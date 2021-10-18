Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B44327CC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 21:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0333B6EA61;
	Mon, 18 Oct 2021 19:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED1E6EA61
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 19:38:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 412EA6112D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634585930;
 bh=+lafo2T6te+gWjhQBzL22he7ufSIIGdZoxOzENsqwDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eGK0/TbLbnoujKvIEa7VC0lEMtD5yVvLFBOPN36A99fIZ7hmq0x98VGtd27xZH7Du
 ATmX9rMY6Zt0qb+WTTG+dlMm+KKt6PGy6Luw0Kn8oWzUUb134EpgYPRs4YpjdIWnto
 TnhfnoE1BSy87Md6OiSQoX/QIMWbCHiHVy2GUQ6i08Y+0DRCGItuhLx6jJXVafkxru
 OoU3WyEuJT9WpfYfBrXasxPglRzW8TQaLiSYf5wtWVYj78AGV6Phqw7+IeItFFB7VT
 Oo0QoKJ6YiMBdwKGmCPPboXW0p6oPbsFRuyVMkoMviZheBJ5rMjE9U2TLkAQhF/SGs
 Oo7xETBNc90MQ==
Received: by mail-ed1-f54.google.com with SMTP id y30so2687479edi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 12:38:50 -0700 (PDT)
X-Gm-Message-State: AOAM5325zTgUG7nC6ivf/X7WN4dhop/ayNByqVm3kL5QzbWPyhvV2V/7
 W4VXFfzdzY1G1yR96sFTs7DeR0/KwFSiYboOAA==
X-Google-Smtp-Source: ABdhPJzGdFAfWjzAMWuADPM5EPYzjfE9/sFvO9OlTDhrOb2mbL6H+KG2sXfvp8vOCsyn0d1W4fqaY0LBzO34Ejzirnc=
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr46194930edb.318.1634585925034; 
 Mon, 18 Oct 2021 12:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <YWTaJOXGgF2bHznv@robh.at.kernel.org> <20211018141908.fuevv2m66fw3xg36@blmsp>
In-Reply-To: <20211018141908.fuevv2m66fw3xg36@blmsp>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Oct 2021 14:38:33 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
Message-ID: <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Oct 18, 2021 at 9:19 AM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 11, 2021 at 07:43:16PM -0500, Rob Herring wrote:
> > On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> > > This controller is present on several mediatek hardware. Currently
> > > mt8195 and mt8395 have this controller without a functional difference,
> > > so only one compatible field is added.
> > >
> > > The controller can have two forms, as a normal display port and as an
> > > embedded display port.
> > >
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > ---
> > >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > new file mode 100644
> > > index 000000000000..f7a35962c23b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek Display Port Controller
> > > +
> > > +maintainers:
> > > +  - CK Hu <ck.hu@mediatek.com>
> > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the Mediatek (embedded) Display Port controller
> > > +  present on some Mediatek SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8195-edp_tx
> > > +      - mediatek,mt8195-dp_tx
> >
> > Are these blocks different?
>
> Good point, the registers of these blocks are described in its own
> chapter each. Also I do need to distinguish between both in the driver.
> Would you suggest making this distinction differently or keep it as two
> compatibles?

If the registers are all the same, then it should be the same
compatible. If you still need to distinguish, then you should have a
panel or connector node that will let you do that.

Also, s/_/-/ in the compatible string.

Rob
