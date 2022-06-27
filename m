Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138F55BC12
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83E10EE0E;
	Mon, 27 Jun 2022 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508810ED19
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:05:16 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id z191so10914933iof.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Vz+PIAaZ/qnk8nyNJa+zdscW6Bv7pgzaLQ1N3O646A=;
 b=EnoZsUd6LEj1hEzbXDnfmV+eu/nhhO7bQY5fL1KTDVd1QVmBHOxkOQtcz9IFBJonGk
 k2RTRq+PlGY0mTNAbB1o5rUO+NOnFQ65qHrIaQiVIhhm+klT55VjNFdaBRzC9sXOezAs
 0aREn/aww4283s/qgUFw94xzqzscMWHM5hr27XMDyZBSaUGRSMUWfQhX/UOZpiKHeIfo
 GZn2ASo5KQ8iAAqPLRLSS/d0WLhE5B9RDv/ER2MwHGKSCQlVpydORE5LAoTXVlENseup
 MFVbUlhwwjfIZ2/1v/iUJOUJWFa0OAFhUtyZ6lIeu47QN1wqEhtauKjArILC+ZNb2KA7
 YFVA==
X-Gm-Message-State: AJIora8yNMZpl4PJe+4YqZaS++eQifIOCoqRKv/FcZxBaPGnQEVx8+cQ
 4uOgJHC2UiVrVHXs1r9JGw==
X-Google-Smtp-Source: AGRyM1vd1hXiT92FmmZEOLGUlOXC2cFf/xqKvRpLsJL6tDRsS+f6gzt0eb8Fg2+4cpBZmPRJbrsmGQ==
X-Received: by 2002:a05:6638:25c8:b0:332:198c:dbf6 with SMTP id
 u8-20020a05663825c800b00332198cdbf6mr8908919jat.52.1656363915770; 
 Mon, 27 Jun 2022 14:05:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a927f0d000000b002d8f50441absm4934985ild.10.2022.06.27.14.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:05:15 -0700 (PDT)
Received: (nullmailer pid 2956189 invoked by uid 1000);
 Mon, 27 Jun 2022 21:05:12 -0000
Date: Mon, 27 Jun 2022 15:05:12 -0600
From: Rob Herring <robh@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v5 7/9] drm/bridge: it6505: Register number of Type C
 switches
Message-ID: <20220627210512.GB2905757-robh@kernel.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-8-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622173605.1168416-8-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 05:34:36PM +0000, Prashant Malani wrote:
> From: Pin-Yen Lin <treapking@chromium.org>
> 
> Parse the "switches" node, if available, and count and store the number
> of Type-C switches within it. The extcon registration is still
> supported, but we don't expect both extcon and typec-switch be
> registered at the same time.
> 
> This patch sets a foundation for the actual registering of Type-C
> switches with the Type-C connector class framework.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> v5 is the first version for this patch.
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 34 +++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b673c4792d7..b259f9f367f6 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -452,6 +452,7 @@ struct it6505 {
>  	struct delayed_work delayed_audio;
>  	struct it6505_audio_data audio;
>  	struct dentry *debugfs;
> +	int num_typec_switches;
>  
>  	/* it6505 driver hold option */
>  	bool enable_drv_hold;
> @@ -3229,13 +3230,28 @@ static void it6505_shutdown(struct i2c_client *client)
>  		it6505_lane_off(it6505);
>  }
>  
> +static int it6505_register_typec_switches(struct device *device, struct it6505 *it6505)
> +{
> +	struct device_node *of;
> +
> +	of = of_get_child_by_name(device->of_node, "switches");
> +	if (!of)
> +		return -ENODEV;
> +
> +	it6505->num_typec_switches = of_get_child_count(of);
> +	if (it6505->num_typec_switches <= 0)
> +		return -ENODEV;
> +
> +	return 0;
> +}

Not that I expect this to remain, but you have the same function in 2 
files. That's a clear sign this belongs in a helper.

Rob
