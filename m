Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49091B3290A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 16:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4463910E338;
	Sat, 23 Aug 2025 14:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJZIvXYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63B510E3CF
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:16:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57NDKv56030413
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=tHzxtlQVpVC5JdCMc8tuGtFWq2Ma7Zo03QGkzubuu/k=; b=QJ
 ZIvXYC9caKCMuFvHsPznNdXgrlUedgIWff8OAzNC8Mzr1/qQDLxMyksoHorQKthX
 wlCutlJw1i8TlLQw5opH4ZFTMIYN8WLn+l+Ao6DZNDKxuj4UPBrT6/kGmfLS42h5
 JDHXmzS21lI7Gw1xEoYHEY0hF1pFIgX6PtBMmNDaKfg1bSZTmNUmOLOKU3rxlw/Z
 fmNo1RWb5anVLNXdyCQEQSHs2C6AaJRhKougHbuGpzMDuDN3lNMKfI47JaO+ipFM
 xEXTK/oAKUhT1Dp859imWZ3c65HpGKUR7QcquORDD+MAssKoqMjhnrBEYNGRaNT6
 Ui8qAQTukisojZ+XFBOQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdrxe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:16:36 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-61bd6d7c149so1386334eaf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 07:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755958596; x=1756563396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHzxtlQVpVC5JdCMc8tuGtFWq2Ma7Zo03QGkzubuu/k=;
 b=HVoshXYFFf3lHWrPp36qjaKpzO5MDuXQWqSrXxL+WFNR+lHYW73WJRznNcH+lvfVWt
 jYJ6YDzPimgpLRn6xHGBMR+9W0jtyJgLg/u4pfnVatsJPYwfMahI5FrzxHcKFuxnX0F9
 brnHTGsDNF4C+AwiHzjRrd54Dz3qMymi8A9mGCKZeikxqjMns9qy5oAh27ZBO+IrScbH
 UcLV2GuUI6lgoDYZVetZfjtMDJjEDO4wZhIaqAFucWcp/bEVMD6gZ+2UZyfVcVO7Qt9f
 JCHvgfPBcrzDrOOK0h1hBa2kLbkU88UX4BK3vKgc/C6QjqfWfssPRspN5rSBWisvK9S7
 rLQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdSxxR4/XYvRyZhAzMCZklthLGRmR7mbpHcfKmrfsRIWtw6JRkD3Zm6wEy6vBnBdniaQ6CN4JBUzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvYdPXkVf+U2Oh1rV1v48s2FPiocbTz6BtXCcW0uFZT6kTDHyO
 X+fZE3O1OnA24KjdgPP6/pWeat7+10lWnUDx8CUz+MAxdPfquBw0JEIwV4jaCRPByzNOoJeMw+x
 TFeZgqpbQIiFT4KdIuEGHrByyzIRgcXBgla+yCXcvhcuZiYVoKkt3Z2w07G9Mr0cfvmICFnUQYG
 c9VQgkajcShKZ4/BAvXPuqJiclL4W4Q/1SY/bmHL8/fm+b+A==
X-Gm-Gg: ASbGncucn9yAtb6/yB0BQlgp8TBEyF1/7F+ICRFHSdaOkXcMlmwTkarDVGJcBUc5lDi
 vYT5NmkRZ6LpCR615EE5REE+1MNM4qmEnSLKtWaCYEL/AbEcDCsNtx8QwwkfnLt0ZJ5mtA905J9
 7yBqu9uZaxI+RZ6BuG1WuMbSEc//TEe5cbR+bXrNh3dtt5uUu1eBJc
X-Received: by 2002:a05:6808:1816:b0:437:75ea:6c73 with SMTP id
 5614622812f47-4377db3d1bamr4164404b6e.22.1755958595958; 
 Sat, 23 Aug 2025 07:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz45QXys2oJtBIlZEp22ZSDXi2Xy8ce0RKvLyzN43wVE0rZMnjq6sHqDOzozGaYpqLEzp3LKatNVdSmB3HMgQ=
X-Received: by 2002:a05:6808:1816:b0:437:75ea:6c73 with SMTP id
 5614622812f47-4377db3d1bamr4164390b6e.22.1755958595550; Sat, 23 Aug 2025
 07:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
In-Reply-To: <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 07:16:24 -0700
X-Gm-Features: Ac12FXxJo_V8NE2Itbp6c9Xk0uvP-h0DrvgmNQ_gM5X36Csd4Q3N56neCim3asw
Message-ID: <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pu9ccaAJtd8pQZms0GoosuSDjfKA8b-t
X-Proofpoint-ORIG-GUID: pu9ccaAJtd8pQZms0GoosuSDjfKA8b-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+EQP38h/BwnQ
 xeSMDMk0QWESTIrBoBhpD6ug21aUsPpcD/OpfyaPz6o4+ROoOlXCbu4sNXSh/iGuBGhA7tEbGb4
 uWZYXc2lLEnWwApFH96J8kvwuxXK73h70Ka3rmiv7QzfPg/IM+7Sd5pGDJdcR0mkNjFS1OZWS8k
 Z2m+hPZrAvuAU6d19WYHeCGDHYEICMfN9DU8gVUSea/PnzhkVguoHJ3KipNGbyDGss/Ou+j/MbX
 W1ClhEI0HITmk5j65zG/yrdaND//nRlTKH8bg2Okgw9Nra9oqIAo9/0AgFjMRsptDx4HntJhCVF
 1t/jDb6p7p4uyww4m5CWirdH1TR/1+n7T5nGXJcB5QDfhHyvjYsseCQ18jueC5msET+Xgwmv7oA
 gL+LrW4l
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68a9cd44 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=4hXh_QXROP5yvhQfHEYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Sat, Aug 23, 2025 at 6:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> > Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> > before adreno_common.xml.h is generated in trees that generate Adreno
> > headers at build time. Make msm-y depend on the generated headers,
> > removing the race.
> >
> > Signed-off-by: Alex Robinson <alex@ironrobin.net>
> > ---
> >  drivers/gpu/drm/msm/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefil=
e
> > index 0c0dfb25f01b..1a918d44ac48 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
> >       generated/sfpb.xml.h
> >
> >  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS=
))
> > +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>
> I'd say, no. The idea was that msm-y should not depend on
> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.

probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..

In the mean time, I think we were going to drop this patch from the IFPC se=
ries

BR,
-R

> >  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_H=
EADERS))
> >
> >  targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > --
> > 2.50.1
> >
> >
>
> --
> With best wishes
> Dmitry
