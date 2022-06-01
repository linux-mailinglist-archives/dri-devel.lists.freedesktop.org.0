Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC8539FEC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7CB10E290;
	Wed,  1 Jun 2022 08:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF2110E290
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654073830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCOUyyDM2EIXc4RPNW8pyLJMNdGYc/IzffrR0m7ZqEw=;
 b=RDCXV6iRSv82XWySydwwf7RkoZlzvzgV8G9FIGOsIiJnr4RW5VhaCL/RXc99apzJ0wYwq2
 63luxmhORV/YPKNRpHWY8zpu9bEeodcj0xvAZt95ueRv9XVYSUps9yvh5Efn20vZCvh3uu
 nyd0kJmeNgjSeDHIg0vSoZO+Og/2eto=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-aMQo_K6FO9eVRhUfiYTxiA-1; Wed, 01 Jun 2022 04:57:09 -0400
X-MC-Unique: aMQo_K6FO9eVRhUfiYTxiA-1
Received: by mail-ej1-f72.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso598569ejc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lCOUyyDM2EIXc4RPNW8pyLJMNdGYc/IzffrR0m7ZqEw=;
 b=028K13NKErbNC+zvi8d4DIczuubWLcgO35nnoTBaSl/BBkcvzEga+BI+YHQotk3o50
 Rw6A+HFJAf51skL6yULJJvQaBoVNSpRA0WnOH3fKLfrMfZF82ksDAHS9KYx3sbMEow5k
 4q9tnjiyj/Vls5zeN0AifqbOt8iEn0f0XwmVe/M1M06NeI4cNlyf2ceSN5rzP6/x5V24
 B9A4kDtEiWcPyvQkvxDGiPB6HOm+Pef4+mJsef0pm/YEW44UJiBAXdXxs4TnIaNHZ2hs
 RDu/+CzJwZvw8dNx/WJmX8B9z6N9sAyAaAVDMTrgFNogzKdWnKI69hj6qiFUG7ZynBSe
 B4TA==
X-Gm-Message-State: AOAM531+cMCE9gU6vxlEmvPRiSo5YXIYysKPVXy2dX6iRGKbmpPtoO25
 4zRjiyWfutaSm5Bxp+88fYzIbxyKbcWR+ZVU7d8Ey+fZIxT8Qj0unUDq2mca41Ee2hyg/XxJmeg
 s2//BP9KuKd3YDzarlSUMF5DltxYJ
X-Received: by 2002:a17:907:3ea0:b0:6ff:7d7a:480d with SMTP id
 hs32-20020a1709073ea000b006ff7d7a480dmr12015286ejc.750.1654073828315; 
 Wed, 01 Jun 2022 01:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDqD6pKipOJm2UHddq2V2tE+4Dh/llNuSewqbfAAqKxh7eaW78QHTMcUwNyG47vvudKgNjkQ==
X-Received: by 2002:a17:907:3ea0:b0:6ff:7d7a:480d with SMTP id
 hs32-20020a1709073ea000b006ff7d7a480dmr12015265ejc.750.1654073828091; 
 Wed, 01 Jun 2022 01:57:08 -0700 (PDT)
Received: from [192.168.43.127] ([109.36.130.134])
 by smtp.gmail.com with ESMTPSA id
 y22-20020aa7ca16000000b0042dcbc3f302sm619741eds.36.2022.06.01.01.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 01:57:07 -0700 (PDT)
Message-ID: <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
Date: Wed, 1 Jun 2022 10:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
 <20220601081823.1038797-9-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220601081823.1038797-9-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/1/22 10:18, Hsin-Yi Wang wrote:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The concept is the same as the previous version.
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
> The only difference is, it now uses the panel API instead of parsing
> orientation from the driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bd3f5b485085..12836a697f56 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> +	struct drm_panel *panel;
>  	struct drm_connector *connector;
>  	struct phy *phy;
>  
> @@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		ret = PTR_ERR(dsi->connector);
>  		goto err_cleanup_encoder;
>  	}
> +
> +	/* Read panel orientation */
> +	if (dsi->panel) {
> +		enum drm_panel_orientation orientation;
> +
> +		orientation = drm_panel_get_orientation(dsi->panel);
> +		if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> +			drm_connector_set_panel_orientation(dsi->connector, orientation);
> +	}
> +
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
>  	return 0;

drm_connector_set_panel_orientation() is a no-op when called with 
DRM_MODE_PANEL_ORIENTATION_UNKNOWN, so the check for this is not
necessary. This allows this to be simplified to:

	/* Read panel orientation */
	if (dsi->panel)
		drm_connector_set_panel_orientation(dsi->connector,
						    drm_panel_get_orientation(dsi->panel));


Note since drm_panel_get_orientation() checks for a NULL panel, you could even
drop the "if (dsi->panel)", but I think the meaning of the code is more
clear with that present.






> @@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
> +	/* Get panel if existed */
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> +

Check ret? or maybe not assign to ret ?    I understand some errors are expected
so maybe something like:

	if (ret && ret != -ENODEV)
		return ret;

?

Note -ENODEV is probably not the right error the check for!

Regards,

Hans



>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
>  		return ret;

