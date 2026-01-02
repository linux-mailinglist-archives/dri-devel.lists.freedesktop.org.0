Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D20CEF6EB
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 23:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB87C10E248;
	Fri,  2 Jan 2026 22:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJiwXSIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349C110E248
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 22:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8A8C42E16
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 22:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACA1C16AAE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767393267;
 bh=p/Jv5nG+sVHiYm8AcMZfdW5K3hhflvZ/ovEwgXHmpeM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VJiwXSISAcJV0qXTmSeIT57CiDm5gborRfTiSHBdph5DpkV7v/EK8GHzaDGJ4SPux
 eWCuRips0fyPhqbecE6Kfz3YDF7b0tgZrpfKsl/BN0xQHw7q4r75P1hr/iIFC0jNax
 YqbJtwiOpvbPb6AzrU05N0XR6AenFJrGF0+g5QDrNOnld0tjF0WJ4dXzJOUhZowcEV
 fjDH+IM5eCfX/q+hmJcr3yW0s0jEtL11Zmk4lEkApw56pC+UpH2cSviJASBPhNyUuO
 6tpKehaayrkEM0GDXrN9EY34gowhDuH7lRDXKpWlIx+yCzuysWIDQTHCGJopG1/lWp
 fyNttkPYts7eQ==
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b7ffbf4284dso1658429366b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 14:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZz7tnCjZ1xDvImtTIwhWcRuCxcCdN5QDH2495sWDPo0t2aAxdEMkrznEBbBFJ7CeKsLufexR9NWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQYBumW967DPK0pkoVlJ7Mtl5Md7eYEsyEnsBtJGBcZzVicGqU
 hwnEh092dgsM7RPPf3Bt6Y2+3mLlomCskWKTXmEKVQtS4HPm1uieug1XwMzUzNtgQSHb7TvdGkx
 S1naNzgVG1ijZaqo8fia7d3lnjO/6Jw==
X-Google-Smtp-Source: AGHT+IG1rWxoS+GvYztMHqB/gJdkFcIK4DZOIUpaJyFmssooGzC677KHzCJrbnQK7v/KK+0EeeO1ZfO4yp8ZU6NtQY4=
X-Received: by 2002:a17:907:86a8:b0:b73:544d:ba2e with SMTP id
 a640c23a62f3a-b8036f62606mr4676439166b.25.1767393266391; Fri, 02 Jan 2026
 14:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20251224133150.2266524-1-s-jain1@ti.com>
 <20251230022741.GA3217586-robh@kernel.org>
 <fd9f0b37-001e-4721-82b7-ee29379eb9a9@ti.com>
In-Reply-To: <fd9f0b37-001e-4721-82b7-ee29379eb9a9@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:34:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
X-Gm-Features: AQt7F2qO3whwDzMYSf3EK2yMZxV1VXazUkw4mQ8nbmABr7OmUyHYA4qzRlYK5VI
Message-ID: <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: ti, am65x-dss: Add AM62L DSS support
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, 
 praneeth@ti.com, bb@ti.com, vigneshr@ti.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Dec 30, 2025 at 8:23=E2=80=AFAM Swamil Jain <s-jain1@ti.com> wrote:
