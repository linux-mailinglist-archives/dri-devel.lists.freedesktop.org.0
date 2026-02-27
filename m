Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDDdJgteoWmksQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:04:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F037E1B4E3A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FB410EA6A;
	Fri, 27 Feb 2026 09:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bV3DNDdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B561710EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:04:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5CDE74451F;
 Fri, 27 Feb 2026 09:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E0C116C6;
 Fri, 27 Feb 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772183048;
 bh=ULqmscrmRYbb7GaDQ1iw2PdzZRP98XQa3VtXm4mRQjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bV3DNDdY9xhWKrvNO/Wuy+ina1DeOPshRfqwbuTvmPjwRx4yGWjfQVOgUGjL9uVMz
 jn9nl5F9K8IhoNQLMCgFUH+GwmMQjIB5QuGp7Bt2NGg+KO+KkooOYyQUKMC14i5Hbn
 U+rwxMtwtNNVF6xJ8KqiYPYB8xqqE5zPgytc64riiVotu95z9lGEZbQtVqXrVuOewd
 XNCpS2TWddFXJVBwHUJe+rl3evQjIJlQSeutsmpSHggaEe8uGS62b8/FNSMNSKTmTH
 lmoxE/xzS2yUe7U3f8TvMsax/mz/zTfFJ6W0NylHRtRMeUr05tjwISn8pY1SmERF+f
 D83rEBW+zmhKA==
Date: Fri, 27 Feb 2026 09:04:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
 Alexandru Taran <alexandru.taran@nxp.com>
Subject: Re: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Message-ID: <20260227-shakable-mummified-ba7bb54e0e05@spud>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <20260226-unthread-reformat-92b855c4acf9@spud>
 <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HGUIQTmEq3BO0PCt"
Content-Disposition: inline
In-Reply-To: <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
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
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:ruxandra.radulescu@nxp.com,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F037E1B4E3A
X-Rspamd-Action: no action


--HGUIQTmEq3BO0PCt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 08:45:29AM +0200, Daniel Baluta wrote:
> On 2/26/26 20:20, Conor Dooley wrote:
> [..]
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    bus {
> >> +      #address-cells =3D <2>;
> >> +      #size-cells =3D <2>;
> >> +
> >> +      neutron@4ab00000 {
> > "neutron" is not a generic node name. This should be something like
> > "accelerator" or similar.
> >
> The only dts nodes I could find using accel subsystem are from rockhip. A=
nd they use npu@
>=20
> e.g:
>=20
> =BB=A0 =A0 =A0 =A0rknn_core_0: npu@fdab0000 {
> =BB=A0 =A0 =A0 =A0=BB=A0 =A0 =A0 =A0compatible =3D "rockchip,rk3588-rknn-=
core";
>=20
> Also, Ethos-U64 introduced by Rob with [1] is using npu@.
>=20
> So, I think we should go wit that. I haven't seen any document to standar=
dize the naming.

accelerator, npu, makes no difference to me, so sure.

--HGUIQTmEq3BO0PCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaFeAQAKCRB4tDGHoIJi
0jXWAQDkJ0uqFe0zBBD97N8Nc9W1uspEgrsZpTqEwgxIVIlnKwD/SKBKuEJxP5os
9i6n1nocp64AivMzqCek95MinbTDIgQ=
=lAaA
-----END PGP SIGNATURE-----

--HGUIQTmEq3BO0PCt--
