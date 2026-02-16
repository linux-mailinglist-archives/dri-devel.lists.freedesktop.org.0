Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCmSL6dYk2k73wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 18:49:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBD146C78
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 18:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136610E039;
	Mon, 16 Feb 2026 17:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dby00tjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7410E039
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 17:49:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D55FF4436A;
 Mon, 16 Feb 2026 17:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C45C116C6;
 Mon, 16 Feb 2026 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771264161;
 bh=j2JRRvBFBpNjZbE21GgntzBOAY0OPpor4fkKfZn1s5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dby00tjWEcvr+brA4a3bCwMlN8l2CVRvVDt8ZYET/0+ier+7zlvzKWYNyFDl/4Iy2
 5uU9U9KS71z4tmjZ9ju01aVxPQTA+csqlTbLNDo37Gy3Ad8nr9ss36/+fZLFTQFOa0
 uNY/MmpmWAPAJb6hOPyfkHM2jz80cg5TGr+rPHC+iVWOUAjMlRPR9G+SqXTlRkXwUO
 jotkhq7ttGjYO84B8OazOCm6NEsD6Q65czm0c2H3tkc5cPUOSb5OqVNh215IhVqFV2
 8h2bIm8alkAx6ylgphXw3sqOI+pc/FG4onHPoLtelK9+TRQrs6PfOWR8Arm1sdkL8R
 G4s8360FY8MBQ==
Date: Mon, 16 Feb 2026 17:49:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, mani@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor: add taiguanck
Message-ID: <20260216-appendix-recipient-1836ea619cf6@spud>
References: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
 <20260214085409.3489057-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nqp8U5/h/2erVZ8+"
Content-Disposition: inline
In-Reply-To: <20260214085409.3489057-2-yelangyan@huaqin.corp-partner.google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yelangyan@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 41EBD146C78
X-Rspamd-Action: no action


--Nqp8U5/h/2erVZ8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 04:54:07PM +0800, Langyan Ye wrote:
> Add the "taiguanck" vendor prefix for Shenzhen Top Group Technology Co., =
Ltd.
>=20
> The prefix is derived from the vendor's website domain:
> www.taiguanck.com/en/, which uses "taiguanck" as the primary

This website doesn't exist it seems. I get an ERR_EMPTY_RESPONSE.

> identifier of the company.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index fc7985f3a549..1856e455f7e6 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1598,6 +1598,8 @@ patternProperties:
>    "^synopsys,.*":
>      description: Synopsys, Inc. (deprecated, use snps)
>      deprecated: true
> +  "^taiguanck,.*":
> +    description: Shenzhen Top Group Technology Co., Ltd.
>    "^taos,.*":
>      description: Texas Advanced Optoelectronic Solutions Inc.
>    "^tbs,.*":
> --=20
> 2.34.1
>=20

--Nqp8U5/h/2erVZ8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZNYnAAKCRB4tDGHoIJi
0sbAAP9vGuy56Aa5sPepBXtSKSwOkocBKX4NYhUfhm9/h+mHIgEA/TYxkJoXjKoI
iEae4Up9VToCpWUD6IqVT2Bnqa8dwAI=
=6iXg
-----END PGP SIGNATURE-----

--Nqp8U5/h/2erVZ8+--
