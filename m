Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093B797176
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 12:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7010E227;
	Thu,  7 Sep 2023 10:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F2610E227
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 10:21:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8856FCE1952;
 Thu,  7 Sep 2023 10:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B29BC116AA;
 Thu,  7 Sep 2023 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694082058;
 bh=w08iyCZEv2y91XhjG6gytJX/08/uuFNdY7YRHOjrTKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVoOSJ9LefWstHF2hTnikgZ/UUNwtOUth5vPxYcufjsTjslUusP7MKDm091Ndjv1q
 78kLUean1Oc8AnlV8LY0GWc6zu1Qfpc073Z1iT+MgtqAwnVLgMiQVVGnrYveCMxn/N
 c8fhp/kCn/PoATsQH64OI+p5gHydwnV92anTt+1L3Elxd+AKcgSsInhDqyMS8P3IAo
 TFybtf55GAyA7GLjEXjySR85zLpTch/rXP8HTvBJYw1rsE6xfhbUVn3q7hpySc9f44
 CrPl1sz5GpTIM4eHWAMqSuN15v7QaGWsaiynG/2uDQdcBjUyvitKHO1de8bG15fFcr
 46GOXc5xqg9XA==
Date: Thu, 7 Sep 2023 11:20:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Message-ID: <20230907-22495ffd0407dacc5cf1cd12@fedora>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-4-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/PgLc/igXG8aid6c"
Content-Disposition: inline
In-Reply-To: <20230906095542.3280699-4-sarah.walker@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/PgLc/igXG8aid6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

On Wed, Sep 06, 2023 at 10:55:25AM +0100, Sarah Walker wrote:

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    gpu: gpu@fd00000 {

This "gpu" label isn't used and can be dropped if you respin.
Otherwise, this seems fine to me,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +        compatible = "ti,am62-gpu", "img,img-axe";
> +        reg = <0x0fd00000 0x20000>;
> +        clocks = <&k3_clks 187 0>;
> +        clock-names = "core";
> +        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +    };

--/PgLc/igXG8aid6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmkAgAKCRB4tDGHoIJi
0nQkAP9uKeN6K/WPKUkM5yMV//ie+sobH7mqetqT7BiWIVUj3wD/V2onnXfHh+pl
bVSIzTHnqcOZIQIgCDr+4Zw1Uj/lTAk=
=7B7v
-----END PGP SIGNATURE-----

--/PgLc/igXG8aid6c--
