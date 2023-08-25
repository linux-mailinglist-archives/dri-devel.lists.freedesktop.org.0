Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BAE78805E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB19110E60F;
	Fri, 25 Aug 2023 06:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853C610E60F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:54:47 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a7ca8720a0so421758b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692946486; x=1693551286;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+wfU7rcmtDqrcxr6nhcrRO0qzXdlsPqLRPQmwwtX6I=;
 b=PMGBctVxc8dZ61UElRNDB6aoT3h796vpSF5/nOVI1EgQwxJBsOKm3rdCsz2TpQ5lQ6
 uVQkkSDMfqdeuF7bR9WjCCXCw7X0vlLdh4HsYt670qkpWzQWn9e48u+jnnOwm3DlGa3s
 wtkwhjtrko0206ZtmjnhOZsVXh2JeS70yA+LvjiGGX0HPqX53sQtnYPd+/D+Nbc1QDhE
 SgsY8+KMOtAwidxhvgdNoEv9ElU8IArFGHCsqnUj0Yh1FboqVoBl1urI3zJILdc7OLic
 c59dGV3XK+7ga0oH3+lbqn1pQDAGpG8ttrMva3bi6vR/ZSJt/e4IMSidKYt5HF4E9Z3I
 GkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692946486; x=1693551286;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V+wfU7rcmtDqrcxr6nhcrRO0qzXdlsPqLRPQmwwtX6I=;
 b=UGxJxiqTT7QB7pWHNc21BDvKheYAkTVORUu7Y008y0MIN6S474ODBEPm5QhpVgDezl
 4WBq99ps7knnUSHQxBngvSLizeXgZNmKB1jVgZK0x9M7inC1YI/kNQp8xqJfV14SoMRF
 0fM0+388rFwoftXl06xzf9YjhmAfuUcMlouM8igju+yjIHZqLVpMSlp7+7jQzg9LTyXu
 rrYgZy/0Izghjkb6ZvLI6rvHmQzWmGysbe//usAhE4WT2Hlztwi8CSx4cOPaekkVcWMU
 beW4Tk/T13uKCIFTRTyHEkHojBv+gVylWJ0Pb6/LmQxxvRo9mbYitquA2P+r1L5OmnfS
 ajqg==
X-Gm-Message-State: AOJu0Ywuz+H01eRBnpdGrMOmF6CDmJ/uont+ap47t99s8sIbnHOkY4e9
 3NmHShyrZSXoD14vf0r20P8=
X-Google-Smtp-Source: AGHT+IFJzwHB103sNBf6VA/lRBPog7nQICWSaWy65FJSUaKpYcWFmWfpNSkAS/O5RwesHVvhtvJEUA==
X-Received: by 2002:a05:6808:210e:b0:3a8:6693:135d with SMTP id
 r14-20020a056808210e00b003a86693135dmr2388427oiw.49.1692946486571; 
 Thu, 24 Aug 2023 23:54:46 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b00688c733fe92sm791281pfm.215.2023.08.24.23.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 23:54:46 -0700 (PDT)
Date: Fri, 25 Aug 2023 08:54:41 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/gma500: Remove unused declarations
Message-ID: <zbnr5t7buu5cbfcbadp3mmvghefffftfdqxe6qey2kv3sseiim@3cayanitq6z7>
Mail-Followup-To: Yue Haibing <yuehaibing@huawei.com>, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20230817133754.36524-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817133754.36524-1-yuehaibing@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 09:37:54PM +0800, Yue Haibing wrote:
> These declarations are not implemented now, remove them.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/gma_display.h   |  1 -
>  drivers/gpu/drm/gma500/psb_intel_drv.h | 14 --------------
>  2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/gma_display.h b/drivers/gpu/drm/gma500/gma_display.h
> index c8b611a2f6c6..1188a8d61caf 100644
> --- a/drivers/gpu/drm/gma500/gma_display.h
> +++ b/drivers/gpu/drm/gma500/gma_display.h
> @@ -81,7 +81,6 @@ extern void gma_encoder_destroy(struct drm_encoder *encoder);
>  
>  /* Common clock related functions */
>  extern const struct gma_limit_t *gma_limit(struct drm_crtc *crtc, int refclk);
> -extern void gma_clock(int refclk, struct gma_clock_t *clock);
>  extern bool gma_pll_is_valid(struct drm_crtc *crtc,
>  			     const struct gma_limit_t *limit,
>  			     struct gma_clock_t *clock);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
> index 0bb85494e3da..c111e933e1ed 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -186,19 +186,13 @@ extern bool psb_intel_ddc_probe(struct i2c_adapter *adapter);
>  
>  extern void psb_intel_crtc_init(struct drm_device *dev, int pipe,
>  			    struct psb_intel_mode_device *mode_dev);
> -extern void psb_intel_crt_init(struct drm_device *dev);
>  extern bool psb_intel_sdvo_init(struct drm_device *dev, int output_device);
> -extern void psb_intel_dvo_init(struct drm_device *dev);
> -extern void psb_intel_tv_init(struct drm_device *dev);
>  extern void psb_intel_lvds_init(struct drm_device *dev,
>  			    struct psb_intel_mode_device *mode_dev);
>  extern void psb_intel_lvds_set_brightness(struct drm_device *dev, int level);
>  extern void oaktrail_lvds_init(struct drm_device *dev,
>  			   struct psb_intel_mode_device *mode_dev);
> -extern void oaktrail_wait_for_INTR_PKT_SENT(struct drm_device *dev);
>  struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev);
> -extern void mid_dsi_init(struct drm_device *dev,
> -		    struct psb_intel_mode_device *mode_dev, int dsi_num);
>  
>  extern struct drm_encoder *gma_best_encoder(struct drm_connector *connector);
>  extern void gma_connector_attach_encoder(struct gma_connector *connector,
> @@ -214,11 +208,6 @@ extern struct drm_display_mode *psb_intel_crtc_mode_get(struct drm_device *dev,
>  						    struct drm_crtc *crtc);
>  extern struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev,
>  						 int pipe);
> -extern struct drm_connector *psb_intel_sdvo_find(struct drm_device *dev,
> -					     int sdvoB);
> -extern int intelfb_probe(struct drm_device *dev);
> -extern int intelfb_remove(struct drm_device *dev,
> -			  struct drm_framebuffer *fb);
>  extern bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
>  				      const struct drm_display_mode *mode,
>  				      struct drm_display_mode *adjusted_mode);
> @@ -242,9 +231,6 @@ extern void cdv_intel_dp_set_m_n(struct drm_crtc *crtc,
>  					struct drm_display_mode *mode,
>  					struct drm_display_mode *adjusted_mode);
>  
> -extern void psb_intel_attach_force_audio_property(struct drm_connector *connector);
> -extern void psb_intel_attach_broadcast_rgb_property(struct drm_connector *connector);
> -
>  extern int cdv_sb_read(struct drm_device *dev, u32 reg, u32 *val);
>  extern int cdv_sb_write(struct drm_device *dev, u32 reg, u32 val);
>  extern void cdv_sb_reset(struct drm_device *dev);
> -- 
> 2.34.1
> 
