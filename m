Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DF6EDF6B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 11:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F25510E013;
	Tue, 25 Apr 2023 09:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5F10E013
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:39:15 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-54fb8a8a597so65151707b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 02:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682415554; x=1685007554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JfUVD5sHyhg+LQzHNaf7k/Kt0E3VestVkeRRTgHKlTo=;
 b=DipW8xeDbTc/oZ/GMlw8ubEdyVx7NY8DgrsuOKZtq4eujdRsPyBCiKkEbw7Pt9giN0
 uOJKEWOb0Zcka3rqsG637bt9XaytGGR0NK0FFv8b8S5b7wl57fAGeMIBWFwHvZvNBV3E
 FEluxJpsURe9b7MohG3D2Y3wXNMe9XRrUzKZsKn8LfKQDXyGSCmobqVZIiXzeVne4FBF
 S+I5OL/h+aLA6g0Yke9AJBatiOb1G8VFijJS8tjDbqmKA0cTs5ScJc8gevIE8cLNFwh4
 Wwqjr46tzO7ZsM1nU0mnlEFsd4j2twfu2Nn5nFgvlS3wLSBJ2qBJ/GyAbzWvFAo+6lqJ
 m2+Q==
X-Gm-Message-State: AC+VfDw8na/tFi1vOSl1YxsUAA9iR3WTNiNf7TSl/RS0MUYn54QtiWTc
 IcJqzwq+SSDq9R6ETLT26AEGMa/YP0RBKw==
X-Google-Smtp-Source: ACHHUZ7ucycrrlwhT3/KLWqH+nFnTfyPw+nOUleoEgxe09T7XGUG973mh1Quip0f2qz0GQQfwrs5Pg==
X-Received: by 2002:a0d:cd84:0:b0:556:c778:9d60 with SMTP id
 p126-20020a0dcd84000000b00556c7789d60mr394176ywd.43.1682415554149; 
 Tue, 25 Apr 2023 02:39:14 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 z205-20020a0dd7d6000000b0054f856bdc4dsm3515488ywd.38.2023.04.25.02.39.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 02:39:13 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-54fb6ac1e44so65036757b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 02:39:13 -0700 (PDT)
X-Received: by 2002:a81:4a05:0:b0:54f:bb39:792b with SMTP id
 x5-20020a814a05000000b0054fbb39792bmr10649787ywa.26.1682415553275; Tue, 25
 Apr 2023 02:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
 <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 11:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
Message-ID: <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Tue, Apr 25, 2023 at 10:55=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > On Mon, Apr 24, 2023 at 6:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > Add my self as maintainer for RZ DU drivers.
> > > While at it, update the entries for rcar-du and shmobile.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -6948,7 +6948,7 @@ F:        drivers/gpu/host1x/
> > >  F:     include/linux/host1x.h
> > >  F:     include/uapi/drm/tegra_drm.h
> > >
> > > -DRM DRIVERS FOR RENESAS
> > > +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
> > >  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >  M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >  L:     dri-devel@lists.freedesktop.org
> > > @@ -6959,9 +6959,18 @@ F:
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.ya=
ml
> > >  F:     Documentation/devicetree/bindings/display/bridge/renesas,dw-
> > hdmi.yaml
> > >  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds=
.yaml
> > >  F:     Documentation/devicetree/bindings/display/renesas,du.yaml
> > > -F:     drivers/gpu/drm/renesas/
> > > +F:     drivers/gpu/drm/renesas/rcar-du/
> > > +F:     drivers/gpu/drm/renesas/shmobile/
> > >  F:     include/linux/platform_data/shmob_drm.h
> > >
> > > +DRM DRIVERS FOR RENESAS RZ
> > > +M:     Biju Das <biju.das.jz@bp.renesas.com>
> > > +L:     dri-devel@lists.freedesktop.org
> > > +L:     linux-renesas-soc@vger.kernel.org
> > > +S:     Maintained
> > > +F:     Documentation/devicetree/bindings/display/renesas,rzg2l-du.ya=
ml
> > > +F:     drivers/gpu/drm/renesas/rz-du/
> > > +
> > >  DRM DRIVERS FOR ROCKCHIP
> > >  M:     Sandy Huang <hjc@rock-chips.com>
> > >  M:     Heiko St=C3=BCbner <heiko@sntech.de>
> >
> > Who's gonna maintain the common parts under drivers/gpu/drm/renesas/?
>
> At the moment, there is no common parts. But in future if we add common p=
arts,
> We need to update the entries here. It will be either the person who is g=
oing to add
> the common part or it will be a collaborative effort.

Oh there is:
Kconfig
Makefile

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
