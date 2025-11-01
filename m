Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77313C27EBC
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 13:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839C10E33E;
	Sat,  1 Nov 2025 12:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtiiOUvX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clpvf0I/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195910E332
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 12:57:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A14C7Q1556066
 for <dri-devel@lists.freedesktop.org>; Sat, 1 Nov 2025 12:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=; b=Dt
 iiOUvXeQQJWf+k7n6l4FlCYsKlDOo6wF0/gVZBk/pnlRh6OG06MlII/KO57lzs31
 6yolqVLfx/pKWDPJg2lSEGPiTHrVdGog4RmfBt+mK9JM8OvFMXFbWBmR6BE3n57v
 Y/dSA/a6MGtib7VPKkgV4uNTUfe8VSnuVp3dd6kl8A98P/F5kF+zKuy8EGvLF6SW
 BmP12HgadllxbjzJYtRku64uyQQSDx7X8Q5iv31bKrS6zWuoB4xBNxZxuHkBdEgW
 XkPRE+Mu5tuYDe1venoJFC4QAQH9gTDZKBkhdjexYb7qpK0KkWoZm69rr4WwD8v0
 uJxBNoEsQ4uuYGTpGHsw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ayf8k7x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 12:57:37 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-651c934828dso5146483eaf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762001857; x=1762606657;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=;
 b=clpvf0I/QaKJ6dlWOvcz2qj+3MrOwB9+pRdmVIAWPXugjgpaJSRF9RTYeCYrIP+HVS
 wquqgjwqOuJNSDxAQQ+hPXiA6yQORIRh3zRMz7wq9r8iF8WuX9w4g+ZittA9joQ7PuRr
 Hu29hwtH/IQVvS5dSY4B8LHLuRKzGSMEJWLXZDmeVGtrtJKKROv/1+sdCOBSuE2a634N
 De6j+/tzf/vTBYNXln4K+JSBzftulwrJc1AEICNiIOCwJJuiMYorNmJRemqQ7tQgGdwf
 kuTvmoBEXTpYsn53KpvdHSQWLldwqWGZyZ2ypbnMlgM05vnhugfHfJ6vwo+gWt4H8i0U
 8owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762001857; x=1762606657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=;
 b=BZKZlLQ51/0HuWa1SRTawyGcQAVydI+dxV32gGvQxEJy9bBRiFLi+o69GACKbMcDev
 b6W9UBIqc1PWqUs3czuorxqQ3L/XV6d8kBsk83pEqMnhomoxcDBYYpg/LLuNE8J/siXF
 RBhRl+gTkmtS07MhuHBFUu+dscVngGa+cXd4hdQE3kf/xwktAE6GFVA1/nGm+aW3Mz1D
 5yHGjeN5IqeyTCMAEmiFnSR3Cf9cNYhEczwpJQkapwj3NahOcoXyFzcoidXUoKJYe/r/
 yqpqd48CDs3VZ7Oimtubr2tu8xu6XmmPIlHnkoDJSyL6cPX5iJqZbcJbJfzZPYVwA7xA
 Ydlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaW7+0ut72GwjGeqCT7GlOpCsoKQLy8WcXhTxwQg9mgyQPAMUsvadBxITPOmLS/eIpcowov5Zb4Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvilbH4K+yyX5in3KdZRD758HcFxXXWynTAbTOIXI0J+mZm7+4
 1lZCoig+ag6V7YwSlfCkYHrKdFrFHOh8u8Doo+u0fd/h7Djskv23ubRkY5mU4La4Eo2hk6toAHu
 BotF9mDKtKVnWjDCjxEDQJhwecg6xSDavnXAEr4mA8mjUgf1XoC8e7uCPPVvI0dQZZ2H5E2cSJx
 cCcOWzEfiDUznBQ0+Kh7vqx0lCbM6QODp0EzvkU5iaw/PDVA==
X-Gm-Gg: ASbGncsJoU8I1RjHSG/61k6mxGi+gXNtpsDUrppIW3C2Rk1K4oQEaJlW17sxDFQCt4w
 mF1mtFRQWgcFIgDWtQ69JPZdL+26JGwiJrGvD/N0FwvotwL2vo0/WO8qvYMXc+3H5AMD8hB1rxu
 3y+A51h3pRo/Arx79QA1dUj/Ffl4+a0RxRxQZHBdew1W8YRvxsvrLiedSMP88MIhX1saKZ6Jdq8
 gh9Abu8eoB43oM=
