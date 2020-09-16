Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F526C02A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 11:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91826E9DE;
	Wed, 16 Sep 2020 09:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D5A6E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:08:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e11so1771195wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=43PplyDWmyM1euT7cjqAWkDLVDd8oJ/fGhn/0wfamYo=;
 b=cnnMIeyCfgis85vOOyPEKsO/uAUor1vphiEYzVwyXT6tBp9G0aOwwnz7gNx8WMpxch
 sTVcYkH+X34XDZ5DiBLLz2vitvkXC8360UHqeKiSjqNW1fEFllMaeZAp0tdJeNfEc6z/
 8Pri/Xq4rd6YAUQmfsokE0LtfqTQglnKYdxic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=43PplyDWmyM1euT7cjqAWkDLVDd8oJ/fGhn/0wfamYo=;
 b=nkiibP2QSbOtBJbe+ZDnzlV9s92YYXRGsY1D4qXgcGzd/0OBaVL7ldoIYb4ttRh7/t
 eC3m9t47B21+KUdiEAbFQrSs46Ok/T/DWkWArKYXuM7umpPwZzmuHh7DOW+e/jIxzc+t
 xBd/QO9N7bWvrfC71nXpxC6psgQ/CqZP9kxc3v1k+TCzqieJhPZUdfpkO3xRWjYVnz57
 TmjWTgbgN4jWTwkQazAjsrd10TOJyPk73auqw4oaGYHi+f/s4565hsfOCcH7rZpSI+j+
 gTSc6r1djNXNy5izHgovvMOp5F/WwEePmJYi/8rC3Dxe46UGY964g8sy/NQDO+JcpJ8p
 fZxw==
X-Gm-Message-State: AOAM531Xq5tngvHmHLhjbOAcSmAfSRuAMWhvRfDKCf+UeE14dpwM5/nK
 XtO9U16G0zDEFKyMoqXiRn7PzlQEKbzvQrVe
X-Google-Smtp-Source: ABdhPJwihiVP+D2Key59NKkXXECuBmADgSSmpJn0R0zN5mWmKm+Yj1jDhj2D+ZyibwNgmQaTAICjGg==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr3563919wmg.174.1600247305831; 
 Wed, 16 Sep 2020 02:08:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n3sm4058973wmn.39.2020.09.16.02.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:08:25 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:08:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 5/7] drm/imx: use drmm_simple_encoder_alloc()
