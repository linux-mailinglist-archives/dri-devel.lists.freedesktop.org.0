Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586924B08A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9DB10E79B;
	Thu, 10 Feb 2022 08:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB5710E79B;
 Thu, 10 Feb 2022 08:42:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 786B1580162;
 Thu, 10 Feb 2022 03:42:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Feb 2022 03:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=8UmB/0ivT0J8zqbGGFQS2Ruey/l6Z0P8AFKloL
 LCMgA=; b=V2ZJBt1VA11btQmfjyO0mhTP3qZyF6OlfzA3V0Yn0BqcZx71YHuZVk
 +JhBITlcoXhGeJwQAjC/tHOzCapnDi4KT46i0Q/dm+ycqgK0lhCi+w8la2V9eGRh
 KsWEoZfS45Tefej/RW2O/sEDzmXvREe7LYE0x5PHxQIztJ0C1dyhJqG8w3u1B6Is
 4R44tdJ+ESOEzbZPkqVFoIB7gZNjVA1Fnf1Uhb4ulUmzvJdP0XliU6fwScMyMSt8
 q7TQHFDWizOF2RdRdJqJ9c3FaFPD4ZC4uXIvUB4FHo1vsF4sjV24jaoHta7jGGHb
 suBQaBHv/EfzmDJsCsa5kUvZD/KLTwfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8UmB/0ivT0J8zqbGG
 FQS2Ruey/l6Z0P8AFKloLLCMgA=; b=KQQzmRJVllZnBpcnVd3MjVhgIWssn7oPK
 qwOrY3T13EitF4yzwN4Uinvj5zqUkg2XxknpoLzGO6+D1LW/I/D7DQkmQL3iAhmV
 TinFNTAZyn4pG5K8XHq5Hgx80O8fhFTD16pqSgfvwsfLgfUPdFx6to0tn6km+kiw
 G8VyrkV5F28FiYolOc1MiTDCJ8DXJYSmzYAa5/8z/8bq/Fe9fnNY9giKljL5Z5gJ
 9XPHjCTKMQJzypmbZmSRTe5+NgikFdJe6KwYDuxV2KfOx80ySi3pAP/mul9HLNzW
 /VVJgGxhVS6Py6NVuOfrLFubcgQluUn08BtCbLGmS1XURQcY6SlYQ==
X-ME-Sender: <xms:BtAEYkv_F3qBcQUSEmKXTM-wkw6rgpoz5qdMpb3w3kUGDZiw_-wkmQ>
 <xme:BtAEYhcxrzaWujr41iuEAwDqdhUJ_-jQ3QEf28K1Dqpv2dpNXHspL6hF7FJCZqIrH
 zXl7ND7TXqcw0LZyzI>
X-ME-Received: <xmr:BtAEYvzoRtn19X6FFsHaZKUBT-SI_KjaitBiH9nDAJQwLmYOIyvfOwaxqdJfbmrPrWTmUUfBMdOrLubo3l5K5ara7bV4mBC2EIwTml0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedtgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BtAEYnMHt83zZ4SjuOS5BT_2PCFBNrvRZ-yszzg1XY1UKxYkLfBjnw>
 <xmx:BtAEYk9C59ubWdp_QCdPFitqLJCaPM6Q0MClTwYA0lV_ra2B-gI4OQ>
 <xmx:BtAEYvXRxIpXtBLIO0-iKainjjVRPzyQW_S_HToLPK5iNWDcNWtKjQ>
 <xmx:BtAEYoWS6keON82kSNH2Tm4GqIQfQT_x-eBFHpKbQ1YLwkuWu7dTrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 03:42:45 -0500 (EST)
Date: Thu, 10 Feb 2022 09:42:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Message-ID: <20220210084243.grmjum55qc6sei52@houat>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-6-maxime@cerno.tech>
 <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
 <3a9f5ff6-52fd-25f5-2714-8801eba13dab@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zqzqaf7ypljyfqok"
Content-Disposition: inline
In-Reply-To: <3a9f5ff6-52fd-25f5-2714-8801eba13dab@amd.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zqzqaf7ypljyfqok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harry,

On Mon, Feb 07, 2022 at 01:59:38PM -0500, Harry Wentland wrote:
> On 2022-02-07 13:57, Harry Wentland wrote:
> > On 2022-02-07 11:34, Maxime Ripard wrote:
> >> The amdgpu KMS driver calls drm_plane_create_color_properties() with a
> >> default encoding set to BT709.
> >>
> >> However, the core will ignore it and the driver doesn't force it in its
> >> plane state reset hook, so the initial value will be 0, which represen=
ts
> >> BT601.
> >>
> >=20
> > Isn't this a core issue? Should __drm_atomic_helper_plane_state_reset
> > reset all plane_state members to their properties' default values?
> >=20
>=20
> Ah, looks like that's exactly what you do in the later patches, which is
> perfect. With that, I don't think you'll need this patch anymore.

Ok, I'll squash it into the patch that removes the reset code.

Thanks!
Maxime

--zqzqaf7ypljyfqok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgTQAwAKCRDj7w1vZxhR
xS9UAQDxZHzWI/TgE+H2KV94xkGKONXDoO5HPthQTVHFCaxKvwEA6xiQuQcP6y+S
9Kw6J1AxwVSzFV1awfCbQ5WIgtv24wI=
=d0Xh
-----END PGP SIGNATURE-----

--zqzqaf7ypljyfqok--
