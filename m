Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D6D0E0B2
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 03:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7E10E1C5;
	Sun, 11 Jan 2026 02:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmPiFGX1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEsfkck2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043EF10E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ANMpuV384403
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=; b=Vm
 PiFGX1c1vKbqdU0TKycFLpnnPqXpg5C3Kr4638z6ZzOh55JmoOyz13CjWLkHxkzc
 zMK4DYOIm+wsrMc4Q0+loYnxbFOVz+j/KcSteXejUZ9AVeeorJRnET1+VGulCXXj
 GqL2bXQoE4rwOg25TFap+73Y2w1uznosbJFDWMfc9RRQh3T2SPtLIHp36w+PjgSc
 ttKF9AxzFWlxSvQ7wOxxPQ9kEGBKNz807kOTU8Ob4LVMU8bIGecIuapl26RRfBK2
 lfPLdMDkWKgwatVJMcszzVbIUzystDsIV8xx9YZOP9hV2Ll0enDKc9VpDhId0n24
 NdTxu/FXaDhzWSj5bWMw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf579j7j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-45a6c0f1c15so4804862b6e.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 18:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768098250; x=1768703050;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
 b=HEsfkck2/RhqZNFkCTPS1UxFPVy0I6dUsK77dKyHLJQg6iHCBvSGgtL2D0W+DBIU5M
 J1tSkR37r+gbpcV7FNrybLL+Jod44xK3GEYZGdzmdu/76SsKRCD5hSX5sDZSgbTUaPVH
 y3sqyMWXq2zbYm8vhFLmjZPH0c4l5gwE1pTV9x0OczfLxqTLfN1VIy4l2qhq76nWBuRi
 pUBug4Qgaq32SO8cxQFkGVOaFQ6xiiEPbA6vnzZM4yfW/J9Bh+T1Jq5NG89p7JOoB52H
 6Ingi/wlzBGiqIW9yl1OzVObBQgPSS1YIuyY/fjD9jZhzX7F8UublVLKW1HRMXo5jfYe
 l++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768098250; x=1768703050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
 b=lwqB588PfiTarujbq+rZx5x3rX/RU+KqyXf9g4xHcMHPfMRfiw68Yykc6HJVO1h+Uq
 A4l0GPC9A1uRnZi0GvxaOf5DMUqVfhMJtJaytxCiQAw4vL7bRguY67ML5Sco7MG1LRC3
 esj+E3+c4cVRq2/IvW7fKAK2Dbx8mhZRMtnh0dyehjAM+8s4+EgihHOdFOQz7DLBtNh2
 Uwf0+gYUagt4zMWtJXfvYUyp7phUWk4s3jTJjpWl2y3CKnOjUQM1sBoJgREc9Lxp+zuK
 JyrwCHfS+G36a1MDFYslrj4bH61GDQMK779/Z28E5JBQCZq7Tfl7ULwyC1d080awOf86
 i7IA==
X-Gm-Message-State: AOJu0Yzjk7+d2S5PFQLmBDWekf27+qRT47/yBUmt+vahxgQlr4eHXNiv
 rsft5RFm3VTwdbCLmhGeN+huBlXZAfUBq6pjLfAVmNOQUxnBO0OYJgS5J11DJtYTtYERvIV/r5P
 inaUg89hsVPAIGPVK6xhqU/FhPlSoDgBRVzzM54nsXLuQtADEgdit9SF+yobtkAQ6S4VbxZxEwo
 /LUQjajOS40/knu8AbzuBQwXK8qv3vIFyp5BlVXHt6//MsGw==
X-Gm-Gg: AY/fxX5iK5W6IR82KZ7J8i6wBe6pFU49VeRZVfIXhXioC1Q6FAmSWfXydu7zjZZNEgt
 nYFiLnQQQ7XPe8ID7cjmMhvjUWu+l070DZSUYPL5qf/qIX6pjUnW0Onz73JMzj+3DdpGIzxzsLT
 sj/DDYRl41emEZl68RnGq5mi6gz4Xft/2wzxsHx4Kn29mjFyyGYssInhFGYPIg1Yx6Wg==
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id
 5614622812f47-45a6bd53fb9mr7611224b6e.12.1768098250434; 
 Sat, 10 Jan 2026 18:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZCXxumreVsEAC+mOBpwX0ObCz4RryEbZ294If65z2upgBBXuNeAZ+1GulIUBpl6GgB8Nzvm3UMyAwatN22nk=
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id
 5614622812f47-45a6bd53fb9mr7611210b6e.12.1768098250085; Sat, 10 Jan 2026
 18:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
 <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
In-Reply-To: <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 18:23:59 -0800
X-Gm-Features: AZwV_QgCfLYp9_RTLz0X2-33DvwusCJJr2t2IF7t2E866j79DbjUC3J_YmBXnVc
Message-ID: <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=696309cb cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wUCF3RwO_GvFUl8ueR4A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOSBTYWx0ZWRfX7xO3hShxrFFd
 EOSXOQ3i1gSar7aUbAluBOTY4AI1IVToPdIhzSRuGmP0l4LwkkhWDVXU7n2awkAkr+BTxiVYlg2
 sMM6an3+xIeJ8ORelzfqBSFjkRlbeYtzs7c8xpe6xXOWNLImQgApiHYkGqHZARvlnQcWpzzWfMl
 iiEOJuuB+9U9rA4Js5d2dW8XeyhXyKebR9FK2PZTluBL7QlSPKeDpNsUJI8SByfN/4TouliC1i2
 tWgn4xhajVLD1jvtU0SaWifmy0imACnU5ZsJcBE2K1/fo+onXWTiNrzVUzY79gGb1QZrGt0jj+s
 cPnZ2mgxRrKHs+mvIsDuLO9UUz4LkI0gtODPhYO4zLcp4br5QOxiqgWfVnLjC2DGkL7bdm7i2yS
 F7zVA7eyCQidYWss7Y0KoPTUv6hAL+kVzoA+9GNIf2rxBQN1dlgpV+XINafntYYrvSiuWBRtwOo
 a4lwF9kJ4QS9GHxAD8w==
X-Proofpoint-GUID: XNQU7L20d7qLKK-aqjt1vh_OMemKiD9Z
X-Proofpoint-ORIG-GUID: XNQU7L20d7qLKK-aqjt1vh_OMemKiD9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110019
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

On Sat, Jan 10, 2026 at 6:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> > This should also be zero for gen8.
> >
> > Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 1c80909e63ca..d5fe6f6f0dec 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >               *value =3D adreno_gpu->info->gmem;
> >               return 0;
> >       case MSM_PARAM_GMEM_BASE:
> > -             if (adreno_is_a650_family(adreno_gpu) ||
> > -                 adreno_is_a740_family(adreno_gpu))
> > +             if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
>
> What about a7xx gen1? should it also be 0?

*probably*.. I'm guessing this was incorrect before

BR,
-R

>
> >                       *value =3D 0;
> >               else
> >                       *value =3D 0x100000;
> > --
> > 2.52.0
> >
>
> --
> With best wishes
> Dmitry
