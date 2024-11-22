Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B79D5BFF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF4F10EB23;
	Fri, 22 Nov 2024 09:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589BC10EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:33:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6eebc318242so18627637b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732267997; x=1732872797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM8g64sET8hw7b+gyg+vsiEnmYLC8RSZn0rXhR5lgBE=;
 b=DJTr2ShX9dHnavzqzR+FSI5Kci0EI3DVQk5MRa1NaBvQ6YxIfwsBr68hYiildprtBb
 IVXCQyuWLrnYhzrgF3iZFAojomazMHy7kkw64cLHsdZw+wv7TubkRbBVoHLALP1SeBGZ
 uVI0Hx/XlnjoKQXu6oH6cVRc8TEFu8HzjjtTUn+R99wZlhtANv53IgOM73TyP50Vl3HL
 LvOZ6tjVp+Jr1U/GyvLsxGNSijXLL0peZsdY8FKkBfQkGEX1vFOevGUUCZPMcPAh21u2
 iZ21gLaOefI3a7P38IFAu9QBFheaLwuQyu34uwLDOa20Rxi4MTQXuRRLaQQPkGanZ0T4
 RcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFAWbDIQrQyAMklVx5NJJ58YLGMUoE1Xw8kW5ojaNuMOaGjtjVasoCWOHe3vKORRDxmmW+i8ZjC5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSMXksjrZGXnN+od1qg92s2G9sMxUBwHWXHBU+ahu8c7jKkae4
 qnXXO1rFtfgljvl5Fq9teXRjkWe4W6ImGLFRhATYUufoFnQv3emKoozu/Fip
X-Gm-Gg: ASbGncug9t7G1hfgAvP21N9PjmaWDsw4ZoWyLFja1tqUwUQo8POROD+xpcrLk49MNRh
 f+kThiaU+WJ0coY67kuPBddlWuGiMJe0Slkmhwqv18JlN1JpEcm7Gi1CVaWql5NOpLTgXnEopmF
 nBljklQIRYH+Tz4I8Sms1xj4vj4zt2UszzxS/y42ktg7neb+aPs6JHpnUiebAyl6sttAoRMnjUU
 /ak9e8N+RWLfB+kjdc9ZvMJq30KMNs+QD0af51i8SYVVltSxEHQ/GA/u/U5Q78KKyVkw+IpxDuA
 amy+hsIoXCZkaaB7
X-Google-Smtp-Source: AGHT+IECElOI7NBkd8kfKdSt7dNbvGrSVogipezz/QNHJ+Ma36b7dYaCVy2kPkE1Aek4w2N+m1a2fg==
X-Received: by 2002:a05:690c:688c:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6eee0a51237mr28622727b3.32.1732267997125; 
 Fri, 22 Nov 2024 01:33:17 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6eedfc6ebedsm3763667b3.0.2024.11.22.01.33.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 01:33:16 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6eebc318242so18627257b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:33:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2/K0mx7t8viemzGn9pherB37+9qzApewtBiJLVYgDES0xT6o2tyvVGc//++YcXPBEuJqu07gHvd4=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6e09:b0:6ee:9cb7:dc31 with SMTP id
 00721157ae682-6eee08b5abemr26651957b3.3.1732267996019; Fri, 22 Nov 2024
 01:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org>
 <20241104172950.GA741087@thelio-3990X>
 <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
 <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
In-Reply-To: <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 10:33:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGfCWyFHnAKeg4YViErzX5BReb2A-8gtqECstUMn2Oeg@mail.gmail.com>
Message-ID: <CAMuHMdUGfCWyFHnAKeg4YViErzX5BReb2A-8gtqECstUMn2Oeg@mail.gmail.com>
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

Perhaps not...

> It was applied already,

Where was it applied?
How would I know that, when the fix is not in linux-next?

> I made sure it's part of the next PR we send to
> Linus. And it should be in linux-next tomorrow.

Thank you!

The issue is that the reported build issue was not fixed in linux-next,
despite the fix having been available for 5 weeks, thus reducing
(build) test coverage for all affected architectures, possibly hiding
other issues.
In addition, a PR including the build issue was sent to Linus, so now
the above applies to Linus' tree, too.

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
