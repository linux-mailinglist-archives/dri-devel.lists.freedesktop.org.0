Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1928CB3DC3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 20:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420DD10E26C;
	Wed, 10 Dec 2025 19:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aV5d3nWP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPR4M6jM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E010E26C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:30:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAIRZ774035236
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9L2O7qJqRbBAsKFfERh2S4V0
 Wy8js6umUKBBvCO1IHI=; b=aV5d3nWP0NZz5NVW956uSMu1vOm6uViY8SswRNIY
 dUmIYz/Q9NruXYQJ+PuBKXx++iHE0Sf9vYLKAyRG2sb6FHwqqVi1AlaCcnIj0vR0
 KphyUnJlub++oawy6tN5+KemHHv3G62af9Kag8WhCz7VmOUcLAUWstwhzkN5VBiI
 s6xgQ1ScIpeDt5sX8c2KDnWpOIA634YNHNaXg9E9ndppIqw/dP6KKpHV4v0XJ2Fu
 tMja0Pw4wMIGHmHa+Yw7ZwZNiqwZdp1e3qCgzTmjYP+620ZUmmBxSsMT6AElzTPP
 RBmujI9ierM84poNXbwfrYs6AynDDGLlgzh33H2v52aP0A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63fsx8n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:30:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5e5632c20easo77809137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765395024; x=1765999824;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9L2O7qJqRbBAsKFfERh2S4V0Wy8js6umUKBBvCO1IHI=;
 b=FPR4M6jM12OJSRwpEL7mqAh721QAIoVkPf1lRkLuS2W5qSompwutzS3LrXfo/ksUe7
 oG/+4BSVNamI96yOEyZeemcf/0KQdFS3JJkpa4G8/2tc+Dgv3elwpoCnD7gXveF7trc0
 T7RuG/JhzcLmdsR6d9EsUB7UHOk4vwmG0Yrldw5mim9pOb27IsaXqXWDAo2yxASyupkc
 LrQCFzsURdT5f7Cubn0KA2BGWeGzwBFxFP1w2/yxRPJDTrzpqz8rRgBEVNW5j7CDFrka
 hmnJOEMbFITzQLoMEC4w4YyJZQkFxLgVsllC9ME/E/NJCrcbqzdjz9uYmn/L4dWT+zUk
 FlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765395024; x=1765999824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9L2O7qJqRbBAsKFfERh2S4V0Wy8js6umUKBBvCO1IHI=;
 b=fExYLn0xHRsbS0Dl0PZIzFTlWFel6fD3pM8CxetQBo1pPLyAkue9ehcB9GLdwzAeR2
 tgfh/B1Z60V7Uylt7mghZlBIGZcM6DiILI1DV8gh2TgUhJHufGLKWAmzawIiwtGBNJ20
 QG3ZReQ6Y/CaJXZzFM6IVUvJoEd/c8GxTPmtNT5KNuB2O8UlT2kAqNAVBNtBvFOtSAlx
 HQ0dBXJ7cmkKoG4o6hExVIY5rMqra40rO3jGrOWTXTRDaIZGCDYk5EafN6w5k6MyBzGD
 YFaP0hBZ9YJwikXGHPT0aL/o4Uiy+lcWz7KPF61+gkYD0zvfdicV6nupRcxttHu+rZ7Z
 3wPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfcABsIE93HZkjmyb1bc2UKekAzVG95w2px9CSsXWPecfMQy+bhkgndzbpAZy8bAx1EKqrHzQz1yI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR+QySrE993qGwl2bKLw+ZQ497pC0iyvFexJ3oG2yv+Mt10iOJ
 diMSdxiNjGeECpMsNXc27OQOrSJKqHJ3CaD36oCP7+lah7yS7w1vSG9uoLVMcdlX6eUn1lu8JgU
 qWGpr3h6dcjlTCU9jxb0T5AD/LP2pWTbHQb63utFhmUbd13ANCSPIzSHsU6bxUOjMxPs68IM=
X-Gm-Gg: AY/fxX4MahwVcnUimLKvYOvza5y5WzibT7UhuPNgigmC+bdwwD+iT2u84mnn17haM3K
 4UyIw0pjy+JXN8VGzDHpANNjtLH/tLTf/MCDdDH9us4FRAlRsL9Avks//FkfvfAEAr3t22M0T8+
 5LkReBErbvT+y0+yv/qw0fbyrMmlcA9T0oKZjBBu6z+sM7je5rc+un3k4Wm43PoayMgegflAIUM
 YzveIjWocuG1Tu8BLHeGLFsYwgiEj9v3zInj8ZSe6OJCm9xe/zFq2K5NdMKOrBSQE7Hs9uevBbo
 Ab8t/MlSZttKHmPfG05w3//EF2FpoHvcPOR18C/VCOdctICuMxRHw5S9mO2StlLxKYzzN4X3c26
 m0JlA1rNwHrPtBQnGo+OaHsmYBBoEK09qrIQkJRAqNXGJhdJP1TCZRNJlZYPRcnPls4Cxcy6vtw
 dmO15V8z0pi/+rwEoeHyhIDxU=
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5e571f1cc97mr1085459137.40.1765395024456; 
 Wed, 10 Dec 2025 11:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvnyaHmfXL7ujjLA1dO0Btd+zC3t/+63/Dvuqr+u4Uhc50grJlKCdJAW0WeT54bdVE1IylmQ==
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5e571f1cc97mr1085445137.40.1765395023973; 
 Wed, 10 Dec 2025 11:30:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fbca8cd3asm832211fa.39.2025.12.10.11.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 11:30:23 -0800 (PST)
