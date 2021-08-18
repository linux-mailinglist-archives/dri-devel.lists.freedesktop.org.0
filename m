Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBE3F0478
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6376E3DF;
	Wed, 18 Aug 2021 13:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86D96E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:18:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso1756605wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5SpTN6PLDBd27k57brua63qa9FWkoLAJAlJaGQ6JCUc=;
 b=O5Wg6elzrDpDe3UUfoSgAun2qCEYEc66qfZtZpUVML4ceySEVyeElfX1BNwJXOq5qP
 ThnkRnZr30s4GOBGqxRvi5OoLlEmQhTMjyMCb1tzirjT3NdF7zKcnlnAQkY/SCErjevo
 d3TAuveuJjpSe5IMa9S9055RLubssnF31WDWXPOrCI7f/gPvoD/b18ukG67cwgfhHPPU
 ndPe3F1L4HXq8iZ+P5kqYDXhhPCMj8zLnZJgZvyW1tGzP3zxn/JKbFfcGDXZuNobmhvA
 4fPxHKJChgLTdQBLNJwCUcGUff+8881FXs/sms8KhYJwOpK5KKHzE21e/xexdWDIWisb
 pJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5SpTN6PLDBd27k57brua63qa9FWkoLAJAlJaGQ6JCUc=;
 b=aYiFJolAU/y+9qMsf8dNkFghTBbdprfHFN/3ImIZkRd+Zyd2Qb2JrWRJJ4e1w0EnNM
 ctKnHqu0ZBzDvbTWTSPAHdnVR6cRADgbJ/GMPqpx224Wc2sy+kE6ifNPwc7diWr83rAj
 iJSPd8cc/j5rnIQoSBuCm6cQr+r0etDPk62AaFTR1bMbOr4qV+Q9OMPDnI4uJFbczvVx
 mdhtS7piUjw8aJG7lHtKMrkI/keujt8ehobGVcGmIBlnXZp95bUWVqL9xWa7tdGkYd+h
 dDLqovN2z6DDEPon4XpDiY3jkxvOt5XDVD/CrMnptKmjNw8csd7CThZ3F/5gUzMfZHcT
 4qnQ==
X-Gm-Message-State: AOAM530jtL8QN6NOBf/mda2m9rCwJsTaDbqhgOiAcoSXHHKFLCkGjCtB
 5gzIhZciw3rzzasIOojXOyU=
X-Google-Smtp-Source: ABdhPJyKgANX5A0a/Xjx8RDwOuCekgOW86ZvUwH1ITFJ9sI/PqxNlrAWC3uCZXPbkYb9Ioy0SkymaQ==
X-Received: by 2002:a05:600c:294a:: with SMTP id
 n10mr8436273wmd.67.1629292703055; 
 Wed, 18 Aug 2021 06:18:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z6sm5093059wmp.1.2021.08.18.06.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 06:18:21 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:18:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>, Rob Herring <robh@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YR0InKtLCO1ohcHW@orome.fritz.box>
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com>
 <YRwoKW4nOc52MAQV@robh.at.kernel.org>
 <1dfd5173-5654-9df8-1e8e-d0e365ed914d@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WYLvNF6e+2nKSnT5"
Content-Disposition: inline
In-Reply-To: <1dfd5173-5654-9df8-1e8e-d0e365ed914d@kapsi.fi>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--WYLvNF6e+2nKSnT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 11:24:28AM +0300, Mikko Perttunen wrote:
> On 8/18/21 12:20 AM, Rob Herring wrote:
> > On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
> > > Add YAML device tree bindings for NVDEC, now in a more appropriate
> > > place compared to the old textual Host1x bindings.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > > v3:
> > > * Drop host1x bindings
> > > * Change read2 to read-1 in interconnect names
> > > v2:
> > > * Fix issues pointed out in v1
> > > * Add T194 nvidia,instance property
> > > ---
> > >   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 +++++++++++++++=
+++
> > >   MAINTAINERS                                   |   1 +
> > >   2 files changed, 110 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvi=
dia,tegra210-nvdec.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegr=
a210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra=
210-nvdec.yaml
> > > new file mode 100644
> > > index 000000000000..571849625da8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nv=
dec.yaml
> > > @@ -0,0 +1,109 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec=
=2Eyaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Device tree binding for NVIDIA Tegra NVDEC
> > > +
> > > +description: |
> > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > +  and newer chips. It is located on the Host1x bus and typically
> > > +  programmed through Host1x channels.
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <treding@gmail.com>
> > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra210-nvdec
> > > +      - nvidia,tegra186-nvdec
> > > +      - nvidia,tegra194-nvdec
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: nvdec
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: nvdec
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  interconnects:
> > > +    items:
> > > +      - description: DMA read memory client
> > > +      - description: DMA read 2 memory client
> > > +      - description: DMA write memory client
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: dma-mem
> > > +      - const: read-1
> > > +      - const: write
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +  - power-domains
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: nvidia,tegra194-host1x
> >=20
> > host1x? This will never be true as the schema is only applied to nodes
> > with the nvdec compatible.
>=20
> Argh, it's a typo indeed. Should be nvidia,tegra194-nvdec.
>=20
> >=20
> > > +then:
> > > +  properties:
> > > +    nvidia,instance:
> > > +      items:
> > > +        - description: 0 for NVDEC0, or 1 for NVDEC1
> >=20
> > What's this for? We generally don't do indices in DT.
>=20
> When programming the hardware through Host1x, we need to know the "class =
ID"
> of the hardware, specific to each instance. So we need to know which
> instance it is. Technically of course we could derive this from the MMIO
> address but that seems more confusing.
>=20
> >=20
> > > +
> > > +additionalProperties: true
> >=20
> > This should be false or 'unevaluatedProperties: false'
>=20
> I tried that but it resulted in validation failures; please see the
> discussion in v2.

