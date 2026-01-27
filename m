Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJe1JgwVeWl3vAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C79A12B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B3910E5B6;
	Tue, 27 Jan 2026 19:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qqBUOdNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14C410E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 19:41:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D179360132;
 Tue, 27 Jan 2026 19:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC21C19422;
 Tue, 27 Jan 2026 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769542918;
 bh=ufkzvt4P3WovGi6PM2lTuF06cLGLKmm1kza1Bn3opPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqBUOdNyHp/jidhqzRhdOnhB2HMlqzNUPpN1OtQaYSg9guJmQcw98jXVnOwzb+sKw
 M8Rk39gEfv7vq5MFcSyq4Q5b9Oqh0ckeQfKt/aXJh11TwHBFlT+6ZznYfqZ0jSFomp
 8U007gjuHOHriZKjzyyMnj/ozcUwBnjdTToHt6rA3RqvTHRf/jI7h56ABgcyNoVxmG
 SgG6fTAAcd1wdRFQmygdh3sLNO96i7CZU8yljLGz/7UM23pZ+y41DmbAyAtJm1pgsD
 N3CAgiaGEU8W2zSbo33/YAfm5vqPeWqxoWjZ2xoLGgAEEpXT+UXbnBXr0xyw576fLN
 PE3o64Q1139GA==
Date: Tue, 27 Jan 2026 19:41:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: document Atrix 4G
 and Droid X2 DSI panel
Message-ID: <20260127-myself-sinless-95525b4c78ec@spud>
References: <20260125131904.45372-1-clamor95@gmail.com>
 <20260125131904.45372-2-clamor95@gmail.com>
 <20260126-patchwork-cofounder-8b7bb715556a@spud>
 <CAPVz0n1hBof7_eB6D39zZd5EfC2dL5-Ngf0ja7+kkcwQnnr7Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FwVs2IaKZpUuxLb2"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1hBof7_eB6D39zZd5EfC2dL5-Ngf0ja7+kkcwQnnr7Mg@mail.gmail.com>
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
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E24C79A12B
X-Rspamd-Action: no action


--FwVs2IaKZpUuxLb2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 08:26:32AM +0200, Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:45 Co=
nor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, Jan 25, 2026 at 03:19:03PM +0200, Svyatoslav Ryhel wrote:
> > > Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
> > > panel vendor and model are unknown hence generic compatible is used b=
ased
> > > on board name it is used with.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/panel/motorola,mot-panel.yaml     | 68 +++++++++++++++++=
++
> > >  1 file changed, 68 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/m=
otorola,mot-panel.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/motorola=
,mot-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorola,=
mot-panel.yaml
> > > new file mode 100644
> > > index 000000000000..2326a83bc405
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-pa=
nel.yaml
> > > @@ -0,0 +1,68 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/motorola,mot-panel.=
yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Atrix 4G and Droid X2 DSI Display Panel
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +description:
> > > +  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. E=
xact
> > > +  panel vendor and model are unknown hence generic compatible is use=
d.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: motorola,mot-panel
> >
> > What's a "mot" panel? If that's short for motorola, wouldn't it be
> > better to conjure up something at least more specific to these
> > particular users? The commit message has some info, but I still dunno
> > where "mot" comes from.
> > Seems okay otherwise..
> >
>=20
> "Mot" is how motorola called tegra20 board files which were base for
> Atrix 4G and Droid X2 in their downstream sources, specifically
> board-mot-panel.c. Since both devices use the same panel I used board
> name. Hopefully, at come point I will be able to name it properly.

Can you put this explanation in the commit message please? Without being
familiar with the platform, it's nigh impossible to know how "mot"
relates to Atrix 4G or Droid X2.

--FwVs2IaKZpUuxLb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXkVAQAKCRB4tDGHoIJi
0vM3AP99HVYtnmRr5OxMZo3zx3ORl5NrXZclP46g2ydF9HqIoQEA9UwB5NeAZQLb
9I84G5w8qyI1NdpMrReNRudwLddYEQo=
=zida
-----END PGP SIGNATURE-----

--FwVs2IaKZpUuxLb2--
