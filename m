Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB2C575F5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07C10E00F;
	Thu, 13 Nov 2025 12:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjxO0CH9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jt4/NYXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3FD10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD9VxNs3120579
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+GplvHX5yxJ933q0AmGSwv5z
 wUzQHMR7HZka/BgtTp8=; b=EjxO0CH97Q5YXz86h/exEubfja23O0cpfbonUSFO
 /EcgGBaDegu0X6DGJ0COHg4/Cv9Whk1CLhs50au+g/U68OYvdjxcYC7LRDJ10C7Y
 f/4gtfgZN7C92XuqmFmkUcBwU9m2tAFrbdOOV1rXoz4mAE44i7oGgN6ulNcyb7Mt
 q66lH2BpsdMtxD7wn1BvJKKjaKHlpW9IlRPOV/mfcG9X6d6ayeZNAUG/ZyFFnqiP
 UdsICNQuFKz/CIksK0/8U4hHosXzUZxZKMw3QchC3x+3QITrrMf08zLIsSgcQCtU
 MNNLvmSf631noRe0hvxaCyRjP+8cXcDnfCQpru0hatbOCQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5pust1j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4edb31eed49so17316001cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763036579; x=1763641379;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
 b=Jt4/NYXfdD5xQ3wPYqSJAq3MhyIHGH9MsFMld+ooAzWNuBfZWXXRCE1nnx1xGAgdbX
 UnuYU9aRRan9Vl8Lz10H3Wlyo1t0X2RNYV/6khRdESWuxk4IsKvFdF4qptxlVwebxpNi
 Mz6LPU5xFmeS+D5NUJ9kG3ikD1TaHzIKrTZHRGZDIrBdmMk+oS9MSadLCCRXJ0A+UhOT
 jYVqwlYK0fafd1QVACcRL1BvB0fd5Kwh/2cQC/G6mbN1yMxbwxatvkOXevMGNFHCWG2S
 GR2pFkodVau9XVxJQsdneE/uk01EcjoBs4nQw3En3FTItMuiu+rW/bJIjXS+vH99IIZp
 Il3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763036579; x=1763641379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
 b=Y92dTrj8k9KFeldYU6Pn9J5zV2AWKYBHECgdPCIuBx2EXxzmvOuzwC66EIUZTxAGO4
 k9g7G8XOEypghkqcl7tp9iZg/P0uD8x0YgZBsBv5eMuLit9fejpjiHylQfdphXFRzi27
 Dfkka73IwA/Xjz04R5vbdilKxsRdh5crK/NvszGAILBTYRtbQBcnSUUzJBFR/GLb2WFU
 KDSs79K04QWFVg5nYtl29B4VoSgVl1PNBbsSNPCLYIC36fCDzjsJj/M5nT06vQGibPzS
 wLmmt8H/Tj7owXYfBAgjFWeGo0bsB2tmelOfuBcDq1ufIHzN0FA0Cg+TvhN6UgRCmJrW
 8j2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHROHV/vnKdLUvNO5p1lA2b+F8xYylaVxgRbcisOkzyjcrLiO21NorMby42IBCVbBkHyU0dGlLWv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjGiM9JN4LDCKzOoKXOLv7zu6d9HtA6EbseS5XAJWtofkW1HOo
 hHJxJ0+XwQjb9dpklHOYwKMak9ngcX5yuDlq9Kb07WlzLggjjcCHv3D1aKp9S4IXyFMt0MorQmI
 2m9eM8tA2xG2a+xzileLEEN0Bk/SILvIxvhIr8xFkp1Fj2enkIbR1ttCRNPOyveiDAwd3sSc=
X-Gm-Gg: ASbGncthm82vSwqTzM/dhrad/WqH1+X7U21SDmqOXrkKcJM7ILG6bG6eU6gIkDrXm8V
 aUhtE2rfVEO5iV1W5s+tL1m3CVE7xashqp8Z3eqZJMP4qsiVsheYWXC0Jlc/+FAVNyZQiNsa0Mo
 lvv9v9tcXElcJaBPcI53a7rNa0N1sTyFe4hVVAO9IIv7Kv/dQtfhSnqYedL2/+izhmw9iTJSCOt
 eJbCBErH38p7LxGGVSOBNxVO09+6NMaJqGhKEwdFCV8hYNVuxor8vfQDAriakRgWJ3Rs2Jf3di+
 Q/74irPYrDzBC8aBSkGDXOByyszUlqbcrdPXF13QDvTPui0IB9q/RqHTkq+qhsO96Mk+blSW4rY
 fa6grUB/S1ogpw4kcMG0dHzTN8rZDBWzt6cbiNRGjU19zgI9XLb8qq7iz0qu01gMCF4bRmr3tdW
 0ik9j3RhEwGcWY
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id
 d75a77b69052e-4eddba97f18mr79916821cf.0.1763036579312; 
 Thu, 13 Nov 2025 04:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYSlJ7Mqnq9Dyf5Mj+nWkiUVIb7DVf2qG0ZIWMq78bytd3X9FzuruWsSqOGP5mq4NeoWsUsw==
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id
 d75a77b69052e-4eddba97f18mr79916231cf.0.1763036578763; 
 Thu, 13 Nov 2025 04:22:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b4d70sm363916e87.39.2025.11.13.04.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 04:22:57 -0800 (PST)
Date: Thu, 13 Nov 2025 14:22:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915cda4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LPoitUEaq9Ymm4AzyX8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5MyBTYWx0ZWRfXxpkoAfBZQBbe
 1+gp0h80H7vpIuzNRVV4+6IWgohFnYlEmx2rwWg28EWDdfmFBdRfJjS/jOrJYuS0Ba2LKJVzo9F
 d2+Ugxrl05mdwGxxyy8GUYviW69fSCN+Yr6TLpMfHgUzRyVwG5O8rWCjtDudikMGfYy3hlkq4ca
 BJTavuBr+XGuSBGg1AEnmrTSYM+b3wP8Wd+POAWX0zUgS+lGzfMEBrqALSUFPhCv0E7+gs7qFt8
 R6uuN1JlxaKOaynxyhe45iNknZVAEloK0ZXi8jjWdk1hS3qttyKla9d73Z7VvR8dhWNjpGYdvj4
 SRJPHT+5axJF27ofII/5zANEIbfLpOsZYuBVmJa9NFemOrm0PCpoaWNPoNSl2B1bL5SbEAdSd9c
 MaTG+ETl21uQYKJWZ3BUeResAjNd2Q==
X-Proofpoint-GUID: bptrpvCnv8_lkuRW7K1D17fAwIPTUypU
X-Proofpoint-ORIG-GUID: bptrpvCnv8_lkuRW7K1D17fAwIPTUypU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130093
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

On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> >> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> >>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >>>> In A6x family (which is a pretty big one), there are separate
> >>>> adreno_func definitions for each sub-generations. To streamline the
> >>>> identification of the correct struct for a gpu, move it to the
> >>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> index 44df6410bce1..9007a0e82a59 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> >>>
> >>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> >>
> >> Could you point me to the holi's devicetree? Currently I see only a610
> >> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> > 
> > I don't think upstream was ported to SM4350. SM6375 should need the same
> > hook, but I don't know why Konrad didn't enable GPU on that platform.
> 
> I'll try to fire up -next and confirm it hasn't bitrotten.

Maybe then a patch to enable it too?

-- 
With best wishes
Dmitry
