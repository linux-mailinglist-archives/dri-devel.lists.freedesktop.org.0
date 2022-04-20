Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE36508952
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD0A89FA7;
	Wed, 20 Apr 2022 13:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CA89F06
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:28:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9C5123202148;
 Wed, 20 Apr 2022 09:28:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 20 Apr 2022 09:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650461297; x=1650547697; bh=IUvE2Ka+6w
 zwF1X/M4kx7H4Hzk0xAzSHJL/7zT9pJvs=; b=pBfytwaFP4kGwoVTnpkb/mUL1u
 Orv56KaxMOH6vwkA3Q6j8MQzbJetIntfATsubsUXUkZvuQTDYFBX2iUqunGZC8Da
 YOatMgGX/UGMH+8XXMF7NyU0ae/kJv2PGTacERbUM2EksKF8/zAaXvwLYgkQ6GUq
 m4efZnvNa37kHBhQsH+LezJ3sEnSDfgPKQRr3e9+lylAOvFf/r4kMPMrLtG2JPih
 ywCzGovxxJIRDT3FCJjmb7iW67R6ltdfKn+827ZcLVXkCUAEVU0PzWs/IL/WnxA1
 Mvox2aVT8HUHImIiufOvJyCr7arRCuts45JjnourqJotadEHrxF6rikqoNig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650461297; x=
 1650547697; bh=IUvE2Ka+6wzwF1X/M4kx7H4Hzk0xAzSHJL/7zT9pJvs=; b=l
 ur9lnygeBEj73Qj1raXsvDpiFGidLXxuSHvcKnqugdYNel4oB3nnsqbET9OcQcRj
 TM/4t1SpzVDuMzbXMxYhDK+LeCPgEZtqdUnVKL9Qp7cjF2f2EL/0OEd4ZPMyzK9O
 KQKEYOKIw1DhI9Da2U+0HfcU1+J2SMArCxY5VGm6rXTpWVpt8ijzB/IfkwMSsIDi
 CgQC1+2WqYiHTF3q2kyTVrAqCUPg7rT82+w96Hm7OvJYK5BkPdLk6wrVcOxmkGg1
 LNu0HocAv0z8uR5GtEbxazy6oIDKXLFzzxkoveg87oKIVcjsG1lJ76k7ODUE2BkH
 x+YLOJIRpoIV5YfMDFrXA==
X-ME-Sender: <xms:cApgYkjqFA6pWTdqKZJV9Cyg0uSQnnd0752WFcN2ooDDmmmIZ7mV7w>
 <xme:cApgYtCMuntQ0WqNVb3UVmrJ45gDeRvpdrdnNDLYOr9vdLZidFtzoxc7yXUgpMVWX
 6eMFP-1tWDr6Cah7qw>
X-ME-Received: <xmr:cApgYsEsEXACq-XNUBIM0p1qkV_i9RoTFTaWkaGNfUuqQoMS0Q_XZe1TxlZllFcT7bIFrjBC1Ql-X5mDAiHCTqf7iL1HJdAkH2zO2RI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeegieevvedvgffffedtveeuhfehudevjeeifeegjeevuefhteeklefgveet
 feffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cApgYlTgVAo9pI72_ozNMxnJqcsHWMrUgoHDJbRtp0E0ASO5_wZHnw>
 <xmx:cApgYhzAYonmFczhdcEbngzbFlgKl8lqmjzKZUVymZSN6S0kNz3hCg>
 <xmx:cApgYj6QWxoazQujN5eO34z6geyFe4w9KEOwu-n3ZzxadTTQiVjLPA>
 <xmx:cQpgYkqhelzU4dWssPxL2fAi6Vk27CqiqgIPtCUHq2dFtOFuljUjlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 09:28:16 -0400 (EDT)
Date: Wed, 20 Apr 2022 15:28:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] drm/vc4: Fix pm_runtime_get_sync() usage
Message-ID: <20220420132814.3sy2ojw3dxnd5tcz@houat>
References: <20220419124407.ugzl7hknsytbhrmr@houat>
 <20220420004949.20508-1-linmq006@gmail.com>
 <20220420075108.xm5ujthootlpayy2@houat>
 <96d27d1f-55e4-578a-75e5-686362c05dcf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fun57gjjam5aec2h"
Content-Disposition: inline
In-Reply-To: <96d27d1f-55e4-578a-75e5-686362c05dcf@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fun57gjjam5aec2h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 04:05:35PM +0800, Miaoqian Lin wrote:
>=20
> On 2022/4/20 15:51, Maxime Ripard wrote:
> > On Wed, Apr 20, 2022 at 12:49:48AM +0000, Miaoqian Lin wrote:
> >> If the device is already in a runtime PM enabled state
> >> pm_runtime_get_sync() will return 1, so a test for negative
> >> value should be used to check for errors.
> >>
> >> Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync=
()
> >> fails, so use pm_runtime_resume_and_get() instead. this function
> >> will handle this.
> >>
> >> Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
> >> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> >> ---
> >> change in v2:
> >> - switch to pm_runtime_resume_and_get() to fix refcount leak.
> >> ---
> >>  drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_d=
si.c
> >> index 752f921735c6..9d7ffaf6bc70 100644
> >> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> >> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> >> @@ -846,8 +846,8 @@ static void vc4_dsi_encoder_enable(struct drm_enco=
der *encoder)
> >>  	unsigned long phy_clock;
> >>  	int ret;
> >> =20
> >> -	ret =3D pm_runtime_get_sync(dev);
> >> -	if (ret) {
> >> +	ret =3D pm_runtime_resume_and_get(dev);
> >> +	if (ret < 0) {
> > pm_runtime_resume_and_get will return 0 on success, so the previous che=
ck was correct
>=20
> previous check is for pm_runtime_get_sync() not for pm_runtime_resume_and=
_get (),
>=20
> I switch to pm_runtime_resume_and_get() to fix the refcount leak bug at t=
he same time.
>=20
> Sure it's ok to use check if(ret) to check the retval, I just follow a mo=
re common way
>=20
> for usage of pm_runtime_resume_and_get() in the codebase=E2=80=94=E2=80=
=94 check ret<0
>=20
> Since pm_runtime_resume_and_get() return negative error code.

If it ain't broke, don't fix it. The previous condition was working
perfectly fine to catch the errors from pm_runtime_resume_and_get,
there's no reason to change it.

Maxime

--fun57gjjam5aec2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmAKbgAKCRDj7w1vZxhR
xaxCAP9NqzEUOSu2m28Vv9PNrEdwrNVPxVKhJOOxy07TrV0NggD+IHpkv0BTgk5i
z0HS/MUWy/4cJaDV8S1OQPxnDXFeFww=
=v4MT
-----END PGP SIGNATURE-----

--fun57gjjam5aec2h--
