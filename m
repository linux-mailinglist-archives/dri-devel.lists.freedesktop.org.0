Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8C2235CC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111616ED34;
	Fri, 17 Jul 2020 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A928F6E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:00:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E865580544;
 Thu, 16 Jul 2020 04:00:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Jul 2020 04:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0WBVzCtkULkTIiSPfKTqyX5eHWh
 bKHfLqeErCO3YmRg=; b=KSVv1acNut9qilziLKu5nYwT//sszYCt8C/T6bTDCsV
 eQMFlJcFsu1pf/vJwpqWankKi12SSSjPAnWXSniWo1OmcyjFjf+9gKTaT11wPEMT
 Zv4XSLGOyvz5AqE5s7NiTG95jycOq7qZNKFZWSPSlwpBP3jfUXTdhBic5R81VhwB
 7ZiOK26sRVKgeUtcMyAkrcVXvq6FYYBqQHFPaaNkz0o187qusZP84mK+ufJ1F8Pd
 exaiqPBTgxSnkr/Jsbk3p/qEG2RdCWz09S9iIpWh34XsUJZfsYxf0p5y9ctXNXfY
 v0YcZ6NFPHbAo4uNHnV6FM4qXhlmbQrMyzjR6ruWQdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0WBVzC
 tkULkTIiSPfKTqyX5eHWhbKHfLqeErCO3YmRg=; b=SjVVC1qmj8vshte4oahTrH
 sS0+id7NS8HB+5WdUkmvgkBB9qNQwwuXHRmV+6C+rctwBuCpC+2Hib6/tFZwvpJR
 5hPlZ9nNIoHiym5Lrq00DCg5yV7JCCKwViED1n5HTmxK9TuSnbtX+EIJD6dfqe6j
 RIwHsILl96ITZBeVJGqZhFIhYW764J9M+tvr1kC4iPvHl/1FigIul5Q6eEDcI9Qy
 t92xcUXEuHcH2wsydKTWuKEH+Puj1MtVic3UeCboP61j8qsF1plJ7Kb7Qjox6Aec
 eNBJYoaf+hzhuTj7AZdgDLFiVF/LwvuUaZM6VJrSvAZRUUXuS+0r2KhUU3qIKpvA
 ==
X-ME-Sender: <xms:LgkQXwaCBChfCQx0IABvrQ_0clzh5UhLzjREIrL5P6pQd3AZG9gJTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeefgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LgkQX7bcOnCHiQCCcJEWE4iN16Cu7zGpYiiDh-jpET7AAjEimdZE5Q>
 <xmx:LgkQX6_Vg-7d_434wtD4x7RsiZLwM3XCcvAibCLmtErs7IFiW3v20Q>
 <xmx:LgkQX6qhVAREf59FdOasfbS2CRKXhZXGh_537XV4sW9HpchPcOVRDg>
 <xmx:MQkQX3IAjSn7HdEGX8ZxN3J2K9bLDZoB3y8Qg2j305yX3KLMGhGCkg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA7A5328005A;
 Thu, 16 Jul 2020 04:00:45 -0400 (EDT)
Date: Thu, 16 Jul 2020 10:00:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
Message-ID: <20200716080043.6duzgo2ikeqr5lnw@gilmour.lan>
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200714071305.18492-2-wens@kernel.org>
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0751903694=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0751903694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="otipczuj6ij2bcki"
Content-Disposition: inline


--otipczuj6ij2bcki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Some LCD panels do not support 24-bit true color, or 8bits per channel
> RGB. Many low end ones only support up to 6 bits per channel natively.
>=20
> Add a device tree property to describe the native bit depth of the
> panel. This is separate from the bus width or format of the connection
> to the display output.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.ya=
ml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 0cd74c8dab42..8eb013fb1969 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -26,6 +26,9 @@ properties:
>    height-mm: true
>    label: true
>    panel-timing: true
> +  bits-per-color:
> +    description:
> +      Shall contain an integer describing the number of bits per color.

You should specify its type (u32), range (1-8 I guess?) and default
value (which seems to be 8).

Also, it's not unusual to have a different number of bits per color,
like for 16 bits panels where we usually use RGB565. I guess we could
make that an array?

Maxime

--otipczuj6ij2bcki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXxAJKwAKCRDj7w1vZxhR
xQvfAP0fFNNpze/ZMPlLdgUo7CYHvKxk2XOpTwI08Idy4WIBQwEAqmCRGSLbw8sO
RX218G2xEnhnaUtaHngA5puiZJ+WzQQ=
=BrQO
-----END PGP SIGNATURE-----

--otipczuj6ij2bcki--

--===============0751903694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0751903694==--
