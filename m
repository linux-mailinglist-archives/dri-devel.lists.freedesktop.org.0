Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E555C7AAA10
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE6A10E62E;
	Fri, 22 Sep 2023 07:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00A10E62A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:23:38 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so2906797e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 00:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695367415; x=1695972215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOFXpuvl1H4NAlV/tBfiU1JSfb7HtfZX/jg6fk0KIaU=;
 b=PifwJM5aX/fU145KG6f8uVAONmLC+Scc7CcadjWy4Q3i0395CLkcDOVRNZzWzq6vHX
 CfKZxUig9xqL6V3VcFeknXtjKp0E3UR9uyIlbOSPUVRpg4YFAbDF5w5r1yRpfdTyPR9U
 kr3FTSD/yBvMQTQl5pSrQo6aGg8a1XEF6aY8qcL/F75CGzOf8HiSBAfXzFAb5gJSvRqQ
 FGsW8Ysm49LIId84diuBkm7KyHVWuLhzLvL4lENrWl39gTXzUJjAwXlfVcLBCkLjLFEf
 2R9GlpStuMVoPSOzU7pS2F5e74LK8Sj94eYXhxaAkv6VcBS2A2byb+8TiavPluatNs9x
 LfxA==
X-Gm-Message-State: AOJu0YzZaPIGZFTJ6MFLYf+rDRKsJxUwxxJMymm8dC4JwHDEIq27E3Gb
 pXTib8I98BmNpBwKPlfHaU0ILsSmfJti6wzA
X-Google-Smtp-Source: AGHT+IFlZr+4f0ciZu/bNM3NRiz6CChuF1I7O1cnnIbvu28OBD2m+h7uV+lV/qieUh2q/vcWyHqQ1g==
X-Received: by 2002:a19:5515:0:b0:503:367c:49c7 with SMTP id
 n21-20020a195515000000b00503367c49c7mr5848882lfe.53.1695367414860; 
 Fri, 22 Sep 2023 00:23:34 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b005031a9238e0sm610712lfl.71.2023.09.22.00.23.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 00:23:34 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so2908757e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 00:23:34 -0700 (PDT)
X-Received: by 2002:ac2:5b07:0:b0:500:9a15:9054 with SMTP id
 v7-20020ac25b07000000b005009a159054mr5914632lfn.20.1695367414153; Fri, 22 Sep
 2023 00:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230921060228.29041-1-rdunlap@infradead.org>
In-Reply-To: <20230921060228.29041-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Sep 2023 09:23:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBhCcUJw00ZzeHJ=x62RGP2MJ8H-AXRHxBrfOaGeU8Dw@mail.gmail.com>
Message-ID: <CAMuHMdWBhCcUJw00ZzeHJ=x62RGP2MJ8H-AXRHxBrfOaGeU8Dw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: sh7760fb: require FB=y to build cleanly
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Thu, Sep 21, 2023 at 10:43=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> Fix build errors when CONFIG_FB=3Dm and CONFIG_FB_SH7760=3Dy:
>
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_probe=
':
> sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
> sh2-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_videom=
ode_to_var'
> sh2-linux-ld: sh7760fb.c:(.text+0x3a0): undefined reference to `fb_alloc_=
cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `register_=
framebuffer'
> sh2-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_deallo=
c_cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `framebuff=
er_release'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_remov=
e':
> sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebuffer'
> sh2-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_deallo=
c_cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `framebuff=
er_release'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined ref=
erence to `fb_io_read'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefined re=
ference to `fb_io_write'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefined re=
ference to `cfb_fillrect'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefined re=
ference to `cfb_copyarea'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefined re=
ference to `cfb_imageblit'
>
> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer dri=
ver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1762,7 +1762,7 @@ config FB_COBALT
>
>  config FB_SH7760
>         bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
> -       depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
> +       depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>                 || CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>         select FB_IOMEM_HELPERS
>         help

Any reason this can't become tristate instead?
drivers/video/fbdev/sh7760fb.c uses module_platform_driver(), and
already has all needed MODULE_*().

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