Message-ID: <20200916090823.GX438822@phenom.ffwll.local>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-5-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135724.25833-5-p.zabel@pengutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 03:57:22PM +0200, Philipp Zabel wrote:
> This allows to drop the custom drm_encoder_cleanup() actions.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> New in v3, example conversion of drm_simple_encoder_init() users.
> 
> This and the following patches depend on the drm/imx conversion to use managed
> resources [1].
> 
> [1] https://lore.kernel.org/dri-devel/20200911133855.29801-3-p.zabel@pengutronix.de/T/#m335a28c5c26ab14bccc998d4dc0aed6850e9bc36
> ---
>  drivers/gpu/drm/imx/dw_hdmi-imx.c      | 19 ++++---------------
>  drivers/gpu/drm/imx/imx-ldb.c          | 20 ++++----------------
>  drivers/gpu/drm/imx/imx-tve.c          | 22 ++++------------------
>  drivers/gpu/drm/imx/parallel-display.c | 22 ++++------------------
>  4 files changed, 16 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index 16be8bd92653..87428fb23d9f 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -188,13 +188,6 @@ static const struct of_device_id dw_hdmi_imx_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_imx_dt_ids);
>  
> -static void dw_hdmi_imx_encoder_cleanup(struct drm_device *drm, void *data)
> -{
> -	struct drm_encoder *encoder = data;
> -
> -	drm_encoder_cleanup(encoder);
> -}
> -
>  static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
>  			    void *data)
>  {
> @@ -203,9 +196,10 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
>  	struct drm_encoder *encoder;
>  	int ret;
>  
> -	hdmi_encoder = drmm_kzalloc(drm, sizeof(*hdmi_encoder), GFP_KERNEL);

Where does this apply to? Neither upstream nor linux-next seems to have
the drmm_ conversion for imx already applied, and that's kinda the juicy
part I'd like to look at a bit. The patches here are just mechanical
conversion. Can you pls include the drmm_ conversion too (maybe even
squash these patches here in, I think that would be more readable)?

Or am I looking at the wrong tree?

Anyway I think it looks all neat.
-Daniel

> -	if (!hdmi_encoder)
> -		return -ENOMEM;
> +	hdmi_encoder = drmm_simple_encoder_alloc(drm, struct imx_hdmi_encoder,
> +						 encoder, DRM_MODE_ENCODER_TMDS);
> +	if (IS_ERR(hdmi_encoder))
> +		return PTR_ERR(hdmi_encoder);
>  
>  	hdmi_encoder->hdmi = dev_get_drvdata(dev);
>  	encoder = &hdmi_encoder->encoder;
> @@ -215,11 +209,6 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
>  		return ret;
>  
>  	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
> -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> -
> -	ret = drmm_add_action_or_reset(drm, dw_hdmi_imx_encoder_cleanup, encoder);
> -	if (ret)
> -		return ret;
>  
>  	return drm_bridge_attach(encoder, hdmi_encoder->hdmi->bridge, NULL, 0);
>  }
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index d4beb58f509d..dbfe39e2f7f6 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -414,13 +414,6 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
>  	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
>  }
>  
> -static void imx_ldb_encoder_cleanup(struct drm_device *drm, void *data)
> -{
> -	struct drm_encoder *encoder = data;
> -
> -	drm_encoder_cleanup(encoder);
> -}
> -
>  static int imx_ldb_register(struct drm_device *drm,
>  	struct imx_ldb_channel *imx_ldb_ch)
>  {
> @@ -430,20 +423,15 @@ static int imx_ldb_register(struct drm_device *drm,
>  	struct drm_encoder *encoder;
>  	int ret;
>  
> -	ldb_encoder = drmm_kzalloc(drm, sizeof(*ldb_encoder), GFP_KERNEL);
> -	if (!ldb_encoder)
> -		return -ENOMEM;
> +	ldb_encoder = drmm_simple_encoder_alloc(drm, struct imx_ldb_encoder,
> +						encoder, DRM_MODE_ENCODER_LVDS);
> +	if (IS_ERR(ldb_encoder))
> +		return PTR_ERR(ldb_encoder);
>  
>  	ldb_encoder->channel = imx_ldb_ch;
>  	connector = &ldb_encoder->connector;
>  	encoder = &ldb_encoder->encoder;
>  
> -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
> -
> -	ret = drmm_add_action_or_reset(drm, imx_ldb_encoder_cleanup, encoder);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
> index bac025eafa1f..0746f0b425df 100644
> --- a/drivers/gpu/drm/imx/imx-tve.c
> +++ b/drivers/gpu/drm/imx/imx-tve.c
> @@ -433,13 +433,6 @@ static int tve_clk_init(struct imx_tve *tve, void __iomem *base)
>  	return 0;
>  }
>  
> -static void imx_tve_encoder_cleanup(struct drm_device *drm, void *ptr)
> -{
> -	struct drm_encoder *encoder = ptr;
> -
> -	drm_encoder_cleanup(encoder);
> -}
> -
>  static void imx_tve_disable_regulator(void *data)
>  {
>  	struct imx_tve *tve = data;
> @@ -498,22 +491,15 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
>  	encoder_type = tve->mode == TVE_MODE_VGA ?
>  		       DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
>  
> -	tvee = drmm_kzalloc(drm, sizeof(*tvee), GFP_KERNEL);
> -	if (!tvee)
> -		return -ENOMEM;
> +	tvee = drmm_simple_encoder_alloc(drm, struct imx_tve_encoder, encoder,
> +					 encoder_type);
> +	if (IS_ERR(tvee))
> +		return PTR_ERR(tvee);
>  
>  	tvee->tve = tve;
>  	encoder = &tvee->encoder;
>  	connector = &tvee->connector;
>  
> -	ret = drm_simple_encoder_init(drm, encoder, encoder_type);
> -	if (ret)
> -		return ret;
> -
> -	ret = drmm_add_action_or_reset(drm, imx_tve_encoder_cleanup, encoder);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 50b5b89c2db2..9b1ec7e73c30 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -258,13 +258,6 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
>  	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
>  };
>  
> -static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
> -{
> -	struct drm_encoder *encoder = ptr;
> -
> -	drm_encoder_cleanup(encoder);
> -}
> -
>  static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct drm_device *drm = data;
> @@ -275,23 +268,16 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_bridge *bridge;
>  	int ret;
>  
> -	imxpd_encoder = drmm_kzalloc(drm, sizeof(*imxpd_encoder), GFP_KERNEL);
> -	if (!imxpd_encoder)
> -		return -ENOMEM;
> +	imxpd_encoder = drmm_simple_encoder_alloc(drm, struct imx_parallel_display_encoder,
> +						  encoder, DRM_MODE_ENCODER_NONE);
> +	if (IS_ERR(imxpd_encoder))
> +		return PTR_ERR(imxpd_encoder);
>  
>  	imxpd_encoder->pd = imxpd;
>  	connector = &imxpd_encoder->connector;
>  	encoder = &imxpd_encoder->encoder;
>  	bridge = &imxpd_encoder->bridge;
>  
> -	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> -	if (ret)
> -		return ret;
> -
> -	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
>  	if (ret)
>  		return ret;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
