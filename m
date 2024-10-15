Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29599F691
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355FB10E5FB;
	Tue, 15 Oct 2024 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TtFcaoR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45CC10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C72B5A43564
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEE6C4CECF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729018699;
 bh=ZjqiGp0bj+NvwU7B6mmFLsuKUZkeVnU+4eHPsa2EBzE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TtFcaoR+aVP+J0hnIJgtQ3lqio6ivLPFln1dEkOCWhenXo8hSjQ0IlhEoZXbzzgKi
 WzKul87p6iZhQoM4MicGkvQcDo67RBYSmRxt6bYbqCzm+wuadF41c0ryWxDKLhD1hT
 bFpg+Sf+7jnkDYBxHYVPJ+MKgfXfkDHTZNXUb1fpy80O0lO2cJJoesoLrghPJpFOXV
 ehbkSxdsODL026a5SgEnXDLuvlAC+zE50eL5QQw6AKueNmt88CUO+9ctdICxe3k3C3
 +rv/vzJRJnwMK/y9KBk/sOPrpW7fh2QKPKyD2Vp7H/Eu0grduCLs321M72Lkn3atx9
 s2YILATZdB42A==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so6831960e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDH54/eDp2jwEs9EIUSAh4sC8WKbjZawK4JkLea1hxpRXV1xN9Jacugp7V9NK+AtQqxg9Vc8/7QQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOSm7BI0KiNC0VrYvkfSOldwCbPhEnzHI5fdJG0bROxMzqOqLx
 gqTkLXEqWsZMDGYe2QM2FRNqZkiz+ZlVq66+xg4DTsaPBTTMAQT7/q1eGmNP+he1WHn9W36AobO
 OdHu+VkgnWGTvaX47ppWl000uzQ==
X-Google-Smtp-Source: AGHT+IHkkm5bMw4k3U4hArlnSreaKl/mJGb5HPD1RKkpSUkGXrbr0rml8iZfYZLX59yuK1lgj1Fv5ddxye3/AwhrWkU=
X-Received: by 2002:a05:6512:e85:b0:539:ec29:1cc3 with SMTP id
 2adb3069b0e04-53a03f2da18mr1016189e87.30.1729018697767; Tue, 15 Oct 2024
 11:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
In-Reply-To: <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2024 13:58:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLK_90n0xnrwDAymLyF5uKPqmfjg0XBU-1DSrWRi35ziQ@mail.gmail.com>
Message-ID: <CAL_JsqLK_90n0xnrwDAymLyF5uKPqmfjg0XBU-1DSrWRi35ziQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Liu Ying <victor.liu@nxp.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be, 
 arnd@arndb.de, nfraprado@collabora.com, o.rempel@pengutronix.de, 
 y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
 biju.das.jz@bp.renesas.com
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

On Mon, Oct 14, 2024 at 5:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On 10/14/2024, Dmitry Baryshkov wrote:
>
> [...]
>
> >>>>> My suggestion would be to add a single root-level property which
> >>>>> specifies which port provides even pixel data.
> >>>>
> >>>> That won't work.  The LVDS source side expects the ports of
> >>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
> >>>
> >>> I didn't notice that these properties are already defined.
> >>>
> >>> As these properties are common between several schema files, please
> >>> extract them to a common schema file (like lvds.yaml).
> >>
> >> I'm not sure how to do that. Is it obvious?
> >> Please shed some light.
> >>
> >> Only two panel schema files are defining even/odd pixels now -
> >> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> >> Maybe, extract them later when more schema files(especially for
> >> bridges) try to define the same?  I'd like to keep a low profile
> >> for now.
> >
> > I'd say, please extract those now. Adding third is more than enough and
> > should be avoided. Extracting is pretty simple. One patch to move the
> > definition and descriptions from panel-simple-lvds-dual-ports to a
> > common location (e.g. lvds-dual-ports.yaml). Leave the required
> > constrains in place. Second patch is to add oneOf constraints to the
> > ports.
>
> oneOf just sits below ports so that single-port and dual-port
> are documented separately?  That won't pass dt_binding_check
> as the v1 binding has proved that warnings will be generated.
>
> > port@0 might get the same oneOf + the
> > dual-lvds-{odd,even}-pixels:false case, allowing a single-port
> > definition.
>
> I don't catch this.
> Below snippet is a draft lvds-dual-port.yaml.

Please make panel-simple-lvds-dual-ports.yaml use this.

> How can it be referenced in ite,it6263.yaml?
>
> ---8<---
> allOf:
>   - $ref: lvds.yaml#
>
> properties:
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/$defs/port-base
>         unevaluatedProperties: false
>         description: the first LVDS input link
>
>         properties:
>           dual-lvds-odd-pixels:
>             type: boolean
>             description: the first sink port for odd pixels
>
>           dual-lvds-even-pixels:
>             type: boolean
>             description: the first sink port for even pixels
>
>         oneOf:
>           - required: [dual-lvds-even-pixels]
>           - required: [dual-lvds-odd-pixels]
>
>       port@1:
>         $ref: /schemas/graph.yaml#/$defs/port-base
>         unevaluatedProperties: false
>         description: the second LVDS input link
>
>         properties:
>           dual-lvds-even-pixels:
>             type: boolean
>             description: the second sink port for even pixels
>
>           dual-lvds-odd-pixels:
>             type: boolean
>             description: the second sink port for odd pixels
>
>         oneOf:
>           - required: [dual-lvds-even-pixels]
>           - required: [dual-lvds-odd-pixels]
>
>     required:
>       - port@0
>       - port@1
>
> unevaluatedProperties: false
> ---8<---
>
> --
> Regards,
> Liu Ying
>
