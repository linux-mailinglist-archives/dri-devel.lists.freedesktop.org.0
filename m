Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5214977D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 20:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5071D6E8EF;
	Sat, 25 Jan 2020 19:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04226E8EF
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 19:39:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 356AC2002B;
 Sat, 25 Jan 2020 20:39:07 +0100 (CET)
Date: Sat, 25 Jan 2020 20:39:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: display: convert panel-dpi to DT
 schema
Message-ID: <20200125193905.GC31645@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-4-sam@ravnborg.org>
 <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=gEfo2CItAAAA:8
 a=wKNdQRUzjenphSg_WccA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=D0XLA9XvdZm18NrgonBM:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

On Tue, Jan 21, 2020 at 08:50:25AM -0600, Rob Herring wrote:
> On Mon, Jan 20, 2020 at 2:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > With panel-timing converted, now convert the single
> > remaining .txt user in panel/ of panel-timing to DT schema.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > ---
> >  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
> >  .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
> >  2 files changed, 71 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> 
> [...]
> 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > new file mode 100644
> > index 000000000000..4e19c1fd52c3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic MIPI DPI Panel
> > +
> > +maintainers:
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: panel-dpi
> > +    description:
> > +      Shall contain "panel-dpi" in addition to a mandatory panel-specific
> > +      compatible string defined in individual panel bindings. The "panel-dpi"
> > +      value shall never be used on its own.
> 
> Yet we have 3 cases where it is...
> 
> A 'minItems: 2' should be enough to catch these. Or do:

The above was a verbatim copy from another binding.
Thinking more about this I went with this:

  compatible:
    contains:
      const: panel-dpi
    description:
      Shall contain "panel-dpi" in addition to an optional panel-specific
      compatible string defined in individual panel bindings.
      "panel-dpi" can be used alone, thus no dedicated binding file
      is required for each and every panel.

So a DT file with:
panel@0 {
      compatible = "panel-dpi";
      ...
      panel-timing {
        ...
      };

Is in many cases enough - and then people do not have
to either cheat or wait until their panel is included in the kernel.
The panel market i big, and there are new panels each and every day.
With panel-dpi we can support the dumb panels that
do not require any special delays etc.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
