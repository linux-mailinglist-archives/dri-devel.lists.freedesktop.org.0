Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBF4791C2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 17:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856D10E541;
	Fri, 17 Dec 2021 16:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E8910E597
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 16:44:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q16so5189220wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 08:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/GdDK5wWRf8JpbcmImAq7kEhdc8Y+mqnKrcYg8SBLRc=;
 b=g8XoN2VZ2khTPDP42SaO+N6NNp7Dw/6AxQefh5k+tGij8v4K/s+vYfIEVeRDlI5zbW
 N4lol4eyZ80RZbe1PNPNVtpbTWdl5zYAKRru6+/VX1iFhkNfIluw2c7dsgyq0xh4qy1A
 If24JQGvKdsIP0iF52XS84dHmYklGjOC04EhYhuWA6NVIWohGW3tc7dGZZL/G0KiVH1R
 sCbOL5nYY6StOYCBFWxRnnmbgi78XA+c+pU2AWEtbFX1j6nAVdhc3thnQMzMa6zjWXRC
 LKlVlTo2rCWE40OqwMLjSzPTBptqjb21q8Uros3eWxktHj08u2GxsRX/jSMpCepgnnFU
 gnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/GdDK5wWRf8JpbcmImAq7kEhdc8Y+mqnKrcYg8SBLRc=;
 b=nU2UcwTu6YoAH+1SQxYIo5CSsCh5cGuXccCiTIU+t9YVc9f8z82HlVq7pr6gknutpc
 BBnDzh4W+bFWHJkpRLOV/lrmIRSy570wGi686RxytRsg5/lCkp0Lalzo3o3AdJkKZUnF
 sFCNMGAC0MRq6yM5WrikmAqb1bTRzu2edWsUHUjrh6R8crJMwEj48ofCD83xQLEQaTJ1
 wyf4nI0B/XnFLgBW0vVQWz3CgM10dLE+NoPxwfxJKYQUOYiRPep7SMV+osMApOh24Qd7
 cO9tT8nt6OmDDu9iYt3RI3E+woIzmTIlra1PlJZXZ3ZEH22ZJCKCBV7vVGPnPC4vxDuw
 azzg==
X-Gm-Message-State: AOAM530mzsRYRKVBTiKx1MAqJMVmFv4f0F0JuKFlcRXs14+ID7SVWAjp
 p4fYiBgvZKCsUX5CaqLXSWs=
X-Google-Smtp-Source: ABdhPJwqJavwCqMUkJE8Bnh6rGOjTysofgZFYxU0Wf0viGcL9MJuJ1jQwDOM/a1MmOQ16ubi2IQwhg==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr3241141wrs.273.1639759475901; 
 Fri, 17 Dec 2021 08:44:35 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id l5sm10956306wms.16.2021.12.17.08.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 08:44:34 -0800 (PST)
Date: Fri, 17 Dec 2021 17:44:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: display: tegra: Convert to json-schema
Message-ID: <Yby+cIm/dzKp5vIl@orome>
References: <20211217164320.2330784-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1fc8WwhfQ28BlQQc"
Content-Disposition: inline
In-Reply-To: <20211217164320.2330784-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1fc8WwhfQ28BlQQc
Content-Type: multipart/mixed; boundary="26hcfhQJ1aKuOxmK"
Content-Disposition: inline


--26hcfhQJ1aKuOxmK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 05:43:20PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
>=20
> This also adds the missing display-hub DT bindings that were not
> previously documented.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v4:
> - add interconnect, interconnect-names, operating-points-v2 and
>   power-domains property to match latest DT updates
> - drop stale reference to DPAUX pad controller bindings
> - include dsi-controller.yaml and drop $nodename, #address-cells,
>   #size-cells and patternProperties from DSI bindings
> - integrate #sound-dai-cells addition from published patch
> - drop some generic, useless comments
>=20
> Changes in v3:
> - split into separate YAML files for simplicity
> - add display-hub DT bindings
>=20
> Changes in v2:
> - use additionalProperties instead of unevaluatedProperties where
>   sufficient
> - drop redundant $ref and add missing maxItems properties
> - drop documentation for standard properties
> - remove status properties from example
> - drop spurious comments

