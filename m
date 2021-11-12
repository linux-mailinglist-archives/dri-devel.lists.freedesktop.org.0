Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED744EFDA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68226E12B;
	Fri, 12 Nov 2021 22:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111966E0BC;
 Fri, 12 Nov 2021 22:58:24 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bf8so20634164oib.6;
 Fri, 12 Nov 2021 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kLWDjBOEgMtaOJJM6olmmsO9ZOKebdhk4SN7pITZDc=;
 b=PxML9IrtUiXHEE7CVKrWioEu8UrZNsfdaMHsjmgeA7NmE4PYMmiTKPWPccRGGNfpss
 UjWUm6FvYcJbRcXEqzuytL0tWgyKcQwtxR5ipqAZ1cS/FZ2Ge9OYHuPUUB7t3frZYjnB
 2OBDPbsKIT+jexdTtBq3VRwvFY6a0Iup/i+HsaeT7JtuK7M/3O28MGPENnX/TA+/y9EO
 XdgNcVFHfK05mctCG/fM4WqWv2TO4jAPckTqx0osvXDFeFLmhiTd5E4rzWoUwtPcMjD9
 cUHo2dEu4XHb/7a96ZIPaZsrFCyrXNsKF2iKNfttEExeSNpLOzgGKampPMU9VKJXfdFt
 CoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kLWDjBOEgMtaOJJM6olmmsO9ZOKebdhk4SN7pITZDc=;
 b=lPLLNNwQDAC4FX2PsejtmbQftVXuDIlYGdD1rm2YUVuydpiNtMXV7Yc8LGJgEE2oD5
 FvPQtvqRzdwYWRARpvzClLfNqoB0JL46w6oujD+NJ0nNcgkXDpe5I357p77/FNgNxvAz
 QRxbVdp8Jl5tP8XCwR8lqtbEEOhJFj//YzMzG8f146l0CwDR4YxG6tsJhJSx+7BngJOg
 3fPF2u8WK6/19FQVpw8VHA88gBEXC8sb5YN5Znlg1tXifSWLje5I5ca0HjdvlVj/KHfr
 Mko4axsmE08tqNFkZQFboNclYv+fA2br9hvcXl1CliUoslqkyA0Z5/tiXCgUXI7MTBiQ
 eUjw==
X-Gm-Message-State: AOAM533UdXUFoLXoOETt91gnNGxxt4yUfd2er0CNcFpSnOZtjasrxLc9
 qreLcZFuf+jqTlnpRCFOaZKbHCjBcz2SPKsD3ws=
X-Google-Smtp-Source: ABdhPJyEs2LppcBiXO8PG2byHA4/cBzJjP42JCJKB570uD0M4uIGkiDHf+Ali76TI/67E28tQF0k6v5sy9PNEfBg1FU=
X-Received: by 2002:aca:180f:: with SMTP id h15mr15803059oih.120.1636757903427; 
 Fri, 12 Nov 2021 14:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20211112061651.6509-1-ye.guojin@zte.com.cn>
In-Reply-To: <20211112061651.6509-1-ye.guojin@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Nov 2021 17:58:12 -0500
Message-ID: <CADnq5_PbjTWCgY-WrNdYna+Dr6F0+OiMEcjk5FpEk9VUSM9U-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix cond_no_effect.cocci warnings
To: CGEL <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Vladimir Stempen <vladimir.stempen@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Zeal Robot <zealci@zte.com.cn>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@linux.ie>,
 Jerry Zuo <Jerry.Zuo@amd.com>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ye Guojin <ye.guojin@zte.com.cn>,
 Jun Lei <Jun.Lei@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Nov 12, 2021 at 1:17 AM <cgel.zte@gmail.com> wrote:
>
> From: Ye Guojin <ye.guojin@zte.com.cn>
>
> This was found by coccicheck:
> ./drivers/gpu/drm/amd/display/dc/core/dc_resource.c, 2516, 7-9, WARNING
> possible condition with no effect (if == else)
>
> hdmi_info.bits.YQ0_YQ1 is always YYC_QUANTIZATION_LIMITED_RANGE.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index fabe1b83bd4f..564163a85d2c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -2509,17 +2509,7 @@ static void set_avi_info_frame(
>
>         /* TODO : We should handle YCC quantization */
>         /* but we do not have matrix calculation */
> -       if (stream->qy_bit == 1) {
> -               if (color_space == COLOR_SPACE_SRGB ||
> -                       color_space == COLOR_SPACE_2020_RGB_FULLRANGE)
> -                       hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
> -               else if (color_space == COLOR_SPACE_SRGB_LIMITED ||
> -                                       color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE)
> -                       hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
> -               else
> -                       hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
> -       } else
> -               hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
> +       hdmi_info.bits.YQ0_YQ1 = YYC_QUANTIZATION_LIMITED_RANGE;
>
>         ///VIC
>         format = stream->timing.timing_3d_format;
> --
> 2.25.1
>
