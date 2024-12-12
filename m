Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45F9EE7CF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 14:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EC510E426;
	Thu, 12 Dec 2024 13:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rRSsqAby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3504 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2024 13:39:37 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0317710E426
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 13:39:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A24EE5C5FE2;
 Thu, 12 Dec 2024 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E04DC4CED0;
 Thu, 12 Dec 2024 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734010775;
 bh=/GVsZ2epC2AQhd27Zheod42Ud2/VmKAfu1dnKlAuEyA=;
 h=Subject:To:Cc:From:Date:From;
 b=rRSsqAby0KnOdjkqVuBVJB0DKJuUmsAkzyIfrrxVMfZPN9pG2KWV2hFWg6BlkWqKJ
 Dg9/3FU3ab5qSEz3pQpdNkK3tU9e1KbuUwkdf08jNBvz2r6qSGkIUrJsN8l/hS/dK7
 xP7SKNS4l4O0W26hYvgvBDwTadGXu2ckx12sCdfU=
Subject: Patch "drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed" has
 been added to the 6.1-stable tree
To: airlied@gmail.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 gregkh@linuxfoundation.org, quic_abhinavk@quicinc.com, rdunlap@infradead.org,
 robdclark@chromium.org, robdclark@gmail.com, sean@poorly.run
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 Dec 2024 14:39:27 +0100
Message-ID: <2024121227-tweet-washbasin-f16e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-msm-devfreq_gov_simple_ondemand-is-no-longer-needed.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From a722511b18268bd1f7084eee243af416b85f288f Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 19 Feb 2023 17:04:28 -0800
Subject: drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed

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


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-6.1/drm-msm-devfreq_gov_simple_ondemand-is-no-longer-needed.patch
queue-6.1/fs_parser-update-mount_api-doc-to-match-function-sig.patch
queue-6.1/scatterlist-fix-incorrect-func-name-in-kernel-doc.patch
