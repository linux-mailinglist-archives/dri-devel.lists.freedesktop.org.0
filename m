Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFkQMbB0emng6gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:42:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31601A8BB3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930BF10E2E3;
	Wed, 28 Jan 2026 20:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V5sy0u3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA5010E2E3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 911F16000A;
 Wed, 28 Jan 2026 20:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687E9C4CEF1;
 Wed, 28 Jan 2026 20:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769632938;
 bh=N9bRTRnRi/F71DZAXsWoArwHXgrRZNZWQ2KdsfURCYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5sy0u3ue8GXSFoF5YArhrUPTN+gCqc0W6DH4mpjHy/w3hN4Lk4klplXE51vflLa3
 vRM7C0+w0zR/xQY5xx0RE1XSmI5+GbxT9C7jewdVirfP6AMQh2pYOLFySsusx/eUtE
 NrzQ0U084fAZjejhZns9iOuAF0XLTDU+fmvbcnfYB/US73q++pSJzAp5KMCRtUEbgC
 tXxrjcV5576XZ2IHhswEeq1ZM/L1N2ZhPFJJ8t4hthtyUXU7IoKz0b1XUAokEtQARf
 Pt98R5DMyTNJudxRjGASydUhr1fJa1xN9yy2r3Ct1nC5JpxzFhqjMSSx0gwF0eutOs
 ACwPemLaKCNQA==
Date: Wed, 28 Jan 2026 20:42:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <20260128-smokeless-angular-cff7e16ff8dc@spud>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
 <aXpwED5wSZbnIjae@x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+rUt8E/m7BH8j/0F"
Content-Disposition: inline
In-Reply-To: <aXpwED5wSZbnIjae@x1>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:fustini@kernel.org,m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,icenowy.me:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 31601A8BB3
X-Rspamd-Action: no action


--+rUt8E/m7BH8j/0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 12:22:40PM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:22PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > VeriSilicon is a Silicon IP vendor, which is the current owner of
> > Vivante series video-related IPs and Hantro series video codec IPs.
> >=20
> > Add a vendor prefix for this company.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > No changes since v4.
> >=20
> > Changes in v3:
> > - Add Rob's ACK.
> >=20
> > No changes in v2.
> >=20
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index c7591b2aec2a7..18f931f369198 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1745,6 +1745,8 @@ patternProperties:
> >      description: Variscite Ltd.
> >    "^vdl,.*":
> >      description: Van der Laan b.v.
> > +  "^verisilicon,.*":
> > +    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
> >    "^vertexcom,.*":
> >      description: Vertexcom Technologies, Inc.
> >    "^via,.*":
> > --=20
> > 2.52.0
> >=20
>=20
> I've applied the bindings patches (1, 2, 4) to thead-dt-for-next as well
> so that 'make W=3D1 dtbs_check' won't break for the next release of
> linux-next.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=
=3Dthead-dt-for-next
>=20
> I wouldn't normally pick bindings patches but it is a short timeline if
> we want to get some testing done in linux-next before sending v6.20 pull
> requests. I have created an immutable branch thead-dt-v6.20-dpu-hdmi in
> case that helps.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=
=3Dthead-dt-v6.20-dpu-hdmi
>=20
> I can drop the yaml patches from thead-dt-for-next if people think that
> was the wrong thing to do. If we think that the driver changes won't
> actually be ready for the merge window, then I can drop all these
> patches from thead-dt-for-next.

If you're taking the binding patches, it means the driver hasn't been
applied, and therefore there's not much reason to do something abnormal
like this? I'm not sure what the benefit of getting the dts patches
applied if the driver hasn't been accepted yet.

If this is only about linux-next, and the driver /is/ going to land in
v6.20 (or v7.0, w/e it ends up being), then the warnings don't warrant
doing something abnormal either, as long as whatever Linus ends up with
at -rc1 is clean.

--+rUt8E/m7BH8j/0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXp0owAKCRB4tDGHoIJi
0jIUAQCPxPMJAFkFSlKYJJsayCDN1Mc4q5bLo9nBYjr8rRdXZgEAqwqLK+HYP+KJ
lj2nW2S/kZbBQliNKngcF15VdRNArw8=
=CbCJ
-----END PGP SIGNATURE-----

--+rUt8E/m7BH8j/0F--