X-Received: by 2002:a05:6808:1395:b0:43f:75c5:57e1 with SMTP id
 5614622812f47-44f95eb9a32mr3052047b6e.18.1762001856931; 
 Sat, 01 Nov 2025 05:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSZCgJFRRbRntQyU/jMD4SdopeuBQLtXGPHNOR+3XpYFUVZPmSaDlMP5/4p8dDW1tBsNVfQYutjVNe3R0atsY=
X-Received: by 2002:a05:6808:1395:b0:43f:75c5:57e1 with SMTP id
 5614622812f47-44f95eb9a32mr3052036b6e.18.1762001856562; Sat, 01 Nov 2025
 05:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
 <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
In-Reply-To: <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 1 Nov 2025 05:57:25 -0700
X-Gm-Features: AWmQ_bmJNIWsGXJ9igpVvjSPKZvPAb_uZwlX3x7hysAr5tWUQUTqmyJnka2MZDs
Message-ID: <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDExMCBTYWx0ZWRfXz4webjDs9BTu
 nuJeIspSblXYbMdZxYqsnQfCd9fYyiaOzk5HQZrM6vGHi0npvcd+WNum8LkeTt/NVwGP/3cmGC/
 xIse3P4GO4Q0aNDYGGwMCB0oPgkoUhhbzsEJDMK7GSQTkfV7lA5p9SxBJkCLRYgDeRuXv/KSWIX
 eGGS7HAYsisnjyDuoeEui7PbRh2wdfHm8+ONPSDCauTDvtUnQTOo+JwH7WkijkMhyrwfYHP19TW
 e+6UaAwQ6KjTMHN8cND0bfm295baa48HxjtGmA5PPF3cg8akqqxltHkGoGAdlu2sh2l8o5g1WJn
 ZUq6Cd0231139ms+Gr8X+HCbIVht/1KKcGig9KGjMHF7wCHsJiGLcKiZzAt2AlcEsl0k1zJyf3+
 y4LuPE1hnpSiXJB1HRRO6g32f5wggg==
X-Authority-Analysis: v=2.4 cv=Scj6t/Ru c=1 sm=1 tr=0 ts=690603c1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=YJZoVlBuq9nIZB7zQycA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: MNqY5rxwBNybMQMpZgjPK6nVtWhs-1QO
X-Proofpoint-ORIG-GUID: MNqY5rxwBNybMQMpZgjPK6nVtWhs-1QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010110
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

