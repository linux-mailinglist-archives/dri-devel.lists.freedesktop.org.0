Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DB91E69D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AFF10E4BD;
	Mon,  1 Jul 2024 17:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ckDzSmXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D45A10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:28:40 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-64b29539d87so28123387b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719854919; x=1720459719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSFG//zBVdEwBNZor3bRFSZ1DAICKTEQMxvdGgDsDzg=;
 b=ckDzSmXRfk1qccOFHFJFcWG2491dHNgEe5ZQ2DUiBHDJW+oHJnclopbbiE0LcFSQxg
 fkJNl1lWYaGHx8k/K+hh1FhgQdg4i4xBfRpOiFAEO0Zx8ae5hK2sMiWu+tT0XX2ZHab2
 HJug6vnLFlnn7n1LVk2DE316yHQcj1RKSqlell5rGHxYPd9dHYM7Wg913wc9vE4lkZLi
 qZT6l/1A28qFZxYOGidq9Z623NYjXqXiYkk478djnmDkJbqGU1jeZTgKAwmGF/o2WIzK
 jrzs4GBLs9mglS/R9dDwrEwjIaj/uuqy6oJiRBRnS2GFrWPyQTenO+PZNh0isXGa1K2u
 rCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719854919; x=1720459719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSFG//zBVdEwBNZor3bRFSZ1DAICKTEQMxvdGgDsDzg=;
 b=PniaiWDkofyAnYgvuiWdtoBf9Fz3KvUNgzppXk/cKJ1UK98XT+iIe+l4C4zPIc2Xsv
 y3aW+I5Slx0ZzzPg4PWOwjN/So15SqxgJ0hvmL03TEVtT4jdKXO6Jk9fjFu0prfRm6Xt
 8UuiBo1UJfi1FKjZrUdUFWgAuxvdLsSYQlOYumR6st3cdSVVUHty1gmIrWICUgtM9c31
 PeQFh3tc7CQvGrNbSFeq1uLxDx4lLn0f226WwWEl7WO7Jf/Bfei1twyS/ypMBuShMf/L
 sF2eEZkkWbmlIUOQ8bCDbsP7ZaevKbb1u7cOY+ibhb7Ok10MuUBGZWCncLB9Nx7df6AA
 QxJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVEfspTdXY5bE1ln6O3cG7XXflwiPPeJ+lW8JJBwEa6YJQQN1ka0amAG3QtaGiP4+VxUZydphXxqxTjHgJVuC/UvniQYicYhnuUWmw3Kyp
X-Gm-Message-State: AOJu0YxsNn6XhDJ+eNwA68EmktHYILs3nK9+Wvg5QfaigkKZ3fBrX9cS
 uYeZhl/ElERjv+hrlrwN8MMXAIhoDxWC1jwpQnqtPxGfC5WSv1rbrsTlAt6D0Z3+viaJTVA7zOZ
 WRvC4gHYlsYnBhcFe6+f8tavlnJM=
X-Google-Smtp-Source: AGHT+IElkx9e+9SmNKKpZqYLKl/8Op+trxRQwLoWcfOfV3aJ3GEVQeLtlKvkGD3+5XCP5ZKvVf9vFhbChNllOzfakV0=
X-Received: by 2002:a81:91ce:0:b0:62f:aa7b:7075 with SMTP id
 00721157ae682-64c72b5410dmr68732147b3.25.1719854919100; Mon, 01 Jul 2024
 10:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240628051019.975172-1-kikuchan98@gmail.com>
 <20240628051019.975172-2-kikuchan98@gmail.com>
 <20240628-splashy-slug-1d74e3fd9fe6@spud>
 <CAG40kxERY2r2cj58kjVMMg1JVOChRKraKYFo_K5C5fnx0g80Qw@mail.gmail.com>
 <20240630-babied-grill-13c840abb70a@spud>
In-Reply-To: <20240630-babied-grill-13c840abb70a@spud>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Tue, 2 Jul 2024 02:28:27 +0900
Message-ID: <CAG40kxHxnSNp1_4fX0fOWypLunPm-NnH1UEKZNQgM0g-Z1u1DQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
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

Hi Conor,

