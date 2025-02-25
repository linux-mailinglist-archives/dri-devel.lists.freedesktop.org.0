Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B4A44E18
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A801910E7E5;
	Tue, 25 Feb 2025 20:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TiXmcF92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056FC10E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 20:57:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5452efeb87aso6084246e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740517031; x=1741121831; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RC4nwCVky+xPc0uxnaEdDnOXaTOZCldxGM13yaUgyKU=;
 b=TiXmcF92H3ihVeI0USM2KDlx+m2rNEsJCK8kD3wmi+izsZS75nSzTZrKnZI5zQOaVJ
 BMH9hdSu6i7GOmk1SzgjPm/JutKaLoAAqGNEQgaIKOTPslQDNQZnfsQ36qZDiHsNxnlk
 VfIiQ4jgiYaMCT/x4EhHAaKg1cVmHTU6yXjiSlE5hqFy1gf6HFleqk90FX2f8zLM0KCy
 9IAO0Cuwat1fBQQrHqRHXQ7w/d3tvNbmy9eAjOfjL1D19bmVoV2QEuewcfReNdOAPc1M
 iJp7yFLkDhPnvB+/ktXpvjY3brmBenzmhe6GAP+iyr6orDtEHCKOQOfehzRP1MYbadKW
 ToKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740517031; x=1741121831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RC4nwCVky+xPc0uxnaEdDnOXaTOZCldxGM13yaUgyKU=;
 b=KxZCJfhvpKnqpfk4wpn403uYIXL8Xy4G5Iaa4PcznI65+e1ni6ArR0PUa+1pdd+P4v
 oqLcBITEZheHsnyho6OEo74jFAU1FLbdcz+7Hz1KiK++0WOQIjgebazn8vjflNb05MoS
 qrkpP4XLrReAwsl6FyP6UNfmKcg12/PjqOS5HN43IkZeMU3F760G8jJPocLcYzR+/t48
 PqiafoCEVDJ14CdPpYntCbP4Lzu8bptOJ4rejsrCqUbONUkn2U/oAFmvAiweC9XgEq/z
 REDswhvAz1RNWjgLhFq8i52JFfmrWcnCkXq2MLuWwtnpRS2hSBXEIX/OtPwIEsoF63vJ
 kWVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo1d3CwYxlkLlNxT1wOXwPU9x13j35jdIZ3H0OI6jMyjoXDXZRBERFPPIIYK5h1vFKm0yLoKb1O3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaAqdxx3norLdlmRkwTgOVRaHuDE/XtWZyMtlkv3HveBvcBGxU
 xSa9QrHAOXI4g0fn2ll5GhiGttrLjDUzza9J88rMeiZhhzJ0F+fWlGO0dPa9U7Q=
X-Gm-Gg: ASbGnctetZNd2hwEnAWJsNY9AjfLZ8MEwKJIaGqvS39sJ/cVOqmoATwxFWvcLKbRn1K
 BgfigAjwGOCWZKndkzSfFXmSgMq2/BEDxFSdyemp7xpGPDhs7586Gcb0pPoqDlh8zK+nhbS7Nra
 3rVUrzPPDv+3fKnV2frrDPer5JbmfpeTxbpaAj7HoFkiTQeHlj35lUNcrtRuIr0ENKtGNwPwkRa
 4kxy9s5R+MQrehY6EWhgORMI9jG51O7LCqZKOg/HEqCNlfr+2tTDrEkEEDk9pFuwXtB4bEA0HpW
 u8KZO6Jg032XaamYQIcpEA3+HVOJOwbFc0/uZ6+mnhlIBmlN6vNb4jnE88xToFAwmxdDI322k/T
 Ejq7p9w==
X-Google-Smtp-Source: AGHT+IHRv8mh/QNtBZyrnliPjjpkMnU2s4zUsA7EqzstzJNaDy/fNbCuH+kkInHHb1dD5QukYC4paA==
X-Received: by 2002:a05:6512:130c:b0:545:2953:1667 with SMTP id
 2adb3069b0e04-5493c57a2eamr788746e87.13.1740517031002; 
 Tue, 25 Feb 2025 12:57:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b9d78sm271652e87.79.2025.02.25.12.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:57:10 -0800 (PST)
Date: Tue, 25 Feb 2025 22:57:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <yvjb7sd42uhvomsw2svotyxrvdxihsa3qch3lfynpaoap6g3hp@dcqmaw65zsk2>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-11-quic_amakhija@quicinc.com>
 <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
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

On Tue, Feb 25, 2025 at 07:58:24PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 05:48:23PM +0530, Ayushi Makhija wrote:
> > The anx7625_link_bridge() checks if a device is a not a panel
> > bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> > the bridge operations. However, on port 1 of the anx7625
> > bridge, any device added is always treated as a panel
> > bridge, preventing connector_detect function from being
> > called. To resolve this, instead of just checking if it is a
> > panel bridge, we should verify the type of panel bridge
> > whether it is a DisplayPort or eDP panel. If the panel
> > bridge is of the DisplayPort type, we should add
> > DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
> > operations.
> > 
> > In the anx7625_sink_detect(), the device is checked to see
> > if it is a panel bridge, and it always sends a "connected"
> > status to the connector. When adding the DP port on port 1 of the
> > anx7625, it incorrectly treats it as a panel bridge and sends an
> > always "connected" status. Instead of checking the status on the
> > panel bridge, it's better to check the hpd_status for connectors
> > like DisplayPort. This way, it verifies the hpd_status variable
> > before sending the status to the connector.
> > 
> > Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index d2655bf46842..9b6303267924 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >  
> > -	if (ctx->pdata.panel_bridge)
> > -		return connector_status_connected;
> > -
> >  	return ctx->hpd_status ? connector_status_connected :
> >  				     connector_status_disconnected;
> >  }
> > @@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
> >  	platform->bridge.of_node = dev->of_node;
> >  	if (!anx7625_of_panel_on_aux_bus(dev))
> >  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> > -	if (!platform->pdata.panel_bridge)
> > -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > -					DRM_BRIDGE_OP_DETECT;
> > +	if (!platform->pdata.panel_bridge ||
> > +	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
> 
> This is incorrect, because there can be other kinds of bridges in the DP
> chain. I think it's better to check for !eDP instead.

Another option comes from the aux-bus bindings. If there is an aux-bus
node, it is an eDP. If there is none, it is most likely DP (well, unless
anybody has been using the bridge with eDP panels defclared using
platform devices rather than the aux-bus.

> 
> > +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> > +	}
> >  	platform->bridge.type = platform->pdata.panel_bridge ?
> >  				    DRM_MODE_CONNECTOR_eDP :
> >  				    DRM_MODE_CONNECTOR_DisplayPort;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