On Fri, Oct 31, 2025 at 4:43=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > Add the IFPC restore register list and enable IFPC support on Adreno
> > X1-85 gpu.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++++=
+++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> >  3 files changed, 79 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b2=
7f08a5b1eeb08dced 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] =
=3D {
> >
> >  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> >
> > +/* Applicable for X185, A750 */
> > +static const u32 a750_ifpc_reglist_regs[] =3D {
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> > +       REG_A6XX_TPL1_NC_MODE_CNTL,
> > +       REG_A6XX_SP_NC_MODE_CNTL,
> > +       REG_A6XX_CP_DBG_ECO_CNTL,
> > +       REG_A6XX_CP_PROTECT_CNTL,
> > +       REG_A6XX_CP_PROTECT(0),
> > +       REG_A6XX_CP_PROTECT(1),
> > +       REG_A6XX_CP_PROTECT(2),
> > +       REG_A6XX_CP_PROTECT(3),
> > +       REG_A6XX_CP_PROTECT(4),
> > +       REG_A6XX_CP_PROTECT(5),
> > +       REG_A6XX_CP_PROTECT(6),
> > +       REG_A6XX_CP_PROTECT(7),
> > +       REG_A6XX_CP_PROTECT(8),
> > +       REG_A6XX_CP_PROTECT(9),
> > +       REG_A6XX_CP_PROTECT(10),
> > +       REG_A6XX_CP_PROTECT(11),
> > +       REG_A6XX_CP_PROTECT(12),
> > +       REG_A6XX_CP_PROTECT(13),
> > +       REG_A6XX_CP_PROTECT(14),
> > +       REG_A6XX_CP_PROTECT(15),
> > +       REG_A6XX_CP_PROTECT(16),
> > +       REG_A6XX_CP_PROTECT(17),
> > +       REG_A6XX_CP_PROTECT(18),
> > +       REG_A6XX_CP_PROTECT(19),
> > +       REG_A6XX_CP_PROTECT(20),
> > +       REG_A6XX_CP_PROTECT(21),
> > +       REG_A6XX_CP_PROTECT(22),
> > +       REG_A6XX_CP_PROTECT(23),
> > +       REG_A6XX_CP_PROTECT(24),
> > +       REG_A6XX_CP_PROTECT(25),
> > +       REG_A6XX_CP_PROTECT(26),
> > +       REG_A6XX_CP_PROTECT(27),
> > +       REG_A6XX_CP_PROTECT(28),
> > +       REG_A6XX_CP_PROTECT(29),
> > +       REG_A6XX_CP_PROTECT(30),
> > +       REG_A6XX_CP_PROTECT(31),
> > +       REG_A6XX_CP_PROTECT(32),
> > +       REG_A6XX_CP_PROTECT(33),
> > +       REG_A6XX_CP_PROTECT(34),
> > +       REG_A6XX_CP_PROTECT(35),
> > +       REG_A6XX_CP_PROTECT(36),
> > +       REG_A6XX_CP_PROTECT(37),
> > +       REG_A6XX_CP_PROTECT(38),
> > +       REG_A6XX_CP_PROTECT(39),
> > +       REG_A6XX_CP_PROTECT(40),
> > +       REG_A6XX_CP_PROTECT(41),
> > +       REG_A6XX_CP_PROTECT(42),
> > +       REG_A6XX_CP_PROTECT(43),
> > +       REG_A6XX_CP_PROTECT(44),
> > +       REG_A6XX_CP_PROTECT(45),
> > +       REG_A6XX_CP_PROTECT(46),
> > +       REG_A6XX_CP_PROTECT(47),
> > +};
> > +
> > +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> > +
> >  static const struct adreno_info a7xx_gpus[] =3D {
> >         {
> >                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> > @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> >                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >                           ADRENO_QUIRK_HAS_HW_APRIV |
> > -                         ADRENO_QUIRK_PREEMPTION,
> > +                         ADRENO_QUIRK_PREEMPTION |
> > +                         ADRENO_QUIRK_IFPC,
> >                 .init =3D a6xx_gpu_init,
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a740_hwcg,
> >                         .protect =3D &a730_protect,
> >                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >                         .gmu_chipid =3D 0x7050001,
> >                         .gmu_cgc_mode =3D 0x00020202,
> >                 },
> > @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .protect =3D &a730_protect,
> >                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >                         .gmu_chipid =3D 0x7090100,
> >                         .gmu_cgc_mode =3D 0x00020202,
> >                         .bcms =3D (const struct a6xx_bcm[]) {
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172=
efdd7255165f3c04a 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_g=
pu *gpu)
> >         u32 *dest =3D (u32 *)&lock->regs[0];
> >         int i;
> >
> > -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> > -
> >         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> > -       lock->ifpc_list_len =3D 0;
> > -       lock->preemption_list_len =3D reglist->count;
> > +
> > +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
> This is NULL on X1-45 and causes
>
>   [    8.795603] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008

Hmm, this is probably going to happen on all a7xx which don't have
IFPC from the looks of it.

We should either check for the IFPC quirk.. or maybe just drop the
quirk and decide whether IFPC is supported based on ifpc_reglist !=3D
NULL?

(That said, we probably do want to have IFPC enabled for x1-45)

BR,
-R

> > +       lock->ifpc_list_len =3D reglist->count;
> >
> >         /*
> >          * For each entry in each of the lists, write the offset and th=
e current
> > @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gp=
u *gpu)
> >                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >         }
> >
> > +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> > +       lock->preemption_list_len =3D reglist->count;
> > +
> > +       for (i =3D 0; i < reglist->count; i++) {
> > +               *dest++ =3D reglist->regs[i];
> > +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> > +       }
> > +
> >         /*
> >          * The overall register list is composed of
> >          * 1. Static IFPC-only registers
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.h
> > index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa426=
9ae7783ed3578e40e 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -45,6 +45,7 @@ struct a6xx_info {
> >         const struct adreno_reglist *hwcg;
> >         const struct adreno_protect *protect;
> >         const struct adreno_reglist_list *pwrup_reglist;
> > +       const struct adreno_reglist_list *ifpc_reglist;
> >         u32 gmu_chipid;
> >         u32 gmu_cgc_mode;
> >         u32 prim_fifo_threshold;
> >
> > --
> > 2.50.1
> >
