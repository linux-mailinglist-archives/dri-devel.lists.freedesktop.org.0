Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7326543D6B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5B112AAB;
	Wed,  8 Jun 2022 20:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF744112AA1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:13:54 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso19342615pjg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p8gfYTqdBB7YfKTUUZfAgLjuct5/Ju4bzHCdUHoJSiA=;
 b=Tcj47/AlGaRRSrZqSt+U2Kngcun7RU6+h/c8KbSrFTExCr8705QFfSZar69ezhbBAh
 nB1BexK4oHzvtAn+HHDZfYSXoem10OsMZgxbWGmDnBGKr3BHKbfXmOqKJiqGGr131nTh
 1COslDbdB0AtHWDxsmRTjl45ecOUxwVDuAnhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p8gfYTqdBB7YfKTUUZfAgLjuct5/Ju4bzHCdUHoJSiA=;
 b=5LXsxaAXPUY/QclmH3giUG59krI/jBA4i+FcDZ942Cp5+WhvSwvD6HolYAU4oWoSMj
 22a3ECtoF5inNgn7d3jSCHEDmnHzbY1SGZ3enFH+LzJGAeC2M+PPppgLQ4e2tSYuh8Tm
 QU4nVf1k3T+H1U32WP0mLBad4DxchzL/pdXJjwmMRIamOh7jH6+QtWZiKcXNZB1io9Gn
 2RpblPw5dH4N0gXyaVj+0qtTzr344VDQWJ7fQEjwmG7e5GjlTeBR54j7pSPOZkweZVV5
 m6UBIvk/N51YBKMTBfzlC0F8sURU4m8ALpt7jt1zQKN2igQ8oxgzQ5AfctePL5vZBDQq
 RACw==
X-Gm-Message-State: AOAM532oV2881TomIwu+GM0IvmoXeuIzX4KBQhqQzsj88+0SzbXRAgL9
 GK289U9FNwXOMSI3uUX1+FU9qw==
X-Google-Smtp-Source: ABdhPJwZaWsj1DFOL1VbG1L9Ph8vwcd+mQeowEgVt3g26sXa0ccQR+75qaZvjcmhPymiJXldQ2SunA==
X-Received: by 2002:a17:902:ab05:b0:164:21:6802 with SMTP id
 ik5-20020a170902ab0500b0016400216802mr35435794plb.56.1654719234171; 
 Wed, 08 Jun 2022 13:13:54 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 a8-20020aa795a8000000b0051810d460adsm15587780pfk.114.2022.06.08.13.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:13:53 -0700 (PDT)
Date: Wed, 8 Jun 2022 20:13:52 +0000
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: typec: mux: Add CONFIG guards for functions
Message-ID: <YqEDALxy2sN0+fxX@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-3-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190131.1647511-3-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Jun 07 19:00, Prashant Malani wrote:
> There are some drivers that can use the Type C mux API, but don't have
> to. Introduce CONFIG guards for the mux functions so that drivers can
> include the header file and not run into compilation errors on systems
> which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
> the Type C mux functions will be stub versions of the original calls.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  include/linux/usb/typec_mux.h | 38 +++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index ee57781dcf28..758d34ced1f8 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -58,6 +58,8 @@ struct typec_mux_desc {
>  	void *drvdata;
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC) || IS_MODULE(CONFIG_TYPEC)
> +
>  struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
>  				       const struct typec_altmode_desc *desc);
>  void typec_mux_put(struct typec_mux *mux);
> @@ -76,4 +78,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
>  void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
>  void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
>  
> +#else
> +
> +struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> +				       const struct typec_altmode_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +void typec_mux_put(struct typec_mux *mux) {}
> +
> +int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline struct typec_mux *
> +typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +struct typec_mux *
> +typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +void typec_mux_unregister(struct typec_mux *mux) {}
> +
> +void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
> +void *typec_mux_get_drvdata(struct typec_mux *mux)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}

LKP discovered some issues with static inlining as well as older
(incorrect struct). [1]

I will fix this in the next version.

[1]
https://lore.kernel.org/linux-usb/20220607190131.1647511-1-pmalani@chromium.org/T/#m571c46dce2339186967216bd5af25bcf9e6d1380

> +
> +#endif /* CONFIG_TYPEC */
> +
>  #endif /* __USB_TYPEC_MUX */
> -- 
> 2.36.1.255.ge46751e96f-goog
> 
