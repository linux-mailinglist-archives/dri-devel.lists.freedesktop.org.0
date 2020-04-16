Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BFE1AD6A6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1506E39E;
	Fri, 17 Apr 2020 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3496E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:26:24 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so8730699ljd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiCNvkh9T+OdzJSCJmGWzbdtJNrMVTbSIfhdr+GotcQ=;
 b=Ws4QXhiAvGNKHTMXP4AWNtMdYdAPVNiy3ni7wl4QQPu6caTsD4AcUpa2/HKUzesULz
 RtTxjc7IBxFagwe4tNuD0sdvpf5FC/uTDYTlahrNXVd8l46j93mdjnosiExaiph3HZMf
 jjxjyrvH7RRQRKMLgdA0XMG1uUcQlCjTibpp1EdDcvjEdqCgZcgD+QaSjKDaG7T9Vrdy
 XWBNgnlBCrDgC0GUSWp4DhfmvZy7OBjOzuE0jH5BbsM3nDiSEhR7id+PXrrG+IDf5ZSS
 yJKAfOyjf+VoeiVZXF8ZkN8O0/dj4LZbRZZTlHu7gfXMEktN7qTLOUzLlUvKCs4NstaF
 zXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiCNvkh9T+OdzJSCJmGWzbdtJNrMVTbSIfhdr+GotcQ=;
 b=Fs1If/L3MonhKMqqr6mZpqeNPqe7haHRL1zvm6RK6vYG+x3W+FxIFKahlOLCTml88A
 gVrYN+cJZAAXs6XqgYnJXKtacTlkZhhFPbyrZ6hKMstzO1moC939UmU+vCBI8Z2MIp5c
 n5dbyofkNPVmLam8RbUhMkcbB7AqKVEf0XsDW16cC4V30V50uPBrAjCx4WgZlpdYFtVa
 mUd2I2WU++TpPNwEE0WKsqSV8mePgS4wc4f5d2pwTiqcCHFth0Yv9TvWHEXXYdIO/Zuu
 oksCVAD3Ai7BLGrGhFfOpotApJzKFkH04e/RbAy/652YjODym8KmI1HQ1PVUTQj+go8p
 LAdA==
X-Gm-Message-State: AGi0PubzPwRJR56iHAcUCWAFlFI9GOkVCLCGHPEuCVOPu+ZzVKHPoz9M
 /uh0iqzGyfN++5bF1vRQpz0=
X-Google-Smtp-Source: APiQypIIC9kjgFxL1oSMIpuH+mLD6+GljcyOy3LohW83aCcQbZ1bimLKfLED+Ewq+wglUvrCkLaTrA==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr7248376lji.279.1587057982791; 
 Thu, 16 Apr 2020 10:26:22 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 10:26:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/2] Support DRM bridges on NVIDIA Tegra
Date: Thu, 16 Apr 2020 20:24:03 +0300
Message-Id: <20200416172405.5051-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

    - Please notice that the first "Support DRM bridges" patch was previously
      sent out as a standalone v1 change.


Dmitry Osipenko (2):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: rgb: Support LVDS encoder bridge

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 19 ++++++++++++++-----
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
