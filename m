Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE675CDD1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D410E6C1;
	Fri, 21 Jul 2023 16:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FC210E6BF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1689956099; bh=bwDESC3di8J2hOB2Il7Vrnp9sMmAKZ7TFP4bVuEHGqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=QZDwSUeqfdgSYfzjpQJHebO7VJqr+YUascrlVoH8W1meDWlX1Zdf1KycNf/kuN8X1kLnexTo4jk6wql7iWjbjixoll/xL4vfVMJJ8Fq6hl6F6hHwZsYfbSeKfEKaoAugqTeP0aixqHPmhCBm/paaxREgY1opN7TM2AA9ix+cT3A9+nPV1Av36bvYKY1Tv9Maoxn6GqbfeMC59T68h6IC9VVfoqbKe/n9iPAWkrafo+2TJvIr39tWxiggcaawWMP+Pn5xx3n3kmlBsKPRV4X5UWbqEYKc6JrTPUjvOxquzRqVDZEpLqxwL1BVJp4hRtAPqhjocNfZwu9G4ewdj7NRhQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1689956099; bh=nOUatyXllBs4LsZ1gPlfX8t8Bq6fmbamfbJICAMajZb=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=t3LIQGw5BbZo19KPXyvYwlWASfdaJbolJXxkDc9HZqHCDxO6atXrGoYlpyIvgzMzpB4rL6F32KfxWr62He+D2S6zh8LgW/msXZMsNv22lrwH7xbEhnTXktWOMgyb8w2+fJN/n0AWonQPp1vWIV11BbpI5eOdq+0kKJQZcssTys1K55sxNq9LevH9r+FPvwkXvOu2+CG3OPlbgZv/4MMpTfHbycHn1CMRVGerYoon4OrM/O5j2QBmrGxP4XNfVSmOqM3lAWwhm9CWY5tSOIjrPZGcNDSbTeeO3qxh4qcJLq1NpQEwNMFnuui7f+7rxQKsElnX4HdS7GTorom8hFfU0g==
X-YMail-OSG: AK72WQEVM1kCQLkBysCEjn4U272Ihichi2rvmDMH3cNxzxRdOcvLjaZ58fabNYU
 u6x_Y6YlOOvxcb2DXk5SFKgeeJyYmLmpWLg8je.z_whuanNbcBJMQX75VuPF5zvC7BUshbPJx0yo
 B7lZRNNaqhPEcYMN_ZRbprziPqsjoqNu_l2RiwGFBgVT2TCsYDzPwZgtJzdqNseDHStMb2jCP3ca
 jBLGoxWy8EjExtRA3biADyPm4ALqkNFXWO_o4fTvjpF07T8LS6pV6El1T5sKsdQ0x6ve5EBbyMPI
 d0hQWgWvVsSZopBkSbiq66enpCmtkIs3GbWqM7bUcHfvm0wqW6hY_bjrhGeSJ4SrUXPG3Gjldkhl
 xGF4cXRrUby5izMMOE1oFd3AlTYZXVH2SP6fZqqx.RfLAkL8hGqqOSlfvjUH5TU3uFHnky.X50_1
 .P6CTJiFqQrSbkBhkfo_VyWZFe2U38z5G5D57AWw_M4S94Nv8fIo1eRAu3RJgSoDBdVs.T02hJ5k
 WqVBdjI7zqTs3fR2bQ9XCA9Vhnrtq.Z1rSn5aObDyQat20NfYJK8v.F73RcwXPRkVYu3Q89lai62
 el4ac5o3OkPnN8BYXAv50UJeoLCpHVUEGPuTDCOl.teZELbzX.6ds4Ax9gLTP7gCze8TlgxBeMOb
 cDAgKDgmayAzkXsULhruf8iLkKNR.xMlmypACKW6Bnnj8jMptTk6_AB8ccXX035Qu4EwtGaUPl9b
 g1E5jQgVngFW9NNOr6m1Dqo99m1Sd3wGs5WZYtGauHBOtOdnap3kiuciFN5ECbubzfugdVx3pHNA
 xTAGF1hiXKl8cU7pl6aqlJaEh2DK3XEBnzqCPU11EfAbJYxRBh2wmhSXkVp3F5l1iSpQICTFmKqO
 PIAYvMspukmukWm99b0L_6kOLRkGYieKx7q1PZVl.wpqmubF2AMqiCOd2xyCXzyCy15tvbpw01gH
 bqUwkk1WGKb4FiIToNkeXm2eQ8pcm4htVDrtogxzqP8WDvScrflN8YphescR41EbgPl7M99LHvay
 BiPoUhDwFKx1WTE9Nh4z36XhFnc7DvB45XS9_wvd7Ew9R4mZJZutd0EVOYMkn5qdQwssT_vyUD5I
 myNn0BpGP11hxREEwTKcaF3NGldiNn6hC81_meLLYrXdCJwew291QLtDCUA_LEBZbOyPpjPJiQ5r
 9OQFSDdidOm.AeWSC3gswzOMNLCeyvcbJm8F.p9kUUUOeMer.RUVRAxkr.y0IUM8gBoHL3FhjYp7
 HLU4WPcJcLwjtJ8EGbv17zGefLvbIRzhwp9OYcQkjPZMBII3j8SFcg5qhoOj6wVeETXuoY9pm0VR
 5OcwNl9o1cz6k9ySbiMnyRHq4qQ6MEKR_WOhoaWI00_Ms_PPV.4N5N1c6ziKq5el1xlP7l5_XXEq
 .LMeh72PB6qCFzvbEupdhdxwm9NGKBSjPwbuvge5RzXEwNvA1fEegEWFw9CWCc7s1RXl.KOG.SK4
 zMCIXrC7CbaTTr98aGFzoV5SwS70S3qKPz0b01DvE2fbqfEuQ2OR6ZeM9W396Q5jYt5gVAeAfdF2
 SO38xKJBBhfhFwdMFsdUMXNYS1VTafFNcfRMQhGL4LqxAtVI8nQFYJm1CntRpJ_DzNJ7_ZlQB2hi
 KABjzYEPHB1kr9jLjT17nz0lxyOQ5oYGohwff6BARp9_tjoXPY74M1kSplVxK5JNqg8.m.nZhyGB
 Kpx58kuyaB6z8EK9p5m3ZFb1UOf2o_20L0tnOobHCScwXT8FX1.0UTq5Kq9m0EGAlDFaP3LX11Zm
 WucnhRSGX.nzNaE75X4kkaHiufBOZmSo7bZr9yA5HcDf.2_NfweuaoETeUOCHKqdXcGrCYIkL_Hp
 sw1DXOajAHyWreA3uNlJd5vRvzUPAOKFQhzPdx_MwA2BvDtkz5R8HeQVJcE90hc_N7wBa9frah8r
 zbopetvI4ZfhyvxuSqXQtftTmdKin3Ro67d4675pX0fDZkL1bb2wYEEyFCXHU3sYDZVEFJm1Rqut
 4BIx1UN5J3hmDyFAPjCcsEKCOl4Gg_46C2_bAZ0NBmGRltF0kHe5922Kn9M8caC7GXPZmThMc5QU
 Vdwz677wIjLTKp4DeFwhmyN3zNzfKUccMYBsKVgIMLpHR9AG6aufWgn5ZP.XU5FQWc9qQLqb5j2L
 0Mxv_7zDIvs8lFrhL9LutvjeRY_VvpduPH5yc2cDvwX5Rj8uKIBbLWP.foWB0h8KfxTP3I2obO7T
 W9qksB4MU_LT3h_4n6Xi9t7S.keEm3Fs78koan3ul_WJECHRYe2DfG1Dz3gPMAWFYB1juc1o-
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: 9835a3bb-7434-4dd4-b4eb-52464eaacfa1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 21 Jul 2023 16:14:59 +0000
Received: by hermes--production-ne1-77c6dd44c7-qc7r8 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 80a0f2870b2cba73bcd1cc4395b3f226; 
 Fri, 21 Jul 2023 16:14:57 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: astrajoan@yahoo.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ivan.orlov0322@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: [PATCH] drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