Date: Wed, 10 Dec 2025 21:30:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jun Nie <jun.nie@linaro.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
 <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
X-Proofpoint-GUID: 4rxR97l-ypqwO5mlRF5Dakxh6dGLaKmF
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=6939ca51 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=AkOOjSqQI7qdMes6WA0A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4rxR97l-ypqwO5mlRF5Dakxh6dGLaKmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1OSBTYWx0ZWRfX+IucGcKf4nkF
 i1B7mf/8cIp2TxLiX0PlKtp9bFqwmalKCbxvN5OWt4K/+Q7ofOvyD/xgRmq8NOJgyyXI4AFRa+G
 VGSmznJbvT+AHYyBEyxen8Vy69tVbSEvIuRhv+g0bzmwRJS0T9bGP63t47Sp+rozO5/P9TFNbvr
 0FkRl4kqojhNWNua6zpT9eCytVjFG/A/ug18iKt/xASS5z5XsTukLggdEVpvRR68rUuFPBZSASE
 KnJ+jlkk/oIPrrn7mmqpW1CrMrarr4JCdeZ0wm2sX4vpLcE/3RuzHjJbiWHiuS4vXOoGgVQeeNT
 RDYakv/KM3tpZhkU4YUKPSayv8IOGMlOM4u1c0lyQ1UzEBFHCaf4DAndvWGb+IQLa1N1Ch/42LY
 WyS8L8HmPy/gyMHszGLpZPQ/JN9P6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100159
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

On Sat, Nov 29, 2025 at 05:37:43PM +0100, Marijn Suijten wrote:
> On 2025-09-18 21:29:02, Jun Nie wrote:
> > To support high-resolution cases that exceed the width limitation of
> > a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> > additional pipes are necessary to enable parallel data processing
> > within the SSPP width constraints and MDP clock rate.
> > 
> > Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> > and dual interfaces are enabled. More use cases can be incorporated
> > later if quad-pipe capabilities are required.
> > 
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 35 insertions(+), 32 deletions(-)
> 
> With this patch applied, I get the following crash on the Sony Xperia 1 III, a
> dual-DSI dual-DSC device:
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> 	Mem abort info:
> 	  ESR = 0x0000000096000004
> 	  EC = 0x25: DABT (current EL), IL = 32 bits
> 	  SET = 0, FnV = 0
> 	  EA = 0, S1PTW = 0
> 	  FSC = 0x04: level 0 translation fault
> 	Data abort info:
> 	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> 	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	user pgtable: 4k pages, 48-bit VAs, pgdp=000000012d4e1000
> 	[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
> 	Internal error: Oops: 0000000096000004 [#1]  SMP
> 	Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus gpu_sched drm_gpuvm drm_exec
> 	CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U              6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NONE
> 	Tainted: [U]=USER
> 	Hardware name: Sony Xperia 1 III (DT)
> 	pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
> 	lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
> 	sp : ffff800081e23940
> 	x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
> 	x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
> 	x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
> 	x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
> 	x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
> 	x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
> 	x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
> 	x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
> 	x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
> 	x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> 	Call trace:
> 	 dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
> 	 dpu_plane_atomic_check+0x100/0x1a0 [msm]
> 	 drm_atomic_helper_check_planes+0xd8/0x224
> 	 drm_atomic_helper_check+0x50/0xb4
> 	 msm_atomic_check+0xd0/0xe0 [msm]
> 	 drm_atomic_check_only+0x4e0/0x928
> 	 drm_atomic_commit+0x50/0xd4
> 	 drm_client_modeset_commit_atomic+0x200/0x260
> 	 drm_client_modeset_commit_locked+0x64/0x180
> 	 drm_client_modeset_commit+0x30/0x60
> 	 drm_fb_helper_lastclose+0x60/0xb0
> 	 drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
> 	 drm_client_dev_restore+0xac/0xf8
> 	 drm_release+0x124/0x158
> 	 __fput+0xd4/0x2e4
> 	 fput_close_sync+0x3c/0xe0
> 	 __arm64_sys_close+0x3c/0x84
> 	 invoke_syscall.constprop.0+0x44/0x100
> 	 el0_svc_common.constprop.0+0x3c/0xe4
> 	 do_el0_svc+0x20/0x3c
> 	 el0_svc+0x38/0x110
> 	 el0t_64_sync_handler+0xa8/0xec
> 	 el0t_64_sync+0x1a0/0x1a4
> 	Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
> 	---[ end trace 0000000000000000 ]---
> 	pstore: backend (ramoops) writing error (-28)
> 	[drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame done timeout
> 
> I don't see any thought given to it in the extremely terse patch description,
> but this patch seems to unconditionally select 4 DSCs and 4 LMs on this device
> because the underlying SM8350 SoC has 4 available in its catalog - while it
> was previously affixed to 2:2:2 matching the downstream and known-working
> configuration of this device - and I can only imagine things are rolling
> downhill from there.
> 
> faddr2line seems to be failing for me, but this is the line
> `dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:
> 
> 	aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS | grep dpu_plane_atomic_check_sspp.isra.0\> -A80
> 	00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
> 	static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> 	...
> 	   67234:	f940101b 	ldr	x27, [x0, #32]
> 		if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scaler) &&

I think it is:

        pipe_hw_caps = pipe->sspp->cap;
    14bc:       f9401018        ldr     x24, [x0, #32]


So, please check why pipe->sspp becomes NULL (or where do we miss the
NULL check for pipe->sspp).


-- 
With best wishes
Dmitry
