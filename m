Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E99D837C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 11:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AF910E3B1;
	Mon, 25 Nov 2024 10:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7310E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 10:36:13 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6eeffdff41dso9192107b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732530972; x=1733135772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8d+g8WKkfE6s6pK+JrY3tSWdNLGevwdYmgstGGTm524=;
 b=dt7TGua98JFOS7dZgJpdqqUk6B05BCW3tS/OYCLuipYESbuxEfxsO+ocBLwbgwoFr/
 dj0tFjz+4Z1zI2fSxdFC7ZXzL5jhCJY3M/GqY/djALIY7qw36KzFX+iJItS7p9ZphCNV
 o75Hvs1Gm07VHrnpxwowea069+hYAC/oWhigBtAlg+22M2bZwssqrJC9bQwSe4GVHVLQ
 WC0XYHTFfnh7jznq1dn9mqnruvASamFKikeP0F2O0w+RctYJ3/wQqIXnJLWgyy+7XbDn
 YtPdqw6T4M3SOQuMmgekzTlP2y2GudUcjsujwoW7yuUM/A/ZPt40d/8QXL/ubS2vu7iv
 tA/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXltkJ26aXW3xXZcjBqGOmeJ43Qn8MD1gwLAJGF+qm+P5roP1gSetP8YtX9RkEOSiWqgutXuvJgkB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh0Vd7BxgXXBf5ezDMu/KVyKMbrkTJcjpV7ZO6qxlcaosTe94T
 fvAs8mMBm0slysg7wveEml3kgbXSafr56ncr5vZ6cpB4SX0XE/0FBR2MGTtU
X-Gm-Gg: ASbGncsFi7fzkiqbeP5gxCDPDBm9pqThtiUhJg2CZjaZd8LtpYlqAEkPNfWiT+9ig8i
 oElA31LWaV1WeztA4rnSDtigesJRewD61uvbhefzelhcjQW+K3YHtIBpaWxxlWq2lZ07T8q5OQd
 8Sf3tAgVNzfa/fbIVGVABUbgo3xREgFZhafEWRtjt8PzhEURzXdEgEcaL/3WPNtPxTyZwzFq2Jr
 AMKyHSAVVXGr2K54tTVfRvE5iRz7BGcA8I1/7DBYaljGbeGKbRPhKd5EM5C5sLOyJUPhKXqlZ6p
 2vVhqP+LxJbQGuW0
X-Google-Smtp-Source: AGHT+IFpyduuRFfRFRsVN0etL0c8CClw0IQso5NkltkeR5UZsZpUmDGauMixQZIbWQ1hldVMYFzWLA==
X-Received: by 2002:a05:690c:998a:b0:6e5:a431:af41 with SMTP id
 00721157ae682-6eee0a4a7d0mr116919487b3.38.1732530971708; 
 Mon, 25 Nov 2024 02:36:11 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6eedfe16c5asm17296407b3.12.2024.11.25.02.36.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 02:36:11 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6eeba477fcaso43269837b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhs+dvwBf0KaqUhlo9wz9S/liOHPnDYt72P6lXNVGNlzJs1Uett5oQBMExDsMXBAiDbZSPLzvpYuk=@lists.freedesktop.org
X-Received: by 2002:a05:690c:4a13:b0:6ee:cf8b:c6c1 with SMTP id
 00721157ae682-6eee0a24b1cmr108161527b3.29.1732530970890; Mon, 25 Nov 2024
 02:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org>
 <20241104172950.GA741087@thelio-3990X>
 <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
 <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
In-Reply-To: <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Nov 2024 11:35:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
Message-ID: <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
To: Maxime Ripard <mripard@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Nov 22, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Fri, Nov 22, 2024 at 09:36:16AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 4, 2024 at 6:30=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > > On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Dividing a 64-bit integer prevents building this for 32-bit targets=
:
> > > >
> > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockch=
ipdrm.ko] undefined!
> > > >
> > > > As this function is not performance criticial, just Use the div_u64=
() helper.
> > > >
> > > > Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output su=
pport")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > Can someone please pick this up? It is still broken in next-20241104.=
..
> > >
> > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integr=
ation2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log
> > >
> > > > ---
> > > >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drive=
rs/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > index 9c796ee4c303..c8b362cc2b95 100644
> > > > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(st=
ruct drm_encoder *encoder)
> > > >                * comment in rk_hdptx_phy_power_on() from
> > > >                * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > > >                */
> > > > -             phy_set_bus_width(hdmi->phy, rate / 100);
> > > > +             phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
> > > >       }
> > > >  }
> >
> > noreply@ellerman.id.au has just told me this build issue is now upstrea=
m:
> >
> >     FAILED linus/m68k-allmodconfig/m68k-gcc8.1 Fri Nov 22, 05:34
> >     http://kisskb.ellerman.id.au/kisskb/buildresult/15277242/
> >
> >     Commit:   Merge tag 'drm-next-2024-11-21' of
> > https://gitlab.freedesktop.org/drm/kernel
> >               28eb75e178d389d325f1666e422bc13bbbb9804c
> >     Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
> >
> >     ERROR: modpost: "__udivdi3"
> > [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> >
> > Applying this patch fixes it, so
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Do we really need +5 weeks to apply a fix for a reported build issue?
>
> Do we really need that kind of comments?
>
> It was applied already, I made sure it's part of the next PR we send to
> Linus. And it should be in linux-next tomorrow.

Thank you, I can confirm it is now commit 818956c76517e127
("drm/rockchip: avoid 64-bit division") in drm-misc/for-linux-next
and next-20241125.

Interestingly, the commit description contains:

    (cherry picked from commit 4b64b4a81fcd51f570c046cf904aef19ec756d45)

which is not in any tree on git.kernel.org, but the github collective
does know about it:
https://github.com/torvalds/linux/commit/4b64b4a81fcd51f570c046cf904aef19ec=
756d45

Probably you want to drop that line.

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
