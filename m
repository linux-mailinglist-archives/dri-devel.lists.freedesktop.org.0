Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C7CDB2B7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF910E31C;
	Wed, 24 Dec 2025 02:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix51g6Pd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipH85aJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECE710E31C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:25:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNKXeFP1206442
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kJMSIrPxVRjOWG8ys5y3zHEr
 idLtCLiJY6TEPFUHWO0=; b=ix51g6PdfcG4VDQ67f5SKdxUHI0rXS5UYZfVIebi
 Pc45weHyC0n3bs0cUWce04cz0VY/YFxN9r0iiZxNhq6Eim1fjqeFemJIxNNXIPoo
 9ChAM7mRvyHEE2FLB+RT5cpfRVJbJGvvwgb52/eNIrL38riJQSKPFHIb3A/h+ti7
 wEWSkQiNxSZyD73GwWkwk+3ef+SV1yF55PLRHZ4zO/zRp5qBayzUlwDBKpSR1UHP
 HycmFozA3LWOWt7YstSl6ElXQc93O5Rfmh2tvAE57Yi054rS5EDWSHPIvkB8R/Y4
 0b2oh93zeXNO72YrBcobqtEm7zPGIIW73sFCpnC63+VPAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0paf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:25:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a316ede50so107911816d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766543121; x=1767147921;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kJMSIrPxVRjOWG8ys5y3zHEridLtCLiJY6TEPFUHWO0=;
 b=ipH85aJICrpt0y4AqMyeWTGTyhZGLYx+3q3fA7MYHlHg7+/L8WymZRIpCNwoemXx2W
 twD6iTuincm2am5HUJnS/M6cjD2wAFLK50yL1BovNllvGgJ2uNnaM55H3H+SEmO6l/2V
 9Abg5q2MW4VG+jG+wngx54+it958QoVbgqCGGXjmYoM2nZhlGMMMngzJSQHCewYqtuE0
 ZgBgvAZN3fSwQzVGQmjmoju7Iw1ZtZa8ePxqxJfXLHx5Q4HjUKr6LnuIMdEJUx4ziGZ0
 AF1XaKsOtAQ5ZlJeYsbbU7DUEHCvL21W40PI8L2ufTUZh0ArWU4lrOtUlZIGsV5TMC7v
 vc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766543121; x=1767147921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJMSIrPxVRjOWG8ys5y3zHEridLtCLiJY6TEPFUHWO0=;
 b=h5SuvF/Rq5JqaiB1RuI21chle5nLwYwSer2tRjlKTbgz9cHWs4JiIZx4HMEGOgdlkj
 dg+rYk9PE3oNYt+jXiqy6hlHBDyJZ6zx+jFjHvt15fYrWEyXAZzlyZqSlUHEugvLLNke
 DGFlIRrwZDV0tR7IqEUZ0sIki0dYNZ65QV8eI5INACAEEoh4m/soA62OJQjM+iQl+0v2
 skdpVuD0wN6IQpbwJD3kJvLaaZQIFQXXtJXhmO6eEHU4ANdEHNq78OeQT6gtcjErM3Va
 EuJghlivYzOuYbhBrnxH/UcInfV3iGij4QMGe45i0JSobeGJKVQiC/nxYg0lDpnuymVb
 A2TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0njb+RInW3wck/E0WHKAjnxaEpx8+6jTdWbzXSJW6YNFqYQL1VDTTuxHQjCbRFH9k4HJ3L0447fw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ085D6CCPb3mVrXnvldAQ/zdu1xVZisVbfG0TyA9QOtqgm5Bs
 arV3/oM2HNyLZOaEhdU1wcCjl/GugN0zPi2aytJvEu47D0k3tEgeVWk8Z15gB49KNanTm/F5CA7
 XITIHcZ0XraVsOKko5XrHBrR3MoMsllW08nOQS6srpwP8U9eDazzvxwAv1wLnNC4aSRUB5hw=
X-Gm-Gg: AY/fxX5kRyRplwcqHsA5pUAta8t3gnNQvU0n2OwLBoeJu5QUakDqKavUaJXPCGVf2Hl
 B0p+ReeCqM2KiX9Zim4Bs9jJM7EVkmh1sOwwxmfiGn3hXWW9OwgWf8A71Nm8+wA1JslMZEsQv5/
 1D7u5uKHWWNgK0vGr4dsYllbtbqnHJW5+BJQdUSsBFUAnDaXl5txnZb45um0sXEgzWigUpN6KKd
 vlHNqcA3z6jbtsm/vsmHexs5GfwiKQnX0BmskVr0TEXufrHvGZqPtd9TUnvZmTRReKrtghkw9x2
 Zuv2bH9WrLPw4uKZ0fhrzHvsQQzSN0MKeMyPmX9b04UoEPwPVSjClO9H+Rb9D9ZzCQO21AdbDE6
 iVp5fbfLlpnVubfHTw5sVJj/ErenPr/BoQkQpcVIfkVcbnRwMmBSVfM2wr/5Mfc446v3fkms=
