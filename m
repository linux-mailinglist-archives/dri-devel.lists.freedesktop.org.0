Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F61F137D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D305B6E487;
	Mon,  8 Jun 2020 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C406E225
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 01:48:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f18so15868491qkh.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+d1Eg/67SeROyIrXeX/NcuRKSdM7i+nQ7oJN4CqZ1s=;
 b=UAH4VeW8rcw5ifVzbhD0DAIm3EmtBlTSzdIjL4I3tUMNCd6rB0fHVN/Tcng7OXy/Im
 Igf39lXIWhkgyvfK6zpoYxZeHJ9SCdJ+f8d3by/31azigmWdLCtLGvTDBYcyx8rHCPDu
 5jS/dLex42d2wwtqbMlNX8B0gvlKzm5hNSvqdPjknfhKgf32GJAgLCJolzLhot278uUO
 NOYi+obqJcXHL6zWcPYKXYqTy4Jov9QFB1Zie2De44J2c4GaRa+XLY6a220Zff0kA0BO
 s5OGDXB3WVZmUVCRNZyBV0m+GVxHUC8TEXA+qs7zf0m5oqqoLjNbzFAB9wDZmxxdWSBv
 60aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+d1Eg/67SeROyIrXeX/NcuRKSdM7i+nQ7oJN4CqZ1s=;
 b=MlMcMWUwLjrVbABJkPIOMo4vW4silQ4bup7efAjVc6fo4+hOqPgO5p29LX/9QOO/Qr
 UWZqldP2v82T2wGQm+YHNuJ9EMeTIIyKWkfITAhkVanqmHWnIpiVXDHO0W3qImz66DY9
 VvLk9JrTqKm4nRg7q3Ll7pSz5exk2cbmxq1e3mwnzZanhi3gEv1o18qjBOusDPdHVjh1
 Zjk5SArN+5SblnMP018PtFuaLfCQajSDYOjpOE3Jrk0TFZvloZwsvJ+uCdwRhgQ0WMtJ
 sWKbtPUO3mUMmfGGpOyenGqQphEUhTQRLgzRjluwCDUhAuGgX07sPMzT1hvOyVv9PIjL
 qzqg==
X-Gm-Message-State: AOAM530iWntOv+2q9mMF2MVyN5zVoqn1ZViMM/WZ3Kys93lHhoqFZKmn
 8aYLi39bg5WoN9vjLCmTEelUvA==
X-Google-Smtp-Source: ABdhPJxXcwD2HMq3mQYT+qLBtgZad05Y4KCfdKEMeIYCHdA/aBMZUtrEsncE5ONgoG1uUECyN+C8vg==
X-Received: by 2002:a37:a801:: with SMTP id r1mr21062926qke.174.1591580917048; 
 Sun, 07 Jun 2020 18:48:37 -0700 (PDT)
Received: from ovpn-112-81.phx2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id f30sm6423106qtb.9.2020.06.07.18.48.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 18:48:36 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date: Sun,  7 Jun 2020 21:48:18 -0400
Message-Id: <20200608014818.2814-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Qian Cai <cai@lca.pw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
the generated .config a bit ugly.

 # ARM devices
 #
 # end of ARM devices

 CONFIG_DRM_RCAR_WRITEBACK=y

 #
 # Frame buffer Devices

Signed-off-by: Qian Cai <cai@lca.pw>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..d80696455d3e 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -48,3 +48,4 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+	depends on DRM
-- 
2.21.0 (Apple Git-122.2)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
