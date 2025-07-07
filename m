Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE77AFB9A8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA1310E15A;
	Mon,  7 Jul 2025 17:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CosisA/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EBE10E165
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:09:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679iX3w011890
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 17:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=; b=Co
 sisA/nNcWtS2/DV2jolq9HasCQctsMa5kfPmFIqLDrVOD1SDgP0JSJgyJ1+PFaS1
 zjXJ1V7DJ1yyptbgELitJYpBKHrxrieEgYp5KbfPTqfnPWHCIkO+CxmK/CMNu6H+
 1O/QSGgTmGJOo63j14IBH7EBOM97D6IUYWh61F7qbeX4l9LLcvIHZKP63SaDU8+V
 y2ewIpWM/aj8VE13eJtZv1qU+7/RTiNKWHayoFuWlhvsV9dDPmsqeXo8rqkMPy3W
 q6X6h0xSyp2wAs2whPMcFR7/wRHbjR6qJPAPx7yPqK8ICRqILPop9LqpjpX0QRj7
 BPn03wJP/Zj0p6K3qCHQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ay8jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 17:09:23 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-736ec01fe04so2739559a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908162; x=1752512962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=;
 b=IhbmxcqqF4gbGVkLL6HKZeUMFv2X9S/QQ4l9hPIIgvgEXMKIIrluY2cZkf9u9CxXzV
 J2oXqAexLNIdk0R83e2275IUf/HQx3ilsBKfm+zlHaPh5NMeMM/x+aCrUk8yvOUj7Vso
 /rWwWEWHHq2neH+Raoh97689T4uNc7zCfsUyq1BkUz1155Q4sqepMCdNXznrqr0vgRgN
 aYEkqS8cWgzTldAGQ+77N37ZLj0JUXGlLicS6l41HLu+FgV7Ktd2sw2vP53kQY/USjX6
 Yuq8JASq6dF6lv59Sx0a5Gv7gdHTDAa5/QqEQsRjYcEfyxRT9ZN4hM9FFUl+b4/ALE5r
 NWCA==
X-Gm-Message-State: AOJu0Yy2hfKPWNg70AnUukiSLq6Z/f90DC7ZOpWzaujXBcrOd6WQQSkj
 DmYakciIe5lpr8mlkBQqASTQlUUd4EsCj6lfxgpoCkNtWGvBAq8p7L9ohiseGJ3UgzGWNtsIoRi
 hSglpq//f8fApsTaktddM7rhsl9M4b/AqOZvBshtXtUiwwJFLL/CMDZIB5mmmagBnD2UNXj+xY/
 MKuDrnCm249x1H+WPBvkA7KUGV9JGRSmyIUy670ckOe0INTQ==
X-Gm-Gg: ASbGncuZ8X3/Xc/L102WZ505QVGDF9rw9+Qr25PIsr44hRkPGfCTxLUMAEYrVx6PYko
 y1ED4CGKSLvWkhZEGpqQcKeAg4AuQ/CksJCFIdUo3ZigRjGIHFEnMGNmvRKiWQ2LAmtmNhi/U1R
 BHspa0Mxk4SGdFgfU1PTLOLa5n2dqCrQnC6UU=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr8743856b6e.22.1751908162428; 
 Mon, 07 Jul 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFgTDJSExh2v7ckh3Wk01zSJ3P5QE5VWongvlxIz7t3sbZ/GbabrbWMQ+rzFK8GgUIeDgxM2pypdJm3Jto6Y=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr8743829b6e.22.1751908162097; Mon, 07 Jul 2025
 10:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
 <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
In-Reply-To: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:09:10 -0700
X-Gm-Features: Ac12FXxuUa5Yn05AD9M7jkS94r-Rdb6D2yJUjRtTcPRlVGpITucDmRppAplnMyc
Message-ID: <CACSVV03U75=5LYdWkbQ-FOU6L-F50iZ+XgpT=f6+-sRNkEv6sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEwOCBTYWx0ZWRfX25MjFmX8WjUW
 VSeKw6A7qE45796q32e/Nb/Ze+3e2oc63Q9LeHI0cb0R/G4o95yLynmmGh7v5aeamsS3XgSIoLk
 TDLKjX9grQvYeDHhyYAqnmjHe1/K0RwoM5VEqB1ZANibViLajRxE/pF1XzFZf5RXZDxJp8UGfAm
 aZWrp6OcN42fo4GgjlojW87uOfH1H4lWxSO+Lvj6W8bFIE5VrVJ3A6Oq1RLNc9rPlKt80Pfjj2A
 F4HYjWnDtNjpl0sObD4XB3RkxmqkQcSLF/xthFyqqQMVRQOsntiYec8rXLajdPAYc/LBK3jvndO
 CF26ByUetAbOtsDzPKOOHCtYlhw1oNtbOK19tJKLgB8uqR32TFnfYsYwN4jZ4u2bDK3E6+EYIRW
 oEakKez4kWATQYn1y5TP3vno6Rksd8kKTtxyGMFr7TAB0wecC3iYXBf5R3LxcOtVn4nV5BIe
X-Proofpoint-ORIG-GUID: iMuBdaFAvMUA1mLoYN_mhhhOQuo1YGg5
X-Proofpoint-GUID: iMuBdaFAvMUA1mLoYN_mhhhOQuo1YGg5
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686bff43 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=mFyTvTkbTY4ge-DhZPYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070108
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

On Mon, Jul 7, 2025 at 4:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/5/25 4:52 PM, Rob Clark wrote:
> > Avoid the possibility of missing features between the split and unified
> > drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> > in the drm_driver initializations.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index b6efc5b9933b..5695de1bbae2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -816,14 +816,21 @@ static const struct file_operations fops =3D {
> >       .show_fdinfo =3D drm_show_fdinfo,
> >  };
> >
> > +#define DRIVER_FEATURES_GPU ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_GEM_GPUVA | \
> > +             DRIVER_RENDER | \
> > +             DRIVER_SYNCOBJ_TIMELINE | \
> > +             0 )
> > +
> > +#define DRIVER_FEATURES_KMS ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_ATOMIC | \
> > +             DRIVER_MODESET | \
> > +             0 )
>
> Perhaps I'm missing some C lore, but do we need the "| 0"?

It is just to avoid later diffstat noise when new flags are added :-)

BR,
-R