Date: Fri, 21 Jul 2023 09:14:46 -0700
Message-Id: <20230721161446.8602-1-astrajoan@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716043411.4950-1-astrajoan@yahoo.com>
References: <20230716043411.4950-1-astrajoan@yahoo.com>
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, glider@google.com,
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The connector_set contains uninitialized values when allocated with
kmalloc_array. However, in the "out" branch, the logic assumes that any
element in connector_set would be equal to NULL if failed to
initialize, which causes the bug reported by Syzbot. The fix is to use
an extra variable to keep track of how many connectors are initialized
indeed, and use that variable to decrease any refcounts in the "out"
branch.

Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
---
 drivers/gpu/drm/drm_crtc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..d718c17ab1e9 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -715,8 +715,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	struct drm_mode_set set;
 	uint32_t __user *set_connectors_ptr;
 	struct drm_modeset_acquire_ctx ctx;
-	int ret;
-	int i;
+	int ret, i, num_connectors;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -851,6 +850,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 			goto out;
 		}
 
+		num_connectors = 0;
 		for (i = 0; i < crtc_req->count_connectors; i++) {
 			connector_set[i] = NULL;
 			set_connectors_ptr = (uint32_t __user *)(unsigned long)crtc_req->set_connectors_ptr;
@@ -871,6 +871,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 					connector->name);
 
 			connector_set[i] = connector;
+			num_connectors++;
 		}
 	}
 
@@ -879,7 +880,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	set.y = crtc_req->y;
 	set.mode = mode;
 	set.connectors = connector_set;
-	set.num_connectors = crtc_req->count_connectors;
+	set.num_connectors = num_connectors;
 	set.fb = fb;
 
 	if (drm_drv_uses_atomic_modeset(dev))
@@ -892,7 +893,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		drm_framebuffer_put(fb);
 
 	if (connector_set) {
-		for (i = 0; i < crtc_req->count_connectors; i++) {
+		for (i = 0; i < num_connectors; i++) {
 			if (connector_set[i])
 				drm_connector_put(connector_set[i]);
 		}
-- 
2.34.1

