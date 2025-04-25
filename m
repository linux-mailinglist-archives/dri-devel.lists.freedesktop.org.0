Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE9A9D0DD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 20:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B25F10E482;
	Fri, 25 Apr 2025 18:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccly0v2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D9610E979
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqYk012793
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EyI1RYrs4XXWK6Jk0wNG+VY0
 wHQ7kc01RAG4sha1MzY=; b=ccly0v2NJWjBD/RWATeomyvHcfgv2NaRvB99ZMGJ
 Oo24ULU1DzVtNt0YzDnlZN2U7vD2b6/y4zJ7QPS4qHl2Hv3mbL4AtGebIEuBmTWT
 mzxz61C0CPyx0SgzVNPjXDSzL8+cJytICNAA97YlShxCGt5QWkeugqJFf+GDaz9F
 bqXCfPMw9uaktthG38TBXppReKEX/lxueCaWhIayEvIVPesUdzPLCcUAhQeopy6H
 66O2NhkauzuI8TI8ko7HiP22/KUW468Klp+z3nGXHoHAhIVkuFcdayLhVzsbJLou
 n7/8+rGttxuO6pCewEgBhJM1ipURX2WNVLS1jNjZPNNgzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t2xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e703so469975985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745607201; x=1746212001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyI1RYrs4XXWK6Jk0wNG+VY0wHQ7kc01RAG4sha1MzY=;
 b=H+hmBgm5JFv2/lFcu7bKN3+IA/8Ixy/clhJPHsgbT/AzpSW66ArkN67cAp3AZwud99
 beqQUW9wRLY1dARkZroFx0c1rNkBi2BEVRv5lCvAcoFuuLb1l/USc4nscVykyJx895M+
 44LmV/zGjRl3q9em5S4apnNS9nZz0O7GJQHzW5NsCK9JoRiRbG0juTXtMEcpJwak/h1Z
 HsTWpy7TBaAaMzJRZDEvqAfczWWeNJm398zngZt5XlvFgFg2MRHlrP8dlvWS4Z9E+QcS
 5NrRKBW3TKc6qnS/Z6EClyJ/8e3HyYAoSqprby5WtY3hvFeFtHzwzE6twD2ekiZOuHHy
 1e3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGCfAAbJiUawODfu2tMTIKRdKPbfGDLzkvujaPY14wfVd7U0SBQpyAOfBAzXmocfOq8suvLvop7uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybLyT4TEQ/optCs2DF+ycszJYBgC/F8o6SpchgR4aYLJaPuwJ4
 bzrq1CFbgOYCB6NSOvnDUHmQRXYyfk9f+F8Ba+885K6n5cPy34qBYO3QUE8i8NieYRyLvy7hUqq
 bhUoibeGm7nRm6Jpr+z3V3QSy56GIWK6XETVvRzSYoPzUo2+TWRw/cY9fWS6319Cay/c=
X-Gm-Gg: ASbGncsM3Pcfdp5PZ8MK/fUhPoAbOPQk9bIjalZdWSl2k1U9yBWCCpF2dizAZsBCioX
 WMiRbGx+BKhWp/aQ1/9wr2KeWgeSbw8xxxQpjqhJYJGn+6cKOxktowGIz6Z063yigPZfS07K5ka
 fOxUiqpNxAaluH1vTc9EHaSnJ6Hp+BCFEfhn0Laa1QPQC3KrM8Ftdaz5EZjJyRR/9GSlJtCkwCc
 4CtOkuVkvo9WVVPOK17YRB9lnBH1ZN10OvybkrAFMFU9BQUO//0UJSOQFNndHurip7T3ncBeZUE
 k3U/0GFP3XeqCOpgfKAmNg5K5oSVBPDZaKxoy8VkkE6EvM5e7CWljF0507kpJ0qmzFQ/B1xu/PM
 =
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id
 af79cd13be357-7c96687307fmr83995285a.15.1745607201020; 
 Fri, 25 Apr 2025 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzpHwv43BxegR84WM3cKeKkomXnTuNqjngSJPB2sfsV1ntCPBMFR2CHLVVFpG3qFUcYD6E9g==
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id
 af79cd13be357-7c96687307fmr83991685a.15.1745607200558; 
 Fri, 25 Apr 2025 11:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb8cabsm690134e87.258.2025.04.25.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 11:53:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Message-ID: <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
 <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
X-Proofpoint-GUID: mNGoPMSGImIPfuEZIepGWAgA0i2X-4wP
X-Proofpoint-ORIG-GUID: mNGoPMSGImIPfuEZIepGWAgA0i2X-4wP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfXzg/SsqVVDHXI
 PwzrMlnEt1HeiCLz1ot8UuCRd13hMsZjVBc902F032GuawQZa2ciJvxwLm/4SmDU6gcdpeEW8Tb
 Gxx9FUiWqhImZk7n9d2LDYYmxnng+KQotWroQzC1qxFYFlyb/R6gBD2aGHCU7/simw0FEIacK2k
 5byd8U08U0MQfxJwBNLZQZ1a2AWmvmQteBImDrpIhJ9M0o27HA9Bh8BlOGCSz9ciFoaRPgwb365
 nyVWNPKVm8yeuHVtPrqvbSqTaPxLcWXOy0/uKUt6xLKWlLS5XNUyBFFTuaAbu/P1dKh9VC4iFPX
 9eMGyO/OUgi0C/PZaLx1BpxowW7C6lrPHkC8Li0kVDpTQJFxjJ7vjuHcN99VqG8BhivqVGz+tsB
 y1xyRURk3AKjOmeBFLhGLsUnuxZo4BLUJmhiCUcoFZ3bNG7sgUMMk5vDSLdiqp8jsh1HBhsf
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bda22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=jGqEa9bayqSivQyTaeQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134
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

On Fri, Apr 25, 2025 at 11:26:20AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
> > platform. Renable SmartDMA support on this SoC.
> > 
> > Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
> 
> Hi Dmitry,
> 
> The code LGTM, but was just wondering why there's a fixes tag for the first
> two patches but not for the other catalog changes.
> 
> Is there some context I'm missing with regards to this?

As I wrote in the commit message, SmartDMA for these two platforms was
enabled previously, but then it got disabled by the mistake in the
commit 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries").
For the rest of the platforms SmartDMA supoprt was never enabled, so
no need for Fixes tags.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 13,
> >   		.type = SSPP_TYPE_DMA,
> > 
> 

-- 
With best wishes
Dmitry
