Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0075483B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 12:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FCF10E083;
	Sat, 15 Jul 2023 10:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DE10E083
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 10:40:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59D3C60ADB;
 Sat, 15 Jul 2023 10:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3F1C433C8;
 Sat, 15 Jul 2023 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689417628;
 bh=wTBz1S2hSZwl9POKXMBD1OXuh1TzdFtjpS1qwGx+jkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzOsA2qFOz4tvHXjRervo3hsjJMpV6Wh6vmXrC9HBvJufqG5Rxd2QWn4Ytf9WmKT3
 ujHHRaZ6EHvH9eJq5Bo2tUdsmlaScYysaiAgNR5GV/wUns4qUKnTOnwwuRUszRu1mj
 4qvEGI7Q96XZXeehYXzyZx/h+k8lBAetCYLTvmZoAJuV5oqUtFL/b5h5rDuBdToy79
 LlOPbpvXntlRlSlMzqmc1z6eguAX/wxLQFmPbaLavZ+57NQu0BY6V2btUGLmjFKQek
 vDqhRkXReWmtyZWxzFjTYSctCOWNIJE4N1xbj3OiHtccADkleRhF4jBxF2aF3HsgF3
 RgCDKpsDhMdRA==
Date: Sat, 15 Jul 2023 11:40:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Message-ID: <20230715-paramount-straining-6a486f8af20d@spud>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PGVJVVq7kVn9L8A9"
Content-Disposition: inline
In-Reply-To: <20230714142526.111569-1-sarah.walker@imgtec.com>
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
Cc: mripard@kernel.org, matthew.brost@intel.com, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de, luben.tuikov@amd.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, robh+dt@kernel.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PGVJVVq7kVn9L8A9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sarah,

Your series does not appear to be threaded. `git send-email` can be
passed, for example, a directory containing a whole series & will set
the correct in-reply-to headers so that the series is in a single
thread.

On Fri, Jul 14, 2023 at 03:25:26PM +0100, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.

> Changes since v3:
> - Remove oneOf in compatible property
> - Remove power-supply (not used on AM62)
>=20
> Changes since v2:
> - Add commit message description
> - Remove mt8173-gpu support (not currently supported)
> - Drop quotes from $id and $schema
> - Remove reg: minItems
> - Drop _clk suffixes from clock-names
> - Remove operating-points-v2 property and cooling-cells (not currently
>   used)
> - Add additionalProperties: false
> - Remove stray blank line at the end of file

The changelog should go below the --- line.

> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Doc=
umentation/devicetree/bindings/gpu/img,powervr.yaml
> new file mode 100644
> index 000000000000..3292a0440465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2022 Imagination Technologies Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies PowerVR GPU
> +
> +maintainers:
> +  - Sarah Walker <sarah.walker@imgtec.com>

> +  interrupts:
> +    items:
> +      - description: GPU interrupt

The description here doesn't add any value, since there is only one
interrupt, so you can drop it and do maxItems: 1 as you have done
elsewhere.

> +  interrupt-names:
> +    items:
> +      - const: gpu

And this
items:
  - const: gpu
can just be
const: gpu

Although, if there is only one interrupt this is probably not
particularly helpful. Are there other implementations of this IP that
have more interrupts?

Otherwise, this looks good to me.

Thanks,
Conor.

--PGVJVVq7kVn9L8A9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLJ3lgAKCRB4tDGHoIJi
0j3aAQDVMC24k6fauiEV0VhEg6EVlCN4u/NEO2bgeg06XEa29wD/RMfmf/un5KW6
LVpJKv8SHRhzcCHfOR387DPgS+VIDgE=
=XdJ6
-----END PGP SIGNATURE-----

--PGVJVVq7kVn9L8A9--
