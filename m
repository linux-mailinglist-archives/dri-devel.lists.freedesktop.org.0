Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969EB0FAC2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE2A10E852;
	Wed, 23 Jul 2025 19:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjzrmpCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37F10E845
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NIOt1p017527
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DySszsnLFN4
 6txmewo3gUR0DN+Qtxzt6DPVvLE0QlUA=; b=VjzrmpCLJaIuckolJY0HFwNaggP
 Wkcum93o4SrXx4L9Rtkx2n7wxenmvWv1KaaG0KXnrdmeKXSjhyCxFs/fC10UCsQQ
 tHl1c4cyL+5zpw9FQyL2fa16dSrWSgCV28FfEFmc5h1OH7SnrSq0GHVrb4XIP2DQ
 p3q3QmXGuI66ue7oC/pgo2KHFIv9+VmR6SgexsT38h3zvPLA5CgqmkF53fTfRYhL
 ukr5TPlXd3s5Vj7wtFzArtegjLnpzVoxnZz5l9IWwBUZ691qjMLsFIzDFFvD6zON
 4PScvQsaQYfNJuCxPYn2KtwFnupSjqXJsqjT1t3TipAD4qUKdcQPx81x/jw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6rf8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23507382e64so1152415ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297737; x=1753902537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DySszsnLFN46txmewo3gUR0DN+Qtxzt6DPVvLE0QlUA=;
 b=X+3F+f8DUE5+3M2CVbZE3moHSl8b+PdEUuZ1WHDnKqluCr835zESkafrkfd+9kbNWb
 B2Q96y9UWiaB9Z7KCGvs3rl4cenFuBUkHYQrYdBqReqfHkKj3mYbfTtKJ7hXtU+H+s+c
 fY61wYH8dnwJFnZkc9W9sNLGUtwZR5/88Rekejg7iQTOEqDkWdj37SiKNgNeZr43inPp
 huaDzLGPco+rM70+7Qi6Z7x9C9iG5H0/ETykz78Auc4Vi/IJNz9CWcdJXLmrMcLJdVxL
 JI9B9c2J5opF0SkSmNB4gwScK0nwglzfY2CS8fvbXXsIqQsNe0ZBDAw7qRVb94Budw4W
 sglQ==
X-Gm-Message-State: AOJu0Ywl34iOCGgVhv2dBhv9lWbdHZsM9H0NN8wMqIkgSrz1MNuATfbb
 oN6w6E5nSb7TTbKP6HTC8+BgV5o7mZfvtjyCaQv4olOXMoYp9lBb60y2ApIe+OgS8aRjVM45fzp
 f3+0PW5n2tI2WS3ATqDCc/CAfkCQEfrQuNrwVsRbgbeBnHgphtxZG3Q7tAfELtGwKwpwE3sZzKr
 jNQnw=
X-Gm-Gg: ASbGnctXsfFzX1TOkl5/gwpmqXZcxftG6gmCDyB23IC0xZ+VBTBl7PmLPLhta4p8Tat
 LaseEU+8Z330lLIAwbAeuPOBjrXprBKuP/hnYvm7IiD4PLZeNT8YEH2gSCaSZ1fGfP/qvDDvx4L
 0PUCBt6Qaydx9mHBiveLhLjF/Bi9Yf9jRuMFwPInUAtsnMgvVp8CqHag4JEscgQdGkAR+8FW63O
 NNAGkR220Eev2LixuYob0eVHkNA6IdqxahOGPdXyQoFG+JonyH9dbcOJ712izj+LVwlwTen5xpn
 gm0Qjg9uU2vx/7byfXdXD92Vl7Ak+vlqYmCJLLmqAeFS08jgOBI=
X-Received: by 2002:a17:902:e892:b0:234:b41e:378f with SMTP id
 d9443c01a7336-23f9814e994mr60313625ad.15.1753297736817; 
 Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvO2wHRoQjvHn2W4SmUFBRllrdv1e83xv0jpGEErywCjUsrAZwZkzrYZm9UaPLuj47t1U5KQ==
