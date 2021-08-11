Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAD3E9B54
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C356E200;
	Wed, 11 Aug 2021 23:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAFF6E1F9;
 Wed, 11 Aug 2021 23:51:01 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so12307989pjn.4; 
 Wed, 11 Aug 2021 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOu/fILHgt+GHJ+t3LqOqvToD4GhAEtXIH4LNz022yE=;
 b=OkYnTFE5LQCWTSV+vCVRV1ljIhlzqPvGYsIHL6dIOUfIKFcM6itQeLlu7/ryrZMI4/
 VsJJBKl6ZLSVYBLA4jae2Vup29c616ibhlt81IbiXbAOYiIcvdFY05z7QY99dEtnxVpK
 gJaIfwK0Wl/hua7x2ks+tHZ2fJvF15ZApFMpfK31ie1bpusWvki5U3gBh1+B3MK1YWE7
 9RYSUA26LK8e8qYZBCL2GxmS97cv7yfdOfjDVS51Er3kHMUFJ1qGEDQXksyJyfH4jOZ2
 m+H5eTise9xNcf2vBtqdfUM07+sC9+u3ndnH8+FTtz60FtV7XSTeGPRfzftPI2b/FoKT
 g6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOu/fILHgt+GHJ+t3LqOqvToD4GhAEtXIH4LNz022yE=;
 b=e64LVm7jnzx/JIVZ7/y4RdoO0sLFCmPai7NfydYEEYt4Dh+3FM8cbd9fJ5u5sPUtzf
 auU0ArocGwps5Uix+3qcTk3KgPEWCxlaACkcP8zyKM2DseBMS6RwJWQck1RJIoI9kgCj
 lIc138AgzEjN7EUoDuVJobJv2fE3YIqGwrGANUvT2SiBlKxS/dt7b5SlQJNZ90JxNj1w
 IZ5yk5Iv3penM8WcRXxM6uOdbuMN+2gnGQdUYFLHxRW3WHMBrSQsl2Fr2L+SX19PyQya
 /35V6HNNRrALdWBT88PP3OAAITcgFep84o7BFRIA66k5mLGFfczsG5Z0KVYg/KMAbeoA
 QGkg==
X-Gm-Message-State: AOAM530YpYw7FXI1pMqI3N9WIBZ4NniKVwIrKs0Lnx0kwZ8AR6kW5S8H
 TRUPd/udbuso0QVUUlU3gtDxPMOeYrAZAA==
X-Google-Smtp-Source: ABdhPJxsDsAj6f4o1hLwy9wQiiHTMfq9dR2jISGP1yYFkJGtHFr8DO4z6bmlY0t9hkpcwVd5R12EZQ==
X-Received: by 2002:a17:90a:d702:: with SMTP id
 y2mr1177478pju.127.1628725860621; 
 Wed, 11 Aug 2021 16:51:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l6sm724199pff.74.2021.08.11.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:50:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org (open list),
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 0/4] drm/msm+ti-sn65dsi86: Fix NO_CONNECTOR fallout
Date: Wed, 11 Aug 2021 16:52:46 -0700
Message-Id: <20210811235253.924867-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first patch fixes breakage in drm-next for the ti eDP bridge (which
is used on nearly all the snapdragon windows laptops and chromebooks).
The second add drm/msm NO_CONNECTOR support, and the final two add
NO_CONNECTOR support to the ti eDP bridge.

Would be nice to get at least the first one into drm-next kinda soonish
since at the moment a lot of things are broken.

Rob Clark (4):
  drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
  drm/msm/dsi: Support NO_CONNECTOR bridges
  drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
  drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 61 ++++++++++++++++++++++-----
 drivers/gpu/drm/msm/Kconfig           |  2 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 ++++++++++++------
 3 files changed, 81 insertions(+), 23 deletions(-)

-- 
2.31.1

