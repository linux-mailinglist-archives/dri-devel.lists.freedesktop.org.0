Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED21516BE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D656EDD4;
	Tue,  4 Feb 2020 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6BF6E461
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:41:09 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l24so8697481pgk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5GSxTQ6W9CcW+Z7ou2IhReezoqFKCBTZW97IH2PqqeE=;
 b=ykGGpqdBVz9OTEZXdrr3nMBFW6G6xd7G3rFY1dkfyRvXQeAnwbfl2QVrBzLExXsdNo
 vA0VqOTVlJTqVk7zRqcBNka7zsMZKr0XfWL5+J3nWl+SV0fObWN3TzJhw/3wkkWwCEo+
 AviQHXckfXkzG9a7pqMenKA/K/+Bd5mn9pD+0a4Iax6Q1TEzIGqjUab6eBI5864UJ4Rb
 SkioIn7d/F+D1LOHMxI7xiMMBIxfYIORN7QQnsUru6ik/9g6gxYV3GS1XSakIH7mJ+RE
 4H+3XBDMu/DdAcHJMBxD2Kz5ec6hb+8PzBo4n85W89a2l8I04lwi6oxZ9fb3ultOVno/
 BC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5GSxTQ6W9CcW+Z7ou2IhReezoqFKCBTZW97IH2PqqeE=;
 b=aKb/guraTLBPimOIG5K7GefWLD6y+5VLDmZrL9lwxb1YVQOqo4QhgswwS0HHUAgwoe
 Q6OzJdnjTlFzVmHH1YrLyp1qjoVV0M/22QguFbYmtjkY66RIcIz/UcJu/3250ItRaYc6
 6GFEOLXoR2K+F2InG7vZRV869SV64loMbPTx7NFoRgVHJsO+uYEVw2eqQS8mb6xV7zQs
 ZXJULm95Zey72njAkehi/OTwCuDiUHD/GqO6Lfvh3lY48VfdhqXfnDBcW5UscpgTfSCP
 zn3ZVOyhSqB5AArKseXgsW10tFekfdQGMLc2tP/CGaAj8VkcmH+x2UmD389vLvpBI1Eh
 /gBA==
X-Gm-Message-State: APjAAAVmvrV3bmyTSVUtBxdQ5HKrmcx2nUzkyjmhZJt6kJey3jUQJzEK
 aZHeNR97NUjkVxMJVk0uq5EbRg==
X-Google-Smtp-Source: APXvYqzOEzc/reC7j8tFM+dcshzPEfWX0YqqE+y7YIL2L2v2ABNE3lPX/3RqH15FUH5z+O5wTVWXzg==
X-Received: by 2002:a62:cfc4:: with SMTP id
 b187mr18808478pfg.155.1580773268964; 
 Mon, 03 Feb 2020 15:41:08 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 11sm22611146pfz.25.2020.02.03.15.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:41:08 -0800 (PST)
Date: Mon, 3 Feb 2020 15:41:06 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 8/9] drm/bridge: ti-sn65dsi86: Train at faster rates
 if slower ones fail
Message-ID: <20200203234106.GH311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> If we fail training at a lower DP link rate let's now keep trying
> until we run out of rates to try.  Basically the algorithm here is to
> start at the link rate that is the theoretical minimum and then slowly
> bump up until we run out of rates or hit the max rate of the sink.  We
> query the sink using a DPCD read.
> 
> This is, in fact, important in practice.  Specifically at least one
> panel hooked up to the bridge (AUO B116XAK01) had a theoretical min
> rate more than 1.62 GHz (if run at 24 bpp) and fails to train at the
> next rate (2.16 GHz).  It would train at 2.7 GHz, though.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3: None
> Changes in v2:
> - Squash in maybe-uninitialized fix from Rob Clark.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 71 ++++++++++++++++++++++-----
>  1 file changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 48fb4dc72e1c..e1b817ccd9c7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -454,7 +454,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>  {
>  	unsigned int bit_rate_khz, dp_rate_mhz;
>  	unsigned int i;
> @@ -472,8 +472,42 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
>  			break;
>  
> -	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> -			   DP_DATARATE_MASK, DP_DATARATE(i));
> +	return i;
> +}
> +
> +static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
> +{
> +	u8 data;
> +	int ret;
> +
> +	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
> +	if (ret != 1) {
> +		DRM_DEV_ERROR(pdata->dev,
> +			      "Can't read max rate (%d); assuming 5.4 GHz\n",
> +			      ret);
> +		return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
> +	}
> +
> +	/*
> +	 * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
> +	 * these indicies since it's not like the register spec is ever going
> +	 * to change and a loop would just be more complicated.  Apparently
> +	 * the DP sink can only return these few rates as supported even
> +	 * though the bridge allows some rates in between.
> +	 */
> +	switch (data) {
> +	case DP_LINK_BW_1_62:
> +		return 1;
> +	case DP_LINK_BW_2_7:
> +		return 4;
> +	case DP_LINK_BW_5_4:
> +		return 7;
> +	}
> +
> +	DRM_DEV_ERROR(pdata->dev,
> +		      "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
> +		      (int)data);
> +	return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
>  }
>  
>  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> @@ -530,13 +564,15 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
>  	return data & DP_LANE_COUNT_MASK;
>  }
>  
> -static int ti_sn_link_training(struct ti_sn_bridge *pdata)
> +static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> +			       const char **last_err_str)
>  {
>  	unsigned int val;
>  	int ret;
>  
>  	/* set dp clk frequency value */
> -	ti_sn_bridge_set_dp_rate(pdata);
> +	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> +			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
>  
>  	/* enable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> @@ -545,7 +581,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
>  				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
>  				       50 * 1000);
>  	if (ret) {
> -		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
> +		*last_err_str = "DP_PLL_LOCK polling failed";
>  		goto exit;
>  	}
>  
> @@ -556,9 +592,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
>  				       val == ML_TX_NORMAL_MODE, 1000,
>  				       500 * 1000);
>  	if (ret) {
> -		DRM_ERROR("Training complete polling failed (%d)\n", ret);
> +		*last_err_str = "Training complete polling failed";
>  	} else if (val == ML_TX_MAIN_LINK_OFF) {
> -		DRM_ERROR("Link training failed, link is off\n");
> +		*last_err_str = "Link training failed, link is off";
>  		ret = -EIO;
>  	}
>  
> @@ -573,8 +609,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata)
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	const char *last_err_str = "No supported DP rate";
> +	int dp_rate_idx;
> +	int max_dp_rate_idx;
>  	unsigned int val;
> -	int ret;
> +	int ret = -EINVAL;
>  
>  	/*
>  	 * Run with the maximum number of lanes that the DP sink supports.
> @@ -616,9 +655,19 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>  			   val);
>  
> -	ret = ti_sn_link_training(pdata);
> -	if (ret)
> +	/* Train until we run out of rates */
> +	max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	     dp_rate_idx <= max_dp_rate_idx;
> +	     dp_rate_idx++) {
> +		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret) {
> +		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
>  		return;
> +	}
>  
>  	/* config video parameters */
>  	ti_sn_bridge_set_video_timings(pdata);
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
