Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E911BBFA4F
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C8610E161;
	Mon,  6 Oct 2025 22:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bOgZx/Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B310510E161
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 22:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B536E6118A;
 Mon,  6 Oct 2025 22:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E24BC4CEF5;
 Mon,  6 Oct 2025 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759788789;
 bh=lIZKgLMniEnisfyXutpns8WCcOXHJQ4ZpCkUFUyy4gQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bOgZx/Uo5U9Za44Jdifn+4OZRvhMXRfgiynKtMt0lfi97IF0Mtvj21TFBmYm+nl3C
 wRJq4U/ZmlNMAZssNRQWS7ofrqhAA6joUVIYhkiDiVeiTnG7Jj8AqOgOW0r+YYTNg/
 Bw/pWpjDGkcZdx052IpIumB0nGB7ohX3M/01f2AzEYodUBGY9PxE9lAKkMFEHUhLat
 lifbv9uKtfWiMa4OBffuqMQLrc2I+xa1LWw8E8mfjjm8PD4qoEtG/+hL9Aej8FHkKS
 IZd/JYW4/gLwhTKTVp1i77d996WDfAnwiooSqzKFBY+N3VuaBVjFk3GSJKNvaIrWE7
 KGXMSKmdlPTSg==
Date: Mon, 6 Oct 2025 17:13:08 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Message-ID: <20251006221308.GA653118-robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
 <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
 <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
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

On Thu, Oct 02, 2025 at 02:35:42PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 29, 2025 at 10:03 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> >
> > вт, 30 вер. 2025 р. о 06:12 Doug Anderson <dianders@chromium.org> пише:
> > >
> > > Hi,
> > >
> > > On Mon, Sep 29, 2025 at 7:25 AM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > > >
> > > > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
> > > > clearly is not. Address this by adding the proper schema for this panel.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
> > > >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> > > >  2 files changed, 60 insertions(+), 2 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > > new file mode 100644
> > > > index 000000000000..0a82cf311452
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: LG Corporation 7" WXGA TFT LCD panel
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: lg,ld070wx3-sl01
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  vdd-supply: true
> > > > +  vcc-supply: true
> > > > +
> > > > +  backlight: true
> > > > +  port: true
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - vdd-supply
> > > > +  - vcc-supply
> > >
> > > I suspect you'll get a NAK here because you're not preserving backward
> > > compatibility for existing device trees. While there can sometimes be
> > > reasons to do that, you'd need to provide a very strong justification.
> > >
> > >
> > > It seems like instead of breaking compatibility you could just have
> > > two supplies:
> > >
> > > * power-supply - The name for the "dvdd" supply.
> > > * avdd-supply - The name for the "avdd" supply.
> > >
> > > ...and then you make both of them not "required". Maybe you'd add some
> > > documentation saying that things might not work 100% correctly if they
> > > weren't provided but that old device trees didn't specify them?
> >
> > Schema describes hardware. If it does not (and in this case it clearly
> > DOES NOT), then such schema should be adjusted according to hardware.

The priority is:

1) ABI
2) describe h/w accurately

IMO, if there are 2 rails on the h/w and you have 2 supplies in the DT, 
then you have described the h/w. names are less important.

> > If there are any users of such binding, they should be adjusted too
> > (third commit of this patchset does exactly that). Panel datasheet is
> > explicit, panel has ONLY vdd supply and vcc supply, names are taken
> > from there too.
> 
> I'm more than happy to defer to DT people on this, but the general
> argument is that "device tree" is supposed to remain forever forward
> compatible. In other words, someone could have taken a snapshot of the
> "tegra114-tn7.dts" device tree at any point in time and then shipped
> it in some BIOS. Presumably the old "tegra114-tn7.dts" (for some
> reason) managed to init the panel properly in the past and the idea is
> that there should still be a way to init the panel with the old device
> tree now.
> 
> Obviously, that's an ideal version of the world and sometimes
> hard/impossible to make a reality, but it's supposed to be what we
> strive for.
> 
> >From a more practical standpoint, the dts changes and code changes
> will go through different trees and so making them mutually depend on
> each other can leave people broken if they happen to have one patch
> but not the other.
> 
> I suppose one way to handle this (if DT people like it) is to keep the
> bindings the way you have it but then add some layer of backward
> compatibility in the driver. It will mean that anyone with the old DTS
> would officially not "validate" properly against the new bindings, but
> I think that could be OK as long as it was explicitly mentioned in the
> commit message. Obviously, though, DT bindings reviewers would have
> the last word there...

That's fine, but then I prefer we keep 'power-supply' as deprecated. 
Then if we ever validate that drivers only use documented properties, 
it would pass. We already check drivers use documented compatible 
strings, so that wouldn't be too hard to do.

Rob
