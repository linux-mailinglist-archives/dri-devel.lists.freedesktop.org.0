Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CF31FC83
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C06EB5A;
	Fri, 19 Feb 2021 16:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8B6EB5A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:00:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g5so14375117ejt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+zcBFD9OLKydvMtia1SRzcrpomNVwm7CQslRqHulBE=;
 b=SZauSH8pNYSFUEtn00V5KYfnvmpaxM2oGHZuV+xR4ftNabdzllHW4BLsiBxWXcBHpR
 MinzdrF7DlXwAJAAZG1uKvkRRWVennj9eft9iFfgqEkfdO+IRFJVO/3olZePoZda/3YU
 rgpJ5JfWdWTy19/wdD0JxdsS685AlWhw7MUYfHOAL10WJu7BV9ZBlse2zIpAWb6orm2d
 OwrBaALTYOt5BxMS/Ik/JGQ3nM7JiPeLcggrooR15ZLeS3uz38PuCxJX5+paCueujLjs
 5f6AguktTklzkf+HcrRGUy1yQSYWjK8kxmCargLFN75XWbJonndSg8XVeJGxrnNWHfOF
 eVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+zcBFD9OLKydvMtia1SRzcrpomNVwm7CQslRqHulBE=;
 b=hStuY+qhkvatOMQV3GDpM8LEbJLQyD+4TTxHz24HBjF9oQCXDiZYdFc7qoRJ8Xie2l
 mCWZyriMEq1t6b1AbZ3YIlk33a51GW/gNjzoHJm33RqD7UwUNG3F0h6pNg64CEmOdWZf
 Q1m1bNqVvgKajZhNNb/PV0/tV1L9tSUjo61tAoPcMor6G27yza+LUOJIW4IntAMJgwSK
 9WP1rgY8E7gdc0AVlSqMHCXjcTM34/fB8LBVoNdOPdxqwMppMbf6+nYxBEVqqIHTzZj/
 lLtxOubqq9aZ3klnEdW4KuT7raADKzvWItkOvazHhlf8D9uk0mMJqWVVghgl6csmaDLG
 YI4w==
X-Gm-Message-State: AOAM531/deUdUYmFTG/CuYIJ0AXrAqYVJ72AW2xO8PhrmnufC5nCltvF
 v/6BHp91hR4BfZi22tpJlawtdFMcaN+vUyxD5IVzig==
X-Google-Smtp-Source: ABdhPJxFl6VMdq3hA6C00e9Yg8YkDXVqM8bsaXJ+IH1I5bHGRm8a2BuB0+k2WOan3ZIPBhcpqfJ+OMqmQdcjo7czY/A=
X-Received: by 2002:a17:906:798:: with SMTP id
 l24mr9449402ejc.92.1613750412092; 
 Fri, 19 Feb 2021 08:00:12 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR06MB5342F273F5DAA0DD24E89EA3A5849@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB5342F273F5DAA0DD24E89EA3A5849@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 19 Feb 2021 13:00:00 -0300
Message-ID: <CAAEAJfA6miHGaJ+u+GGj_jiNWgFRncx=toU0KEGhaZ8DV=rgvg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: elida-kd35t133: allow using non-continuous dsi
 clock
To: Chris Morgan <macromorgan@hotmail.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Feb 2021 at 00:14, Chris Morgan <macromorgan@hotmail.com> wrote:
>
> This fixes an issue with the panel not working after
> commit c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for non-continuous HS clock").
> With this change the panel inits successfully and displays an image.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..fe5ac3ef9018 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -265,7 +265,8 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>         dsi->lanes = 1;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
> +                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
>                        DRM_MODE_CONNECTOR_DSI);
> --
> 2.25.1
>

I kindly appreciate you taking the time to debug this one.
It looks good, but also seems like Heiko already sent the same fix:

https://www.spinics.net/lists/kernel/msg3824932.html

Thanks,
Eze
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
