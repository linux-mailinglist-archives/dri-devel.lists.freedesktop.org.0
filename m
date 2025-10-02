Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3078BB57BD
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 23:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC4810E853;
	Thu,  2 Oct 2025 21:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LznnMPYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65010E853
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 21:36:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b556284db11so1447781a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759440957; x=1760045757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tb5ZhFKHgn3PI0RL+wA56er2lYPRbzxVlrU7xzkMbM=;
 b=LznnMPYoBjTCLpu+P9wm4DMRZKf0Q8uw+mRN0iEs63H+l1woTXWpRraI0rKJ8Aft0S
 HY/QbPWbpKoYEaQjlm56s338HjTDtobe8Uw+r1h0VRpwAtb+mmoU5ySGzV4mA/+rrU6X
 uekeWOugfSLBVKCyEPB0oGH7aYwEnlMv8n96I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759440957; x=1760045757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tb5ZhFKHgn3PI0RL+wA56er2lYPRbzxVlrU7xzkMbM=;
 b=PpKGMef0bBGfBLR0kMNP5usb6bum3BpcJxh07Y46rlO054nP+WxFqo0pkBSsRNtJzH
 ALWdeb3yb2E+WpnW0myKsb66vabUV0fyGpoAip0M7k49rYnwtgBIJvMOtZBdAf2T1oPZ
 x8Iss5GmH5hdxKO7HQ6VKyloVOqr7qJwhD6HdhU2r/FLAO9EhB8n9EsrVt9Uo98dI1mg
 pMRXBx1W9QGZWIXhErH51f1JEuLR3QHefsfktNewIO29p+IEgAu0FwZOJ0sq3I+RFani
 VaFfQJCx/ztiX2HfePnjy9s7gBt/3U0LFDNmzCeHdSmaBcszcG5p01LGLIe7K2m6TwQM
 u9/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc67ukN9700I6GDEdAJC+M1V+j+QBFLme8gqGSL6EKfPK0O9sL3mm+c1hzeYYYfFrkvlh7Xook24g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBY8eRzvkq4+zK8a39bM9E/jsvDqn72Xuzmn7M5A518FsIGWLC
 72Zz/jOiDvcyolE55ydlILQ963Xt1toenoYhgbbu6FlZ+Ibh1NLIOMvOOsp7xTFbgc4e4BR3aC7
 FRqU=
X-Gm-Gg: ASbGncsY/5nsSOQm+I3lVsqwpYeXtZxAG66nbWNtM/ZxRUv+VpjVo2UCa/TsOkyO8wC
 aMaFhLK0n+C8MyOVRYl+WY2n1rWBfT7dtGnzKmNB29Z72iPY2z2QpOGQXrwkTA02M7AjrdIoQki
 DVOUXL9zyhoSUxVn3rCx8FMzggo+m96lhxt2CMn/wm4xl29+xbzILzEH+FDauhxQ8DJKrIN4exu
 pAd1aSE+Vyd5TbMtI0tCojo3r11CTy/qmtRDsQWGSs6joLk0KkQPiMN4vIdGS62IVVBAFMW5l8Z
 fg4d5Bn7FDqNQpj1nh+EgPuzxtCjzcqaa3XZPkUAktDVdbKw+KdjFMsc4/0iM8xUKswjS9ox9QR
 PPXKzSpWTjPnX005lqTizLBWalAh+dW1up/6FMCJR75MQV4UC3wWPyDd+QUDzl3FFB+luXdojzk
 maRuD1RLfxiPE/kozC0mXnZDXh
X-Google-Smtp-Source: AGHT+IF0ZU3oU37IOghtuLwtcUbXC6BDitcgX7xxsBlcFw41a6KEPdmuxctpa2AByL6gyd5LsmMU1g==
X-Received: by 2002:a17:903:198b:b0:269:a4ed:13c9 with SMTP id
 d9443c01a7336-28e9a693f79mr6570105ad.30.1759440957012; 
 Thu, 02 Oct 2025 14:35:57 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d584esm29616945ad.107.2025.10.02.14.35.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 14:35:55 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-269639879c3so13037525ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkcorjqZieYcAcaaaRxlJJd3QFOlp+OL1YiuFvWRgG4VhFkWpAxcKeL3Xe1GVTaDQTzaWEUKbJuqo=@lists.freedesktop.org
X-Received: by 2002:a17:902:ebca:b0:265:604c:17e7 with SMTP id
 d9443c01a7336-28e9a6ff040mr7217865ad.60.1759440954340; Thu, 02 Oct 2025
 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
 <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
In-Reply-To: <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 14:35:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
X-Gm-Features: AS18NWCyCoeGl8UyyLw_R0kuFN-88oe-Wi6XpVX99MGsfcmrycek7SZgv1oi908
Message-ID: <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
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

Hi,

On Mon, Sep 29, 2025 at 10:03=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> =D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:12 Do=
ug Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmai=
l.com> wrote:
> > >
> > > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, whi=
ch it
> > > clearly is not. Address this by adding the proper schema for this pan=
el.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++=
++
> > >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> > >  2 files changed, 60 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/l=
g,ld070wx3.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070=
wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > new file mode 100644
> > > index 000000000000..0a82cf311452
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yam=
l
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LG Corporation 7" WXGA TFT LCD panel
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: lg,ld070wx3-sl01
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  vdd-supply: true
> > > +  vcc-supply: true
> > > +
> > > +  backlight: true
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - vdd-supply
> > > +  - vcc-supply
> >
> > I suspect you'll get a NAK here because you're not preserving backward
> > compatibility for existing device trees. While there can sometimes be
> > reasons to do that, you'd need to provide a very strong justification.
> >
> >
> > It seems like instead of breaking compatibility you could just have
> > two supplies:
> >
> > * power-supply - The name for the "dvdd" supply.
> > * avdd-supply - The name for the "avdd" supply.
> >
> > ...and then you make both of them not "required". Maybe you'd add some
> > documentation saying that things might not work 100% correctly if they
> > weren't provided but that old device trees didn't specify them?
>
> Schema describes hardware. If it does not (and in this case it clearly
> DOES NOT), then such schema should be adjusted according to hardware.
> If there are any users of such binding, they should be adjusted too
> (third commit of this patchset does exactly that). Panel datasheet is
> explicit, panel has ONLY vdd supply and vcc supply, names are taken
> from there too.

I'm more than happy to defer to DT people on this, but the general
argument is that "device tree" is supposed to remain forever forward
compatible. In other words, someone could have taken a snapshot of the
"tegra114-tn7.dts" device tree at any point in time and then shipped
it in some BIOS. Presumably the old "tegra114-tn7.dts" (for some
reason) managed to init the panel properly in the past and the idea is
that there should still be a way to init the panel with the old device
tree now.

Obviously, that's an ideal version of the world and sometimes
hard/impossible to make a reality, but it's supposed to be what we
strive for.

From a more practical standpoint, the dts changes and code changes
will go through different trees and so making them mutually depend on
each other can leave people broken if they happen to have one patch
but not the other.

I suppose one way to handle this (if DT people like it) is to keep the
bindings the way you have it but then add some layer of backward
compatibility in the driver. It will mean that anyone with the old DTS
would officially not "validate" properly against the new bindings, but
I think that could be OK as long as it was explicitly mentioned in the
commit message. Obviously, though, DT bindings reviewers would have
the last word there...

-Doug
