Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38433E7C96
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE6089FA5;
	Tue, 10 Aug 2021 15:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B0289FA5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:41:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x12so3414260wrr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5BOjAtYtHBrrUtvvPYpr4CfSwCevXlilQRicwBu3hi4=;
 b=I8gTYF37Y+yC7IK8bLdzvlfXgxAhLaop9VcjPn7RoGVnP2EFDDZdsEdDkjIk+Vioa4
 DCRtTnoPznwGMTcDrr+iqkCm/iP/ApXDu2ylupO+xellpqJ0HAcrGTOs7U+F5VNIXAlb
 hBOZv3+2MiarAGiGkQx2xqCYVNRW/B+ayaqnQVY3X8kX3hULO/r/17govXUP/80TV8n0
 gjMHSEr+fo7ff4aaA5A7bHk0noGx3ctV/SD+qNsHYQ89smTPMMY/qqWWYWmdyEr0aqRs
 Vm8TuDo7zBJFT2sDFQdHNKgZ1H543KQLpEAlPmyJlwnStg1nIk+2OYmm4kNe8GM+siFl
 E0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5BOjAtYtHBrrUtvvPYpr4CfSwCevXlilQRicwBu3hi4=;
 b=eXFZATwLH13T4F6pzVIV090NiW7G62w0cO7UB3yeofItuI5yLNPeuGuQpT/1smddzB
 ieavopGkAywQ3vMAomk+8P+WVVrmKeBWPzPdorgZ48B1bHXtAmIYw9y0czYXVt3SxiQa
 hUZO02pUkay4XeCK8VXzTX1IgqLbx4jSSOVDH/pvbbjx0X9KNgsHhn1Lf2XtBIMUm3ai
 KG5a/FXO7O+BVqsHaF6tmcr+5U0u+qPiLWF0vHUkbysjwUl1hycjm4FThfFXsp+F4tD/
 mGZDcSBdvHym4Zi8wC+Yr6VBbIKT90QKeB7dasVTJDjq7R0NN0rxSvHUdtzGhQczh47K
 MG4g==
X-Gm-Message-State: AOAM533GzS10V/JzKmAaaOAaxjCctqPH9eneak1rf/ohhro9DT/8TJAG
 PQ1ICiOENloyRrl216LZY7M=
X-Google-Smtp-Source: ABdhPJzXStNJ2ulmvPuMUn7ZQqgwF9x6zAtcVsHtXjxfEY23XpgdUZqGSt8xKhIGvGsvqh6My9lj5Q==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr32377489wrq.98.1628610062372; 
 Tue, 10 Aug 2021 08:41:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id c190sm21664343wma.21.2021.08.10.08.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 08:41:01 -0700 (PDT)
Date: Tue, 10 Aug 2021 17:43:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Message-ID: <YRKengKZmFtgsIZy@orome.fritz.box>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kJH6/96gHwlIk2vB"
Content-Disposition: inline
In-Reply-To: <20210806123450.2970777-2-mperttunen@nvidia.com>
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


--kJH6/96gHwlIk2vB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
> Convert the original Host1x bindings to YAML and add new bindings for
> NVDEC, now in a more appropriate location. The old text bindings
> for Host1x and engines are still kept at display/tegra/ since they
> encompass a lot more engines that haven't been converted over yet.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 131 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 +++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,t=
egra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,t=
egra210-nvdec.yaml

Can we split off the NVDEC bindings addition into a separate patch? I've
been working on converting the existing host1x bindings in full to json-
schema and this partial conversion would conflict with that effort.

I assume that NVDEC itself validates properly even if host1x hasn't been
converted yet?

> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210=
-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-=
nvdec.yaml
> new file mode 100644
> index 000000000000..fc535bb7aee0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.=
yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yam=
l#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra NVDEC
> +
> +description: |
> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> +  and newer chips. It is located on the Host1x bus and typically
> +  programmed through Host1x channels.
> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^nvdec@[0-9a-f]*$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra210-nvdec
> +      - nvidia,tegra186-nvdec
> +      - nvidia,tegra194-nvdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nvdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: DMA read memory client
> +      - description: DMA read 2 memory client
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +      - const: read2

The convention that we've used so far has been to start numbering these
at 0 and use a dash, so this would be "read-1".

> +      - const: write
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra194-host1x
> +then:
> +  properties:
> +    nvidia,instance:
> +      items:
> +        - description: 0 for NVDEC0, or 1 for NVDEC1

I know we had discussed this before, but looking at the driver patch, I
don't actually see this being used now, so I wonder if we still need it.

> +additionalProperties: true

Maybe this should have a comment noting that this should really be
unevaluatedProperties: false, but we can't use that because the tooling
doesn't support it yet?

Rob, what's the current best practice for that? I see that there are
quite a few bindings that use unevaluatedProperties, so I wonder if we
just ignore errors from that for now? Or do we have some development
branch of the tooling somewhere that supports this now? I vaguely recall
reading about work in progress patches for this, but I can't find the
link now to see if there's been an update since I last looked.

Thierry

--kJH6/96gHwlIk2vB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmESnpwACgkQ3SOs138+
s6ESBBAArTK4Z/v/65pDRfwUxUKgE62FylRjAen+dpH9Eh4YSd7oaUN7WzWk+kih
EFi79BDInfwASxZd5YtrxGuqKNkLS5fsmf+Y89W3OdII9h+JKUKcM2kZk8TUVTKM
+4qXC84/NLCd/GKoo4MTo7Kd7nHAs3ijKvYQOwpiRaNmMmhh0qabC1ONZcz7ZuuB
u4mmgyWwrL8idfKMK0Zy+SsYo/z5HwRcucXfPiC7fmj11YLANms4TzXPMVCfVcul
v7qOvTThjn6VH6Sr8WZBuOYWTTOPu3k4a73f4+m4oHh94XUtwjqBN9viyvQbwb08
+q8G+a5fdqX1dIKvfi4leZBPs6wJ4oIXee9cyqB9gw7pD1B1H2ZmnNj3qWBgeFHz
MYilkaeiADStBTuNS8FcEgWUSji1jUkVRkk04/sYTVtCJ+2WZpljZilKnyq+IhjW
xFmh+ZP02mpGbe4GBBg62xrnzlLa2mHspFJClh3bK2iMxREG2lQ86XMN1/X/0pHU
gGe18Z7eIfcAyws4kcV4sjG7V+zJQIE8sreFkHlNhf65Iaz/Pqmw8pJi590zEDpL
z9Kv+R/Pmk1Sca+pwxbAFHK4M9cy7P6izTBwHOBFgbucfjecF1JqPe5VhspJ6pg6
du6OIvICKI7Drn/UWIsyZsIa/M6+zV37H39BmVhS9hSJOrXFUjA=
=+T8a
-----END PGP SIGNATURE-----

--kJH6/96gHwlIk2vB--
