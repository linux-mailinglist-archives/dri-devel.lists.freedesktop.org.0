Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66923BE74
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 18:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F96E492;
	Tue,  4 Aug 2020 16:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C76E492
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:59:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 88so38055829wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u311Hp3+FlIAdoQ7563W+xB0F3aPlrRzNQAAkWiq5SE=;
 b=IYUwOKuqDXfK/LXpbdKziS2GW8qozZCWUqYGRpbeA8isv2eUogsOvWHBrE+rWkX7Lj
 XQ4WJp2XulKy54aiGL1DDaz9YWz64/7pS4bYPdTBUbr6GIQkl8E4Olzgl7MeGEQCRIJs
 a9Y1ymWhbDMCX5fEbhusOCQ5s5WLYL/kvRf8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u311Hp3+FlIAdoQ7563W+xB0F3aPlrRzNQAAkWiq5SE=;
 b=EZICSY5Kv4C6Mpv4qP1KgQaYR49atmqqDSK3AfCwA11c7Qlo2+rXVD39yNzQAYqtUC
 ulk6u6tIDOqRLGS074IqTLjbSUacNl5JvktCGbhC0HG8WZ/YBYj8wvarJ1/l58JoxMrx
 Ht8VN1R6jIE0s4vwzcngLrdVMSHEelMQvcqCfTLR2LIYntZP208uacoqVim9SLTy6jR8
 pp3JlbVY/jyXcz+Zv70eTzWnQzyp+e6Ewi1fXlCXmkrnjggqzNJSnx/bzRFi4bsFKEAk
 FBBTP3shpyd63Gb/JK/GcPMnNc9AMJUMldkk8TRyU6ET7TDPqrDZSqYCh9kNkAsDqLip
 Pr9Q==
X-Gm-Message-State: AOAM530ROEyTLBMsY9p5u+oQcsU01QEm3yFEAPVSw9uhmTFFpPU11XeL
 b/8tg9hpvzN5GanOYKuvhQdb+w==
X-Google-Smtp-Source: ABdhPJzOXEh1JsSwgAaxZ3ww4H+xbQK9fmNHtPEe0UAXJTrLNIupDUPs8uUY8OgSp0UXRLktrRHZdQ==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr3304183wro.307.1596560360706; 
 Tue, 04 Aug 2020 09:59:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p3sm5004407wma.44.2020.08.04.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 09:59:20 -0700 (PDT)
Date: Tue, 4 Aug 2020 18:59:18 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 06/22] drm/panel: asus-z00t-tm5p5-n35596: Backlight
 update
Message-ID: <20200804165918.GN6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-7-sam@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Konrad Dybcio <konradybcio@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 02, 2020 at 01:06:20PM +0200, Sam Ravnborg wrote:
> Update backlight to use macro for initialization and the
> backlight_get_brightness() operation to simply the update operation.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Konrad Dybcio <konradybcio@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index 39e0f0373f3c..c090fc6f1ed5 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -216,14 +216,9 @@ static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
>  static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> -	u16 brightness = bl->props.brightness;
> +	int brightness = backlight_get_brightness(bl);
>  	int ret;
>  
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness = 0;
> -
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
>  	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> @@ -238,7 +233,7 @@ static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
>  static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> -	u16 brightness = bl->props.brightness;
> +	u16 brightness = backlight_get_brightness(bl);

I'm not sure why we do this, but your patch here changes behaviour in a
way that has bitten us in the past: This now reports a brightness of 0
when the backlight is off. On some backlights (especially firmware ones) 0
means "lowest value", not actually off, so that's one confusion. The other
problem is then that userspace tends to use this as the backlight value to
restore on next boot (or after resume, or after vt switch, resulting in a
very dark or black screen).

Therefore I think in these cases we actually need the direct
bl->props.brightness value.

I think an even cleaner way to solve this would be to change the
get_brightness code in actual_brightness_show to handle negative error
codes from ->get_brightness and use that to fall back to
bd->props.brightness, then we could remove this code here.

That reminds me, probably not a good idea to store a negative value in
backlight_force_update() if this goes wrong into bl->props.brightness.
-Daniel

>  	int ret;
>  
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> @@ -261,11 +256,7 @@ static struct backlight_device *
>  tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)
>  {
>  	struct device *dev = &dsi->dev;
> -	const struct backlight_properties props = {
> -		.type = BACKLIGHT_RAW,
> -		.brightness = 255,
> -		.max_brightness = 255,
> -	};
> +	DECLARE_BACKLIGHT_INIT_RAW(props, 255, 255);
>  
>  	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>  					      &tm5p5_nt35596_bl_ops, &props);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
