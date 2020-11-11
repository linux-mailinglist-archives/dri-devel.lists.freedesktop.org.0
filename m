Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F9E2AF37C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37136E02E;
	Wed, 11 Nov 2020 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03F36E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:25:52 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71F06208CA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605104752;
 bh=yjQbz6yukbg0pWgBKEkAwfao7ZJ/mR8R8fYrOGQCgj0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WqSf4m2l7nKEllYtyUGJ9qiysRuyPiXfxI1pktiFbwsz8TQ1bQ1JHaNJ2otqvwDqb
 g/9Ns9euHQ+OiWsj3DhfhY6rVx2/fl1Xf5baAAxPWW3E2/4XNV3gFI+atKkw5cYGPl
 tSnyI7QvjKmf7bzEei+1SSTJayDlD9+mCs/3M4F0=
Received: by mail-ot1-f52.google.com with SMTP id n11so2305989ota.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:25:52 -0800 (PST)
X-Gm-Message-State: AOAM5304YT575KT5hMQFOTmrMb5uED/4S2aKDcXOMxZ8gosQdnsnYK2z
 NLscSmcsguIC0KDsZ9TV+hc4ed5LAjnpcs+l5Q==
X-Google-Smtp-Source: ABdhPJxDzbGonZ7mQJWbeGH/aeIH+jTY0iZdh6QOjcXfWz12QukgD60IRHaI+rb26aSGSNrRwt9WpH/roxgQxUS67Xw=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr16588139oti.107.1605104751592; 
 Wed, 11 Nov 2020 06:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-2-robh@kernel.org>
 <20201111140009.GD4115@pendragon.ideasonboard.com>
In-Reply-To: <20201111140009.GD4115@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Nov 2020 08:25:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+A6Ga+h4qK0nzyL87M1DvrRSnzxtjwUNpq--L7MDHxfA@mail.gmail.com>
Message-ID: <CAL_Jsq+A6Ga+h4qK0nzyL87M1DvrRSnzxtjwUNpq--L7MDHxfA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Convert graph bindings to json-schema
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Sameer Pujar <spujar@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 8:00 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob and Sameer,
>
> Thank you for the patch.
>
> On Mon, Nov 02, 2020 at 02:36:54PM -0600, Rob Herring wrote:
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
> >   ports:
> >     type: object
> >     $ref: graph.yaml#/properties/ports
> >
> >     properties:
> >       port@0:
> >         description: What data this port has
> >
> >       ...
> >
> > Or:
> >
> > properties:
> >   port:
> >     description: What data this port has
> >     type: object
> >     $ref: graph.yaml#/properties/port
>
> Sounds like a good approach.
>
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v3:
> >  - Move port 'reg' to port@* and make required
> >  - Make remote-endpoint required
> >  - Add 'additionalProperties: true' now required
> >  - Fix yamllint warnings
> >
> >  Documentation/devicetree/bindings/graph.txt  | 129 +-----------
> >  Documentation/devicetree/bindings/graph.yaml | 199 +++++++++++++++++++
> >  2 files changed, 200 insertions(+), 128 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/graph.yaml

[...]

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
> As noted elsewhere, this shouldn't be required.
>
> Should we set additionalProperties: false here ?

No, we've got a bunch of properties that get added to endpoint nodes.
There's a few cases where 'port' nodes have properties too.

> > +  ports:
> > +    type: object
> > +    description: |
> > +      If there is more than one port node or 'reg' property present in port
> > +      nodes then '#address-cells' and '#size-cells' properties are required.
> > +      In such cases all port nodes can be grouped under 'ports' independently
> > +      from any other child device nodes a device might have.
>
> Allowing multiple port nodes not grouped in a ports node has created
> complexity, with very little gain. Should we forbid that going forward ?

Yes, that's probably a separate change. The examples need updating
too. We do have a few cases we'll have to support though.

> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port(@[0-9a-f]+)?$":
> > +        $ref: "#/properties/port"
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +
>
> Maybe a single blank line ?
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've gone thru and updated schemas to use this. Primarily to prove out
a meta-schema for it. So I'll be sending out another version.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
