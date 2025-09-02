Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E3B409DB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3B895EE;
	Tue,  2 Sep 2025 15:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYbekwim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A522895EE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:55:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqLoj001734
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=A3gqSpoIQ3gnaOLqW/dm0/FqkEZT7i2DBb0/fr+ypKE=; b=iY
 bekwim/S+o4b/4mz7R241d0gq1jTBYADedQsYVStLu2BprGGnjer6MEqIN95XOiO
 a50a38xOjdPv+Ac8vCO70lZqQExDRqPZc1tVyc4GCPqEknUSMOODx/oAHig5+VXT
 K0lZvxBC8i2UMmqSTJlqxtStDf248DPJq1iaazjbRL8T0OUiIDLPqQDZAQSGfqpu
 VUXR9olBc4/EKWf5uMtlk1pp1+3hgC6SEwb4RdIDSUYDKmA6cooCp+rlOXrpia93
 sEhlBrvh90zf1wgTE6Ge2MiKlfl/xeuo9nPuhWyt4qqLHATv8H3bOT94QthpFP2i
 sIU829PTMLxWEnngA4ZA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy47ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 15:55:31 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-435de6eabc7so6271250b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828531; x=1757433331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A3gqSpoIQ3gnaOLqW/dm0/FqkEZT7i2DBb0/fr+ypKE=;
 b=L95kjqS2xuRZy6b2OE1Nutfmog1toB/uOWOPl+vfbXXVKjWsY/RGnK5xfsRjmWt0Ru
 ZBXmqZvbEtzr5bzfnydngF0+uGgKm9lfuskDTleim9+knYo70B7rGtIZWB4G4x7l41YR
 JszaidCA1rAEmxtpCQsAqgvLq+9gCs4Ewvzg1svpewzBLdHqxmx++mt4JmA8mxcAaD8t
 rpSlW2DOrj4KEWjfD+u+27fRP5PdOC+o0r72vbPVH+/1uKoTG7x+CKcAGNbXeVj9lFLK
 EqrMO7AHJwJ7LZEqqUqc8EYRomqBk7SNzOqlL+FWEHc+DAlMGz55FTPOMa8JJCvbdJn9
 ENXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQQYWmGLotN9voQ7BaVHnqao6Mk0Yc/HvZjMj5EI8NhQoJp0/esN5H4Qr2LHDEDLU3V8/H30npJgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbafJBJ6FNWz4Vk1Vy0fqku6/tMvMLVnupWLEOWhWPcK+jih0O
 X9nRK345m2F8KxxYDiN4hxYil6xRfzzZ63qWXFN8umcY4zaRxYwg219RsX6h7umHPBs1zJBJ/U9
 2sap2DdCVS+Q5SzliRYbIPtXURj5QnpET4oiyoNaQeWpYy9gnWf7gD78KwXpwdHQ0aPY6pEQMKq
 WUZ4+WvGuR5TQypifHVUPVIqG2aHVCfLEeW5toslFgEX0noQ==
X-Gm-Gg: ASbGncsDm55uepSczGi2A2Yw9ihgduu6CBU4sOHn658tA1JReOO13n/DCfyFEfc0Bza
 xCQkKYNNosSyeemry+lXlf9bnU1BYLBDiqqay1uREL+cF2Hy0x0Agzp0ulHf4F32aAEIvMtiOmv
 BJaBuwjdBFCSkyAtTqFdYKuNMbjAhxsE9VKIrfMVjmOz0ruMlDwXy3
X-Received: by 2002:a05:6808:48d5:b0:437:dade:463f with SMTP id
 5614622812f47-437f7d994c4mr4151942b6e.34.1756828530722; 
 Tue, 02 Sep 2025 08:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1uf3jNioSmAshEc9z3yyLmgANd+2PnHEVtARN4d50VJILUSoxTI1ggnEVO/qE8F0+1dvdgSEHxjdhqo4mTMM=
X-Received: by 2002:a05:6808:48d5:b0:437:dade:463f with SMTP id
 5614622812f47-437f7d994c4mr4151933b6e.34.1756828530347; Tue, 02 Sep 2025
 08:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 08:55:18 -0700
