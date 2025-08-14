Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0479B2601A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0D10E13C;
	Thu, 14 Aug 2025 09:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="naplBDp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AD810E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:06:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNoWGE030090
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u83LGKfQavcBzgp0I3ktMakL
 FeOK42oeRXtS8jSDHss=; b=naplBDp74OJuAWrMcC7asyzHAH1NU4XFaVhpCHJb
 QAR8CSv5NU496F8ccOFesaKKpNY1Z5X+dQSSbuyK2yla+APLrTrusQREBQXCXptS
 3hfXcOl2HSxnJN6SdQ6yAJtXbRqy1kfKnnd7XFar1XKBpMUTjzClAnRYsySFKkZS
 uuPwK9KKOiKzOFsTY7qHhIPrPPKoXJUiEXm/Vp+5g4gOgep1FzJ/7qEa2B56M0ui
 XaPsR7nKQ7R2NCW8syC6mJLHgAfwKPRLEanJXlsjwIRGEC+oLFfmwgcWbh+b9Xgs
 owsPoKQBTrVvGOQ9HnhXasgAo4+1Af0dM1vC8DnK/6BkoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vsyfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:06:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b10993f679so16124011cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162361; x=1755767161;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u83LGKfQavcBzgp0I3ktMakLFeOK42oeRXtS8jSDHss=;
 b=Y0gcVFrSSnopeafgZMbAR0T/l60OAeQwZO9LBGU53KcDVX5P7eMVIoaYKPziyjDM8O
 eLNOIehoLQxNOFep50Qwo6G0cwTdWG9OMB9NRtvx/UmkdTRf1gtmk9k/F67I/ZnFsFu2
 mvhxivCBoulpUp9w2ILZRi1aoD86gpO2iNTcZRHCymvl5q6gI73uUYBNCzNo1ZgP7gZ+
 TWTZLCFE3yMnALP7Zz2XOvWwp60Yv7IfIZ3YNQyk5x+gpnM1AigY/nr1uV/2FPTgL5+z
 YK2dRW9aOCAhgNEuMLZLTiGt7tlCaJ9jHZKaphDTNnP+mLiFhyPV7oUNBWzzlnIznxod
 IRTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZWiyuj7gaJ8TiJJhBButhklnjKl7G6MzbtWkkCzvcfKXSveg1PkrtncKXAlLeEJAMhc4tdRth1v4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoXHxptndw30xGGVt5xZ2gqPHHx9SYYlAY36QZ80svVu5dvBdF
 RVb573KVnPQpH8yTIsRPtM+twFhXFWfiAXUy7Yl/iPmdlxoMx/4G7rhWXtoVID/r3ftllBwRdQV
 cMt4X3TTxkebSwdzsMRlPIOaTt6ppairlV3lPtbznBikv6gdDGtqo5eBOzM1gdHRHAEdJocU=
X-Gm-Gg: ASbGnct67joIoG4DyrxSKGfPYtHVOEwiZV7mmuhhr/3+tMdd08uvdbIZeGQuJmuDHyX
 0hp4MYwJt0sV6XfgtvTEJ67OVxEEcF8HT0Mp0+woHKKk1XAX6h61RltAtu4Io31a3LoZk1GBOjs
 bIMLU2XHSj+JbrPGsGzgK406c6YvsOtilDDKFZ0gEOwvU/kPoTKHcBoh/ixCatkbBvH1EHpFySL
 VVL4Yc+A6HiEf5DRwctNx70Dfn50jjCNewFv+EtjIMO1IznBgXvGnci8Ol5gNMv94dzFmjJkD8d
 jlNvWXxYV0UwlpQRE+yZaVncaddZZ6q3EnzenAhL8+XhOwgDeyRl4uUWfMvxn7JUG5tky/Ry042
 mzGkhmDmJcs3ZCH44QjOjfUNn8dNZXlsqFdv78TbiZn5q+Q31hf3v
X-Received: by 2002:a05:622a:11:b0:4af:1912:5966 with SMTP id
 d75a77b69052e-4b10ab03114mr29191401cf.55.1755162360575; 
 Thu, 14 Aug 2025 02:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHflOgmqWtfQyIjvsUEupQSwbEKJuD51/ae0PBG04IRq+7Km2Le+7kgi+QLV5PttmGOq5tpw==
X-Received: by 2002:a05:622a:11:b0:4af:1912:5966 with SMTP id
 d75a77b69052e-4b10ab03114mr29190971cf.55.1755162360054; 
 Thu, 14 Aug 2025 02:06:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55ccd2fa76esm2229886e87.120.2025.08.14.02.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:05:59 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-3-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX8RIKxSip/9bk
 dnrvCUzUpTECRLrkgsJQiPHBH2HqdzQkUKuohgvuqOhozKFlsDDK/1HOedRSXhfmvn3KYQqs34P
 vrEZ2R6kf/seokiHQdup/trwbVT85IzPuX6+w9vWuXJOGOypiRVhrTUYaYEwnwZaQfqfL7pO7Vg
 wZ3p5pu+Xg8SHeBD4p59ttwOJ+PecBVY95kcHy237+mgVoKmE75CT+gZQBcGApIRzqM3KJth+Pg
 NaNlJ3sop9BONFzh0JZWu4LOLvksOsMYUmMG46n8FB91BdIJcSgSZ4bRCTzlTHzAbaddNcfZYkA
 6mWCSrouOeKg1ReyYq1zSwrM2G63+H+mXQPuLUUH3DZRd3Pj7lqzftZ0TOnl/UvBZiH6eHvC8ZC
 17XFFXAE
X-Proofpoint-GUID: L-6I0plljEkUsVRpkt3obtQz6EfwVbF7
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689da6f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=Wb6V2SaiAW0i5CbIPAAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: L-6I0plljEkUsVRpkt3obtQz6EfwVbF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The debouncing when HPD pulled out still remains sometimes, 200ms still can
> not ensure helper_detect() is correct. So add a flag to hold the sink
> status, and changed detect_ctx() functions by using flag to check status.

THis doesn't explain what is wrong with
drm_connector_helper_detect_from_ddc(). In the end, this function
doesn't use the HPD pin.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - remove link training process in hibmc_dp_detect(), suggested by Dmitry Baryshkov.
>   - remove if (dev->registered), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 665f5b166dfb..68867475508c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -50,6 +50,7 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
> +	int hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index d06832e62e96..ded38530ecda 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -34,9 +34,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	mdelay(200);
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>  
> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +	if (dp->hpd_status)
> +		return connector_status_connected;
> +	else
> +		return connector_status_disconnected;
>  }
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> @@ -115,21 +118,23 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
>  	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	struct hibmc_dp *dp = &priv->dp;
>  	int idx;
>  
>  	if (!drm_dev_enter(dev, &idx))
>  		return -ENODEV;
>  
> -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> +	if (((dp->irq_status & DP_MASKED_SINK_HPD_PLUG_INT) && !dp->hpd_status)) {
>  		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> -		hibmc_dp_hpd_cfg(&priv->dp);
> +		hibmc_dp_hpd_cfg(dp);
> +		dp->hpd_status = 1;
>  	} else {
>  		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> -		hibmc_dp_reset_link(&priv->dp);
> +		hibmc_dp_reset_link(dp);
> +		dp->hpd_status = 0;
>  	}
>  
> -	if (dev->registered)
> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> +	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>  
>  	drm_dev_exit(idx);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
