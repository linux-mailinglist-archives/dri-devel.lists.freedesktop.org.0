Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA48AD2136
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DD710E3E1;
	Mon,  9 Jun 2025 14:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxgdwTJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECFA10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:44:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OguW002424
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=; b=FxgdwTJ9vXIkOJKe
 uQSbiulWmFuqiuc24Ppr0U7TQiW+TWXnvCL07zOWelsZJO6W4/IV7Po+y4jmy14P
 CqRPEKs0zKgKLCSxNN65xg73JQwLEZQ3wc1TXQAlxgFqNNzrxH4eOUFEq5+vXak5
 2sdwgck43qG1KM+aiqqT3QqSJf8Z+fQW2kAXgzj9Hqsf+65+7vRcdE8DGOW2WzF4
 LDIN/iC3HveZtQBkGiEd2I7solFO6m9gojSvzPfmpdmJkEO1r/P7kUlVb1GwTRMO
 tCCvq+wYoq/LLyHU9zpuYUG9hfSnGiIG4iSicL8AIGLwNL78kbqgnZ04U3BRr5Fw
 pl81cA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y13t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:44:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so684234385a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480248; x=1750085048;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=;
 b=mSfmSdaq3PFLzdUOGp8y/80JLuRThiIFAbkd8kULPSb6ohdsMzi8K2cRp3qmq5jlBB
 Tol724caQVjjfp/G7ND7xyg9F/uPshkUe1EB+JTZtnjriqJ0f7VLQSz/LJDqVkPjyHNO
 apHCtdpk5jMm/YfhLtbTIklIWXeh5907AWzm1G3Yrcfn+txJoJAPvcVk48o1bkSel5DS
 Ds0Lmm/1kPYmmWpzAn1mXigJvX7XnsCLux9W0zMxP3ZlcaY/8kscuh/8KwC/J8aPv6QX
 lClLpHGitHciV6kmr81Z3cgW4KRNFAgGeHKqoxho2LNUcvyo7Qznsd/vdE8NkfE/U15Q
 i1EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWH8BXxDF2K6prxCpIRzFfsWdj+v1V9+wntqILiTMmrXtReXSXcjdgsNqpQ+FmyTyg1I2vELM1SQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE/PRU1ochwaWmN/OB0vYMnsd027H+XlM9Y6gAlQXlBk+46b/j
 qy2EFPtfsZkzBLLvnXVmGR6khGubRLaIPcjXOplTDB6vC7hbBD5+kDjejiajoh3k2tCKN7xgz8J
 wDUTJKOnDc6Zb0lz5QctuHB5YrFreIH0XphVJsk6KD+U66WRGgBE7qHo8xCPIesx71y4ZS9Q=
X-Gm-Gg: ASbGnctt/hguUMXFCfqDKX10cMGsxpvCiAxP6K7oJd610ATWX7B+8M02+rnuRRdprHX
 45BPhUgy9yUcRqcjsIHeyXumqcJfokgROi3LjxOoLqq1ak/7IrtaJCH1WGRIKy+54C8ZdnXiIGw
 INmt/w4swOVXx6C9rAMh7c96Uwv8FPypcWSGClGJSZRu8CcaO12Zoj1o0TQw0h9kPysJ8uqOBrh
 1iWNgdnFzXorFmx3HVp4qQ6vX1HI6kD0txNfpKfmiJ9Nf8zOcAHwfXhnQAcjQX8XBRK/CQ6/zge
 hoJ4gqofog4iMThkOHYycgYN2fI3T/hOFtcae+OKrE0SxZipaxZOqb+jhlRjFweQDQGZvqOP5tc
 =
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id
 af79cd13be357-7d2298d6eaemr1815632285a.39.1749480247847; 
 Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsEWFGVkDlPTwmsMHbybN20i8t3PV7oDWgFQp0aJTKLiHA9vwJmMx+0ImeLu5tsgrrcimiw==
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id
 af79cd13be357-7d2298d6eaemr1815628285a.39.1749480247414; 
 Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367722445sm1170794e87.130.2025.06.09.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:44:06 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:44:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 35/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <75k7tekvps6227tagfn6z5medhqn7zzkhii525aao46hndk4iw@6bto2vrqkgih>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfXybeuN4BUfLsF
 8iBb23C42F0Frzal8WiwpAgTYuvR/0bgushjmTzaHIN8EM3gLg+QHcn921xKWwLSy2Lc/wuKon1
 heP8ouVnZZ6vhPjfRJ2VqONPXP580pri8rGVxidU07Ag337r8PyCyF32M4UfnPjAxGSY1VOiqJ4
 rWgv1PdEyynkv7cs8KC+7VwgCaoJb2zIl2O57XGmicjx8u39zVCZ1pKYoG77LWKt+J0Mqmwrxm7
 JAtmab013Rrqgd89HcH20nrpF6LeBuXRTqd0ofHA4kKn0xw76iIxYz33UuSsvhHBhcCvsBhmpIk
 cqLvYpn6lJp/bkX0pQa+rwoSiwUI0BdPo+DZSIJbrLl6Z2y0pUF29Sx4kyFWcP7mrG58XWA1b06
 uf8colVrB9089Go/niQZOvI0ApruE7bb8JGpQWmntxgVeQLFzY21AUHH7w94q2SpfqueLzEN