X-Received: by 2002:a17:902:e892:b0:234:b41e:378f with SMTP id
 d9443c01a7336-23f9814e994mr60313235ad.15.1753297736352; 
 Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2d06sm101524775ad.43.2025.07.23.12.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
Date: Wed, 23 Jul 2025 12:08:49 -0700
Message-ID: <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6881334a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=CtOTWVoUMOquu4jWpgwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: oRel7-4Nv_fUTziLP6wU-LXGti8As3b0
X-Proofpoint-GUID: oRel7-4Nv_fUTziLP6wU-LXGti8As3b0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX5NaOwd4lvCaB
 mbBceuozl0GTMRqroEymimMhr/Kwv98d+fkYM5jwHYhOOlzbQLev0VnQtmM/nFdIDsj18LmGoLP
 Z3NOzavikJE6I68DbmZ68jurqu3YomGLN3u7ywugnIPBpVqUNNl4q8pBhIzoS4chb+9e8BajVtG
 V5tBMtnWLTprCVGLx6AMFBthABVhhEyg7MTpqIlYVqitkL2gVaVqdGvb88ysPwXsBwNEidyX5oh
 ilUO7t6nMCBn9eA9oYJifYb8e7nW5Yq2SLlDm9tz+UZ/LTxUAAU3BA4Jruf9fWQK+YCQjbHkBYh
 xoFl2BO/LSxEBl64rVEAKI8cAfHI6eRRP1CW6TxcotNWqNlNjpx926Nb2KkoH6S15u0nGAd8ihX
 s9XI4ncLIo5YPyMUzViZu2wlVyc2mBhH0nWhH2RqGsF0T4FnoRl438hCRDAUDRzNhR26Gbkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230161
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

If we hit an error path in GEM obj creation before msm_gem_new_handle()
updates obj->resv to point to the gpuvm resv object, then obj->resv
still points to &obj->_resv.  In this case we don't want to decrement
the refcount of the object being freed (since the refcnt is already
zero).  This fixes the following splat:

   ------------[ cut here ]------------
   refcount_t: underflow; use-after-free.
   WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
   Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
    qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
   CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
   Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
   pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
   pc : refcount_warn_saturate+0xf4/0x148
   lr : refcount_warn_saturate+0xf4/0x148
   sp : ffff8000a2073920
   x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
   x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
   x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
   x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
   x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
   x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
   x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
   x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
   x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
   x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
   Call trace:
    refcount_warn_saturate+0xf4/0x148 (P)
    msm_gem_free_object+0x248/0x260 [msm]
    drm_gem_object_free+0x24/0x40 [drm]
    msm_gem_new+0x1c4/0x1e0 [msm]
    msm_gem_new_handle+0x3c/0x1a0 [msm]
    msm_ioctl_gem_new+0x38/0x70 [msm]
    drm_ioctl_kernel+0xc8/0x138 [drm]
    drm_ioctl+0x2c8/0x618 [drm]
    __arm64_sys_ioctl+0xac/0x108
    invoke_syscall.constprop.0+0x64/0xe8
    el0_svc_common.constprop.0+0x40/0xe8
    do_el0_svc+0x24/0x38
    el0_svc+0x54/0x1d8
    el0t_64_sync_handler+0x10c/0x138
    el0t_64_sync+0x19c/0x1a0
   irq event stamp: 3698694
   hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
   hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
   softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
   softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
   ---[ end trace 0000000000000000 ]---

Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 33d3354c6102..958bac4e2768 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
-	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+	if (obj->resv != &obj->_resv) {
 		struct drm_gem_object *r_obj =
 			container_of(obj->resv, struct drm_gem_object, _resv);
 
+		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
+
 		/* Drop reference we hold to shared resv obj: */
 		drm_gem_object_put(r_obj);
 	}
-- 
2.50.1

