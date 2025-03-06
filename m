Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187BA54041
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 03:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8EE10E8B3;
	Thu,  6 Mar 2025 02:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LD2ZXo1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBFB10E8B3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 02:06:28 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5495c63bdc0so168638e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741226786; x=1741831586; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oxbxNY786YrsKRIbDHKdRfexTZ85j7EEsRpteNUREfI=;
 b=LD2ZXo1GlPchtWOX+l2C9/bxRbWwseO1LskZx/X3Aux/0kGYnOukpp2NYaGP5UcmPh
 JAKB4xSy7Gl1D8eQsqfXRa7CBiW/d6F7FWeDv/LgyB2cj2qjZlYisuVJE/DS0yOT34k1
 OCJ8dB3jvp6RjgHbK+jDXe8oooxS9HhBR4tNaQeVLPmC8Tic0RYhd209yriQmJl4X+hw
 08KcVddGOwpE7cw5bAj0YyRmMB5YkUGK/TzMs2eXNRdwFq9uYtSN8/3aLIez7oYAYqF7
 67Th+NhP6sywAODXIkhKU+N97l9BBPLFOifbB7t5VxUpgKldn/R2x4DLxdJl1pCq6oa5
 Cg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741226786; x=1741831586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxbxNY786YrsKRIbDHKdRfexTZ85j7EEsRpteNUREfI=;
 b=PdYb6ryYBdXH0mF1XTwjqIETQSQo+qkdJB93ap+/GAFsMoBmvu6S9bP0q3Ntc9Gb8m
 poZsD5KnoP0ZjtUyEcTEIO5qHHIf1pah1fzd43BHR/oUJkmFsiQulcXT8dvy8mAP3/PM
 CB81h9/0/UeVnnkGWJgg+EAZU5LMASVwEB9NSVUao2Q270XOLO0KB5i4VemmKhjbgseu
 e6NsReQrmUyZbq63WOPxljYooLclQjheDxX70gjl2BguW1mDfMycYufDihPQXVWPK6hM
 KoWBtnpwWXfMZKNLXso2ia5gy56OR82MWv2fKfqfDg1VIIn3/EwJ8oqg5gx3sVM6z4bH
 sWYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLxV+X1pATGfSYXKze1iOGIdiZ9NffXbHfmnGkXsmIo+o6EOHq6KVzdijFCJLWrzE7IAUy/Xsq6so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0FTVTxuNkFKdN6nkodUOqn7hpzweUOfg9CG3hzh7GKtIvNc64
 YLrmBO13QcwdZDUeWbi6C2TcjloiKclQ5uJ4CbKVDOPlteboGmKheaB19nhsoTA=
X-Gm-Gg: ASbGncuw/zSO3TQroaqwqKjXqJ97urYSWrHLos2D0hVs0HXgT54u5FadqiC/EnC9or/
 haXY6PfhqAdliUJKxu5A+CV2mWx8IOVUYk0ObTDYYoQvllZNyZ4SLtvgBGQHAsJcW1imENk0h7K
 hNhaPq7+/r+jDf6fETT0Mz2qBYRmz/4qzz17chpD1wYkm5FFsO8LsU2jvDJKPXC3xdNbLQa4HUO
 vgSH6CT5ozYMmpzv1j3k92J+Clo0bqM5arIlJPUhur6IiAx9l/7glhsKYoo9btp45p9+r/yvpY3
 yDebKkk1q/GbKdsb+i7kCEb7nNiX1Oa+s9awX5tslGMZxl9uk7PWLapIG8++OE46kJFIf8UvA32
 funMPeI6SySpngUNYhD1yPb5o
X-Google-Smtp-Source: AGHT+IHWHRcySCxYc1B0y6PhF0rI3/lSPzlG5f7R9rUTKQMeZ07z2qQaZyArRoFRqnnRWxqa+VOdOg==
X-Received: by 2002:a05:6512:1386:b0:545:81b:1510 with SMTP id
 2adb3069b0e04-5497d32f4ffmr1641136e87.2.1741226786379; 
 Wed, 05 Mar 2025 18:06:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bcf30sm27665e87.115.2025.03.05.18.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 18:06:24 -0800 (PST)
Date: Thu, 6 Mar 2025 04:06:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
Message-ID: <sbimsyq2xrcxpp2ha2vequtwfl5bss7clw2snkqsbgitosnkub@it35hzscp3jc>
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
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

On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi
> variants if available. Use mipi_dsi_msleep()
> and mipi_dsi_usleep_range() instead of msleep()
> and usleep_range() respectively.
> 
> Used Coccinelle to find the multiple occurences.
> SmPl patch:
> @rule@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_device *dsi_var = dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> (
> -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> |
> -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> |
> -mipi_dsi_generic_write(dsi_var,es)@p;
> +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_nop(dsi_var)@p;
> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> |
> ....rest of API
> ..
> )
> -if(r < 0) {
> -...
> -}
> ...+>
> 
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Previous attempt for this change was addressed in:[1]
> The series did not handle returns properly and still
> used msleep() and usleep_range() API.
> It also collided with an Tejas's similar efforts.
> 
> Will be sending the patches per driver instead of
> major haul of changes.
> 
> Following [2] for reference.
> 
> [1] -> https://patchwork.freedesktop.org/series/144824/
> [2] -> https://lore.kernel.org/dri-devel/20250220045721.145905-1-tejasvipin76@gmail.com/#iZ31drivers:gpu:drm:panel:panel-sony-td4353-jdi.c
> ---
>  drivers/gpu/drm/panel/panel-synaptics-r63353.c | 64 +++++++-------------------
>  1 file changed, 17 insertions(+), 47 deletions(-)
> 
>  
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display ON (%d)\n", ret);
> -		goto fail;
> -	}
> -
> -	return 0;
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>  
> -fail:
> -	gpiod_set_value(rpanel->reset_gpio, 0);
> +	return dsi_ctx.accum_err;

You've lost panel reset in case of an error. The rest LGTM.

>  
> -	return ret;
>  }
>  
>  static int r63353_panel_prepare(struct drm_panel *panel)

-- 
With best wishes
Dmitry
