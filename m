Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F810CE48BD
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381810E0C8;
	Sun, 28 Dec 2025 03:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBwh2Cl6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu1S6eX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2010E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS10cf7688966
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=G5ZtyNhbwgn/S3NWbt1gNJl8
 aOXPg2uVBnJuiZYIEQM=; b=RBwh2Cl6gv8S5hJuNG5hcQzUg1oqYqLxV91bNY2y
 ihfJ4XNtZkVKBz0Z4efX6uXaYdB5YvhRCgm7VNu3Da0MiZMwE4fc4m1ukcDmB+YX
 QuYSYrmU1E/KpdTman+FDwda60vaBj1iYpyMICpFH3s9DdJlFi9OTVPN6S4zfI7g
 p2AcfYGCmg2bTnWnaxt21x/wOl5iokjaFr+GUmPP2xI/aaTs6R7ajtfUT4iqBnmc
 DnHxkzI4PaV7FMBcA4vhzv1sbqRf7SJovfjoeqQi4h/uq4ki95n7OSg34GxHpw57
 m5kVVGG+kgbYyGENlWIkLQBD+CXqK/Ag3gmMcC/iMkJxpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r69hta-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1d26abbd8so240622571cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766893717; x=1767498517;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
 b=Vu1S6eX3t0FnaYJH3LA5hhoaZyLx4QNqdlB2CY+nBZ6+PIeWsfZzSAQUEDaRX0YuYt
 PxyKduLcZ9Gq1SuZt3mdDWEyThP8m9TWQrjOKS0pD88SyIVuRz1MrkM3dIMtIO9irZR+
 zSYWlnJy27NKcPyjsk9igw3u/jFVfiyE3Gq/zgs8Q3CUUmIDKyhgfBMmoAKULyFsS+rR
 IbLuuz2TBJxJQ7G0e/jmyooePS0m1MTGU+7jaCUD+zRq1AwBR0QAz9TJivIJqtTYyoBS
 TJiNfD+byUQ/lJOWJuvNnoEZou4WVsYbyHOhhCmug2caClg1gs1wJtY4MXWDtkCVF891
 QDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766893717; x=1767498517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
 b=RyiQIpPRyMHId0azFc7oCM8ncw3gCUsOlRqz+igP3kHZSQC1VHeLN1Qyck+bWCtDnc
 Ge8FTa3T08qzY0b6GpXQHGsbWgUKqfvSc0193D0lB1zeubLn960ttRRQpPbRk4JayveP
 qERvt46JyOY9VPNO/TLKrFMjC1V2jbsBJG/BTR/K3hn6hB3bLxQWLQCWtcft96ZwelDi
 +KY4Jxk/dsO/I5VnQEJcZd3BVrs0iY4joOntWLYo9i+YF/EoLAO5WQ8ilNK/ssUNTRfW
 nw43UzVLaIOukei5QFWv1huc47DAhcbqhMPSqzIXyFKTt4XXQ9uFBCK7mjUSAC8ok6os
 BY/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ0eOBwL7swFxKtdhb+WNutYGzynDLHGRL0WQAbQn62PpR8sm/AKCSlTxt0laN5wPljYQTcj2yRho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQhiUFDmLEGBNtfZT0xW4ure5TAbCbuxL4+T1ihTJvce2Dsdeq
 BQ9h6WS7cJGAQEnjQdue0wGGBhNCJV9m5vgOrHWRKz/Kb4/IIu4hXdppPOKyPtJbBv74uOQ5OFu
 lyo6P2AbCeSFzjxfrlHF747amUEaxWVm70cP3BgdZ7qg40ASEtrDWnu0iFy0sjZAJSypklt4=
