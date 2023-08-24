Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F91786C3C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3610E51D;
	Thu, 24 Aug 2023 09:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46110E51D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:47:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A658D643AA;
 Thu, 24 Aug 2023 09:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AA9C433C7;
 Thu, 24 Aug 2023 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692870455;
 bh=jpIcgpyOmQBzytNpmhA45q0sBknQ9noZJX6C0UvzR4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQH56xIeRfV6F2rA9n/tCd1UEoKryH/JWeMK7zcwllISQnpd1I+3U7YpvYq2WTyhB
 5AuKGAaeu3vqXvBIdxKm3uBAoMnWmrlBdpBVGRKLtsFVl0+xZfT+vFog/A/xSYivIO
 eZznYwXL0dLIiNsY0jKAV62+8llPViJjf2iM+d6le+vW18pCV8c3zsqSYY/9zjzj5N
 bXIs9BlFtrHBRpS6ueidHHwfKlIqnhH2GGrocbXLgVkY5oiCAaDJEMgOfJzYXHxYmm
 uM9hEzYC1I1EbZxhGBcx1ybfmrs9SH4tW6iawSKgq87r+J2dbL83i+XOWEkZsLv+rf
 EA4K/6fa0Y3DQ==
Date: Thu, 24 Aug 2023 11:47:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Message-ID: <2k3cc3yfwqlpquxrdmzmaafz55b3lnqomzxjsvtetfriliqj3k@tv6uh7dzc2ea>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
 <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
 <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <64bpiz5nt3xgboxya26gcdh6d7nyyflm2m56orgjwwwibh52n7@yk4ogdcierho>
 <AM7PR04MB7046E8DD816FC99193B07E07981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6rb56x6m6vahizvh"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7046E8DD816FC99193B07E07981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6rb56x6m6vahizvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 08:47:51AM +0000, Ying Liu wrote:
> > > This dt-binding just follows generic dt-binding rule to describe the =
DPU IP
> > > hardware, not the software implementation.  DPU internal units do not
> > > constitute separate devices.
> >=20
> > I mean, your driver does split them into separate devices so surely it
> > constitutes separate devices.
>=20
> My driver treats them as DPU internal units, especially not Linux devices.
>=20
> Let's avoid Linuxisms when implementing this dt-binding and just be simple
> to describe necessary stuff exposing to DPU's embodying system/SoC, like
> reg, interrupts, clocks and power-domains.

Let's focus the conversation here, because it's redundant with the rest.

Your driver registers two additional devices, that have a different
register space, different clocks, different interrupts, different power
domains, etc. That has nothing to do with Linux, it's hardware
properties.

That alone is a very good indication to me that these devices should be
modeled as such. And your driver agrees.

Whether or not the other internal units need to be described as separate
devices, I can't really tell, I don't have the datasheet.

But at least the CRTC and the interrupt controller should be split away,
or explained and detailed far better than "well it's just convenient".

Maxime

--6rb56x6m6vahizvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOcnNAAKCRDj7w1vZxhR
xbJhAQDZaTkwwHUSQvHmPGZpRlOyyyziNVb6jv9YxbU1HZ0pywD/WigGDCjifkiR
8nfYBdnZbrK5UeFqdTRPOCdu3I0hEgw=
=X+lc
-----END PGP SIGNATURE-----

--6rb56x6m6vahizvh--
