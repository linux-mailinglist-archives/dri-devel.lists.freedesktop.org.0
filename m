Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC89D5B11
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990C910EAED;
	Fri, 22 Nov 2024 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C210EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:36:32 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6eeca49d8baso14322967b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732264590; x=1732869390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAZGdYy0kLNz/HWKiT5Wenkd6deM0b7lB87bgXf3/+U=;
 b=D7LQglqzJFDVJAT+vlal3IGqIR7Q4rtwqG8+dGzwinRJewEYNbomAV7bzmEySsxs9Y
 EPzSBv8wmBUlHcUHBZEZ4Lj1suLkANgeMlY/DZifGB5YfrHF3QLhMxQuKnEF/wHtp6bE
 czYHsxLasxpflZBnRzQ/tmAnrBKukvhI6/o5anHyWvaBM/HYof7KlJsKgvq/u4cgxE8l
 RYI7CilP5R12CgoEqAzyKHCP0N4iQAK0JMjPBLF5c22O+eOMlf6MiudkpJLBm7SrwhQW
 2vZUL2Aq6hgLLxzg8zgTyPd0zWXaI8nIXx/FFLZtrH3uEx8i2qc16bnZeY8rhv3fLy3L
 rLSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLRjtpftb98AXlPFzNfZcVc0n6vxbS2guwjcOJu+Ez5WHPHT7soEtBKttAbRcx/YHSBJEgk+9d1GU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydpyrgzjY+wcZlmAsAIyLt7XTUYcey5NDHS3xnKWlqGPHVyD+O
 ZEXmwVvX6mWhXBxpbOQc7roKecyM+hmYJaKP1hg4vrLoGQj9vCoZzPWffF3S
X-Gm-Gg: ASbGncslsUGIvnpxBHJTbonkf+tGbqso9csHUqdWTpQk/Q6Ln9Kjq4CBtyUC9YFOdAh
 X9uzOx5AWbUnjx7vMEQ2aVQYoF0/+5Rcwb5d9YYAA3+UpLmGLRv4JUvQh30Kq3JVqkVEtWE3xMe
 G3NsgTNNLoNFaus0r4pr8oUucwKZNlwvB4abmF3CP7Kju0YZ9Qu81b4HnT30+kg1AlrC0mFRPco
 gmyq+x4bwV9yjBzscDiHbKFCcO4Sc2e8VMi9TAf2jSxi4w2Aom79VqbFfCOCFec23RhhYEI14ai
 tfXD6AnIWCeWzNok
X-Google-Smtp-Source: AGHT+IF2RVGGtkbIy6yvJGSvVjesMyhTqaTdwiWS9DLpysJ6wPdLvxHVBMzEQMwyAH0N//gL4l7hlg==
X-Received: by 2002:a05:690c:490c:b0:6e3:6a76:ce45 with SMTP id
 00721157ae682-6eecd2e8d62mr51989967b3.13.1732264590270; 
 Fri, 22 Nov 2024 00:36:30 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6eedfe153cdsm3562957b3.4.2024.11.22.00.36.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 00:36:28 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6ee79e82361so26539377b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUdgxpzKGpiiUXWMFsntw4iuKpuxWuimlad1+FzuBvXdccVzolcXSmmWewNRjOT3OsqFt30UxYsaGQ=@lists.freedesktop.org
X-Received: by 2002:a05:690c:7084:b0:6e2:2684:7f62 with SMTP id
 00721157ae682-6eecd25bc15mr55712747b3.8.1732264588474; Fri, 22 Nov 2024
 00:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org>
 <20241104172950.GA741087@thelio-3990X>
In-Reply-To: <20241104172950.GA741087@thelio-3990X>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 09:36:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
Message-ID: <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Algea Cao <algea.cao@rock-chips.com>, 
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

On Mon, Nov 4, 2024 at 6:30=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
> On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Dividing a 64-bit integer prevents building this for 32-bit targets:
> >
> > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdr=
m.ko] undefined!
> >
> > As this function is not performance criticial, just Use the div_u64() h=
elper.
> >
> > Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output suppor=
t")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Can someone please pick this up? It is still broken in next-20241104...
>
> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integratio=
n2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log
>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > index 9c796ee4c303..c8b362cc2b95 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct=
 drm_encoder *encoder)
> >                * comment in rk_hdptx_phy_power_on() from
> >                * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >                */
> > -             phy_set_bus_width(hdmi->phy, rate / 100);
> > +             phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
> >       }
> >  }

noreply@ellerman.id.au has just told me this build issue is now upstream:

    FAILED linus/m68k-allmodconfig/m68k-gcc8.1 Fri Nov 22, 05:34
    http://kisskb.ellerman.id.au/kisskb/buildresult/15277242/

    Commit:   Merge tag 'drm-next-2024-11-21' of
https://gitlab.freedesktop.org/drm/kernel
              28eb75e178d389d325f1666e422bc13bbbb9804c
    Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30

    ERROR: modpost: "__udivdi3"
[drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

Applying this patch fixes it, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Do we really need +5 weeks to apply a fix for a reported build issue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