X-Received: by 2002:a05:6214:491:b0:882:6797:3a67 with SMTP id
 6a1803df08f44-88d81278f16mr272973056d6.13.1766543121308; 
 Tue, 23 Dec 2025 18:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrNdW+R0PdyyGcoJ/iH1xT1ZvVmp3X4bDgF/iM5YBDtBr8TepTmAOt1PUis9RhdZlldhttbA==
X-Received: by 2002:a05:6214:491:b0:882:6797:3a67 with SMTP id
 6a1803df08f44-88d81278f16mr272972716d6.13.1766543120870; 
 Tue, 23 Dec 2025 18:25:20 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d96bec097sm117191926d6.16.2025.12.23.18.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 18:25:20 -0800 (PST)
Date: Wed, 24 Dec 2025 10:25:10 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 10/11] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <aUtPBuotEGDLcz/S@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
 <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
X-Proofpoint-ORIG-GUID: HRfOJBb8gpj5tnXoOxxiCvI0M0Nsd5-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxOCBTYWx0ZWRfX/V79LgUqy09Z
 GaC29CYfPOpqUy+2jkGOGJ3785OMWbRiOmIyRc+1L3UTdH0AclSOoHDzPNkHpecJ9hthN3oiLfa
 JhvoCy/jY2qUFgB3zupspFteAliJ3n9tkmszQ0jhv8/7UesOLRMywyOaZnF41r3sYLo4e9nYvTs
 v63ZCr7N3EAAWxjm5UtWvBilVmPRBe3AgXGLtNl2j6x/hPQDquVOKbWrMa/ti0Wi+MQ1Liys6VE
 MlDTFPPM5jV9Ke+vz8Tum57j1JnkdPlz2sDCnrEy1HJawYJUJW58OJzheR3BmtulEDA7rdfdxSi
 Fg4pPoHtuwfn5QbFKvG58KmHy9Y2jSQywlmoXuy/1ODxNNjxPXGAWnXOoXxzUcSTNqY03QztVHz
 I9vUrGn5Zl21SoLngOnmlvF0M9/HjvOi431TDEvjnw3TQifrUCJfl+rsg1GSTDCGZossDsAVwUa
 hXu0ljNeJnF7OxtYKZQ==
X-Proofpoint-GUID: HRfOJBb8gpj5tnXoOxxiCvI0M0Nsd5-G
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b4f11 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EeaRNE0bk9nq3hHqtxUA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240018
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

On Tue, Dec 23, 2025 at 10:30:56PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 06:23:59PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  13 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  7 files changed, 371 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> 
> > @@ -291,9 +292,10 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
> >  		if (MSM_FORMAT_IS_UBWC(fmt))
> >  			opmode |= MDSS_MDP_OP_BWC_EN;
> >  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> > -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > -			DPU_FETCH_CONFIG_RESET_VALUE |
> > -			ctx->ubwc->highest_bank_bit << 18);
> > +		if (core_major_ver < 13)
> > +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> > +				DPU_FETCH_CONFIG_RESET_VALUE |
> > +				ctx->ubwc->highest_bank_bit << 18);
> 
> I'd prefer if this is pulled into dpu_hw_sspp_setup_format().

OK, will put this part in dpu_hw_sspp_setup_format.

 
> >  		switch (ctx->ubwc->ubwc_enc_version) {
> >  		case UBWC_1_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> > index 478a091aeccf..006dcc4a0dcc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> 
> This commit was about SSPPs. Why are you touching WB?

Look like I should drop WB part in current patch, 
and add a new patch just "add qos V13 in WB".
 
make it more clear for each patch function.

Thank,
Yuanjie

> > @@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
> >  			      cfg);
> >  }
> >  
> > +static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
> > +					struct dpu_hw_qos_cfg *cfg)
> > +{
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
> > +}
> > +
> >  static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
> >  				const struct msm_format *fmt,
> >  				bool enable)
> > @@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
> >  	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
> >  		ops->setup_roi = dpu_hw_wb_roi;
> >  
> > -	if (test_bit(DPU_WB_QOS, &features))
> > -		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> > +	if (test_bit(DPU_WB_QOS, &features)) {
> > +		if (mdss_rev->core_major_ver >= 13)
> > +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
> > +		else
> > +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> > +	}
> >  
> >  	if (test_bit(DPU_WB_CDP, &features))
> >  		ops->setup_cdp = dpu_hw_wb_setup_cdp;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