>
> Hi Rob,
>
> On 12/30/25 07:57, Rob Herring wrote:
> > On Wed, Dec 24, 2025 at 07:01:50PM +0530, Swamil Jain wrote:
> >> Update the AM65x DSS bindings to support AM62L which has a single vide=
o
> >> port. Add conditional constraints for AM62L.
> >>
> >> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >> ---
> >>   .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++--=
--
> >>   1 file changed, 76 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss=
.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> >> index 38fcee91211e..ce39690df4e5 100644
> >> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> >> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> >> @@ -36,34 +36,50 @@ properties:
> >>     reg:
> >>       description:
> >>         Addresses to each DSS memory region described in the SoC's TRM=
.
> >> -    items:
> >> -      - description: common DSS register area
> >> -      - description: VIDL1 light video plane
> >> -      - description: VID video plane
> >> -      - description: OVR1 overlay manager for vp1
> >> -      - description: OVR2 overlay manager for vp2
> >> -      - description: VP1 video port 1
> >> -      - description: VP2 video port 2
> >> -      - description: common1 DSS register area
> >> +    oneOf:
> >> +      - items:
> >> +          - description: common DSS register area
> >> +          - description: VIDL1 light video plane
> >> +          - description: VID video plane
> >> +          - description: OVR1 overlay manager for vp1
> >> +          - description: OVR2 overlay manager for vp2
> >> +          - description: VP1 video port 1
> >> +          - description: VP2 video port 2
> >> +          - description: common1 DSS register area
> >> +      - items:
> >> +          - description: common DSS register area
> >> +          - description: VIDL1 light video plane
> >> +          - description: OVR1 overlay manager for vp1
> >> +          - description: VP1 video port 1
> >> +          - description: common1 DSS register area
> >>
> >>     reg-names:
> >> -    items:
> >> -      - const: common
> >> -      - const: vidl1
> >> -      - const: vid
> >> -      - const: ovr1
> >> -      - const: ovr2
> >> -      - const: vp1
> >> -      - const: vp2
> >> -      - const: common1
> >> +    oneOf:
> >> +      - items:
> >> +          - const: common
> >> +          - const: vidl1
> >> +          - const: vid
> >> +          - const: ovr1
> >> +          - const: ovr2
> >> +          - const: vp1
> >> +          - const: vp2
> >> +          - const: common1
> >> +      - items:
> >> +          - const: common
> >> +          - const: vidl1
> >> +          - const: ovr1
> >> +          - const: vp1
> >> +          - const: common1
> >>
> >>     clocks:
> >> +    minItems: 2
> >>       items:
> >>         - description: fck DSS functional clock
> >>         - description: vp1 Video Port 1 pixel clock
> >>         - description: vp2 Video Port 2 pixel clock
> >>
> >>     clock-names:
> >> +    minItems: 2
> >>       items:
> >>         - const: fck
> >>         - const: vp1
> >> @@ -84,7 +100,8 @@ properties:
> >>       maxItems: 1
> >>       description: phandle to the associated power domain
> >>
> >> -  dma-coherent: true
> >> +  dma-coherent:
> >> +    type: boolean
> >>
> >>     ports:
> >>       $ref: /schemas/graph.yaml#/properties/ports
> >> @@ -195,6 +212,46 @@ allOf:
> >>               port@0:
> >>                 properties:
> >>                   endpoint@1: false
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: ti,am62l-dss
> >> +    then:
> >> +      properties:
> >> +        clock-names:
> >> +          maxItems: 2
> >> +        clocks:
> >> +          maxItems: 2
> >> +        reg:
> >> +          maxItems: 5
> >
> >             reg-names:
> >               minItems: 8
> >         else:
> >           properties:
> >             reg:
> >               minItems: 8
> >             reg-names:
> >               minItems: 8
> >
> > clocks needs similar constraints...
>
> Sure, will add in v2.
>
> >
> >> +
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: ti,am62l-dss
> >> +    then:
> >> +      properties:
> >> +        reg-names:
> >> +          items:
> >> +            - const: common
> >> +            - const: vidl1
> >> +            - const: ovr1
> >> +            - const: vp1
> >> +            - const: common1
> >> +    else:
> >> +      properties:
> >> +        reg-names:
> >> +          items:
> >> +            - const: common
> >> +            - const: vidl1
> >> +            - const: vid
> >> +            - const: ovr1
> >> +            - const: ovr2
> >> +            - const: vp1
> >> +            - const: vp2
> >> +            - const: common1
> >
> > Why are you defining the names twice?
> >
>
> For AM62L we don't have "vid", "ovr2" and "vp2", the dtbs_check will fail=
.
> Could you please suggest a better way?

You already defined them at the top level. Here in the if/then schema,
all you need is 'maxItems: 5' and 'minItems: 8'. But then you already
have that as well.

Rob
