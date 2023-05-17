Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312E706099
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81010E3B1;
	Wed, 17 May 2023 07:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A996210E3B1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:02:33 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-ba829e17aacso479352276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 00:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684306952; x=1686898952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kb66cM90aorprDoD+fU8o0Tfbn5W3STJm5DAIXq91ZM=;
 b=Rh45pGn2krlWTx6Kr7g4TEIgv9DYGVlg/Q9gwZ32pyqa7F5+gQOTIOElGN5q4fcjGW
 LzoAY8HQjeQWhWw+IZa3NS0wyHMLK8coPcQtk8SL+qgXFXY4v0Wiqh3P5gkXU2JTtauL
 doYzosd1CXWaRBwKC34eXxmPk4sHDNetORfrp5qBVIkHYPfStqi6e9y3mLN/9+eaPjcw
 ULp1zyQE8/VfKLqNK1F+mxBXAGA2yv3uoiUZh+EbWLuZep+2nfZjxmlkqN9STRCDP3iu
 2t8Yn4Ylh3+QdFIM8r4DD/VcqMIbdRiA5qMxMmcxaSBcaA4WmCHkY5FwXfXShnDy+oPE
 LYbQ==
X-Gm-Message-State: AC+VfDz6ZEYEDDUH9AvHOXS4lwXbahQPSmcbcghUy98/81Q217S+0LsF
 Px0nASwqlIbToKRiXk+5ETNUMgfwPVZIzQ==
X-Google-Smtp-Source: ACHHUZ5INjj1SvsR9z+6RKwBnkcjzr1yJWnOYFUKCpAOPxwAQHyxZnFZgsrC22yk4zh5XB+TMifKsw==
X-Received: by 2002:a25:3781:0:b0:ba8:206c:6702 with SMTP id
 e123-20020a253781000000b00ba8206c6702mr3385478yba.47.1684306952105; 
 Wed, 17 May 2023 00:02:32 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 e17-20020a256911000000b00b9f4343547csm386202ybc.41.2023.05.17.00.02.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 00:02:31 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ba71cd7ce7fso464937276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 00:02:31 -0700 (PDT)
X-Received: by 2002:a25:c7cb:0:b0:ba7:5f08:ba07 with SMTP id
 w194-20020a25c7cb000000b00ba75f08ba07mr10396212ybe.33.1684306950735; Wed, 17
 May 2023 00:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230516202257.559952-1-arnd@kernel.org>
In-Reply-To: <20230516202257.559952-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 May 2023 09:02:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
Message-ID: <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, May 16, 2023 at 10:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> There is a global function with this name on sparc, but no
> global declaration:
>
> drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype fo=
r 'get_fb_unmapped_area'
>
> Make the generic definition static to avoid this warning. On
> sparc, this is never seen.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1468,7 +1468,7 @@ __releases(&info->lock)
>  }
>
>  #if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFIG_M=
MU)
> -unsigned long get_fb_unmapped_area(struct file *filp,
> +static unsigned long get_fb_unmapped_area(struct file *filp,
>                                    unsigned long addr, unsigned long len,
>                                    unsigned long pgoff, unsigned long fla=
gs)
>  {

LGTM, as this is unrelated to the SPARC function, and SPARC does
not support nommu (yet? ;-)

drivers/video/fbdev/Kconfig:config FB_PROVIDE_GET_FB_UNMAPPED_AREA
drivers/video/fbdev/Kconfig-    bool
drivers/video/fbdev/Kconfig-    depends on FB
drivers/video/fbdev/Kconfig-    help
drivers/video/fbdev/Kconfig-      Allow generic frame-buffer to
provide get_fb_unmapped_area
drivers/video/fbdev/Kconfig-      function.

Probably you want to update this help text, too. E.g.
"to provide shareable character device support on nommu"?

This seems to be selected only by DRM_STM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