On Sun, Jun 30, 2024 at 11:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sat, Jun 29, 2024 at 05:26:56PM +0900, Hironori KIKUCHI wrote:
> > Hello Conor,
> >
> > Thank you for your reply.
> >
> > On Sat, Jun 29, 2024 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Fri, Jun 28, 2024 at 02:10:15PM +0900, Hironori KIKUCHI wrote:
> > > > The RG28XX panel is a display panel of the Anbernic RG28XX, a handh=
eld
> > > > gaming device from Anbernic. It is 2.8 inches in size (diagonally) =
with
> > > > a resolution of 480x640.
> > > >
> > > > This panel is driven by a variant of the ST7701 driver IC internall=
y,
> > > > confirmed by dumping and analyzing its BSP initialization sequence
> > > > by using a logic analyzer. It is very similar to the existing
> > > > densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> > > > register values, so add a new entry for the panel to distinguish th=
em.
> > > >
> > > > Additionally, the panel is connected via SPI instead of MIPI DSI.
> > > > So add and modify for SPI as well.
> > > >
> > > > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > > > ---
> > > >  .../display/panel/sitronix,st7701.yaml        | 69 +++++++++++++++=
++--
> > > >  1 file changed, 64 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/sitron=
ix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,s=
t7701.yaml
> > > > index b348f5bf0a9..835ea436531 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st77=
01.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st77=
01.yaml
> > > > @@ -20,21 +20,19 @@ description: |
> > > >    Densitron DMT028VGHMCMI-1A is 480x640, 2-lane MIPI DSI LCD panel
> > > >    which has built-in ST7701 chip.
> > > >
> > > > -allOf:
> > > > -  - $ref: panel-common.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      items:
> > > >        - enum:
> > > >            - anbernic,rg-arc-panel
> > > > +          - anbernic,rg28xx-panel
> > >
> > > Please no wildcards in compatibles - what is the actual model of this
> > > panel? I don't really want to see the model of the handheld here if
> > > possible.
> >
> > Well, the "RG28XX" is the actual product name of the device...
>
> Ah, I see. I didn't realise that.
>
> > Besides, there is no vendor name or model name on the panel; there is
> > no information at all.
> > Since the panel cannot be disassembled from the housing of the device,
> > I named it like this.
> >
> > >
> > > >            - densitron,dmt028vghmcmi-1a
> > > >            - elida,kd50t048a
> > > >            - techstar,ts8550b
> > > >        - const: sitronix,st7701
> > > >
> > > >    reg:
> > > > -    description: DSI virtual channel used by that screen
> > > > +    description: DSI / SPI channel used by that screen
> > > >      maxItems: 1
> > > >
> > > >    VCC-supply:
> > > > @@ -43,6 +41,13 @@ properties:
> > > >    IOVCC-supply:
> > > >      description: I/O system regulator
> > > >
> > > > +  dc-gpios:
> > > > +    maxItems: 1
> > > > +    description:
> > > > +      Controller data/command selection (D/CX) in 4-line SPI mode.
> > > > +      If not set, the controller is in 3-line SPI mode.
> > > > +      Disallowed for DSI.
> > > > +
> > > >    port: true
> > > >    reset-gpios: true
> > > >    rotation: true
> > > > @@ -57,7 +62,38 @@ required:
> > > >    - port
> > > >    - reset-gpios
> > > >
> > > > -additionalProperties: false
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            # SPI connected panels
> > > > +            enum:
> > > > +              - anbernic,rg28xx-panel
> > > > +    then:
> > > > +      $ref: /schemas/spi/spi-peripheral-props.yaml
> > >
> > > I'm not really keen on this. I'd rather see a different binding for t=
he
> > > SPI version compared to the MIPI ones. Is doing things like this comm=
on
> > > for panels? If it is, I'll turn a blind eye..
> >
> > This might be the first case that a driver supports both DSI and SPI
> > for a panel.
> > The panel can be either a DSI device or an SPI device.
>
> The commit message sounded like the panel was capable of doing SPI
> instead of DSI, is that not the case and the panel is actually capable
> of doing both, just happens to be connected as SPI in this particular
> device?

Sorry for the confusion.
I think it depends on what the "panel" refers to...
Although the "panel driver IC" (ST7701 variant) is capable of doing
both, the "panel assy" (including its cable) of the RG28XX only has an
SPI interface in its pinout.
If the compatible string "rg28xx-panel" represents the assy, then I
could say the "panel" only supports SPI, and the other panels only
support DSI.
But if it only represents a specific LCD panel and its driver IC with
control parameters, then it theoretically supports both, and it might
be sufficient to just include spi-peripheral-props, as in v1.
v1: https://lore.kernel.org/linux-kernel/20240618081515.1215552-2-kikuchan9=
8@gmail.com/

>
> > I'm not sure if this is the right way to represent it in the documentat=
ion...
> >
> > >
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          not:
> > > > +            contains:
> > > > +              # DSI or SPI without D/CX pin
> > > > +              enum:
> > > > +                - anbernic,rg-arc-panel
> > > > +                - anbernic,rg28xx-panel
> > > > +                - densitron,dmt028vghmcmi-1a
> > > > +                - elida,kd50t048a
> > > > +                - techstar,ts8550b
> > >
> > > This is all the compatibles in the file, so nothing is allowed to use
> > > dc-gpios? Why bother adding it?
> >
> > There are 3 types of connections that the driver supports: DSI, SPI
> > with D/CX pin, and SPI without D/CX pin.
> > Although most SPI panels don't have a D/CX pin, theoretically "SPI
> > with D/CX pin" exists.
> > So, it's just prepared for that.
> >
> > IMHO, once it's found, the list should be negated. List panels for SPI
> > with D/CX pin, instead.
>
> To be honest, I'd just delete this complication until something arrives
> that actually uses that pin.
>
> Cheers,
> Conor.

Best regards,
kikuchan.