X-Gm-Features: Ac12FXxe1UwMG2c7pfYzqGvYc64XhcrboIhwaNGex0OludbeUsMDhRZIRxFJEYY
Message-ID: <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b71373 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=Yc-ri1j8BvKz7xlZgGsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: bONJchpSwhQWTZc9Qu8UfhqWCDXXWSUl
X-Proofpoint-ORIG-GUID: bONJchpSwhQWTZc9Qu8UfhqWCDXXWSUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8JxZe4qn7AZS
 bmtCvsk/wd6rdwoQcjlj2Cxp1QSukbB9D++no2rLQOdIkkmPO/QUcwOIOOHxJ3caUiX3AfVartk
 OPuXklQ0nD7tZKHAydt312WlTKEwaUKKMKRa4udZ89kktcmvtjpUhgmZApOdrmPBxIGbMHsHnNI
 wM4fUt36ovMwFpH1Q7wc8l3tvJes2oS243yjjgcChYS8YRBqPP4mMIqtBiExTFD4vBPT2pRP3jg
 rfZ1bqyKGrOxTaG+cSzcSJy/pwjQ+BHZEYRvPl56PtrrCADb7csnrmnqA/xuHGs01lBKjxdp3Ij
 DFmYQJXNH12dBrIqRkk74rL/wrhZvTwIP6n2tPBD8OMqliqB1vf/eYr7LB01wJyY2WsPZOVAv1a
 5RPYnqky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 2, 2025 at 4:50=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
> drm_gem_obj.gpuva.list, which is not initialized when the drm driver
> does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
> drm driver to fix the splat seen when msm.separate_gpu_drm=3D1 modparam
> is set:
>
> [    9.506020] Unable to handle kernel paging request at virtual address =
fffffffffffffff0
> [    9.523160] Mem abort info:
> [    9.523161]   ESR =3D 0x0000000096000006
> [    9.523163]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    9.523165]   SET =3D 0, FnV =3D 0
> [    9.523166]   EA =3D 0, S1PTW =3D 0
> [    9.523167]   FSC =3D 0x06: level 2 translation fault
> [    9.523169] Data abort info:
> [    9.523170]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
> [    9.523171]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    9.523172]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000ad370=
f000
> [    9.523176] [fffffffffffffff0] pgd=3D0000000000000000, p4d=3D0000000ad=
4787403, pud=3D0000000ad4788403, pmd=3D0000000000000000
> [    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
> [    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.1=
7.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
> [    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-=
00515-HAMOA-1 07/18/2024
> [    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
> [    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
> [    9.763632] sp : ffff800082dab460
> [    9.763666] Call trace:
> [    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
> [    9.763688]  get_vma_locked+0x2c/0x128 [msm]
> [    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
> [    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
> [    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
> [    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [dr=
m_kms_helper]
> [    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
> [    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
> [    9.763782]  drm_client_register+0x58/0x9c [drm]
> [    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
> [    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
> [    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
> [    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
> [    9.763848]  msm_drm_bind+0x30/0x3c [msm]
> [    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
> [    9.919283]  __component_add+0xa4/0x170
> [    9.919286]  component_add+0x14/0x20
> [    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
> [    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
> [    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
> [    9.919341]  really_probe+0xbc/0x298
> [    9.919345]  __driver_probe_device+0x78/0x12c
> [    9.919348]  driver_probe_device+0x40/0x160
> [    9.919350]  __driver_attach+0x94/0x19c
> [    9.919353]  bus_for_each_dev+0x74/0xd4
> [    9.919355]  driver_attach+0x24/0x30
> [    9.919358]  bus_add_driver+0xe4/0x208
> [    9.919360]  driver_register+0x60/0x128
> [    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
> [    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
> [    9.919370]  do_one_initcall+0x6c/0x1b0
> [    9.919374]  do_init_module+0x58/0x234
> [    9.919377]  load_module+0x19cc/0x1bd4
> [    9.919380]  init_module_from_file+0x84/0xc4
> [    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
> [    9.919384]  invoke_syscall+0x48/0x110
> [    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
> [    9.919393]  do_el0_svc+0x20/0x2c
> [    9.919396]  el0_svc+0x34/0xf0
> [    9.919401]  el0t_64_sync_handler+0xa0/0xe4
> [    9.919403]  el0t_64_sync+0x198/0x19c
> [    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
> [    9.919410] ---[ end trace 0000000000000000 ]---
>
> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display=
 devices")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf590=
97a01c2b2556608 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -826,6 +826,7 @@ static const struct file_operations fops =3D {
>
>  #define DRIVER_FEATURES_KMS ( \
>                 DRIVER_GEM | \
> +               DRIVER_GEM_GPUVA | \

Hmm, the description of DRIVER_GEM_GPUVA is that "Driver supports user
defined GPU VA bindings for GEM objects", which isn't really true.
Fortunately the only thing that it actually seems to control currently
is the list head initialization.

Idk if it would be better to make the list head init unconditional, or
just add a comment here?

BR,
-R

>                 DRIVER_ATOMIC | \
>                 DRIVER_MODESET | \
>                 0 )
>
> --
> 2.50.1
>