X-Gm-Gg: AY/fxX418zGiZLtyUz5giYOZZJxYyr8LzKmJkRMX5ivdEH8jM5mvKbV+3uCqho06NTH
 WOkF8/CfFygmR8ELM+ADAMTrP8iFgG1lLhQQMdfbfu2Ag7zegFmVKdg99gXS24rehp3dw73vOcw
 X1OfqEZ/83rjcAR1WV+QRf7X2Vr7oqx48C00BHvbYf3sC8DvUFlVjAner6Qg8dakVm+D7yfdVYQ
 xQOAcAscL+2NztQWpDLSLRwnkn7fVwDW5jU8qKdqD2fqSTrvmLPsfPuRoRs7QaRJ50s4v43cNF/
 VtlDaP9p+ATacGVYw7zwl3gPWTepCNmer9Vh0gI/RhBU3BQ0igJO6W3dR2tIYsu2OWsoMnHdiSY
 zN1ZDpJ0sCO/HliuRFpdViyKdLzlzvC0EGRajXCJZa+FvvlnDPI5SSS0tklkjwf1yJP1qoB9FME
 4CgfRMKxGlCn8urRkkfMd5stw=
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id
 d75a77b69052e-4f4abccf0b4mr376484011cf.16.1766893716858; 
 Sat, 27 Dec 2025 19:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWl5R2B2w9eNeTAdexpt9iS61TBLyp3dSOAsh42BGWIL7uO3Pn0K3kDuZ4F2wO6bCoLEUjJw==
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id
 d75a77b69052e-4f4abccf0b4mr376483921cf.16.1766893716473; 
 Sat, 27 Dec 2025 19:48:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122680689sm65495831fa.44.2025.12.27.19.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:48:35 -0800 (PST)
Date: Sun, 28 Dec 2025 05:48:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Message-ID: <dxtktuo2evbqibblvnxejkex2em62jkbhcvnwxn7iy46me7msb@5scbwuow6stj>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
 <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
 <aUwhqUlM3WBqQwZb@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUwhqUlM3WBqQwZb@SoMainline.org>
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6950a895 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=djJBbdDc_AO9gVaMYpQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: aOD4yV0wNr2HpEknmPk2YSmmY2oSh5sq
X-Proofpoint-GUID: aOD4yV0wNr2HpEknmPk2YSmmY2oSh5sq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfXyL0mHRkPgQcg
 I+ojIzE/9fQLZtrSxRYoBiA259uVcQ90jSmWUbsH3dX6oFi7O9i1hShhANPHYiSRrdDQKbSyozg
 1RM0GOm47xcmEIvt5Z1czJL65pGyBnyHPe/+fCvoc1SXAiz2+EC0w6MpLjH9tF1oatMxDnrg026
 0GW9viI20xGF0O+F8Ah5g2q9C50kixc9QkAtH4LwFOlt8iYkm/TaaWLlu8nleMaIc+rh8OPAdnZ
 aXOdttmKHgXtayDj1vT6qy4sEauPTfVhT9WwQussO8MueXrmHMAn+Lr7sDHNbLm1p8NuvvMU8g2
 zJ08qpVXdAL6y2Fnw/IOHwzHIhh5KqRaO5WxzUS4xc+psFDMLGMuM1D6tE4TZFBqOsUNQKLNc+N
 aZMe/BgqjPoDJIn7qkeljmc2xCpwriWlkqnYFaKk5iIBsIQ9A95+6s8sY0NWPQLuQOgNJya5QMp
 gheIGSp34+hNUthEmzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033
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

On Wed, Dec 24, 2025 at 06:26:59PM +0100, Marijn Suijten wrote:
> On 2025-12-24 17:33:49, Dmitry Baryshkov wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> > 
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> exectued -> executed typo remains since v2.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> Double space to match the above, on two occasions:        ^^

I've changed all occurences to 1 space.

> 
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
>               ^^ double space too
> 
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
> > [DB: restored top->ops.setup_vsync_source call]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..0482b2bb5a9e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> I still think this comment is redundant, as mentioned in v2.

Dropped


-- 
With best wishes
Dmitry