Hi Rob,

for your convenience, I'm attaching the diff from yesterday's version 3
to make it hopefully a bit easier to review.

Thierry

--26hcfhQJ1aKuOxmK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-squash-dt-bindings-display-tegra-Convert-to-json-sch.patch"
Content-Transfer-Encoding: quoted-printable

=46rom f016de415f8a6bf263337bc88a840093a3f7514f Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Fri, 17 Dec 2021 14:44:47 +0100
Subject: [PATCH] squash! dt-bindings: display: tegra: Convert to json-schema

---
 .../display/tegra/nvidia,tegra124-sor.yaml    |   3 -
 .../display/tegra/nvidia,tegra20-dc.yaml      |   7 ++
 .../display/tegra/nvidia,tegra20-dsi.yaml     |  25 +---
 .../display/tegra/nvidia,tegra20-epp.yaml     |  13 +++
 .../display/tegra/nvidia,tegra20-gr2d.yaml    |  13 +++
 .../display/tegra/nvidia,tegra20-gr3d.yaml    | 107 +++++++++++++++++-
 .../display/tegra/nvidia,tegra20-hdmi.yaml    |  10 ++
 .../display/tegra/nvidia,tegra20-host1x.yaml  |  19 +++-
 .../display/tegra/nvidia,tegra20-isp.yaml     |  12 ++
 .../display/tegra/nvidia,tegra20-mpe.yaml     |  15 +++
 .../display/tegra/nvidia,tegra20-tvo.yaml     |   7 ++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  18 ++-
 12 files changed, 215 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra12=
4-sor.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra12=
4-sor.yaml
index afc283796653..0188baad0865 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.y=
aml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.y=
aml
@@ -14,9 +14,6 @@ description: |
   The Serial Output Resource (SOR) can be used to drive HDMI, LVDS, eDP
   and DP outputs.
=20
-  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
-  regarding the DPAUX pad controller bindings.
-
 properties:
   $nodename:
     pattern: "^sor@[0-9a-f]+$"
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-d=
c.yaml
index eeffb8d7c597..ac346af663cd 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -59,6 +59,13 @@ properties:
   iommus:
     maxItems: 1
=20
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
   nvidia,head:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: The number of the display controller head. This is used t=
o setup the various
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
dsi.yaml
index abab8783db1b..75546f250ad7 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.ya=
ml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.ya=
ml
@@ -11,9 +11,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
=20
 properties:
-  $nodename:
-    pattern: "^dsi@[0-9a-f]+$"
-
   compatible:
     oneOf:
       - enum:
@@ -50,15 +47,12 @@ properties:
     items:
       - const: dsi
=20
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
   power-domains:
     maxItems: 1
=20
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
   avdd-dsi-csi-supply:
     description: phandle of a supply that powers the DSI controller
=20
@@ -90,17 +84,8 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: "/schemas/types.yaml#/definitions/phandle"
=20
-patternProperties:
-  "^panel@[0-9]+$":
-    type: object
-    properties:
-      reg:
-        maxItems: 1
-
-    required:
-      - reg
-
 allOf:
+  - $ref: "../dsi-controller.yaml#"
   - if:
       properties:
         compatible:
@@ -142,7 +127,7 @@ allOf:
       required:
         - interrupts
=20
-additionalProperties: false
+unevaluatedProperties: false
=20
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-epp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
epp.yaml
index d6c45a385c89..0d55e6206b5e 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.ya=
ml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.ya=
ml
@@ -40,6 +40,19 @@ properties:
   iommus:
     maxItems: 1
=20
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    maxItems: 4
+
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
 additionalProperties: false
=20
 examples:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-gr2d.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-gr2d.yaml
