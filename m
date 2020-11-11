Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EE2AF23A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 14:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2D389FF9;
	Wed, 11 Nov 2020 13:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2876489FF9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 13:35:13 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E63F2087D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605101712;
 bh=GaQU9rM+P1s6S9ioMaD8ODMJuqhbgzej2Pwn224DULs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l9eP4xo3Dt8JIOzkI5XJDqS3pK0+YVQyYhIozCNMEA3Gxkl5kej27O0hDjPW6Wqes
 CXOSZ2UMDqAyXLSs7b0baDYs3ZyECh0yu0WFFWzqzJGzEtdcs4LcVPrUnXxTIxGvmG
 ME90S0lMZhMrHhDKmc33RrqkFn+8w+rI8twiPWDY=
Received: by mail-oi1-f179.google.com with SMTP id w145so2156711oie.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 05:35:12 -0800 (PST)
X-Gm-Message-State: AOAM533KftdV56DdSlWU5E7yFV2hJXbOuOhdbIv9dJWYYjPlJJtlUVeo
 kPvter1AXIiwV4MXVCiAWr4LMwMbg+zq4ejr8w==
X-Google-Smtp-Source: ABdhPJwVxej4pSf3XECc4BzNRNQ7R9EtApnK/+4WVvKLOte9oPRPUUpShUa/ZyNa7yt2H/HctrZNL9nqRvPr3bSejyo=
X-Received: by 2002:aca:fdd4:: with SMTP id b203mr2177696oii.152.1605101711667; 
 Wed, 11 Nov 2020 05:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-2-robh@kernel.org>
 <4185c162-8a71-7402-f46e-4a2495f152f2@nvidia.com>
In-Reply-To: <4185c162-8a71-7402-f46e-4a2495f152f2@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Nov 2020 07:35:00 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3_R9G=Lk4F3DMNgh4EhG_qsv1+HM2HgQOm+ePE4=hFA@mail.gmail.com>
Message-ID: <CAL_Jsq+3_R9G=Lk4F3DMNgh4EhG_qsv1+HM2HgQOm+ePE4=hFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
To: Sameer Pujar <spujar@nvidia.com>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 3:52 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
> Hi Rob,
>
> > From: Sameer Pujar <spujar@nvidia.com>
> >
> > Convert device tree bindings of graph to YAML format. Currently graph.txt
> > doc is referenced in multiple files and all of these need to use schema
> > references. For now graph.txt is updated to refer to graph.yaml.
> >
> > For users of the graph binding, they should reference to the graph
> > schema from either 'ports' or 'port' property:
> >
> > properties:
> >    ports:
> >      type: object
> >      $ref: graph.yaml#/properties/ports
> >
> >      properties:
> >        port@0:
> >          description: What data this port has
> >
> >        ...
> >
> > Or:
> >
> > properties:
> >    port:
> >      description: What data this port has
> >      type: object
> >      $ref: graph.yaml#/properties/port
> >
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v3:
> >   - Move port 'reg' to port@* and make required
> >   - Make remote-endpoint required
> >   - Add 'additionalProperties: true' now required
> >   - Fix yamllint warnings
> >
> >   Documentation/devicetree/bindings/graph.txt  | 129 +-----------
> >   Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
> >   2 files changed, 200 insertions(+), 128 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/graph.yaml
> >
> ...
> > diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> > new file mode 100644
> > index 000000000000..b56720c5a13e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/graph.yaml
> > @@ -0,0 +1,199 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/graph.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for device graphs
> > +
> > +description: |
> > +  The hierarchical organisation of the device tree is well suited to describe
> > +  control flow to devices, but there can be more complex connections between
> > +  devices that work together to form a logical compound device, following an
> > +  arbitrarily complex graph.
> > +  There already is a simple directed graph between devices tree nodes using
> > +  phandle properties pointing to other nodes to describe connections that
> > +  can not be inferred from device tree parent-child relationships. The device
> > +  tree graph bindings described herein abstract more complex devices that can
> > +  have multiple specifiable ports, each of which can be linked to one or more
> > +  ports of other devices.
> > +
> > +  These common bindings do not contain any information about the direction or
> > +  type of the connections, they just map their existence. Specific properties
> > +  may be described by specialized bindings depending on the type of connection.
> > +
> > +  To see how this binding applies to video pipelines, for example, see
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +  Here the ports describe data interfaces, and the links between them are
> > +  the connecting data buses. A single port with multiple connections can
> > +  correspond to multiple devices being connected to the same physical bus.
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +select: false
> > +
> > +properties:
> > +  port:
> > +    type: object
> > +    description:
> > +      If there is more than one endpoint node or 'reg' property present in
> > +      endpoint nodes then '#address-cells' and '#size-cells' properties are
> > +      required.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        type: object
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +          remote-endpoint:
> > +            description: |
> > +              phandle to an 'endpoint' subnode of a remote device node.
> > +            $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +        required:
> > +          - remote-endpoint
>
> Does 'remote-endpoint' have to be a required property?
> In case of pluggable modules, the remote-endpoint may not be available
> unless the module is plugged in. In other words, device-2 in below
> example may not always be available, but still device-1 endpoint
> configuration and usage may be required?

No, I've dropped it. I noticed the same thing converting some of the
schema over to use this.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
