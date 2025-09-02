Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E6B3FE6B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7610E684;
	Tue,  2 Sep 2025 11:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6zyRUPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE4F10E684
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Al7iO025161
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=; b=N6zyRUPjVnq1G9ja
 KcPaq2mtNJM+ZmdKazy0ExicjtvOg/3YKgRUp46jxoqtI6aOeRrVRL1cxGkjpP9h
 4FoM4QAM2a82XD8u58ZP6jqXU7pyiq7yG3jiEHMFKEUAgNFh7tYpQkEKByFbivKy
 XWK1UehNwAqR0tUhFSrI1sqIWyPJ2l+Kh7+vAe/GJzjy4KPBf7OhUpstas/jJeFy
 ICozRQEoMsmK3zYrr0fwDPqIYECSN2xF/aTrColJQwSYhX2bSGhmLmAf9rexBpLJ
 nir6kkQeM9dqAy8XvUBHhm7VGXkSceqClia25KR41dNUeDFfGAB5R9Ye9mtMKuxF
 iqUoMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuypch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32811874948so2740774a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813847; x=1757418647;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=;
 b=HtcFZdAVm6yAtzCRvHdi5uBhuh4Lh2TBIZNJgpPI8KAKXTR82KqwfJBtRno4Q1g3Ar
 LEG0BZG0WAtfRPBrR3DZbYI7lmDzetQ42Z2qHzCoqpKTyIJ3DrjxWlHh2zCen7Jwgd5B
 Kr+FgnLpULPbnuctbzRSafVaZFCLj4b9+UybUM/8OBxAlDGbmLdIIY92rztEX2iRblsY
 nGkGPHZEFh6GrPCSy8NmiHIkyrPV9fii5rUmtsrIaxdd8uKMDTXDbAmfrVDB0YSSLaCx
 4Eho5M0fXaJP6yyHGUHYjlts8NPqhRSOa2xsM2lC4hKgoaN1O8Vu3AFS+17uNsbt74Yl
 TQhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWncrJGH//HuZ40bI4zbr517yP6eRs8XcBihUv8/cEvBIWx9ocwzRI6UY7hU5tO5zEIS97fojLJE20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIZ7Zj6J9CqU/+5xHg7Pi3Q5QDVH4jknH53RqTAPxSiC/q0Ubu
 wx68AFkMmHEcsFtBrmalkgndZPUNFhtE8E3eDqyoy2sxlT4E4lqN1LGhywK+pRf8HXmwjK2J1f1
 Hx4afiCM4zngZ0p6faWKJZldnr64yNZGs4Wn0pvFYGexKG4k3lnypaQ4ORB5cpsXOjcwj0SM=
X-Gm-Gg: ASbGncs/6omEFuiC7v/7JK6kuXgnlqNu8Fvps8YAYu8OpkeG+ByZBu9+qLHQFg5EuR5
 YXvsnfuzrzgr5qJO6A8OhObXpKl0KdggPrVGkZmS83P9U0bdXKj87Jgfgg1xRP+jVz/O8U1mplR
 mty+gOca5Ff6omFNJADomCfpcyOqyq8hoDj454FjM7o4jVi0C76h3lUNKiZOjOwJb7JeR3tJjCo
 0gCLcqEA2RFP+16lrQfU1V5XbLaGT2GBEPdHzvwX//aP3My2X2rzoF97OS3Pv3c/NDn1oN+JC1l
 rVumYHBiiQSnYmkR0OP7JqcJthGD+8CU9i0ES+Ku/JDb8iQdA39T7J4koTYU86eL
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id
 98e67ed59e1d1-32815412d5fmr10872191a91.1.1756813846409; 
 Tue, 02 Sep 2025 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW99TwUZWxEy45yoetqpbaSq5lJC3JPeKamGQotr5IZQ5SoSdER5YO+EmZCPCjeK1GGCyBuA==
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id
 98e67ed59e1d1-32815412d5fmr10872157a91.1.1756813845739; 
 Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:00 +0530
