Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A439CB52294
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AB10E9DF;
	Wed, 10 Sep 2025 20:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaGyExaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F310E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADZXU7025358
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GjMQrOqt1kzUjiB7WrBgzYzLHVWBj+hV2C1YKYXo120=; b=OaGyExaaQQXe2OT7
 yepRG1DWBHoXnJ77boJyY9isfWYOlebMd1ol4dTjE9f4Jbk+f7Ao3h9fvbjpI0/l
 SzQ7KRsns/1/ovmcQSvkH6V2rFDxt+xMrPNSFbMjqRpoveSajkMWR01NBFs87Wg7
 x3oGiuvvCettf+wJJLvswNLXl8wkn+XJS8bp7MyoapEzhbEOvNScSJWjXsgvX4d4
 NiO315xIvBTe6UPN/8lm6JAlZlscv4idOJZYMe/ZwF24p/YkFZz6Qd6l+jgFk0Vz
 iiXh6rxNMoZUFr423h/AUM5jVn5afppPYpwj/JZthBaTNGwu3n78wrHkxkFI1c6U
 SdP4NA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by958dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-772299b3405so6742b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537072; x=1758141872;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjMQrOqt1kzUjiB7WrBgzYzLHVWBj+hV2C1YKYXo120=;
 b=XKDqPJQviKdvTHBK2jFcA63gW8G2TJ0jGowKuyQIWwhWTkUvlOcApepanlnRsj5hs0
 i7ASgy/geqwNou21+uPnYmuowrWW6YR/gW6a+UTn+846w/dLYss2m0UpWw17YfhhA12a
 o32Bqa/AxgiECrAD801wXP3/g1EXg4FOWU8+fzqDVZz53zlnw9k/bFFoBBWkfEX8guex
 N1bd9ef8K6sWrwfFT8FSeb5aLTJzdcOG0C9eMcADRTIbP6KhLaHgoZlA5CXup1wiMLBR
 Mm9C00BQl59Ew1roP2VOAx6j+rNpgllVO2nONtAOoiJfPewCzrD0WHltby5dwftRTRe8
 n52A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDK4PsfgvcEwSlAusjOq4btCZcrD8Sv3/a5uEYxHjZodaqT5XdnImhHKuA+Hy6FjN4K+NGXaydqeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC6NhtR4NXc0/vtyQIk2Eg0LxuOZ9mniRIDQFVj39u+2VZtwo8
 aycOeIPSPXKPjGSa0wFzTXsVyWDrpO5ZflcV/ScVRI/CHIjoC/49ceEkmLZwC0dtMf4D44rwxnb
 notc3UnXRgpFb7zqCtTVbKU+ZXjrpy6MQqa8xxMm+xiE5kiHpxVGm8yEPQEH5Y7EnxDLVee/0fj
 f7350=
X-Gm-Gg: ASbGncsE2m78fMZex2d1RpUH10pgyjbolKfepfXXocfsJJFrdjRcD6Eh8TSzVEuvNWw
 PRgzf7bPKMsjH85T54YjkpUNu3WMD1DIIlrerA9/8i+Rhbh7GAmerNaiLjtEjdw6/e2HlXLyb/O
 q7oYD0NTFzzJQArNRaufY8qNtSDKz85pMll6kDiWQyYeRhfwA1lWytRwezWTbmla288RzPOXh87
 Mba9kxzVTCi3BUzNtr7ARTK922kY4wLCtOjcrpzqPxPZTs6jQkBpJM0hSEEDDIel6cCxxt/8l6p
 +NiiYPhqhS2Tgjko9kZU8i37UlHXEB+MrAaLdCz7EBBH2LXQJ2681bxPaM4+yFPW
X-Received: by 2002:a05:6a20:3c8f:b0:251:1b8c:565c with SMTP id
 adf61e73a8af0-2534441550cmr23941567637.31.1757537072099; 
 Wed, 10 Sep 2025 13:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9OV2MeB3Kpz+lIR7PJ0sGEfu8xDO/gzp+R4DHMG4utoV9wKznHz0MNDx+h6Gs3YDnRszCcw==
X-Received: by 2002:a05:6a20:3c8f:b0:251:1b8c:565c with SMTP id
 adf61e73a8af0-2534441550cmr23941533637.31.1757537071574; 
 Wed, 10 Sep 2025 13:44:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:04 +0530
