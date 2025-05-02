Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814CAA6EE2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BCD10E18F;
	Fri,  2 May 2025 10:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5QNqvAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85110E8EA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:09:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N2VE015140
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eGb1DlUbL3NjKY/kTW9b+ae2
 nxS0xZx64n5ndmQSd6c=; b=A5QNqvAp5jkwLT+0EyVxkW5mulaAL90Je2+xwzeM
 qyBWdXFm0tbRwy54j3HeK1MpiN1rita+E4lQKTJIt7Iu49/UToqQxANcpBRy7K/K
 I3P1L23ExvE1bH/vDER3dlrchk16s0vq/EU3ThgSHe8KSnR+3UUloULe1V8+SCP2
 iesFZIeyB7x/OhRWuhkjLuUPXguVqWzveeu6f0fVzDsgS1/WZLdJzmXWnNiSJ9JD
 pIgpkyg6LGKOk5CdrvfXWsmCLRHg64M/rgsO00jJLikmiZ3rTWHw1tBdXLDpS8AD
 Xfq/3SNCExOlmrkl6RD19f6H9eX8r2NEDhcXe1iQeMPVhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uayv47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 10:09:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-47b36edcdb1so65128901cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180591; x=1746785391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGb1DlUbL3NjKY/kTW9b+ae2nxS0xZx64n5ndmQSd6c=;
 b=Y7D4j2Q7uOVSqqL6ahw5WnUJ//pT3x04h/IuNoP27+pCtzgngfRdlREYXzlyqj9o5x
 hFt9RB3TP+TU/OS90M9R1x3dxvNO9M1jAN0r8cbp7Nex2qr2JUTrVZ1caU6j5IzPhez/
 Dld6MKe3FIMQ/RDIxZTzWr1E4cC342xYQxlb/vuPvrPmqyXjn2JcAOY6e2ceuIQzvD1m
 sIlHeganrJvdAyKj84Pah/v8fWuKHzbFnbYjiyyIs7LDkae/efjsGxe/d+OgB31w87gR
 lhK3AqMUJ4VqKEvDG/AZTiadN4rtfef51CTnArvV5qbM286qRr2MVv5NfbJ+afzOs92V
 6eSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU883YVB8LSGgItmuQX+AsibsInAKsVKyrQRSCvYrkr3mOSgR1Pigm/mmFpRBuUCIsyXO9/NxFiZlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsdI8o007+uNYmw9za5JvEel7Oae2eOUylSIncZaWNze0UP8Gr
 eB1gQa/GWqKgtOLqHIHdm6AUQKOjZFENY+lSTehz6kx7CZwdpt9vRgBfx0/Wacz0oqVDmUS7Xfd
 HAJN3U/UFZ31Javdhd27T49+y4mteG93CfdiiWXmIA4oCRGOJ7jSfXqyzWl5/5P3uxTg=
X-Gm-Gg: ASbGncsRplLJghhoS8IxcAcfMIXMznt8CmUKAGChXNgVM+cW0Oaw09DMyq50/P/+B6H
 pS0gPeZEbJD0bUIq993qpR6Y5rCSKIRBRsLiTVD6OHV8CNbsUrh9LUEIpLBzyq6IXV8f3G6icYp
 5muCyXdfTe/ru8UyAHv1TU0NoUnXnf8wfKiVnVmk+lDVuUw/nfLjHiHHHThX/31xegePuboDhrS
 5nEm2a5s4XyzXRdI67+mpMmissu1dL+UwHYAAJVoUFerwuouRvHVFaPefaI4m6206sUQnWDUh62
 y2L0DatKA9YPG62lYXm+9UsHPmcpVhWspK7AMMvXoMQR7Ai8bTosfH3NLvjAgLCoGLTTOJPgNyU
 =
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id
 d75a77b69052e-48c31c1393amr33914571cf.26.1746180591584; 
 Fri, 02 May 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+T+sdPnhpQgFYsQMx/i1P/XK7HsEdfcoW/C3AL1UBNlcOIoAgvN7TUEI2OJ5tLKMoKv/uQ==
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id
 d75a77b69052e-48c31c1393amr33914241cf.26.1746180591064; 
 Fri, 02 May 2025 03:09:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f680dsm309413e87.220.2025.05.02.03.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:09:49 -0700 (PDT)
Date: Fri, 2 May 2025 13:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm: make it possible to disable KMS-related code.
Message-ID: <lyzp62vwvina435pdskwalcgjmejkbs6u6ozx3nn3epvyjyqo4@2o4w7uxrklp6>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
 <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
X-Proofpoint-GUID: nUslYoDSHJDDwZLUEPRxKMk4aCyLSD2T
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=681499f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CDNnaGQRe6Xf55pPQM8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nUslYoDSHJDDwZLUEPRxKMk4aCyLSD2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3OSBTYWx0ZWRfX2tpjlAo/Tubx
 MfYEra6hkBZ7tn4DOCwoH9fVMUe6MDgUFJ5yNbEr2vbEcRqLLyP/UimgzNShj5u2kGZT3s0+YEb
 nWBqMQENxkGPNyr665rAPYYWxg+eDBfDs05lHoLDoh351wksgO4IYgWffoTvophbOT5n6KuCPev
 VH1qj03lwdt5z+UYhlGJt8vOiaT0Di26zU7sfXO+pLJVFs1AiNI2RxKpdlC/RcHAbrnVkyXVx33
 OquegRLVZfTmYt6NEsb4AUbf/tzX5vSYORteIDaPYtj5Cey4iOROQuXgRPwm6BTBqlL8qI2xdlT
 blix0NFHENJXeK4H/vExFtacHNKO+iJsGB6ZeQjEwtEAKFkR3VLU4MQja6V7yjPWFT10aoi2YOE
 XiCJ9equJ9E3Mgws0JOTDPvvEBZFOWi383fOvjPPxZU3UZdCWx9UBJ/CFJqAqLS+DBeGDjVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=845 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020079
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

On Wed, Apr 30, 2025 at 01:09:31PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> > If the Adreno device is used in a headless mode, there is no need to
> > build all KMS components. Build corresponding parts conditionally, only
> > selecting them if modeset support is actually required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Kconfig       | 14 ++++++
> >   drivers/gpu/drm/msm/Makefile      | 16 +++----
> >   drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
> >   drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
> >   drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
> >   6 files changed, 108 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -88,6 +88,7 @@ struct msm_drm_private {
> >   	/* subordinate devices, if present: */
> >   	struct platform_device *gpu_pdev;
> > +#ifdef CONFIG_DRM_MSM_KMS
> >   	/* possibly this should be in the kms component, but it is
> >   	 * shared by both mdp4 and mdp5..
> >   	 */
> 
> As the comment says, I am also thinking that this should be part of msm_kms
> struct, to avoid ifdefs. I didnt follow the second half of the comment that
> this is shared by both mdp4/mdp5. Why does that prevent it from being in the
> kms component?

Indeed, there are no such limitations nowadays.


-- 
With best wishes
Dmitry
