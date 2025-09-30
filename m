Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A4BAB70C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D208110E4BF;
	Tue, 30 Sep 2025 05:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CwOpqVFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913E10E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:03:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso35001085e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759208583; x=1759813383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GoR1B9T7V1pTFNhkgw0nIgS8ET98ouYhg1Jto8UVkhg=;
 b=CwOpqVFeP7tEwcyGsqe8lULOvnL+BekTRER+wyQQ2Ilrj0oCAducOFP5657IiRZZvx
 bVNlJkUnA0OgNRpiIJAP/ggzgztnIFwuO0nTfiUW5eo4yEVxi5nE3fuHAkL5tguQd+7W
 DZM3jHGuajSQBo/Wnc2fFf5WG2tpVHU+efmKokdxDQ0tEf14X2BGPDgb/xZ8S6ikIIaI
 CqYNdIaToooE+EPbeigojMfCn7+VH4F/FTrsedYKW/saMyUsKDex1F2SjvYmBp0tWpZH
 g2IUhoM2AqYk4PKL61vFo6RuLRqdS/gruVWM+a7nL0QgH0NTuaUBosmhL3GCT9f9jUoU
 6JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759208583; x=1759813383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GoR1B9T7V1pTFNhkgw0nIgS8ET98ouYhg1Jto8UVkhg=;
 b=IhJzfAbdRzLFtqyk3/ymtENHxIsqKIE5aT4IgrmkVJzHDo497gL9y77siWcGmG/MO8
 AriO6rOC5eGXJIkWGuOsmYrZNXP3H8h4ePk+xCJQXvs/mn/dkX9j5/tnVqB09DvKWD85
 DfOb/6xA9TaWI3jaKb5cl6/S27qxD6xpHwfe4ymPyG7poLSqLYpVW2JmDubff1HKrIbD
 yvaqMI3zeKwkKB6CBmE9OPqYAyY2hylu3AoAi0aHfxUO3sWwx+Y+vENublvBP+ciRlAa
 17yqIHsqzv46hDJNPvnsFxSzACmzl7O0D/Rv6QlPNX8ykZq9B9Lb2fQUHhYEEwKaXi2t
 ygBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuJE9JxSjcmMDiL3HChoCOKWn3VQEt2nZhQ3tEzeo90GGSEcJnmnFHBHfSSVmfSuInDKT4DDFoDDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg/krPYBgdwXCKsFHLI7+tglT1GbjlF3cV4CHYwVVAnsEe+/v+
 A0EbgF5XGfxKpzYnjf9Yyhiv1qyG+36/RKR8lCBzQquON80OE98FnNhLiW5OO+Hbt8M9OZmQ2h4
 KEV2KdI6vBGsWwHfDszGlh1CaW1pDC0M=
X-Gm-Gg: ASbGnctNIIOuiFva43u8io5hKdI/+qfNzNahv0jxQkzBMkg9qxLbaEqH95EqObjdpys
 5YYzbTI20ohk3cJWwPI5CmsNRFF1VJeC+E2zBcMWcV+XQ2KHbRg8UWvHzoXQRDlaU10qFITRPwc
 2++B6O9ntZj23I8r/Y87EnOySnLGs4FdvvAf90PYflVyiCxssC56LBf9MICwaXbfsDK5vRG8m1t
 R14x0ohKScldyQQwlb6iIyIMFKTHPzN
X-Google-Smtp-Source: AGHT+IHtCiLZWPd6YG0+/m8xv7WXlf4TjyLf87iKzlvK+SbdMSS/Y5iMogSqKCijOs1mMK9wjtjefb1nkSZHeV4XUX4=
X-Received: by 2002:a05:600c:3b12:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-46e4287ab48mr113132665e9.13.1759208583161; Mon, 29 Sep 2025
 22:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
In-Reply-To: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 30 Sep 2025 08:02:51 +0300
X-Gm-Features: AS18NWD95jSyp5Bl_nRLcKiZ6--BarGD38quBofBfUrmsZQ1NRrhf1Cuovt9_j8
Message-ID: <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

=D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:12 Doug=
 Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which=
 it
> > clearly is not. Address this by adding the proper schema for this panel=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
> >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> >  2 files changed, 60 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,=
ld070wx3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx=
3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > new file mode 100644
> > index 000000000000..0a82cf311452
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LG Corporation 7" WXGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: lg,ld070wx3-sl01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vdd-supply: true
> > +  vcc-supply: true
> > +
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - vdd-supply
> > +  - vcc-supply
>
> I suspect you'll get a NAK here because you're not preserving backward
> compatibility for existing device trees. While there can sometimes be
> reasons to do that, you'd need to provide a very strong justification.
>
>
> It seems like instead of breaking compatibility you could just have
> two supplies:
>
> * power-supply - The name for the "dvdd" supply.
> * avdd-supply - The name for the "avdd" supply.
>
> ...and then you make both of them not "required". Maybe you'd add some
> documentation saying that things might not work 100% correctly if they
> weren't provided but that old device trees didn't specify them?

Schema describes hardware. If it does not (and in this case it clearly
DOES NOT), then such schema should be adjusted according to hardware.
If there are any users of such binding, they should be adjusted too
(third commit of this patchset does exactly that). Panel datasheet is
explicit, panel has ONLY vdd supply and vcc supply, names are taken
from there too.
