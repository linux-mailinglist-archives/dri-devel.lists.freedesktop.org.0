Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF427B1DB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 18:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D8D89DF7;
	Mon, 28 Sep 2020 16:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C012F89DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 16:28:41 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68A562100A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601310521;
 bh=Eo8YEjouCJzF1yYSbOTSLRi6+NRp9wrcB5MtIkA8TCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AZ+elSJNS7jNx/5uNGRT4xca53om5Iz5t8ceN1+UDaeEUAm4QfDKNhZ51HYVQP7Tg
 duTODn7ql0pu+rSaIDfQbNE5uwyTEi088CU/pYJZr8/IhYzJvQBL/0bjkHQ7DXtTCZ
 brvEBHgLw9nKzZsnyKaJiyuTuYJinZhd3qfKGfY4=
Received: by mail-oi1-f172.google.com with SMTP id v20so1979590oiv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 09:28:41 -0700 (PDT)
X-Gm-Message-State: AOAM530S5g3kFWNDwJtzvPI8USYN5USRqYfodQd7TPUBVAVgvkSQHUoI
 HGxQmOPmWK6sraz6BqXNQZZZ0R2vhjaVBs3Oyw==
X-Google-Smtp-Source: ABdhPJxa2uMVpJWBoZg+SM+FBl4RJ9Um0uaAT5ECCXoQfXhOVrkAi/EDHDmDLmJOKu0hkbNfgXZBlR2mU8AeruFF828=
X-Received: by 2002:aca:fc07:: with SMTP id a7mr1401247oii.106.1601310520677; 
 Mon, 28 Sep 2020 09:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
 <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
 <20200928081726.hkh3rzbfr6m7jszt@gilmour.lan>
In-Reply-To: <20200928081726.hkh3rzbfr6m7jszt@gilmour.lan>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Sep 2020 11:28:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLUT9gBiVgSdcHM86vNLR_1MxEZ+x9MDBaFGdv2j9EtvA@mail.gmail.com>
Message-ID: <CAL_JsqLUT9gBiVgSdcHM86vNLR_1MxEZ+x9MDBaFGdv2j9EtvA@mail.gmail.com>
Subject: Re: [PATCH RFC v7 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Maxime Ripard <maxime@cerno.tech>, Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 3:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi!
>
> On Mon, Sep 28, 2020 at 02:27:35PM +0800, Kevin Tang wrote:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > The Unisoc DRM master device is a virtual device needed to list all
> > DPU devices or other display interface nodes that comprise the
> > graphics subsystem
> >
> > RFC v7:
> >   - Fix DTC unit name warnings
> >   - Fix the problem of maintainers
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../display/sprd/sprd,display-subsystem.yaml       | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> > new file mode 100644
> > index 0000000..9487a39
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc DRM master device
> > +
> > +maintainers:
> > +  - Kevin Tang <kevin.tang@unisoc.com>
> > +
> > +description: |
> > +  The Unisoc DRM master device is a virtual device needed to list all
> > +  DPU devices or other display interface nodes that comprise the
> > +  graphics subsystem.
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,display-subsystem
> > +
> > +  ports:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Should contain a list of phandles pointing to display interface port
> > +      of DPU devices.
>
> Generally speaking, driver-specific properties should be prefixed by the
> vendor name to avoid any conflict with generic properties (like the
> OF-Graph ports subnode in this case)

We try to avoid this virtual node altogether which I commented about
on v6 which was ignored.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
