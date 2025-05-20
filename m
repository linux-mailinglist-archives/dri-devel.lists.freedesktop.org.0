Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38245ABE613
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987DF10E1A8;
	Tue, 20 May 2025 21:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUfq7W63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9AE10E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:31:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGiB6d019029
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R5feMRXUbS4wQ06aTExWKDnE
 JW6wVqMRR4Tp50ILFfc=; b=RUfq7W63dbi7b1KGny1t6dsAE+EabY3+vywKqe3d
 27NC2yVruNHQOmPf5Zmp73lDwI4+hIe2+HLxIVC0eBN5viVwKTcHFfE2EEOOJ7W5
 iJwe92mV39IbkWcvkYWMltCyMsXj7oai6OoLlX7ZaCjD+B9ClqgUAdPP83A7IarQ
 UfUGqM6vYxMN4xF5byOtVI0QIUZkgEok3D1hUylPd+XdvUp963cEXHbKSP/ARQ9s
 riXCGxiaYC0t7X62hTah0IZLjOIKwR4RRIGjsKiGvQlrQkcozJl2+UpnBroqWH+8
 zuGl+J0P7GpWktnSPUgCY08CHFdWxaOpsO0prRDSkdgmsQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh58pew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:31:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-877b7ebb548so3771927241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776659; x=1748381459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5feMRXUbS4wQ06aTExWKDnEJW6wVqMRR4Tp50ILFfc=;
 b=jgUrlqusyoEiH0C2pVUDHJhtgaIHvWZXZ+qnglToRcoBH4T5ga8KxgcasV70a9fKdp
 kyhx5JvbV7WVpPUtUbteWvWvvnrh1TAmG3vFJYy8Rr9ahwtTgUeD5aa2pwLzeMOmDLcI
 QRxSTMCNgsu3US3Ev69tThr5+yZxaYGecD6qarIL0crOTTlHd5JJ9MyifuAB26ZCREV7
 ZWzxmxrYfKoQtEkYxx7/OBBHOStCSREpVv5PGMCgQ92IZhISaf4l/dHC4MYjlTaJozfI
 0nnN+IivAyy6L1KYDEOMJLnv7U7pX3pJkk5iVFVMehgy6M1cKiP4Zb0PRIMgdS6/FceM
 m1jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXumCppTb1PzI0O3VRpGfKI7P2AIYL/zr2yL0iThv/FwITGUYc+CuMh8w0lTyFTlBCIkPDjW2DVOt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNhr1hn3/+Ob5n+4EOHgXuGRBBoVLjSK3J2qTHIbTTxNcFgZAu
 68/h/bO1jiUet9wEN1SlEUZcDjTTrN7jMQyjVO+jUfSZ8eNIyjjACIuDScTBvKiQCv4gThL8pAK
 KppuFbCKBTUZfB/vWRyJ8090fCUjIyjOlhvRZcChTAovo8JWSXCCICKLnG3jWykzCeoMcNFQ=
X-Gm-Gg: ASbGncvqyfObyjzUh+nletQcnmeGehOEH861zaHLckogaB1xC8o9JSWnsuRdC7oYx7W
 O12BINYfN1Atdtfv9j8DMIspSDY84sNCijko6LqQK0/p9z2edGKt7NITROclkwBnRM3lJEJYlex
 RlcSMLmuAcF//g4FrZ6wQQFz9HMq3nZXdlCz1Lhr0tfJECNYhwE2jB54b+JvfwEeGDxZ8uHIvqu
 cyrMipMDSjgINF1mKZhVaZnzyrV0rNE9+Npt74SwgOyTeRx66CbaO7j1L6JY3HnAeq7nbEuh3Ue
 YgNZaOojBuLwrpEfD+pa0E7nTyl7BZ4mn9ZorzNYygyEU9gBi2i31GWiNtfDB/MyMGo4YAFZvp4
 =
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr20307432137.9.1747776659097; 
 Tue, 20 May 2025 14:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ0JUa9lKmM7vc8ucq5JsEnBy+m6NXYoj4X4dcDZidirslkniyjDSG1QivD3U9k2FiRTgBqA==
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr20307392137.9.1747776658678; 
 Tue, 20 May 2025 14:30:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e701804esm2530018e87.152.2025.05.20.14.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 14:30:56 -0700 (PDT)
Date: Wed, 21 May 2025 00:30:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Message-ID: <ym37vvngy3pvwreic56sxyneo5pkvuzrzqg7hu5x4g4smswalq@my2pe4naswdm>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
 <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX0GpabNpjrfN1
 W/E8nzzgQejVUcK6hv3AFNMbg51busYH+iUvn/Oye4PLOgdeSzbNkbT245lBexCB+5HvEJt/DOh
 HHcfVj7zfQQF/aqkP572Cr5U71Xb+YHRePtLfUqU7UXrCJGd/mjf4T7xT25z01v48bx/E3FcU9w
 H4iXvYttx/hyCFyLjellZ0CGmMCmFQvl+gw8msONq8/DJhUgTMTL51qjLl/0Jjo1q6elqaDux0F
 fvxaFt2k9nTjOzTI26mDjOMWV1zrXr9zB+bbeKTS08eunCb6ORw7fA7H1GxTES5psSpGoY3byYz
 KaLhgX9tPW+6mNJa/QtpRVMG69JLm5UVR3mtORIO/S8pYW+Saflwv3IGQmaL6kurs7tT75iEBAN
 PQG6WjmQskrdriSty5ewC8tRuO5pt2t9eoYj+xmyd6E6wtkw74E+ZKiVxOdh3rGKv2NolT3m
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682cf494 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EkPWHm4ox5rSgcNimlMA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gyQjAjICA_Z26ARxG0-uSEiV0whg1qOM
X-Proofpoint-ORIG-GUID: gyQjAjICA_Z26ARxG0-uSEiV0whg1qOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173
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

On Tue, May 20, 2025 at 09:53:42AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
> > core_major_ver == 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
> >   7 files changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
> >   static const struct dpu_mdp_cfg sdm845_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > @@ -11,7 +11,6 @@
> >   static const struct dpu_mdp_cfg sdm670_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
> >   static const struct dpu_mdp_cfg sm8150_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
> >   static const struct dpu_mdp_cfg sc8180x_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
> >   static const struct dpu_mdp_cfg sm7150_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -38,7 +38,6 @@
> >   enum {
> >   	DPU_MDP_PANIC_PER_PIPE = 0x1,
> >   	DPU_MDP_10BIT_SUPPORT,
> > -	DPU_MDP_AUDIO_SELECT,
> >   	DPU_MDP_MAX
> >   };
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > @@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >   	if (mdss_rev->core_major_ver >= 5)
> >   		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
> > -	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> > +	if (mdss_rev->core_major_ver == 4 ||
> > +	    mdss_rev->core_major_ver == 5)
> 
> Commit message says: core_major_ver == 8 || core_major_ver == 5
> 
> Which one is right ?

It should be 4, as in the code, I'll fix it later on.

> 
> Neil
> 
> >   		ops->intf_audio_select = dpu_hw_intf_audio_select;
> >   }
> > 
> 

-- 
With best wishes
Dmitry
