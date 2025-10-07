Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF361BC031B
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 07:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4E610E010;
	Tue,  7 Oct 2025 05:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ABX0dHBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E310E010
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 05:24:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso4262385f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 22:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759814658; x=1760419458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLnHbmNpMD4epIcKjnyPaJrpyCwbEXYNf6ehl6bEb60=;
 b=ABX0dHBdRkHXofCbPiegJC5vYzX2jBuDU/h3VOT9oE0C2DQlx1Os45HXKTIRVBfAsi
 d+niRNCVMg0cEK/YNs3trYfAegpJtZY4MaZmjrIVsnRJDAlHR6QGOk6O9eD1dBbxjxWw
 ncxIh0qBcV3vd788qK6yTXkM5wG0u5pB1Zdu6qUes8AgB7tSTqsdMPWW3y9TlC/nZCfT
 5qNV9KBphPxIsg9Pp5BWjFgfRNZA2T2D6mVanuCzQxudks/w8hymjnIeU8JL5nmLWDNe
 +KfOJZpHmrwkvWty69eFVHZsr6YKi/CjgqFuN3DvnK2fWQjq257DU4WHGlfo8LKx1Y6S
 ngJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759814658; x=1760419458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLnHbmNpMD4epIcKjnyPaJrpyCwbEXYNf6ehl6bEb60=;
 b=f8BqtSqJdcrevF4Kb09sQsY+RsAtQEJIwH6vi4avCkuwjxAhOT8adXYE1ZygL/lX5F
 PPkvlMSwAEg8PEXP+W54kKsUUaYpjRCfjQkfWVNlmrETsyu/7EK5pjWFWnGRszHQgfnb
 uL3Sl0+vRyt43PSc+2PJgxhTKXnnsERqlkZ3PiHiAlNQ7BcUbZOiNWO1t4Rt/7i5hJr7
 W1k0cMiYUYXtQYPfTA+WVgngKTHQOuXeWl9uSuxNOeY4WZdLX82xMf8/fIKS6qbS3eB1
 Psb/gw7V/zrUXb120lP061xlpHM5p7L/914BzuWBjsaYXYV3e8pFN45nxf1uwTz3ZNAR
 cH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtN6tBq4BxZomnwbuB6TS8JiGuj4khOck3fnIRLyV7nsYJ5/x0YxpugxOTJxwdtQgI8z3OzP/MsXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBfjijHy81A7UvaGuVK/snMJjRNibnrjUHgr70u1gVrUzPsUX+
 HnLPX68o1wltlUE4chqFDxJcPx82moIHB1iqTy/eOOqcyK4Rb+fJNWT34u/0KXNZwcbjdAA6QLC
 sIc3f8UH6z+T1Nw3LMp2/i2ma0gnqqsg=
X-Gm-Gg: ASbGnctjwoNIE5IFKhSl9LjOz/SCh7nUtliQaSxck4Hs7F4Bq4+hQib8Fg186ofxxXh
 s+Huk15B7c3EEVHWawHxZZs3JQ1lQSRMUyh6Age7XlhHeMqHEb43fN17zvIkrOFwQEBT1viH13M
 spkFm9kvu8rzGNYLh5pemlgWIqHu2Ry0vqU2djc2YjKgA5GW+m0nXNZkdvz/U/FrBSIzyrQTVy/
 UPOn6GVLzSs9NqE7uNdbnc0pr30Uzct
X-Google-Smtp-Source: AGHT+IEqm1Cnm5JSU8P7+erEx9aLkQi3brzS+KjxKcgqGgPXKaswgBRSqgdDnMzPTqldRk/rKa7ILjK4DFwNEE+3/5s=
X-Received: by 2002:a05:6000:24c4:b0:3f4:ad3f:7c35 with SMTP id
 ffacd0b85a97d-42582a0534bmr1024206f8f.27.1759814657634; Mon, 06 Oct 2025
 22:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
 <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
 <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
 <20251006221308.GA653118-robh@kernel.org>
In-Reply-To: <20251006221308.GA653118-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Oct 2025 08:24:06 +0300
X-Gm-Features: AS18NWDToXA58gus5hDUvN4FNyaQ6Lgn-00bI-Bbb3jdyK_JaChVX5A0PwIJW1E
Message-ID: <CAPVz0n0VfjW_=E9oM0FAhjqzAQnPXaL40gDqOsz2mwBaaA_0Fg@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Rob Herring <robh@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