Subject: [PATCH v2 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-1-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=4407;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TsM6Bk8IU172J5i+V6pxbaDOzPWuVAASo1qAv/7B0Mc=;
 b=ducsX3eTW444B3LX7ve+GjHgu50CveeJOKhPEVAFz0SDyyqB4N0olEWFgMcuaDv3ZE4VrnB3p
 LTjjhefYUPLCBh3hegVS8gvfT8foSgSNQCh0oqzPjvLSCnjT4I2YhA3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c1e331 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wZg4fdH2GHFv12Tp5BEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: D7gtsHt_Xy1HR7Du1HKkuJ2bbtvCs_IW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxxPObqzY17L3
 c8b606lKHwGfgneKhl9902rydaH2zxAsEXggiCep0X0SxzpKg3f9tmfUuvy3xz2KDf8UYBfvNgn
 i3pOyTKWfjFhF/7Ui6oU8Dl5XDeI/7F3k2q//OR3azx5p/HpV/2KbL8viFdWHth/bmt+wDGqjdF
 LEBYtxQlbJCzH52FZIQMmP+Ndm7qmGohmxU+5O3pUNXpoDJAZ4KLN/JMJ/diZQ48aQ+dWyrSD9f
 b49wk3wBSjCMGaVdRlG0fSXcW7YOQcWBWye6ko7tbVwmnfGpnNaKGoUjMd/eHNrUyRF4UQLgIEr
 GuduKtJOC26wZnRQ0kPQD1N6Gs1OOnNZTDWDDkXQun8jjaKD3ZsAmnIhAcfmCsCiNTk6W8P6JrH
 eYTyNqDl
X-Proofpoint-ORIG-GUID: D7gtsHt_Xy1HR7Du1HKkuJ2bbtvCs_IW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
drm_gem_obj.gpuva.list, which is not initialized when the drm driver
does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
is set. Also, update the description of DRIVER_GEM_GPUVA flag to
reflect that it is also used by DRM drivers which doesn't support user
defined GPUVA bindings. For eg: msm_kms driver.

	Unable to handle kernel paging request at virtual address fffffffffffffff0
	Mem abort info:
	  ESR = 0x0000000096000006
	  EC = 0x25: DABT (current EL), IL = 32 bits
	  SET = 0, FnV = 0
	  EA = 0, S1PTW = 0
	  FSC = 0x06: level 2 translation fault
	Data abort info:
	  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
	[fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
	Internal error: Oops: 0000000096000006 [#1]  SMP
	CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
	pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
	pc : lookup_vma+0x28/0xe0 [msm]
	lr : get_vma_locked+0x2c/0x128 [msm]
	sp : ffff800082dab460
	Call trace:
	 lookup_vma+0x28/0xe0 [msm] (P)
	 get_vma_locked+0x2c/0x128 [msm]
	 msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
	 msm_gem_get_and_pin_iova+0x18/0x24 [msm]
	 msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
	 __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
	 drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
	 drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
	 drm_client_register+0x58/0x9c [drm]
	 drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
	 drm_client_setup+0xb4/0xd8 [drm_client_lib]
	 msm_drm_kms_post_init+0x2c/0x3c [msm]
	 msm_drm_init+0x1a8/0x22c [msm]
	 msm_drm_bind+0x30/0x3c [msm]
	 try_to_bring_up_aggregate_device+0x168/0x1d4
	 __component_add+0xa4/0x170
	 component_add+0x14/0x20
	 msm_dp_display_probe_tail+0x4c/0xac [msm]
	 msm_dp_auxbus_done_probe+0x14/0x20 [msm]
	 dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
	 really_probe+0xbc/0x298
	 __driver_probe_device+0x78/0x12c
	 driver_probe_device+0x40/0x160
	 __driver_attach+0x94/0x19c
	 bus_for_each_dev+0x74/0xd4
	 driver_attach+0x24/0x30
	 bus_add_driver+0xe4/0x208
	 driver_register+0x60/0x128
	 __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
	 atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
	 do_one_initcall+0x6c/0x1b0
	 do_init_module+0x58/0x234
	 load_module+0x19cc/0x1bd4
	 init_module_from_file+0x84/0xc4
	 __arm64_sys_finit_module+0x1b8/0x2cc
	 invoke_syscall+0x48/0x110
	 el0_svc_common.constprop.0+0xc8/0xe8
	 do_el0_svc+0x20/0x2c
	 el0_svc+0x34/0xf0
	 el0t_64_sync_handler+0xa0/0xe4
	 el0t_64_sync+0x198/0x19c
	Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
	---[ end trace 0000000000000000 ]---

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 include/drm/drm_drv.h         | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf59097a01c2b2556608 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -826,6 +826,7 @@ static const struct file_operations fops = {
 
 #define DRIVER_FEATURES_KMS ( \
 		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
 		DRIVER_ATOMIC | \
 		DRIVER_MODESET | \
 		0 )
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986dee9261f8b08c4fc7d93b8d6d9769..8729c88fd12ba76eb0084fc1a2ebccaabf377995 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -110,7 +110,8 @@ enum drm_driver_feature {
 	/**
 	 * @DRIVER_GEM_GPUVA:
 	 *
-	 * Driver supports user defined GPU VA bindings for GEM objects.
+	 * Driver uses the drm_gpuvm infrastructure for managing GPU virtual
+	 * address mappings of GEM objects.
 	 */
 	DRIVER_GEM_GPUVA		= BIT(8),
 	/**

-- 
2.50.1

