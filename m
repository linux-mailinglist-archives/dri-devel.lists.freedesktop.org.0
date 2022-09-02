Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C385AB565
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 17:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91610E88D;
	Fri,  2 Sep 2022 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBEC10E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 15:39:13 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1225219ee46so5647783fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z574SbJi3NHEhiRFaK09BK/ITDPZbu2lYB/u0aQjjBY=;
 b=EP1dC1N1kZbVxzk8LFHzOJaxBITa9jFfWSY9j/bKnRKt+p1hnSeRPTonIps7KKMtoY
 gMjGi5svf7xN83W5GSgsKJY4kzpmPvnYzlbu74tHfRHdvx1SReEEg3lSyudU4ovqnUHh
 n7e7IXRi/PPGWRg3fBSEdwWhtS5jqLu/MHe6J9/5iCK6uFk1zjksrcVToBl9UiylawTp
 u+izEMOfVVg9Zb7Tbr4opylFVjcRFL/wjt7C8FGZhPxw7ja0zRR+bV40fQuZNwYn3MvD
 j21HopxtJ7/TfghpPfVbTPhzyb9sXP8bMKGq0h4qvq3PjblL62t3RETF4ZaJ5XKW1csh
 CS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z574SbJi3NHEhiRFaK09BK/ITDPZbu2lYB/u0aQjjBY=;
 b=Fl0c6n4ncJpgjxwr2cMh4ddUjNZI+uZ10Tt3Ppa35kIe42pqP/zMHD/RwCQXy8gWTX
 aACrS+lO5JLrWMlm7JsGWeUsnVBqldYoFiX8gF87ZwgBGXOQ6GPvVsVXDwmSfbi1MP3A
 cGCskCVkPJesnqp7YKTpEb6A9lpD3yfXQ6VNClp9cCE2MDp2b35QiwcuKmfsASwfSodT
 Dwk3Q+ua4Pn07BH+NkOu+IMGiesUE3bPf0zAB6WM/hDqMNX10fRscXJFDvJANXJLmmE7
 s4kiFfzNntglcXhUHD1MDSpvWxTuukZpxKN7OZn0dhIuZyplBgOw/Z5zzG3H11GV6D54
 g4jQ==
X-Gm-Message-State: ACgBeo2VBYvx1oEU3TK2tJ8fJ03tT4BjjjRSlt8xTXe/WAXEcbmi8Mjb
 zQjKZUQy0KeGYtCiyYnYcejsgS3z+r4=
X-Google-Smtp-Source: AA6agR6BnQcDNXdrb7X/FmnIA2kgSQCLGKBqcfZjPxRvuqRTQ5X26SdVuNhPmNzfu7mnFbne17PDgA==
X-Received: by 2002:a05:6808:140a:b0:345:7a77:2e9a with SMTP id
 w10-20020a056808140a00b003457a772e9amr2092698oiv.225.1662133152256; 
 Fri, 02 Sep 2022 08:39:12 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 e28-20020a544f1c000000b003436fa2c23bsm1087209oiy.7.2022.09.02.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 08:39:11 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/2] chrontel-ch7033: Add byteswap order option
Date: Fri,  2 Sep 2022 10:39:04 -0500
Message-Id: <20220902153906.31000-1-macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, jernej.skrabec@gmail.com,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This series adds the ability to set the byteswap order in the chrontel
ch7033 driver via an optional devicetree node. This is necessary
because the HDMI DIP of the NTC CHIP requires a byteswap order that
differs from the default value of the driver.

Changes from V1:

 - Updated devicetree documentation to be easier to understand.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (2):
  dt-bindings: Add byteswap order to chrontel ch7033
  drm/bridge: chrontel-ch7033: Add byteswap order setting

 .../bindings/display/bridge/chrontel,ch7033.yaml  | 13 +++++++++++++
 drivers/gpu/drm/bridge/chrontel-ch7033.c          | 15 +++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.25.1