=D0=B2=D1=82, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 01:13=
 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 02, 2025 at 02:35:42PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Sep 29, 2025 at 10:03=E2=80=AFPM Svyatoslav Ryhel <clamor95@gma=
il.com> wrote:
> > >
> > > =D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:1=
2 Doug Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@=
gmail.com> wrote:
> > > > >
> > > > > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel,=
 which it
> > > > > clearly is not. Address this by adding the proper schema for this=
 panel.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++=
++++++
> > > > >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> > > > >  2 files changed, 60 insertions(+), 2 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/pan=
el/lg,ld070wx3.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,l=
d070wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.=
yaml
> > > > > new file mode 100644
> > > > > index 000000000000..0a82cf311452
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3=
.yaml
> > > > > @@ -0,0 +1,60 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yam=
l#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: LG Corporation 7" WXGA TFT LCD panel
> > > > > +
> > > > > +maintainers:
> > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: panel-common.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: lg,ld070wx3-sl01
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  vdd-supply: true
> > > > > +  vcc-supply: true
> > > > > +
> > > > > +  backlight: true
> > > > > +  port: true
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - vdd-supply
> > > > > +  - vcc-supply
> > > >
> > > > I suspect you'll get a NAK here because you're not preserving backw=
ard
> > > > compatibility for existing device trees. While there can sometimes =
be
> > > > reasons to do that, you'd need to provide a very strong justificati=
on.
> > > >
> > > >
> > > > It seems like instead of breaking compatibility you could just have
> > > > two supplies:
> > > >
> > > > * power-supply - The name for the "dvdd" supply.
> > > > * avdd-supply - The name for the "avdd" supply.
> > > >
> > > > ...and then you make both of them not "required". Maybe you'd add s=
ome
> > > > documentation saying that things might not work 100% correctly if t=
hey
> > > > weren't provided but that old device trees didn't specify them?
> > >
> > > Schema describes hardware. If it does not (and in this case it clearl=
y
> > > DOES NOT), then such schema should be adjusted according to hardware.
>
> The priority is:
>
> 1) ABI
> 2) describe h/w accurately
>
> IMO, if there are 2 rails on the h/w and you have 2 supplies in the DT,
> then you have described the h/w. names are less important.
>
> > > If there are any users of such binding, they should be adjusted too
> > > (third commit of this patchset does exactly that). Panel datasheet is
> > > explicit, panel has ONLY vdd supply and vcc supply, names are taken
> > > from there too.
> >
> > I'm more than happy to defer to DT people on this, but the general
> > argument is that "device tree" is supposed to remain forever forward
> > compatible. In other words, someone could have taken a snapshot of the
> > "tegra114-tn7.dts" device tree at any point in time and then shipped
> > it in some BIOS. Presumably the old "tegra114-tn7.dts" (for some
> > reason) managed to init the panel properly in the past and the idea is
> > that there should still be a way to init the panel with the old device
> > tree now.
> >
> > Obviously, that's an ideal version of the world and sometimes
> > hard/impossible to make a reality, but it's supposed to be what we
> > strive for.
> >
> > >From a more practical standpoint, the dts changes and code changes
> > will go through different trees and so making them mutually depend on
> > each other can leave people broken if they happen to have one patch
> > but not the other.
> >
> > I suppose one way to handle this (if DT people like it) is to keep the
> > bindings the way you have it but then add some layer of backward
> > compatibility in the driver. It will mean that anyone with the old DTS
> > would officially not "validate" properly against the new bindings, but
> > I think that could be OK as long as it was explicitly mentioned in the
> > commit message. Obviously, though, DT bindings reviewers would have
> > the last word there...
>
> That's fine, but then I prefer we keep 'power-supply' as deprecated.
> Then if we ever validate that drivers only use documented properties,
> it would pass. We already check drivers use documented compatible
> strings, so that wouldn't be too hard to do.
>

Sure, but ATM there is only one user of this compatible in the
mainline Linux kernel, which is Nvidia tablet Tegra Note 7 and:

1. Node used in its tree is addressed in the third commit of this patchset
2. Its panel is broken anyway since it cannot init properly if
bootloader does not leave a pre-inited panel, it cannot suspend
properly and it has a loose regulator which relies on always-on
property rather then being hooked to the panel.

I can assure you that besides me there seems to be no one interested
in this tablet.

> Rob
