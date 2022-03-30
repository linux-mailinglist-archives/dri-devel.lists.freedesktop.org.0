Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93C4ECD59
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06510E386;
	Wed, 30 Mar 2022 19:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD72D10E386
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:39:49 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id j83so23112786oih.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqiFcolTO2phQ+P2yqBAa97dsVxP9bPOQ0F86q+kILE=;
 b=b3L1T9OruADCj4qWgCQp5eJ2X8h2K+YhbbfjB9CHzsGWxHuJJLtbCsp9ILOZvCwf5h
 fH8wv2JHACBPpt54Ne8Gcl/+96CLEp9y/SAonPRCbCyFJIm8I0TOC9sM57A737XXdPv4
 W3k3VDl4nMPc9wCtI6AVySbFFy2JGUgKcQqDYqSAFC867NBJ+eFiOlZp6abvSX/nEpgb
 znbdTfQzwuE3vsWsuOf2YtbuoH2zFfdRe7B8jTtmtVpuyt0vLWpOlfhg8097Rwc+YMux
 /444vkbLICRc/REaFfpDnEMOEMjiHOJf6GwFAKKWPH/JOJ9HnWqGVZ0Ac4FXN8pHb+Bf
 P85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqiFcolTO2phQ+P2yqBAa97dsVxP9bPOQ0F86q+kILE=;
 b=ckkT9USkW9VQq1fYqGto5b4SXtbt3Vb+9GivnTzub/oaFWolLdBMyoEuyHcpdjIRF5
 TSpGwyhO+86sOmDJSpT3CcRk5xzMGoYBS8DX8tl6/kizwv9Dg8bSXGSLjOaX6XY7JhCh
 6F2WzzXD4TVT4JNWnwQR03pNNBDvsmnj6DIpaJVj2GXXVlt0tqdgvmdTUXoAITgqnpNc
 2KMVCDp025ZQrB6AJ3JshAOjydO1QBk2p6jwDIRJhcEFYdoNL/MXUho/e+IJx5UQ29Mt
 IydDHsIS1VKUd+fdRRC/PXUI9C/VM1rqjUF0hNuaAMJwZfAkf9GjY6Z8zD4ZLDVB479b
 XXMA==
X-Gm-Message-State: AOAM530HLSvoijKQvDlfaWNzKrKCM6dtA/ZLnozcBdBSLor7tsKZ41vB
 uA+G6TCW6inkt71jRGAYMD2lWChP2jM=
X-Google-Smtp-Source: ABdhPJylcR4KC9H9EE7EKHWDgY4XPqqazFl8Kzp+qCk3kapWQn/MUGvhajQQTZod0ZM/9sQsuR8y/w==
X-Received: by 2002:aca:db85:0:b0:2ee:eeb7:be10 with SMTP id
 s127-20020acadb85000000b002eeeeb7be10mr802529oig.0.1648669188492; 
 Wed, 30 Mar 2022 12:39:48 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 bb35-20020a056820162300b00324b9a8121bsm11242223oob.27.2022.03.30.12.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:39:47 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] chrontel-ch7033: Add byteswap order option
Date: Wed, 30 Mar 2022 14:39:39 -0500
Message-Id: <20220330193941.3720-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, Chris Morgan <macromorgan@hotmail.com>,
 robert.foss@linaro.org, lkundrak@v3.sk, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This series adds the ability to set the byteswap order in the chrontel
ch7033 driver via an optional devicetree node. This is necessary
because the HDMI DIP of the NTC CHIP requires a byteswap order that
differs from the default value of the driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (2):
  dt-bindings: Add byteswap order to chrontel ch7033
  drm/bridge: chrontel-ch7033: Add option for setting byteswap order

 .../bindings/display/bridge/chrontel,ch7033.yaml  |  8 ++++++++
 drivers/gpu/drm/bridge/chrontel-ch7033.c          | 15 +++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.25.1

