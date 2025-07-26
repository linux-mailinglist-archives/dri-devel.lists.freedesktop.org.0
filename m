Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1648B12B12
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD2310E280;
	Sat, 26 Jul 2025 15:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODRrSFI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CDF10E280
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:09:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3g4fe018843
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ixn5D6011HJHnN4b/bvT9nT2
 5y5QsLKPv3noCoNau3Y=; b=ODRrSFI5coiqiyA9HOcv4aRexKNxMGBu5didthN+
 1fr2x3KZu01VHyR8yNbfiSxP8NmbGrw+Ixa1yURrEwwlTy8zlOu6RxBruyXkDctX
 OcBCzcy/LouRHjwmEXK3TcDK3KaulE3leJgt0h9xyBMdWybMCxZbQw0n9NHNrsPd
 eN3OPGGEENi36iDpHWia3Ij1BQSkMoHT/GqMa6dcvQuOx2l88pCFCk+JWSwLBtrd
 eto9/HKu0lWmWxPLmlLh94C6suvB1jmjDGSsZ9F9E5aCabUMh+FZJwasJYdb2Qx6
 ebPPvlzSt4t8eah91LsCo+uuyOZy7eIYs1KFgGdVtUYJtQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1a8uhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:09:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-702b5e87d98so56371636d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 08:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753542564; x=1754147364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixn5D6011HJHnN4b/bvT9nT25y5QsLKPv3noCoNau3Y=;
 b=dtMAf+LWciVneSi5+5S3++JIVyuetOrj754fTqLRQuI4+STSEKbTluK0kAI4qLP6Dr
 sGxQdxtdOCNpVqgsuhacbX18rd9iayXDConXC7AJzvfjmIwfSG1uGcvjpGbPMUxVL2z3
 JofjK/M8f/xIomxw9V5m5U4h5/V160MDbym73vM1dLMwnbGjH/g+VZLo/6dX/8UOGnlg
 CKTdFcy4TOWSOKQK5I3FY6wt/lTMh0vOuEX/+kLFqlN4NUFgnHovDjk5Wl/MIw7Cf701
 8kLNVuIG3+WwoerHOYRVOVrGtVq2YOoHvBnczjMfL85n/boX0GdZZ6uyHbSWU/9p88+L
 D/Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCShQTEymig5EZnxZk4b/zoEhaZ0clo513ktUU2DQOQq/GJlNDS8scqrg7VYHgr5KO9vezsO0BznU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu3LAL8ajor13Z1gtEB0aaSWIhYdTUd1xsdbSomZUwfRqbbyqn
 s0U2MVib4JYDZsBg/kF3WljRvuEG5wW0FjxDqp1hzGo4VLOmQjO38HZUefXM8xafBTX9+ktJonx
 msCoIoIM0NX+pnVHLBYnZjxsVS2dcef8e/Py4PSRBXZfE6XySNm2xsLjKl7eWY7Zk/2BKQG8=
X-Gm-Gg: ASbGncuAHqGiEkz6MfXrVy8Uqk6SXxHsWbUWyqKWTDfpc5cRrFDa4VAqaWInHrOtc32
 3JnHQcLK+txelPUQ6evjsbXqLWAp3+VEU/hBEyhErpS6V8ZifTM8NICyeK1+DRAmO6pPDgtR9/Q
 oW3lNDE2QsxCSktEPlGsxUD+I/mmEtxZwNnBYiJ3miHydYF7d0pPkywfgH1qk5fFz2/R+yQ9zqM
 EV+d0tJCnAKdpJFTBipungV/eDg6MD7J7LYzKZMsKYYl65nHEGHCEUAfwJ0S0R656cc7lfdWAzN
 vXBrXk5BxHZ+F/An3ksUKE88iCkeLA01zly3YOsm9qbxzIpbx15tdzfRt3p9mKmuX0fRpJ0iIEE
 Ryi/ffWolBuaux0Gk0oRLDEu2bbBCa2wUzmWNPvprnvnrMJWNF794
X-Received: by 2002:a0c:e34f:0:b0:707:23a2:f57c with SMTP id
 6a1803df08f44-70723a2f8e4mr47702656d6.30.1753542563778; 
 Sat, 26 Jul 2025 08:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy1JODq1MZqt5dpjdetFUJ9lRnqH7LIhbzdGEOoche9a8M9EHiu3rVcJDYdyKqBn/gYOvZQw==
X-Received: by 2002:a0c:e34f:0:b0:707:23a2:f57c with SMTP id
 6a1803df08f44-70723a2f8e4mr47702246d6.30.1753542563268; 
 Sat, 26 Jul 2025 08:09:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f4278c27sm4508101fa.76.2025.07.26.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 08:09:22 -0700 (PDT)
