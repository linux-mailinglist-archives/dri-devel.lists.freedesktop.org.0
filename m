Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9B1E21D8
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE26E171;
	Tue, 26 May 2020 12:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9447A6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:29:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so7770061wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehl9413qGXjDWpnNjI7NhUKg/rQKrWFNJkh18zEG+go=;
 b=I6auHdg8KmJKL1VrCl08Va6JmyHlN0siJ069XBwdvkngfrzODlJE1SyBT9udsIGe18
 UOP605RhJhaah+eD7zzNpwrRSfUTfjpRAR9URb2imCmtlNnH7us2MhL2A+hAudLUeQIH
 TUJpBtf6F5kFmDgVCquFL1kHxLIbuYl8O5qfryQoU8QQkaChKeLCq0sorcyqyiIO/s7B
 denLwqfZvjBSy2+8ZCgeR7EUfq9m7Y9ZUz24Zy+WD5B9JwG8L1liIvQQ6dHRm4s4ahlG
 /fLspqEgpo0/nldHZipYDOkBF5MaVpBywFkrC1TcBdWZz4IPpQ14BOGkVnVzXGJf1vp3
 aDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ehl9413qGXjDWpnNjI7NhUKg/rQKrWFNJkh18zEG+go=;
 b=KtBuKgj/quVcAFJyP23raQgGEZqEExjBVaFDIGGCjF9/DAUIZpQBH7WuBGFQJzXCLT
 hBfGTXBMUChmyG/gJZ9mtY2M7dw/p4z4mWkp3GSyjOpFXjNFt7PDr3QXMA1dcX9u+k8l
 D3meh9lOcqBB6gEZUM+CaUB14b+owZaqEkdfTyUZvt7uKQlbcAaDsnJZFwOX/UK7tMkQ
 UjATlzL3cK1vjdqLYOXy+K7a9Rqyn3n9vzxFcQ+lTDXbjJFIPpWr0xKUEhe+8tEMkqrB
 osxXpef8agEDHosUnTkpRiEMFMYfZZWhutOxsdl70/ts6FpFwILOsukUcAUibTCBxhOG
 oTbA==
X-Gm-Message-State: AOAM531Mp5QzdKq7un0qvI0OKu3X+hf9pT/wR1ZDGsD3GZmOSbXZ6gga
 6W/B7woZh5l0QS/mUr9Fopkqfw==
X-Google-Smtp-Source: ABdhPJyh1g1ibfPckIg1BKcChmhCPbtGK8rfaON3zuuf1nJ7nadh1e0IbcY7pstbSR+jaoCQNEFJzQ==
X-Received: by 2002:adf:ab44:: with SMTP id r4mr12128585wrc.261.1590496147105; 
 Tue, 26 May 2020 05:29:07 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id a10sm21390584wmf.46.2020.05.26.05.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:29:06 -0700 (PDT)
Subject: Re: [PATCH 20/27] drm: bridge: dw-hdmi: Store current connector in
 struct dw_hdmi
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-21-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <27347c93-f9dd-ab08-6183-2c249b70a503@baylibre.com>
Date: Tue, 26 May 2020 14:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-21-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:14, Laurent Pinchart wrote:
> Store the connector that the bridge is currently wired to in the dw_hdmi
> structure. This is currently identical to the connector field, but will
> differ once the driver supports disabling connector creation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 35d38b644912..16bffedb4715 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -181,6 +181,7 @@ struct dw_hdmi {
>  
>  	struct mutex mutex;		/* for state below and previous_mode */
>  	enum drm_connector_force force;	/* mutex-protected force state */
> +	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */

Nit: The comment position is not great, but I don't see other ways except adding a tab and removing "(only valid when !disabled)"

>  	bool disabled;			/* DRM has disabled our bridge */
>  	bool bridge_is_on;		/* indicates the bridge is on */
>  	bool rxsense;			/* rxsense state */
> @@ -2823,23 +2824,32 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>  	mutex_unlock(&hdmi->mutex);
>  }
>  
> -static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
> +static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_state)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
>  	mutex_lock(&hdmi->mutex);
>  	hdmi->disabled = true;
> +	hdmi->curr_conn = NULL;
>  	dw_hdmi_update_power(hdmi);
>  	dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
>  }
>  
> -static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
> +static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_state)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> +	struct drm_atomic_state *state = old_state->base.state;
> +	struct drm_connector *connector;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
>  
>  	mutex_lock(&hdmi->mutex);
>  	hdmi->disabled = false;
> +	hdmi->curr_conn = connector;
>  	dw_hdmi_update_power(hdmi);
>  	dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
> @@ -2854,8 +2864,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.atomic_check = dw_hdmi_bridge_atomic_check,
>  	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
>  	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
> -	.enable = dw_hdmi_bridge_enable,
> -	.disable = dw_hdmi_bridge_disable,
> +	.atomic_enable = dw_hdmi_bridge_atomic_enable,
> +	.atomic_disable = dw_hdmi_bridge_atomic_disable,
>  	.mode_set = dw_hdmi_bridge_mode_set,
>  	.mode_valid = dw_hdmi_bridge_mode_valid,
>  };
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
