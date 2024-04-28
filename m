Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A528B4A18
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 08:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549D110E73D;
	Sun, 28 Apr 2024 06:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mmGd2FA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40F910E73D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 06:12:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6f2f6142d64so3298138b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 23:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714284753; x=1714889553;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rACQzxSZl48k0N9zEquIXjlaBzjvzWp9s0fZvg9+UtE=;
 b=mmGd2FA7O0Gbyw0MeNwUPDoMGJu4E2IpDR/8R6UsiDgIaeOgaJc8MH59YiZpBEJF9+
 GD3k5yfU07X58k7p5YRmoGelTuYb0eub8DEPbwKWQadJjOdAPTlI0wuImwHFfH395Q8e
 8/4sqXE8Hu9xBpDXfRhDNgu2l4Rj6d9p9/xgmCXzKesAM/5fnP1mZ7FPpkxL025a1y2/
 3Dh8/1fUtnAwuEyhe+QPiPofIJ6B5gv3jN/tKbKF7FkTWx/QWqNfl0WP5Lubb8LiEywS
 +IiNBioSSa3pMQyO0vXAf5biyyAcHQnXDzw6bnGnOXevWunjnh71H1/Yp95AmbCMRtP/
 lkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714284753; x=1714889553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rACQzxSZl48k0N9zEquIXjlaBzjvzWp9s0fZvg9+UtE=;
 b=SSvn4JXnaZklN02k2OaZlgThTl+aqSF3TBNq1JJsczK+GjtMmzasmN2RYPclKVGjZP
 vtSh3X/M/ghla3wHkbtSPOsdjZ5o/SIre7wQcNuYIGgcUD/ENSedWTr54f+NrhnI1i9z
 5NiH7xJ5LYY0xFClV0YS9UsRGcZqDqJkr6LoHDURWxa/cshQncyX+PME8bs1T3eroCnc
 O7LjMo+OP5otFn0fnaPYl/IO+H7ZOwBgvAa5/Az+Imd4ZMhrHYpfOyPpo5EahsRpMw80
 hlnTKQF24H/UjznIif/gilN2gJ02T1ybb+eGkFcfZNoGNUO5ULLa/kLiWD+H4soqe+LJ
 Vrgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK4ee23mzIPtYqtBOxNJdHe35w4Ri0wVv8vchWwmLRWqsfXad5DhaF6lWxSUjIJE5KYj6NabKU9Zy5dWQlm2j1XyW9UpQlENqYJu3bsWrM
X-Gm-Message-State: AOJu0YwBugoBjrrAp8zIKwMCRjjbATi2QT72QXMOZASfRZi1DFRT7M41
 9qmAfpj/FcHNTF9yySM2J1G1r8c1TksZCmjtZWcG9EX+7JV01llekSBTBjcXrX8+3Hq6xFebDIg
 f9plgU84kSe5Zxwl02UPk1hZlw+Iw3QkMEI8h9w==
X-Google-Smtp-Source: AGHT+IG7wEVRyUSjjFaWLzerPlnVDWJzSGQolHizu0dCLmKzBNjm+Fj+yU3XZ3TJA7fFCdtI8QFwEAY1mwmLbbxp/Jk=
X-Received: by 2002:a05:6a20:d492:b0:1af:36df:5159 with SMTP id
 im18-20020a056a20d49200b001af36df5159mr4309888pzb.59.1714284752885; Sat, 27
 Apr 2024 23:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com>
 <20240424-spelling-float-9b881cb80992@spud>
 <CAHwB_NLb9ENfCj-oJ2mV_DwFJ0h6TGSi1byUdd6Bri3gDsCo5Q@mail.gmail.com>
 <20240426-fifteen-random-ff4a535ab40d@spud>
In-Reply-To: <20240426-fifteen-random-ff4a535ab40d@spud>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Sun, 28 Apr 2024 14:12:21 +0800
Message-ID: <CAHwB_NKHsDUarG8ozQ9N_ABBkgSv_sti6HUcyYtSNBVS4n2Tvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
To: Conor Dooley <conor@kernel.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, linus.walleij@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

Hi,

Conor Dooley <conor@kernel.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8827=E6=97=A5=
=E5=91=A8=E5=85=AD 01:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Apr 25, 2024 at 02:03:24PM +0800, cong yang wrote:
> > Conor Dooley <conor@kernel.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=9B=9B 00:55=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Apr 24, 2024 at 10:30:04AM +0800, Cong Yang wrote:
>
> > > > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102=
.yaml
> > >
> > > Filename matching a compatible please. What you've done here makes it
> > > seem like there's a fallback compatible missing, given this looks lik=
e
> > > the LCD panel controller and the starry compatible below is an LCD pa=
nel.
> >
> > So change the filename to starry,himax83102-j02.yaml?
>
> IDK chief, are you missing a fallback or not?

Ohn, I see.  Like this. Thanks.

properties:
  compatible:
    items:
      - enum:
          - starry,himax83102-j02
      - const: himax,hx83102

>
> >
> > >
> > > > @@ -0,0 +1,73 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yam=
l#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Himax HX83102 MIPI-DSI LCD panel controller
>
> Because the title here makes it seem like there should be.
>
> > > > +maintainers:
> > > > +  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> > > > +      - starry,himax83102-j02
> > > > +
> > > > +  reg:
> > > > +    description: the virtual channel number of a DSI peripheral
> > > > +
> > > > +  enable-gpios:
> > > > +    description: a GPIO spec for the enable pin
> > > > +
> > > > +  pp1800-supply:
> > > > +    description: core voltage supply
> > > > +
> > > > +  avdd-supply:
> > > > +    description: phandle of the regulator that provides positive v=
oltage
> > > > +
> > > > +  avee-supply:
> > > > +    description: phandle of the regulator that provides negative v=
oltage
> > > > +
> > > > +  backlight:
> > > > +    description: phandle of the backlight device attached to the p=
anel
> > >
> > > I'm not sure why this was given a description when port or rotation
> > > was not.
> >
> > So change it to backlight: true ?
>
> Sure? It is just a repeat of something already described in
> panel-common.