index f431a23a1373..984a0de9b8a8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.y=
aml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.y=
aml
@@ -43,6 +43,19 @@ properties:
   iommus:
     maxItems: 1
=20
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    maxItems: 4
+
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the HEG or core power domain
+
 additionalProperties: false
=20
 examples:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-gr3d.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-gr3d.yaml
index 956d1f507208..4177d311899b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.y=
aml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.y=
aml
@@ -32,18 +32,77 @@ properties:
     maxItems: 2
=20
   resets:
-    minItems: 1
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
=20
   reset-names:
+    minItems: 2
+    maxItems: 4
+
+  iommus:
     minItems: 1
     maxItems: 2
=20
-  iommus:
+  interconnects:
+    minItems: 4
+    maxItems: 10
+
+  interconnect-names:
+    minItems: 4
+    maxItems: 10
+
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
     minItems: 1
     maxItems: 2
=20
+  power-domain-names:
+    minItems: 2
+    maxItems: 2
+
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra20-gr2d
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: 3d
+
+        resets:
+          items:
+            - description: module reset
+            - description: memory client hotflush reset
+
+        reset-names:
+          items:
+            - const: 3d
+            - const: mc
+
+        iommus:
+          maxItems: 1
+
+        interconnects:
+          minItems: 4
+          maxItems: 4
+
+        interconnect-names:
+          minItems: 4
+          maxItems: 4
+
+        power-domains:
+          items:
+            - description: phandle to the TD power domain
+
   - if:
       properties:
         compatible:
@@ -76,8 +135,36 @@ allOf:
             - const: mc2
=20
         iommus:
+          minItems: 2
           maxItems: 2
-    else:
+
+        interconnects:
+          minItems: 8
+          maxItems: 8
+
+        interconnect-names:
+          minItems: 8
+          maxItems: 8
+
+        power-domains:
+          items:
+            - description: phandle to the TD power domain
+            - description: phandle to the TD2 power domain
+
+        power-domain-names:
+          items:
+            - const: 3d0
+            - const: 3d1
+
+      dependencies:
+        power-domains: [ power-domain-names ]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra114-gr2d
+    then:
       properties:
         clocks:
           items:
@@ -100,6 +187,18 @@ allOf:
         iommus:
           maxItems: 1
=20
+        interconnects:
+          minItems: 10
+          maxItems: 10
+
+        interconnect-names:
+          minItems: 10
+          maxItems: 10
+
+        power-domains:
+          items:
+            - description: phandle to the TD power domain
+
 additionalProperties: false
=20
 examples:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-hdmi.yaml
index 4384803b9017..035b9f1f2eb5 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.y=
aml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.y=
aml
@@ -50,6 +50,13 @@ properties:
     items:
       - const: hdmi
=20
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
   hdmi-supply:
     description: supply for the +5V HDMI connector pin
=20
@@ -76,6 +83,9 @@ properties:
     description: phandle of a display panel
     $ref: "/schemas/types.yaml#/definitions/phandle"
=20
+  "#sound-dai-cells":
+    const: 0
+
 additionalProperties: false
=20
 required:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.yaml
index 4870d2130581..4fd513efb0f7 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
=2Eyaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
=2Eyaml
@@ -71,11 +71,13 @@ properties:
       - const: host1x
=20
   resets:
+    minItems: 1 # MC reset is optional on Tegra186 and later
     items:
       - description: module reset
       - description: memory client hotflush reset
=20
   reset-names:
+    minItems: 1 # MC reset is optional on Tegra186 and later
     items:
       - const: host1x
       - const: mc
@@ -84,17 +86,20 @@ properties:
     maxItems: 1
=20
   interconnects:
-    description: Description of the interconnect paths for the host1x
-      controller; see ../interconnect/interconnect.txt for details.
     items:
       - description: memory read client for host1x
=20
   interconnect-names:
-    description: A list of names identifying each entry listed in the
-      "interconnects" property.
     items:
       - const: dma-mem # read