Subject: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm modparam
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=4562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qPgkL7fQFaE6QyN7pM6ijtnceZa332Ylsl3h67JWyzs=;
 b=KpwHPv5jbU1wG0upN69QN4TU9tLv75znfaMNG/wW/Vr6JMKnE72nr9y8RUcFJA0uol8NLt7B+
 0SEFpVmHcU3An78DGT319SckSxtIIrGYV3cpjSsb3jEmR64RaxyjTRg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX4GyB7elrE/zo
 pp627KEq9RLRq+JLFz2QuI27b1h7H8KHGL2wfiF/51UPWgr6W05K1hS58OVNstdlnJYpLe3tdiQ
 UjP1bfgO6k5Y7CyCaSGRzXIt5iWLKgLceomK3+ST1LrdwY2Zxcw368aR2jqjvXQ24jLkcvlXynR
 kXuWFn91NXWOa2vrJyfR7ftYa97AlWegDVuX4lrvMwry/OXYU+inRm+DwrIbN2Iq3qInueF1MjH
 eq7JeSA//mKjI6kXsE1NLry1dDc1XqvgE69DgpQejCNxVUp2McjWv5elYz4HwtmqADbH1zjnzTu
 1LcXWgA636C6S/lK5emsshCYcHfrcSRAtrhR/qqjnGDUxF2plFtxN4NMpZFcsEJVDDgJERY/LwZ
 oUl/O88y
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6da18 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7L6S3vPEwiY8THHMc4kA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3SBp_UUypzakJxlzQzcahSdmoGeDI0Qs
X-Proofpoint-GUID: 3SBp_UUypzakJxlzQzcahSdmoGeDI0Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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
is set:

[    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
[    9.523160] Mem abort info:
[    9.523161]   ESR = 0x0000000096000006
[    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.523165]   SET = 0, FnV = 0
[    9.523166]   EA = 0, S1PTW = 0
[    9.523167]   FSC = 0x06: level 2 translation fault
[    9.523169] Data abort info:
[    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
[    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
[    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
[    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
[    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
[    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
[    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
[    9.763632] sp : ffff800082dab460
[    9.763666] Call trace:
[    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
[    9.763688]  get_vma_locked+0x2c/0x128 [msm]
[    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
[    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
[    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
[    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
[    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
[    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
[    9.763782]  drm_client_register+0x58/0x9c [drm]
[    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
[    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
[    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
[    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
[    9.763848]  msm_drm_bind+0x30/0x3c [msm]
[    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
[    9.919283]  __component_add+0xa4/0x170
[    9.919286]  component_add+0x14/0x20
[    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
[    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
[    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
[    9.919341]  really_probe+0xbc/0x298
[    9.919345]  __driver_probe_device+0x78/0x12c
[    9.919348]  driver_probe_device+0x40/0x160
[    9.919350]  __driver_attach+0x94/0x19c
[    9.919353]  bus_for_each_dev+0x74/0xd4
[    9.919355]  driver_attach+0x24/0x30
[    9.919358]  bus_add_driver+0xe4/0x208
[    9.919360]  driver_register+0x60/0x128
[    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
[    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
[    9.919370]  do_one_initcall+0x6c/0x1b0
[    9.919374]  do_init_module+0x58/0x234
[    9.919377]  load_module+0x19cc/0x1bd4
[    9.919380]  init_module_from_file+0x84/0xc4
[    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
[    9.919384]  invoke_syscall+0x48/0x110
[    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
[    9.919393]  do_el0_svc+0x20/0x2c
[    9.919396]  el0_svc+0x34/0xf0
[    9.919401]  el0t_64_sync_handler+0xa0/0xe4
[    9.919403]  el0t_64_sync+0x198/0x19c
[    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
[    9.919410] ---[ end trace 0000000000000000 ]---

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

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

-- 
2.50.1