X-Proofpoint-GUID: GdCrphCwLxKmI1jtwH763G3q5rPiXwYM
X-Proofpoint-ORIG-GUID: GdCrphCwLxKmI1jtwH763G3q5rPiXwYM
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f33b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ax9iHmw9lJn8B8Mg6a4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090108
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

On Mon, Jun 09, 2025 at 08:21:54PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 43 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +-
>  3 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7020098360e474ee149824a488d912a7ad8ed06a..75cc2d475440fcdc941aa9eb19e78a87e83b5f5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2611,11 +2611,13 @@ uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
>  
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
> -				 struct msm_display_info *disp_info)
> +				 struct msm_display_info *disp_info,
> +				 int drm_enc_mode)

Rather than passing additional argument with very special case, I'd
prefer if you expanded dpu_intf_type enum.

>  {
>  	int ret = 0;
>  	int i = 0;
>  	struct dpu_enc_phys_init_params phys_params;
> +	u32 intf_id;
>  
>  	if (!dpu_enc) {
>  		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
> @@ -2658,9 +2660,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
> +			intf_id = dpu_kms_get_mst_intf_id(dpu_kms, controller_id,
> +							     disp_info->stream_id);
> +			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
> +				  disp_info->stream_id);

If stream_id was a part of the h_tile_instance[] (e.g. by using high
bits of the ID), then there is no need to patch this function at all:
pass DP_CONTROLLER_n | DP_MST_STREAM(m) through h_tile_instance, then
parse it in dpu_encoder_get_intf().

> +			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
> +
> +		} else {
> +			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +								   disp_info->intf_type,
> +								   controller_id);
> +		}
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2760,7 +2771,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
>  
> -	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> +	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
>  	if (ret) {
>  		DPU_ERROR("failed to setup encoder\n");
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e030476dc4c69448886c29bcfe8ff3105949b129..f82dcf7c6dd31f078bbe4afe55d4667a4867f0b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -574,6 +574,49 @@ static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
>  	return -EINVAL;
>  }
>  
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id)
> +{

This goes logically next to dpu_encoder_get_intf().

> +	const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
> +	int i;
> +	int cnt = 0;
> +	u32 intf_id = INTF_0;
> +
> +	/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> +	 * DPU_8_4_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | stream_id   |    0     |    1     |    2     |    3     |
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> +	 * | DP1         | INTF_4   | INTF_8   |          |          |
> +	 * +-------------+----------+----------+----------+----------+
> +	 *
> +	 * DPU_9_2_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+
> +	 * | Controller  |    0     |    1     |
> +	 * +-------------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   |
> +	 * | DP1         | INTF_4   | INTF_8   |
> +	 * | DP2         | INTF_6   | INTF_7   |
> +	 * +-------------+----------+----------+
> +	 */
> +	for (i = 0; i < catalog->intf_count; i++) {
> +		const struct dpu_intf_cfg *intf = &catalog->intf[i];
> +
> +		if (intf->type == INTF_DP && controller_id == intf->controller_id) {
> +			if (cnt == stream_id) {
> +				intf_id = intf->id;
> +				break;
> +			}
> +
> +			cnt++;
> +		}
> +	}
> +
> +	return intf_id;
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct msm_drm_private *priv,
>  				    struct dpu_kms *dpu_kms)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index a57ec2ec106083e8f93578e4307e8b13ae549c08..388cd8f84fd579ce30a69989be5ac116bb727878 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -168,5 +168,5 @@ int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  
>  unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
> -
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id);
>  #endif /* __dpu_kms_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