=20
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the HEG or core power domain
+
 required:
   - compatible
   - interrupts
@@ -133,6 +138,12 @@ allOf:
             - description: physical base address and length of the register
                 region used by the hypervisor
=20
+        resets:
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
       required:
         - reg-names
=20
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-isp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
isp.yaml
index f94f30830bbf..3bc3b22e98e1 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.ya=
ml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.ya=
ml
@@ -38,6 +38,18 @@ properties:
   iommus:
     maxItems: 1
=20
+  interconnects:
+    items:
+      - description: memory write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # write
+
+  power-domains:
+    items:
+      - description: phandle to the VENC or core power domain
+
 additionalProperties: false
=20
 examples:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
mpe.yaml
index 4dbbba3678ae..4154ae01ad13 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.ya=
ml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.ya=
ml
@@ -41,6 +41,21 @@ properties:
   iommus:
     maxItems: 1
=20
+  interconnects:
+    minItems: 6
+    maxItems: 6
+
+  interconnect-names:
+    minItems: 6
+    maxItems: 6
+
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the MPE power domain
+
 additionalProperties: false
=20
 examples:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-tvo.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
tvo.yaml
index c1d4c6fe923f..467b015e5700 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.ya=
ml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.ya=
ml
@@ -30,6 +30,13 @@ properties:
     items:
       - description: module clock
=20
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the core power domain
+
 additionalProperties: false
=20
 required:
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20=
-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-v=
i.yaml
index 5cb2d9964c05..782a4b10150a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -47,6 +47,21 @@ properties:
   iommus:
     maxItems: 1
=20
+  interconnects:
+    minItems: 4
+    maxItems: 5
+
+  interconnect-names:
+    minItems: 4
+    maxItems: 5
+
+  operating-points-v2:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  power-domains:
+    items:
+      - description: phandle to the VENC power domain
+
   "#address-cells":
     const: 1
=20
@@ -56,9 +71,6 @@ properties:
   ranges:
     maxItems: 1
=20
-  power-domains:
-    maxItems: 1
-
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
=20
--=20
2.34.1


--26hcfhQJ1aKuOxmK--

--1fc8WwhfQ28BlQQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG8vnAACgkQ3SOs138+
s6HD3A//X/ccJoIgFT0OIvk4SpH8sHzS65bflrHAL6H+3oXq7qVh5Qvv3Hb3cFTC
4UBvbztZdUxr48d9j2AF5A8/I3XL7fi2ll/eO6B+91dNDUdYX6A3cqcMN3htD1Ea
GlY9zFjuYsiHqfY0YFHcAsgYQawykmh+DXiLNUB/Yyk06MWHev+zSQUrSf8mkjDE
SNWwl2uSCJZXsFxGobHlsvHuyd51Hz1La3Y5kQrg3Ixmk+r67fIqgw3QsXppfkR3
iE3gh1tb4bHiQkBYZFuufI46HUY1BuIaWDeijEMhWfSv49De8MvxwFYCVxgknA5/
CxbHjT3T8ubKBnARK3ByRG5TmM3aRyyFAgMQkT76W4OilEbSyoTMnAmMzIUlml5r
LgJrYcuGq8GuFIOYMb8e1ZppepWIqPMe43b3BX50pZA1rSa5+H9OM4gSltSpBEqM
05QvT5+cJBs1o1hf03En4m4YdDHlTmVxAf8MHEG1ro+5uPx/m9A3ZPSrnUe2bUIf
guJFaTn0ddXO3H5W25VMMeJ122DNsS3CbWUL/fH5wniGo0IQB5g5vzqHK98sYyKt
3tO74XFzW7ACTZAuR2BLXGoIgyMnAG/solWMfT0XVFxLP/krPWoBI944vFwSo2L9
FD4j96pUVkMBrx19T0Hc4Sdy2iSO0ojEC8rxtrfRopSqtquhtBs=
=Tk8I
-----END PGP SIGNATURE-----

--1fc8WwhfQ28BlQQc--
