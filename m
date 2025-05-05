Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6493AA92F7
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 14:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED71010E3D6;
	Mon,  5 May 2025 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGrcD4YR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14DA10E3D6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 12:24:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BXKHx019902
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 12:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jrwG038kdxUPyHEoYbFPB3qB
 QgkZiGSoqj/0yEoAKXQ=; b=UGrcD4YRberod5zPfWFWWzSj4pz3o/+siba20sxr
 ypLY4v/gEV/YMnJYVmMEsQYwIpsuQyJjeBAyTBqbm8G1ZAbgRcjmXZkv+w9XM///
 /dyu7IR0Z97MEDsFJs/v6WhcTz2tyh2PlR5zdMNnOFk//QKksTyjwfwh3z776QET
 GL0kC37+WU09Ah5Wh4Jr3gYYJgU+KJKkDdqEtfr9Vqse7tVNKNNOOa1ZgbQcDYBl
 +p2y/PR/7+kAuOaVW59qFKUTMx4IyAMQr3Tfcq6QM9jfyHuRnGCSkFTCZYyFiTyB
 5PWbOZqzPdwM7hwTxjIOBPWeugjFWr1ANNWhal79FgsRaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7c170-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 12:24:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c793d573b2so138193185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 05:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746447882; x=1747052682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrwG038kdxUPyHEoYbFPB3qBQgkZiGSoqj/0yEoAKXQ=;
 b=wcMBlCgVCMRfQtQL26fyrt9RMwa1RCsERFKp8+ywb31qB0T18rvSaJlyOwCvGsN3jt
 u5Fo0g33u1BF7Zr3zXhOc/wznuAQY1mexhCW40JPI4ZI/1ZQfWRRT4x9SqgOD8LrPfeT
 389k8vwftiNO7IavSmF2J4qusTjdhYcS+2SAhXRDxesQPUbVjv1Pp4GV70xbkmDDYELw
 fF14vWiAImvwCKlsTa5ZyWKZbjn96ZIghNTNVM+VOVkjMQSyM8boRSIUXG9a1nI6zEEK
 OtyhU+Al3mqRrVkcOfgsznt+2g9uLYHYF/dzxmS0elhp9FVrkXI3llviJxlZTlWH3KFt
 0OrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIJ9ch2CRexnNKa+Dg4m1ClHWcrHMBhRAphl34+u27frrZ0djFecEvTSsO0G2KxL6XGDNHi/Jnkj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhxBHy2G/8/vhZWcht7Ok0KK4mwIcU19DoWOjjDg8hlNuZbUce
 cwCelIZYFHCviSPC6duwEhvQWDFD3i/jfXEO3AAGYN9eL+mEZw5q3eXBlkL1Uw84eCETtzA1LMi
 WfiNfma5BsL4CKlrpnN3x1Zrt1/WzvRC+cfktAUhoSCTId229POAOnhmaF9beTfRVfK4=
X-Gm-Gg: ASbGncsjfcpxXPAmAmoyl0FaYXPWm1xABF4fn9wkDof33nT9XGuvawQmW3kNelQ1ojg
 IcJynn4VDPMZBBzsbHuCfUNX389pzVPGU65C/axkvMBwdH0Iv8sdnSnfrFPrLH6mdDDpVyDvNq/
 9BzCmc08EI2Z0dKkhOLKYmi0SFGhnMaRjSYy3M0FQV33OhHNuphQ/OVSNNPi1DrCX01rGmgB5N5
 tebYqdEAw0e2l72jy3WSd2VSM6KkhAAxEXepYDckhg0YJoJvmx2bIVdG52YlQVoPsGB3jl9TdqA
 oY7yoPHyjCKJKlZCuWs+QM0L9e32sYO+9uK9cdPwuQ/eKLI4KLsn+zyMN/9uPamYWcQd4p0xndU
 =
X-Received: by 2002:a05:620a:1723:b0:7c8:39ea:5166 with SMTP id
 af79cd13be357-7cadfeda709mr1534150585a.55.1746447881953; 
 Mon, 05 May 2025 05:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQVHNC/X4ldrU2WAdEOvCrJu1jzAs9DRDibWoLBRLHVoPEZe8mcE+qcx8xAVSbPy2Iuw/oTw==
X-Received: by 2002:a05:620a:1723:b0:7c8:39ea:5166 with SMTP id
 af79cd13be357-7cadfeda709mr1534144385a.55.1746447881548; 
 Mon, 05 May 2025 05:24:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94b16b6sm1706106e87.12.2025.05.05.05.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:24:40 -0700 (PDT)
Date: Mon, 5 May 2025 15:24:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818ae0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cHRrv4Hvtu4HjFTugcMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rPrR3_PVTAZLZhaRgveE-T7ReSnH_Na4
X-Proofpoint-ORIG-GUID: rPrR3_PVTAZLZhaRgveE-T7ReSnH_Na4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOCBTYWx0ZWRfX0923zD21mkZb
 Xw9dVflMmkO9m45bTZ+Jf1SZEO7IA0S7ssPjOI+S6C26IPWFMJ+//Wqy7JdqFzrMnj+ttdMV2Ok
 xZKDcjX3C1bX8bOq2kE+qhtPv/5c06HYHJAHbL7n/iDqW0IgMvgfH7ubWiAaACfrZUYV0LBBVf3
 aL0ywi8Qfh+YTAiwoYe5CLYqGHwObr/snKIY4AUmKo+ePSzigDRsbA11p9zvcVIbdYV/5Z7nxLx
 5to67zGKOziPlaxrAJWVKxluliGCLUEidi0txMFWwHrw6Lo3Xn4qLSPDk/Oyt/n+d5a9peTFU9Y
 QSNVghomPt3aNhjZvau+ie18Au0nq+JfIWAqA2ELXzgFgD3i3V44W0otQqBl0y6Qj/bs6/qhZYW
 SG0LbTOPuz75eNH5Ika4ZLXr+2B2J8NQW9LAowpIrc/7x41Cngf9nGg/fiexr2wo5ieKNgD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050118
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

On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 9 deletions(-)
> 
> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>  	c->idx = cfg->id;
>  	c->cap = cfg;
>  	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (mdss_ver->core_major_ver >= 4)
> +	if (mdss_ver->core_major_ver >= 12)
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
> +	else if (mdss_ver->core_major_ver >= 4)
>  		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>  	else
>  		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> -	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	if (mdss_ver->core_major_ver < 12) {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	} else {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
> +	}

I tried picking up these patches, and choked on this one. This heavility
depends on the DPU fetures bits rework patchset (mentioned in the cover
letter, it's fine), but granted the lack of the reviews / updates on
that patchset I can neither apply this patch (and its dependencies) nor
steer Krzysztof away from basing on that patchset (this patch provides a
perfect example of why that series is useful and correct).

Abhinav, could you please continue reviewing that patch series?

-- 
With best wishes
Dmitry
