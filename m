Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6B1B01F6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8DD6E20D;
	Mon, 20 Apr 2020 06:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1EB6ECB6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n6so1965291ljg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UjhBLAJmzhN057qQPLR85nlezCd0Cbg3wKL62JA+F0Y=;
 b=h6kMX8/a/MD+21migy24dxFEqMf8aW6xXDbzepMropt4ZX8BHN3GOTPCB9P4/mWpfC
 +zorigm2j4U6S9MKaU5zWQzA9Oek7rSlqwU7x5LeHtxj3w1+7hIoKiK0nI+eKB9bhRxp
 BMTGfoe93olsIYCuJ6TWCK2m+09QR/m0F61d0ue8dFpZE7wPF3moZSILOtqf0BEhrgJD
 sjcsOAd+kpRcbGfBeXpkdJSCmhN7KmwXcgj5dsqlkQaZSuqFAG8hlJaIUtDAAmYF0LGa
 QglQCB/UuKgn86AN+Q712QZ2/xoXbQgDHpQPG8yMGSin3tZhOFN0K2lM/ABXT4mESoKq
 Aw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UjhBLAJmzhN057qQPLR85nlezCd0Cbg3wKL62JA+F0Y=;
 b=bbNbE2yl+ee2uzrOMc2SuTqhGWvIkBR1NMf2MDQC6ji7X5mfPKVTXfaAfICGnbcSr7
 1+7CmbVs6dDCUlXhAyZOJqjFhNtiTqT7pLSkB3pHRXese0KM1ATxVToxAGnkr+ux3DKO
 cDP/1zpYNqIj9YQT1QDc8+zy1ljdOH8asy18K6YO+bFUSWosnf1SxN4duzFHwa0k9w3c
 znGgaoCClpdQSif3jyVQrF5wg8Z5fgG9plS9bAhW/n/CkNUVU49/RE7I9p5BoDR//7Cw
 pdm6to9v/sjGNkZrfTSAJqqZO2FVpa/UdTs9uY/QP+6HV8BrpM49IyjeYC4/NxFK/DeI
 rjDw==
X-Gm-Message-State: AGi0PubSPwLQKGpFvRJgieZ8aZEz77zILicSy1eQ4XbrtKx29RJUR2Qs
 XYveduEMcDFn8vj/2eQtd/Q=
X-Google-Smtp-Source: APiQypJO9Q9iUvGnqWW4hjfAjTVkvpc+Xh9pA8t+jnQA9ei8M3XpSh8CGKey1LqD9LuS39c/Z617jg==
X-Received: by 2002:a2e:7006:: with SMTP id l6mr5124806ljc.269.1587229637344; 
 Sat, 18 Apr 2020 10:07:17 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 0/6] Support DRM bridges on NVIDIA Tegra
Date: Sat, 18 Apr 2020 20:06:57 +0300
Message-Id: <20200418170703.1583-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v5: - Added new patches that make drm_of_find_panel_or_bridge() more usable
      if graph isn't defined in a device-tree:

        of_graph: add of_graph_get_local_port()
        drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

    - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bridge()
      directly and added WARN_ON(output->panel || output->bridge) sanity-check.

    - Added new "Wrap directly-connected panel into DRM bridge" patch, as
      was suggested by Laurent Pinchart.

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

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

Dmitry Osipenko (6):
  of_graph: add of_graph_get_local_port()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

 drivers/gpu/drm/drm_of.c       | 13 +++++-
 drivers/gpu/drm/tegra/drm.h    |  2 +
 drivers/gpu/drm/tegra/output.c | 21 +++++++--
 drivers/gpu/drm/tegra/rgb.c    | 85 +++++++++++++++++++++-------------
 drivers/of/property.c          | 32 +++++++++----
 include/linux/of_graph.h       |  7 +++
 6 files changed, 114 insertions(+), 46 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
