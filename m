Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77591A2B95F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B9910EA0A;
	Fri,  7 Feb 2025 03:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MXe5z7n2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C805B10EA0A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:01:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so15695761fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738897283; x=1739502083; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
 b=MXe5z7n25jgmQrfY4ctvvrDX3dVlOYnSZUY6R+cgYrEPWSVA//JN4VkqZA5fYrG5oF
 yx11O9SEaqsdYRTgvOHprHNBQ4mcud8ajR6wstcVN4tF8kwUwg7yMVDj73NV4OovZtlp
 /pCbpJzQ/DYqaLw1x035fy3L6ZLTpTYPP/KoMaV2G9lpi0ajUcGMMXliiKjkA4eb7jY/
 vkg01VLn2oNJ9yVAkCCYxKAgr0sf/F4C9zVKrDxXjuO9lVkEfrtU/WrrjGF3Vfvbsyg8
 FluqzrUb+U4IBu9hqrgCchNJoPeK+x8WH7YMjZ58iIL9K0vPod1krMZkXRrd7DwLqqCj
 WAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738897283; x=1739502083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rv/3RFVNWDMcc5HMME46hF6itjMzUu60Z1kcevabBlU=;
 b=gRwTarhovKfgswJjAMMhWrGVYRStashObxmBRpumTHThz2jTNNZhaOJjhC1SAIYuq1
 wnNLDfKCNslwVnNM3uwfXDu5MOhYofL480h8F8YR5TsiDqH7lBJ1aBPg0FTewQJLb5kT
 KRAW8BgL+6oP7PAX/WKrzGBvS6ryFcoq5qDiFw13tzDsUGCMppG1ILTSACNlxQdYeRNJ
 DpEkLKBiqPZRloxzZcHpXENwr+AmtjerfhfJ4msr7lnhEBqVKMet+IdT3uvio2jRtI0w
 wPppGbTDSgOzDtgLvhSF0Q7WbZTjyWZVPDe8eEvwtq9MEFoq+YqcIxrK4VaI3Dw6X6k1
 3keQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMCdGtrr/KcRWQQi8vHb3NNyAEbHIBVY7pF1rPBaMMVRv6wUk0aIwOFDWAm3dfSM0zo2W1aWQTy2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfgRgt3TYRT8MormShYphs+CNieJ4fQNU8qi4WxA9otULZW2SP
 XD9FQw40isZla11MeKfdOaD/asqzbqwSWAQJu4YRltJp2MyTNWyKto9z26PloSM=
X-Gm-Gg: ASbGncuLKJzYR0TZEw4eL4VnXmAUgOv3rUTTFGNs5m7Yv+OF5TMTThU2Q6tH0qOdFCw
 Gz4WKoiUqH1/fXW3nt4j50fAqIWZYGb31YQlSyIBBIUUSHPQ/hkkhY95m232pqh42Yl9Czb1J5N
 uVDsQUUnJ8zoKJtiWJQmxtVOpeONGiD21ZsHJ89Ix468PHnAa2ZpS4tLis/I/71Q1/q+sJlnSsE
 CZxuaYFwz59i21rVzipt77W3wMOEppS74O+zhGYdp3GDefi5HCG6W9pVk78ayA67Ruq0QNSgarb
 6VvDy4aiySaeNYJOyrYBSYD+c4mhlkGI9ajSKZYAZiHOmMjr+lvqPsMkkmD2hczzFZOEj8Y=
X-Google-Smtp-Source: AGHT+IGDqEkE6OWYr0NcLlg1JR9sknC45WBuXsh87/ud3ljT7djhN2ztl5wAF/TJfj5OXo6RJ8lw+Q==
X-Received: by 2002:a2e:bc21:0:b0:302:244a:da2c with SMTP id
 38308e7fff4ca-307e5a71d1amr2898811fa.31.1738897283014; 
 Thu, 06 Feb 2025 19:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de18e48dsm2871441fa.27.2025.02.06.19.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 19:01:21 -0800 (PST)
Date: Fri, 7 Feb 2025 05:01:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 12/26] drm/bridge: allow bridges to be informed about
 added and removed bridges
Message-ID: <5roxoodskw3ieksvzqezs33gcwhppeqikagu5462wljc6zylif@5ls7bmdusmq5>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:27PM +0100, Luca Ceresoli wrote:
> In preparation for allowing bridges to be added to and removed from a DRM
> card without destroying the whole card, add a new DRM bridge function
> called on addition and removal of bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v6:
>  - rebased fixing conflicts
> 
> Changed in v5:
>  - fixed kerneldoc errors
> 
> This patch was added in v4.
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
>  include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b0834b8644284e5f7751cec81724af849b4180e7..1955a231378050abf1071d74a145831b425c47c5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -207,12 +207,18 @@ LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_init(&bridge->hpd_mutex);
>  
>  	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
>  		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
>  					       BIT(HDMI_COLORSPACE_YUV420));
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -249,10 +255,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	struct drm_bridge *br, *tmp;
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
>  
> +	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> +		if (br->funcs->bridge_event_notify)
> +			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
> +

I think the order should be different: notify about the added bridge
after adding to the list, notify about bridge removal before removing it
from the list.

>  	mutex_destroy(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1561347c4991dac6022319774510f9560c9283c3..ad7ba444a13e5ecf16f996de3742e4ac67dc21f1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -56,6 +56,11 @@ enum drm_bridge_attach_flags {
>  	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
>  };
>  
> +enum drm_bridge_event_type {
> +	DRM_EVENT_BRIDGE_ADD,
> +	DRM_EVENT_BRIDGE_REMOVE,
> +};
> +
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
> @@ -729,6 +734,24 @@ struct drm_bridge_funcs {
>  				      struct drm_bridge *bridge,
>  				      bool enable, int direction);
>  
> +	/**
> +	 * @bridge_event_notify:
> +	 *
> +	 * Notify that another bridge is being added or removed.
> +	 *
> +	 * This callback is optional. Bridges implementing it must always
> +	 * check whether the event refers to a bridge they actually need to
> +	 * interact with.
> +	 *
> +	 * @bridge: bridge being notified
> +	 * @event: event happened (add/remove bridge)
> +	 * @event_bridge: the bridge mentioned by the event (i.e. the
> +	 * bridge being added or removed)
> +	 */
> +	void (*bridge_event_notify)(struct drm_bridge *bridge,
> +				    enum drm_bridge_event_type event,
> +				    struct drm_bridge *event_bridge);
> +

This creates a small issue. It requires drivers to have a bridge, even
if they don't need one - e.g. the drm_encoder doesn't get notifications
about the added bridges.

I'm not sure if that can be solved in an efficient way.

>  	/**
>  	 * @debugfs_init:
>  	 *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
