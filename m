Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B131B7293
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 13:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04D6E466;
	Fri, 24 Apr 2020 11:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A056E466
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 11:02:46 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id i5so9006277uaq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEQC+zc6DWadDrh+ZHzHbWKwoF6aqL0hIqOxLyw9TN4=;
 b=ZDvl6CexW9fr1PbbL25d535OAPCYxO6vtZW8yb8cFa320y0xvW9nIsS4c7zd1NneSU
 aICxZkyFjDhuvRoxmverJSmKpl5PSdJ/n/X+hibs462m8q5C0TlGaw7b5F525uF3aOtx
 5jWoKFvuOjy97HTuPJK+w/vLGwDEhc69m24Wzr+KobWn9BrUd0wEV7PJldo4TieQfcsr
 xjACtTZIaiBVLtcLsRIDw5HVXY8i9L9Af5MzfiK2UVifTOIxMrtSIJmyOiUPHWtbVaQX
 +KAgXCA3PP1uLJeypXU6efRjwOl/NeCFVNBCi4S4UD11vhW/feKCYa6ayHwE+xHwYVQS
 gAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEQC+zc6DWadDrh+ZHzHbWKwoF6aqL0hIqOxLyw9TN4=;
 b=suFt3geQqeDAckoDff5o8jgyMJy6dqckZ9Wd/oUZiUHNoXpohLhVZVn0sjLox6go2k
 Ol7A73dM+QBhqz6XyUOeOr8qVmCkHnM+8NdSnjfntqbd3as063I4JkawP7iEIzrJBbNX
 36ugN2TFuwWBjyQfkqR9pD9Gj8p2IQB72JAeiZdPN0bsNHoJFant8WzOCwNFIWcpzD0X
 GaA9xkcVV8SQb4/XRsBN3W7PzAnaee/dsJWv/ox40XXcMtWIwRJHZhlWqFvG9+E4QOCA
 YBiGVxHQtj2KIKktTflQ6vWeEEV3ypMMi1tXbNgjoiGoN/v2BznGuefLYRuQbFSh0yrI
 qjYg==
X-Gm-Message-State: AGi0PubPjOefSwrIaeZzTXpMVUc+1FGz6UWIk311i1FdJLiYIZb9cKuM
 lhfupfK+D3SrMJoAH9gfWsxj28sMtRFEDmjuboU=
X-Google-Smtp-Source: APiQypLAYP3M4WTMMbrtv0TIPLbSsl/+ylxPbD0Q59Fu36Wsny2ulaATuujzPdSegWiEfvjpsGf3JZtfeLx+bm3i0a4=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr4835744ual.106.1587726165361;
 Fri, 24 Apr 2020 04:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200424063551.14336-1-bernard@vivo.com>
In-Reply-To: <20200424063551.14336-1-bernard@vivo.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 24 Apr 2020 12:00:38 +0100
Message-ID: <CACvgo53s8YM4rt1=1o+w1PbBeG54RRbg=Qpcmc66WXUtoe92Xw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/arm: fixes pixel clock enabled with wrong format
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard,

On Fri, 24 Apr 2020 at 08:15, Bernard Zhao <bernard@vivo.com> wrote:
>
> The pixel clock is still enabled when the format is wrong.
> no error branch handle, and also some register is not set
> in this case, e.g: HDLCD_REG_<color>_SELECT. Maybe we
> should disable this clock and throw an warn message when
> this happened.
> With this change, the code maybe a bit more readable.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Changes since V1:
> *add format error handle, if format is not correct, throw
> an warning message and disable this clock.
>
> Link for V1:
> *https://lore.kernel.org/patchwork/patch/1228501/
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index af67fefed38d..f3945dee2b7d 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -96,7 +96,7 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
>         }
>
>         if (WARN_ON(!format))
> -               return 0;
> +               return -EINVAL;
>
>         /* HDLCD uses 'bytes per pixel', zero means 1 byte */
>         btpp = (format->bits_per_pixel + 7) / 8;
> @@ -125,7 +125,7 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
>         return 0;
>  }
>
> -static void hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +static int hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  {
>         struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
>         struct drm_display_mode *m = &crtc->state->adjusted_mode;
> @@ -162,9 +162,10 @@ static void hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
>
>         err = hdlcd_set_pxl_fmt(crtc);
>         if (err)
> -               return;
> +               return err;
>
>         clk_set_rate(hdlcd->clk, m->crtc_clock * 1000);
> +       return 0;
>  }
>
>  static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
> @@ -173,7 +174,11 @@ static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
>         struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
>
>         clk_prepare_enable(hdlcd->clk);
> -       hdlcd_crtc_mode_set_nofb(crtc);
> +       if (hdlcd_crtc_mode_set_nofb(crtc)) {
> +               DRM_DEBUG_KMS("Invalid format, pixel clock enable failed!\n");
> +               clk_disable_unprepare(hdlcd->clk);
> +               return;
> +       }
This doesn't seem right. As far as I can tell, the state must be
checked in the .atomic_check since .atomic_enable, intentionally,
"cannot" fail.

HTH
Emil


>         hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 1);
>         drm_crtc_vblank_on(crtc);
>  }
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
