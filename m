Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5026FD8C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4C36ECED;
	Fri, 18 Sep 2020 12:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733436ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:51:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a17so5500006wrn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=LdqUwNGuUoOZQN1Vrg5rTKgqe2Vlz3PCWzH7mZwiHkg=;
 b=VbIfCOkIPLpuuLEj3Czk6IQzde0+eqXqXF72Xa+y6PnfBTjb0prJZ3ApY6Wkqganxr
 zm4vGX2vlar5ZHzsZX9tk+LbhMdOefJ/z3Nk4KvgAq/JpBGWqwSrkZnO6I2RM28UfZUZ
 e26MMcvMpiieFDnfLYqY+aKuqxczdsAON1Gwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=LdqUwNGuUoOZQN1Vrg5rTKgqe2Vlz3PCWzH7mZwiHkg=;
 b=IIgfntwgEnylErY0ofO/xxYWpY93Lar2SvSjPY+97kcNaXXF0l8DpZyo2INea4i01Z
 CPJYa/ooPBtUQW4CY1T7XU0n2mfcRm4VRHA99rVNGyyGeH9unyfkVltd5/SDko7n4IPD
 sH0aaq3f2nrNKhOYx9tlwVQjh98Nb/CfF6YjhcDq+929YEM0AtM57KNz8zcjfUoXWnBx
 cwkvOImSaAqQxGa5+RZK1Wa8pwheK/UIoBj7gUoXOuHOVsZej451+UG5EDtM6uRGeFj1
 AgeEPE+9eQyoSMurtkCLEyaEeHqPQYNRE1w6scwogME8ThsVVFnZJ9Wi8sUS2OImg/EZ
 MC6A==
X-Gm-Message-State: AOAM530EKKqih2xJuwFeLqVAE78beiX1tODGzFo7rIDaV9OE8Q+0P/r8
 V+K3iDMLJthd5vBnxsMViAqIyQ==
X-Google-Smtp-Source: ABdhPJx/gY7W2/o0UKhvbfl13oUVULn2OYRrEJfQ7Obt1b0wGNHyDYhr7uARtrZSm+O1qJSvt3pukw==
X-Received: by 2002:a5d:6cb1:: with SMTP id a17mr34096968wra.386.1600433509088; 
 Fri, 18 Sep 2020 05:51:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o4sm4935851wrv.86.2020.09.18.05.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:51:48 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:51:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/panel: otm8009a: remove hack to force commands in HS
Message-ID: <20200918125146.GF438822@phenom.ffwll.local>
Mail-Followup-To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Antonio Borneo <antonio.borneo@st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200918114718.11106-1-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918114718.11106-1-yannick.fertre@st.com>
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
Cc: Antonio Borneo <antonio.borneo@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 01:47:18PM +0200, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> The panel is able to receive commands in LP. The current hack to
> force backlight commands in HS was due to workaround an incorrect
> settings on DSI controller that prevents sending LP commands while
> video out was active.
> 
> Remove the hack that forces HS commands.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>

This and the next are missing your s-o-b line. Also you've done a bunch of
gpu patches arlready, want drm-misc commit rights so you can make sure
they all do land?

https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

There's tons more docs about how the tooling and process works.

Cheers, Daniel

> ---
>  .../gpu/drm/panel/panel-orisetech-otm8009a.c   | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index 6ac1accade80..f80b44a8a700 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -99,20 +99,6 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
>  		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
>  }
>  
> -static void otm8009a_dcs_write_buf_hs(struct otm8009a *ctx, const void *data,
> -				      size_t len)
> -{
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -
> -	/* data will be sent in dsi hs mode (ie. no lpm) */
> -	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -
> -	otm8009a_dcs_write_buf(ctx, data, len);
> -
> -	/* restore back the dsi lpm mode */
> -	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> -}
> -
>  #define dcs_write_seq(ctx, seq...)			\
>  ({							\
>  	static const u8 d[] = { seq };			\
> @@ -400,7 +386,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
>  		 */
>  		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
>  		data[1] = bd->props.brightness;
> -		otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
> +		otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
>  
>  		/* set Brightness Control & Backlight on */
>  		data[1] = 0x24;
> @@ -412,7 +398,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
>  
>  	/* Update Brightness Control & Backlight */
>  	data[0] = MIPI_DCS_WRITE_CONTROL_DISPLAY;
> -	otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
> +	otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
