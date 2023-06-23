Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCDD73BE4D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 20:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036D10E0B1;
	Fri, 23 Jun 2023 18:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1FC10E0B1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 18:10:08 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-440b9d60606so366444137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687543807; x=1690135807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdLesGDWRYBklitp69Kt70nnbJt9dWfGsl/z3ZsnPiw=;
 b=aTgcMFTa28ddhSy7nmUg5lXFA8koandLCoKwh1ZpBISGrxmH2EIpwz8BmHn5zHg5fT
 1w4DCqeqOxwpCVoHoXw5axMZiJV3E0h/gHDLKMlBNruXC3lD13En1LCdhD3XQ2/C+pC4
 Hr1z8Rfvqmkn82eYvGu/LgqdiG7Rge4EXMJDaYYefkr8yjGtsXB95EnLLYLZh4uUXM+i
 5n0fQ0GstO/VDxEn7BrPzE2EMyWARP5jsTKVlLYOJPPr+1iTOJ1VUD5/Ml+ALCiqoZR4
 AryM/hBJsUxcM+pcWlojbC3xT1FeX6DYeh5CxHR9GIpO5+64FQO9VyMpJxlyKlF6PPLO
 Md5A==
X-Gm-Message-State: AC+VfDwalFrSAqEFc+/yRdmSXqnJyUOKCx+fSKviRKnhkz7WjTVk6Fm8
 Ml4EyHELPs8NZtvJpPB6vvofmAvOK1hxRw==
X-Google-Smtp-Source: ACHHUZ7veZTz7cxG64UuuWokfP9MrqD3ah9/zpiVyLvdzGlClsAvSEaL24yPVuUVsqJIbN9AITSxLw==
X-Received: by 2002:a05:6102:242:b0:43c:8dc1:9df3 with SMTP id
 a2-20020a056102024200b0043c8dc19df3mr12028214vsq.7.1687543806604; 
 Fri, 23 Jun 2023 11:10:06 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 m8-20020a67e0c8000000b0043d5d6eb61fsm1339464vsl.31.2023.06.23.11.10.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 11:10:05 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-78cbc37c5b1so376165241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:10:05 -0700 (PDT)
X-Received: by 2002:a67:ee13:0:b0:43b:1561:9e6b with SMTP id
 f19-20020a67ee13000000b0043b15619e6bmr12740902vsp.18.1687543804614; Fri, 23
 Jun 2023 11:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2759075c94c011b0f15cb610f39f8fa9b3736600.1687423204.git.geert+renesas@glider.be>
 <20230623175019.GO2112@pendragon.ideasonboard.com>
 <20230623175409.GA2534204@ravnborg.org>
In-Reply-To: <20230623175409.GA2534204@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 20:09:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsvz1knSDqQW16rrT3tq2Zz4dfEJj4WS5By0AYLWRazA@mail.gmail.com>
Message-ID: <CAMuHMdVsvz1knSDqQW16rrT3tq2Zz4dfEJj4WS5By0AYLWRazA@mail.gmail.com>
Subject: Re: [PATCH 39/39] drm: renesas: shmobile: Add DT support
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam, Laurent,

On Fri, Jun 23, 2023 at 7:54=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wro=
te:
> On Fri, Jun 23, 2023 at 08:50:19PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 22, 2023 at 11:21:51AM +0200, Geert Uytterhoeven wrote:
> > > Add DT support, by:
> > >   1. Creating a panel bridge from DT, and attaching it to the encoder=
,
> > >   2. Replacing the custom connector with a bridge connector,
> > >   3. Obtaining clock configuration based on the compatible value.
> > >
> > > Note that for now the driver uses a fixed clock configuration selecti=
ng
> > > the bus clock, as the current code to select other clock inputs needs
> > > changes to support any other SoCs than SH7724.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > ---
> > > SH-Mobile AG5 (SH73A0) support is untested.
> > >
> > > Unbind crashes when drm_encoder_cleanup() calls drm_bridge_detach(), =
as
> > > the bridge (allocated by devm_drm_panel_bridge_add()) has already bee=
n
> > > freed by that time.
> > > Should I allocate my encoder with devm_kzalloc(), instead of embeddin=
g
> > > it inside struct shmob_drm_device?
> >
> > That shouldn't be needed, if you manage the memory for shmob_drm_device
> > with the DRM managed helpers.

Well, Marek said unbind works fine in drivers/gpu/drm/mxsfb/lcdif_drv.c,
where the order is:

    bridge =3D devm_drm_of_get_bridge(...)
    encoder =3D devm_kzalloc(...)
    drm_encoder_init(...)

> > Lifetime management of bridges is currently completely broken, there's
> > nothing that prevents bridges from being freed while still in use.
> > That's an issue in DRM, not in your driver.

OK ;-) (or :-(

> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -508,9 +508,43 @@ static const struct drm_encoder_helper_funcs enc=
oder_helper_funcs =3D {
> > >     .mode_fixup =3D shmob_drm_encoder_mode_fixup,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
------------
> > > + * Encoder
> > > + */
> > > +
> > > +static int shmob_drm_encoder_init(struct shmob_drm_device *sdev,
> > > +                             struct device_node *enc_node)
> > > +{
> > > +   struct drm_bridge *bridge;
> > > +   struct drm_panel *panel;
> > > +   int ret;
> > > +
> > > +   /* Create a panel bridge */
> > > +   panel =3D of_drm_find_panel(enc_node);
> >
> > Using drm_of_find_panel_or_bridge() would allow supporting platforms
> > that connect a non-panel device to the SoC, in additional to the alread=
y
> > supported panels.
>
> From the documentation of drm_of_find_panel_or_bridge():
>
>  * This function is deprecated and should not be used in new drivers. Use
>  * devm_drm_of_get_bridge() instead.
>
> I suggest to go that route.

OK (do I have the feeling that these helpers are sometimes deprecated
faster than they are written? ;-)

> > > @@ -147,11 +148,13 @@ static int shmob_drm_remove(struct platform_dev=
ice *pdev)
> > >  static int shmob_drm_probe(struct platform_device *pdev)
> > >  {
> > >     struct shmob_drm_platform_data *pdata =3D pdev->dev.platform_data=
;
> >
> > How about dropping non-DT support ? That would simplify the driver.
>
> +1 for that, without knowing the implications.

That depends on your priorities: do you want to migrate all users of
sh_mobile_lcdc_fb to shmob_drm, or do you want the SuperH users to
stick with sh_mobile_lcdc_fb until they have migrated to DT? ;-)

Regardless of the above, I do not have (visible) access to any of the
affected SH772[234] platforms...

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