Rob mentioned that there is now support for unevaluatedProperties in
dt-schema. I was able to test this, though with only limited success. I
made the following changes on top of this patch:

--- >8 ---
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-n=
vdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nv=
dec.yaml
index d2681c98db7e..0bdf05fc8fc7 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.ya=
ml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.ya=
ml
@@ -73,14 +73,18 @@ if:
   properties:
     compatible:
       contains:
-        const: nvidia,tegra194-host1x
+        const: nvidia,tegra194-nvdec
 then:
   properties:
     nvidia,instance:
+      $ref: /schemas/types.yaml#/definitions/uint32
       items:
         - description: 0 for NVDEC0, or 1 for NVDEC1
=20
-additionalProperties: true
+  required:
+    - nvidia,instance
+
+unevaluatedProperties: false
=20
 examples:
   - |
@@ -105,3 +109,28 @@ examples:
             interconnect-names =3D "dma-mem", "read-1", "write";
             iommus =3D <&smmu TEGRA186_SID_NVDEC>;
     };
+
+  - |
+    #include <dt-bindings/clock/tegra194-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra194-mc.h>
+    #include <dt-bindings/power/tegra194-powergate.h>
+    #include <dt-bindings/reset/tegra194-reset.h>
+
+    nvdec@15480000 {
+            compatible =3D "nvidia,tegra194-nvdec";
+            reg =3D <0x15480000 0x40000>;
+            clocks =3D <&bpmp TEGRA194_CLK_NVDEC>;
+            clock-names =3D "nvdec";
+            resets =3D <&bpmp TEGRA194_RESET_NVDEC>;
+            reset-names =3D "nvdec";
+
+            nvidia,instance =3D <0>;
+
+            power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
+            interconnects =3D <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
+            interconnect-names =3D "dma-mem", "read-1", "write";
+            iommus =3D <&smmu TEGRA194_SID_NVDEC>;
+    };
--- >8 ---

As I said, this only works partially. One thing I have to do is comment
out the whole "if:" block in meta-schemas/base.yaml in order to get rid
of this error:

	Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml: '=
additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properti=
es and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

which basically makes the whole file invalid. The reason seems to be
that dt-schema will only allow unevaluatedProperties if there are any
$ref references in the schema. Although I'm not sure I understand how
exactly that works because I tried to inject a dummy $ref but that
didn't fix the above error.

Once that's worked around, though, I do get the examples to validate
with just a small caveat: nvidia,instance is recognized as being
required in the Tegra194 case (if I remove it from the example, I do get
an error, as expected), but if I add nvidia,instance to the Tegra186
example, it doesn't actually produce an error and will just accept it as
valid, even though the compatible is not nvidia,tegra194-nvdec.

I don't have time at the moment to investigate why that is, but just
thought I'd report this here in the meantime. Perhaps it's already a
known issue?

We could potentially side-step this by getting rid of the custom
nvidia,instance property altogether. Unfortunately of_device_id table
matching only supports matching by name, but not by unit-address, which
would've been nice in this case. Matching by base address manually is a
bit suboptimal, but it's not that bad.

In any case, there are other examples I know of which need this type of
functionality (a bunch of devices where the number and names of power
supplies change from one generation to another), so this problem isn't
going entirely away anyway.

Thierry

--WYLvNF6e+2nKSnT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdCJkACgkQ3SOs138+
s6EyKA//ThgwpGG+hY7+/rPxqlOMWO7DhGhknT8Q2NrJrlq7s0qTh1O51CvOC/IN
dN9+6EFUGHyuj/h24KocTkJVvBpNXQuJgdoEc1xJiat3z6tr0BjyLxBxZL9Rme2p
rOY34gn587BUjQjjaibRqB5MPKE8bQbKgvzbaelbbyg8wc8hALiWgbn+7zaYjwnA
4Rbk4xHEfSFMwTOlANBUgQX+y4/bbpOwdx6yw2CR07N0gyBmnOoWQA9EbIYi8dJ0
9FGr8NGZ9WFP8GxtEf7ouiO0IZelKlWCDUE2tMD7QmidEGAf3uZIYTymY4Px7ErC
Bo7C3JjDO8NVvY5l9dI39RrxzVdsVlzadyBv26OLFqRG+TzxLwq5I57SIZZJNJni
jOHfTfT3joAW50ycdLVmTXNinVlnTVgTPvNSURTAHgf/3BsFYZ0Sx0lpTBnxRZW4
FEwlgfYEyxj3xoUiqXMlpEuG+XKNH5dPsaWkEynMTj2x+sh5/AuvvPuqBe75x8ku
FjwTQ3ZlR66ly5foIHvfDQofKfBzjDf3xJt4ypRejoynJSvtCz8K8Z4CAy7+mBMz
OzIGJIs7hEvFx80IPu2LVd59iQHLe99/bXLmo53IcEbzcPye2ljkbFvD5xHDR1J3
HO9N3z40NSkKRYTZry6ri6uJ4jDVPJSWRNpppwnnvojmSUhQviI=
=WWNO
-----END PGP SIGNATURE-----

--WYLvNF6e+2nKSnT5--
