Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2D9EF18A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85C210E423;
	Thu, 12 Dec 2024 16:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DL3shQLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10774 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2024 16:39:11 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6727010E423;
 Thu, 12 Dec 2024 16:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 302C65C5FCC;
 Thu, 12 Dec 2024 16:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D80C4CECE;
 Thu, 12 Dec 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734021550;
 bh=28GP+if8s00JfMq5taAXrfU0aH0wD2Yn6kBzI4rgY08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DL3shQLBwTjBSdjzL9+2ith3R5CzuoT5egOIPt4F3E0Wgh43wnd6a+wciXi5Z2xKO
 x6z9g6vKbD4dwVpxLNgn2Ti1d47qd0p5yjTQEv5WNQQcA2bSrwWK/jYUG0KUvJn8PY
 lgw+Pd6PWkMMxCiodVe+lTccF5PiDZyyaJ86LmKU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Randy Dunlap <rdunlap@infradead.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH 6.1 769/772] drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer
 needed
Date: Thu, 12 Dec 2024 16:01:54 +0100
Message-ID: <20241212144421.709324965@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144349.797589255@linuxfoundation.org>
References: <20241212144349.797589255@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

commit a722511b18268bd1f7084eee243af416b85f288f upstream.

DRM_MSM no longer needs DEVFREQ_GOV_SIMPLE_ONDEMAND (since commit
dbd7a2a941b8 ("PM / devfreq: Fix build issues with devfreq disabled")
in linux-next), so remove that select from the DRM_MSM Kconfig file.

Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Rob Clark <robdclark@gmail.com>
Patchwork: https://patchwork.freedesktop.org/patch/523353/
Link: https://lore.kernel.org/r/20230220010428.16910-1-rdunlap@infradead.org
[rob: tweak commit message to make checkpatch.pl happy]
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/msm/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -23,7 +23,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
-	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE


