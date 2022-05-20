Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8A52EB6D
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27F810ED0A;
	Fri, 20 May 2022 12:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDED010ED0A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 12:02:25 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id t2so2492036qkb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65WlQ7s8g42M5C+5yY3Awf+CpXZTfjugQxcprooIu8U=;
 b=Obd0Oa4X9i4PWxG+5oa/V9+G++kOidNDJRx7UJUCDGoQ7OXLWvFSfXZJdnc+N+kBi2
 opQ+byLz3BK60Vd0Ajf5PdBcllHPxlqVrMOql0vCur+eYbyeqN417cDQ4mJq7HO6CZKE
 dAbx+WdZ7By0Oi0fEY/dNy3ufRFrvvSN9LkaNL41sWTXOsXnK+UuQimzT51NlxQ2LgHl
 zbvnqoddpO9pyCr6fVaP9/3P25D9uUB5/isHVR5ZSV8RaX7uztHB9mMY3Zbpno05pUDQ
 e3LC7KhYOqElZMtz37HGFIBlq9ssPSzopgBs+h8mpxKtEGv1TZHBL3s+i6B3pxngDCqy
 okVw==
X-Gm-Message-State: AOAM532l7GCyAiNItcuumAvEdemVYylT2Wnf09mODWGVmnjpJDBXp5YZ
 u+6hXF6GvG+XALlO9oqnkedJ8RBFhppZ/A==
X-Google-Smtp-Source: ABdhPJzfeiwhe1+BsK1EhlEn6/+ZJH87cncTPaIQJ8kFjC0Tgc/zibJO2oje3tL741f+/InglaB2ww==
X-Received: by 2002:a05:620a:2988:b0:6a0:53e7:ed48 with SMTP id
 r8-20020a05620a298800b006a053e7ed48mr6058168qkp.604.1653048144451; 
 Fri, 20 May 2022 05:02:24 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 y1-20020a379601000000b006a323e60e29sm2825671qkd.135.2022.05.20.05.02.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 05:02:24 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x2so13483957ybi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:02:23 -0700 (PDT)
X-Received: by 2002:a25:4289:0:b0:64d:746f:5311 with SMTP id
 p131-20020a254289000000b0064d746f5311mr8586423yba.89.1653048143666; Fri, 20
 May 2022 05:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220520091602.179078-1-javierm@redhat.com>
In-Reply-To: <20220520091602.179078-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 14:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmFGjGbHz1yo7tOzqtUbMTDkUxaMo2fVSp1HMU=_1emA@mail.gmail.com>
Message-ID: <CAMuHMdVmFGjGbHz1yo7tOzqtUbMTDkUxaMo2fVSp1HMU=_1emA@mail.gmail.com>
Subject: Re: [PATCH] drm/st7735r: Fix module autoloading for Okaya RH128128T
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

CC spi

On Fri, May 20, 2022 at 11:16 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The SPI core always reports a "MODALIAS=spi:<foo>", even if the device was
> registered via OF. This means that the st7735r.ko module won't autoload if
> a DT has a node with a compatible "okaya,rh128128t" string.
>
> In that case, kmod expects a "MODALIAS=of:N*T*Cokaya,rh128128t" uevent but
> instead will get a "MODALIAS=spi:rh128128t", which is not present in the
> list of aliases:
>
>   $ modinfo drivers/gpu/drm/tiny/st7735r.ko | grep alias
>   alias:          of:N*T*Cokaya,rh128128tC*
>   alias:          of:N*T*Cokaya,rh128128t
>   alias:          of:N*T*Cjianda,jd-t18003-t01C*
>   alias:          of:N*T*Cjianda,jd-t18003-t01
>   alias:          spi:jd-t18003-t01
>
> To workaround this issue, add in the SPI table an entry for that device.
>
> Fixes: d1d511d516f7 ("drm: tiny: st7735r: Add support for Okaya RH128128T")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!
We really need to fix this at the subsystem level.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -174,6 +174,7 @@ MODULE_DEVICE_TABLE(of, st7735r_of_match);
>
>  static const struct spi_device_id st7735r_id[] = {
>         { "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
> +       { "rh128128t", (uintptr_t)&rh128128t_cfg },
>         { },
>  };
>  MODULE_DEVICE_TABLE(spi, st7735r_id);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
