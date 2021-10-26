Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840343A9A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 03:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2596E1CF;
	Tue, 26 Oct 2021 01:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0026E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 01:13:20 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z24so12050717qtv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zoFDos6hqsoqPNE3Ubon2jXwfOR6C/kTOnroswa4np0=;
 b=YD76ZQyDKFx2VikMwfx6Wtm4xSipBCQMd/DLWlpZ4zQmxA5Ud/s31RJ4FSUZA77SF5
 8VKmNmiXVI1JNvMACnCbxkuTr3kiesrznZiUIdy7f1/20He1Z4WdGTHmqmfkiJdU0eeu
 77YLxMrXZ0o4r2X158iw2180hPelIRw6n/OGcKFzn/B0ClULewryvg3Qvv/TqQ0V8hnT
 FzIbYZrouWQ+nxIHHd/mw6/h/P9Y1JrLkUnzTGWA/8NQLM9GzXcHrwY/UUs18ChJIF3Y
 PpIfbNQsnbCuVZuSDrfrnt+5d7Eaxjb/cd0XvPKX5ckVFvzboFMgdYvyDa7JsW6NmiyY
 hoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zoFDos6hqsoqPNE3Ubon2jXwfOR6C/kTOnroswa4np0=;
 b=G9E5ibzfGX+TxeDvD6wMnaBAjJWe3XnkkQ2O2h5u+T83i7ncrCvaU4pn04mqyYCAQD
 Bf58UJuoeYeLfEZfvCXUrbkIbJ1lHckSCexgMipRx3JTr7QK+iaVrt2v68ovgQUQbLzi
 0cdbxzmevPS2hCIHmLs7F1xyugOq7fcyZmY6mXaywDWISKN3ItGYA0piZ3g3eFG47j/r
 GRH0+L1H5B94SXYB3NFUbB/7oPDBQIyLFX/ES3cvkTrovTHS1BNG2p7ebTdO/2xU6nFS
 OANfB2Z2FtvIXWZEahBtOu4MLIpRkPFNlDAebixwrq2ATmncARnC07YIiDAvr3qrS6wm
 s4yA==
X-Gm-Message-State: AOAM532f3XZsdel/eVFjxHQ3sjsWW2xJREXTYZIoN47oyZ0PJqsXGNCe
 KZRo5Oorj5md6F7BAgD11x69jA==
X-Google-Smtp-Source: ABdhPJwZ4eKoLPCDqP0AOPkjcIy0mJFLBRYWPbATnTT744Z29KzjLAreryt+LTa8sHr0LQ9cUbLj4w==
X-Received: by 2002:a05:622a:13:: with SMTP id
 x19mr21230249qtw.83.1635210799496; 
 Mon, 25 Oct 2021 18:13:19 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bj26sm10232892qkb.127.2021.10.25.18.13.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Oct 2021 18:13:19 -0700 (PDT)
Date: Mon, 25 Oct 2021 21:13:18 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: linux-mediatek@lists.infradead.org, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
Message-ID: <20211026011318.GF2515@art_vandelay>
References: <20211022172413.195559-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022172413.195559-1-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Creating the prop uses UNKNOWN as the initial value, which is not a
> supported value if the props is to be supported.
> 
> [How]
> Set the panel orientation default value to NORMAL right after creating
> the prop.

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> 
> Tested on Jacuzzi(MTK)
> Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0ad7157660afa..b7c2528a8f41c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		DRM_ERROR("Unable to init panel orientation\n");
>  		goto err_cleanup_encoder;
>  	}
> +	drm_connector_set_panel_orientation(dsi->connector,
> +					    DRM_MODE_PANEL_ORIENTATION_NORMAL);
>  
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
