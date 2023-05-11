Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168456FF1A8
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D75F10E0EA;
	Thu, 11 May 2023 12:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6A210E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 12:36:07 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-55a26b46003so129630847b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 05:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683808566; x=1686400566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bccEgTIv+NuBZ7b0m7HvDAcmdwRNosK16KRrDt/LqxI=;
 b=DfpWeqkayEH7Y+Mc8uDufG5jmRbU26B1GGepy+nBuLyYoEcMSf0aoVZfR6EtmQIP0S
 po1Wu4SUTNiT+EFXSfI4bhT2lm9i1gwdoaV+FtkTGIJxhDLFYkl4av8poAzstjNpD+pM
 9duc469SlFJqXD7Il0jAGuu4YmOmSBRt7o2ClWVqlAL0IyXd/P3vPDRUrTZXgpgAyaT5
 JnZU3Uls+n4yxD4x/jQ4pzKaSP9WPjR0kVreNT/gjci71b2JJLHNJXHN0nUMlvPNh2Ze
 usP6oRsAmZO9TOULysfebRtYV00ccQuDJy3Hnnxsb/KZFsPR3lEZhr49LfQbIHxQmacw
 Z3Yw==
X-Gm-Message-State: AC+VfDyTRTXJqN1aOS++4ydKBv+EH7ZDeuDehysoEgUr8MMXG7xnDIsp
 F8XXrjUfmRPU7yS3n6fxaE+Ye1FiZPQGJw==
X-Google-Smtp-Source: ACHHUZ5gvQEMJiZXVl8DRnpCN7QhbkeW0Mi1DOOPCJznQYybIagoXg+S5VhSxxi9Kc8/lVN3ra3oXA==
X-Received: by 2002:a81:9202:0:b0:559:e54d:4dde with SMTP id
 j2-20020a819202000000b00559e54d4ddemr22503702ywg.8.1683808565996; 
 Thu, 11 May 2023 05:36:05 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 l127-20020a0dfb85000000b0054c082bad36sm4859405ywf.120.2023.05.11.05.36.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-559eae63801so129597007b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 05:36:03 -0700 (PDT)
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id
 a5-20020a818a05000000b005561b32343bmr19413336ywg.45.1683808563363; Thu, 11
 May 2023 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 14:35:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Sam Ravnborg <sam@ravnborg.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, Artur Rojek <contact@artur-rojek.eu>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 suijingfeng@loongson.cn, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

CC Artur, who's working on HP Jornada 680.

On Wed, May 10, 2023 at 5:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, May 10, 2023, at 16:27, Thomas Zimmermann wrote:
> > Am 10.05.23 um 16:15 schrieb Arnd Bergmann:
> >> On Wed, May 10, 2023, at 16:03, kernel test robot wrote:
>
> >> I think that's a preexisting bug and I have no idea what the
> >> correct solution is. Looking for HD64461 shows it being used
> >> both with inw/outw and readw/writew, so there is no way to have
> >> the correct type. The sh __raw_readw() definition hides this bug,
> >> but that is a problem with arch/sh and it probably hides others
> >> as well.
> >
> > The constant HD64461_IOBASE is defined as integer at
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/hd64=
461.h#L17
> >
> > but fb_readw() expects a volatile-void pointer. I guess we could add a
> > cast somewhere to silence the problem. In the current upstream code,
> > that appears to be done by sh's __raw_readw() internally:
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/io.h=
#L35
>
> Sure, that would make it build again, but that still doesn't make the
> code correct, since it's completely unclear what base address the
> HD64461_IOBASE is relative to. The hp6xx platform code only passes it
> through inw()/outw(), which take an offset relative to sh_io_port_base,
> but that is not initialized on hp6xx. I tried to find in the history
> when it broke, apparently that was in 2007 commit 34a780a0afeb ("sh:
> hp6xx pata_platform support."), which removed the custom inw/outw
> implementations.

See also commit 4aafae27d0ce73f8 ("sh: hd64461 tidying."), which
claims they are no longer needed.

Don't the I/O port macros just treat the port as an absolute base address
when sh_io_port_base isn't set?

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
