Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A43D7AD1C6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DC310E20B;
	Mon, 25 Sep 2023 07:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB610E208
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:33:52 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-59f6e6b206fso19568237b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 00:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695627231; x=1696232031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4DkV30tiTF+/Nd4PKu9iZtuKtXNv4GedklEIC0otY4=;
 b=ohbKwancbvD1JVkwQ/VRcUt/tOOqqzpulGGMXGnuUU0RzSM6wTSxzAqK3aqic5bAVN
 ZeB1qcq9bb/c9UgjGxQgq7yIPWhVQcSw0MMLaWVyvfnKbdnMgRvg0BmSGabbOVAYiwou
 whcNC3g0caJx/9LIHqRjCHcdfxkMmugaj0TmMvNAkJggV4mg4rQMsk5M35LbnGhcYByY
 cLUdaiIv46gTZRfaMaXeaY8xf+NksRbPTs0/f0blizGUJhgo5FUl7kkRzXaUWcdBx8kv
 c+8p4tTncsKj5znXFeeBgExa65uP9U9AE0I6wDURBoR69OZZ071/xZE7e9bWAdp884aG
 7uJw==
X-Gm-Message-State: AOJu0YxSEy6pg7JyvJW17v60+lQ5DChuKwB3z1fPem2IPEGToxLMM01y
 sVDiU/CwQ8xDCxartpNk8svM0KF8ZRMZHA==
X-Google-Smtp-Source: AGHT+IF8YiOHgTFDkabbu1FYwVhCJpoqpeG/StdrAwLP+6jAgZDSaIjJddDEVEfQAGwC+eoq/F0mCg==
X-Received: by 2002:a0d:cac9:0:b0:59b:bea7:29cb with SMTP id
 m192-20020a0dcac9000000b0059bbea729cbmr6754069ywd.1.1695627231489; 
 Mon, 25 Sep 2023 00:33:51 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 z5-20020a81a245000000b00583e52232f1sm2244118ywg.112.2023.09.25.00.33.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 00:33:51 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d815a5eee40so6372180276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 00:33:50 -0700 (PDT)
X-Received: by 2002:a25:37d4:0:b0:d77:91db:e5c6 with SMTP id
 e203-20020a2537d4000000b00d7791dbe5c6mr6003949yba.17.1695627230398; Mon, 25
 Sep 2023 00:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230918090400.13264-1-tzimmermann@suse.de>
In-Reply-To: <20230918090400.13264-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 09:33:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
Message-ID: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 arnd@arndb.de, Linux-sh list <linux-sh@vger.kernel.org>, deller@gmx.de,
 rdunlap@infradead.org, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 glaubitz@physik.fu-berlin.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Sep 18, 2023 at 11:45=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Fix linker error if FB=3Dm about missing fb_io_read and fb_io_write. The
> linker's error message suggests that this config setting has already
> been broken for other symbols.
>
>   All errors (new ones prefixed by >>):
>
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
probe':
>      sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
>      sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_v=
ideomode_to_var'
>      sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_a=
lloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `regi=
ster_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_d=
ealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `fram=
ebuffer_release'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_=
remove':
>      sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebu=
ffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_d=
ealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `fram=
ebuffer_release'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefine=
d reference to `fb_io_read'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefin=
ed reference to `fb_io_write'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefin=
ed reference to `cfb_fillrect'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefin=
ed reference to `cfb_copyarea'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefin=
ed reference to `cfb_imageblit'
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-lkp@i=
ntel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1756,7 +1756,7 @@ config FB_COBALT
>
>  config FB_SH7760
>         bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
> -       depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
> +       depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>                 || CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>         select FB_IOMEM_HELPERS
>         help
> --

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
