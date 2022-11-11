Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2562604F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 18:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0058310E196;
	Fri, 11 Nov 2022 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9A10E196
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 17:18:24 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id d8so118326qki.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MdtI6UbB5wmG++XC226FrHVJyXk+ZL72ipR2W0nf3TA=;
 b=Giscrycg/IhkWuPEtuG9heCQyVPrnRe+weAN1ez6KwWRkl4XDUs+ep9h0/JkNqGYJD
 aTBC8HCMuu53IG5VpoomBrrsz+saMw18YeEVvXfZHETUix4nKrKbRI7F1Tx7et8Nwkpu
 itsjOQHCEM8ikeMYpO9K5k7cPrdtXpYENkLspbPcL4WUrmvrhBHz0yNSsC3CdDkjSdHZ
 4F0DeubmEO7TPkKrtti8ZOTsZ9+BNyNHieLLXjfg0rAOqqUYVNt+JqEciYGqZaPzTj+x
 8UYqMlm2SqkmWzcXJijw0u91Sux0jwpbKRshuWc3C3GFANSxozXYoXwRDVxDqbw3LjOX
 xQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdtI6UbB5wmG++XC226FrHVJyXk+ZL72ipR2W0nf3TA=;
 b=IIHrItVs/g04ZTqb33uILu0BNZMScNMNKBXueaqBXImV2YQmPlZQOqt5lkuOlW+JqL
 +kiSV4Uoy6NpzUS4KwoUxtM1TuwfVedTE/kRbah11GGGExcQTIegieEQOvB3zDLngWPl
 CtxroyRwTAoi1PhqObc9CvCVDsTlVAMUMhkgKjsqZ5ORezJL8Gj3EwdBCIGDOYDHb2Vk
 mb4b1bMLlM/SIGoyrH9RA9sirgyPiVgGs76a+d7Kz+ZJUtU+z51ddZo4TFYYrTon5E5k
 uHj4Ok36M9jksMdnepAmZhrJoFZoci3Lmzm17IJCnT2y45y4wLoYQZ45p2IZSyhMI0hp
 jFxQ==
X-Gm-Message-State: ANoB5plmsroHgsgqanSmKokgbX932q43j+0wewoq5rZ5DI57u1UZhL+5
 FoAlcCvn5RJO/Tp3zS7RJQEDIQ==
X-Google-Smtp-Source: AA0mqf5ar8tpYdoEycvL5cWQPm9q7S/RXlRccqGuTlGG243PooULMPf6DBq/Jha+IaL9qpnzFOB7Mg==
X-Received: by 2002:a05:620a:2233:b0:6fa:566f:eb1e with SMTP id
 n19-20020a05620a223300b006fa566feb1emr1883068qkh.616.1668187103756; 
 Fri, 11 Nov 2022 09:18:23 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 m17-20020ae9e711000000b006ce580c2663sm1685659qka.35.2022.11.11.09.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 09:18:23 -0800 (PST)
Date: Fri, 11 Nov 2022 17:18:22 +0000
From: Sean Paul <sean@poorly.run>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: anx7625: register content protect
 property
Message-ID: <Y26D3pENgEIMu3hc@art_vandelay>
References: <20221102111148.1810314-1-hsinyi@chromium.org>
 <20221102111148.1810314-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102111148.1810314-2-hsinyi@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 07:11:47PM +0800, Hsin-Yi Wang wrote:
> Set support_hdcp so the connector can register content protect proterty
> when it's initializing.
> 

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index b0ff1ecb80a50..0636ac59c7399 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2680,6 +2680,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> +	platform->bridge.support_hdcp = true;
>  
>  	drm_bridge_add(&platform->bridge);
>  
> -- 
> 2.38.0.135.g90850a2211-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