Date: Sat, 26 Jul 2025 18:09:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 05/11] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <hx6dx2xxkdjyrhjz24bnnomywsvup532bk3jo3oswzftid6yyw@gu2bjjk4ahrm>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-6-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: zik29t_3POk5dDRvUstfHSPE4sZY7ATB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEzMiBTYWx0ZWRfX7AMqvb6LGtnJ
 GcKj0K1disvF8qLeMxxLXFXl73UhkOsKVfPoRNJt1pwfWvNfvTPe/u5K8xLrJnLHbn/NfjxZ0uI
 ZYn7kjPSQx/KAeh2Yuv511SfaYqRNjcHSRhEMxzF0rqUyBB2gbHIPuSGDCuNm01fAxA2FyopaY1
 yRm2EQqhlugKilsr2ifcEXOFaK61lN+rkFXuRZaK59nm+jRJ+WHQ3dAxfajdadZdUpiBQwHWAAO
 LTYMt6rLyxy8kKSYT129QnIbVq5N0v6VjJWOhwnWAgs2cx8EY5JPCBJAcgIwGZBk5pocVO6uVzA
 94nXzF8+m//cec2u04J2UTYxVVZ3Z7GHvkpQj65SfmyYXssFt+LHhJl1Dk9PFmg/esZ+XEPAFl8
 Jli2/OBiw3hitoGOZNEKdYeQAuCvxtP8ePLG2Vmu1Sr6Ptq7f3gubl9ZL5lDYZGs0tF3cyy/
X-Proofpoint-GUID: zik29t_3POk5dDRvUstfHSPE4sZY7ATB
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6884efa4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=hhupN-KlCfBdHl9C51QA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260132
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

On Fri, Jul 18, 2025 at 02:51:19PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> In some case, the dp link training success at 8.1Gbps, but the sink's
> maximum supported rate is less than 8.1G.  So change the default 8.1Gbps
> link rate to the rate that reads from devices' capabilities.

You are doing more than changing default link rate. Please split away
non-related changes. This is especially imporant for Fixes commits.

> 
> Fixes: 54063d86e036 ("drm/hisilicon/hibmc: add dp link moduel in hibmc drivers")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>  4 files changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index 4add05c7f161..18a961466ff0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -25,6 +25,9 @@ struct hibmc_link_status {
>  struct hibmc_link_cap {
>  	u8 link_rate;
>  	u8 lanes;
> +	int rx_dpcd_revision;
> +	bool is_tps3;
> +	bool is_tps4;
>  };
>  
>  struct hibmc_dp_link {
> @@ -62,7 +65,6 @@ struct hibmc_dp_dev {
>  
>  void hibmc_dp_aux_init(struct hibmc_dp *dp);
>  int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
>  int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
>  int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 2d2fb6e759c3..b4d612047f36 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -155,7 +155,6 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  {
>  	struct drm_device *drm_dev = dp->drm_dev;
>  	struct hibmc_dp_dev *dp_dev;
> -	int ret;
>  
>  	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct hibmc_dp_dev), GFP_KERNEL);
>  	if (!dp_dev)
> @@ -169,13 +168,10 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  
>  	dp_dev->dev = drm_dev;
>  	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
> +	dp_dev->serdes_base = dp_dev->base + HIBMC_DP_HOST_OFFSET;
>  
>  	hibmc_dp_aux_init(dp);
>  
> -	ret = hibmc_dp_serdes_init(dp_dev);
> -	if (ret)
> -		return ret;
> -
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> index 74f7832ea53e..6c69fa2ae9cf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -39,6 +39,14 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>  	/* enhanced frame */
>  	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
>  
> +	ret = hibmc_dp_get_serdes_rate_cfg(dp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = hibmc_dp_serdes_rate_switch(ret, dp);
> +	if (ret)
> +		return ret;
> +
>  	/* set rate and lane count */
>  	buf[0] = dp->link.cap.link_rate;
>  	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> @@ -325,6 +333,20 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
>  	return hibmc_dp_link_reduce_rate(dp);
>  }
>  
> +static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
> +{
> +	dp->link.cap.rx_dpcd_revision = dp->dpcd[DP_DPCD_REV];
> +
> +	dp->link.cap.is_tps3 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
> +	dp->link.cap.is_tps4 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14) &&
> +			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
> +	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
> +	dp->link.cap.lanes = dp->dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
> +	if (dp->link.cap.lanes > HIBMC_DP_LANE_NUM_MAX)
> +		dp->link.cap.lanes = HIBMC_DP_LANE_NUM_MAX;
> +}
> +
>  int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>  {
>  	struct hibmc_dp_link *link = &dp->link;
> @@ -334,16 +356,7 @@ int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>  	if (ret)
>  		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>  
> -	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
> -	dp->link.cap.lanes = 0x2;
> -
> -	ret = hibmc_dp_get_serdes_rate_cfg(dp);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = hibmc_dp_serdes_rate_switch(ret, dp);
> -	if (ret)
> -		return ret;
> +	hibmc_dp_update_caps(dp);
>  
>  	while (true) {
>  		ret = hibmc_dp_link_training_cr_pre(dp);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> index 676059d4c1e6..8191233aa965 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>  
>  	return 0;
>  }
> -
> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> -{
> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> -
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> -
> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> -}
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
