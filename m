Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3688574CC7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4A11275A;
	Thu, 14 Jul 2022 12:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B410FC45
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 12:05:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 80DF65C010C;
 Thu, 14 Jul 2022 08:05:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 08:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657800343; x=1657886743; bh=ByZfPRJBbk
 rVwwMD7jhiSx78ihc3R//dZAXdFGDSPi0=; b=NiNA4zuAhOprHEJDMsUbvxr9iA
 xY7+8+NbdC+5CGgreN5rKAVfg+rNUxCl4Ob8gsp807FeegUGIRv+aEwJXEqPXLuL
 GlYlwO7v3ZKEPu9fog/KeaxvVmZY5PxopvguP89AfdvLupzq5G31Mt93DOteYPvC
 YE+2h7B5Ftfm2COF0wl5f2mjm8q8oPIBO2QoILVEK87Ber/GfwSI9I/RLWrYaG0S
 9CDqcOSjudEJWCgbiaIQbgE5s2jT6pSETeRJ8dS5ICM9mcomTYtnfW2JmzOJITMz
 LwJdo84E9HI1sf7FL0pJMTNE5ubApDcEw+5htUW/EA1QU/6xNhC/HX2XrvNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657800343; x=1657886743; bh=ByZfPRJBbkrVwwMD7jhiSx78ihc3
 R//dZAXdFGDSPi0=; b=UZ9Lr+u79FHOmT5vHSfEpddfVavWK/JWWJZCh+8P0/DS
 bHm77HRqOxcbxWlf9xKAOQso/J0PN0i8+7Kjsx7JzbrZhksMKYUBVAKoYqpAzXFC
 TStDAYr+w/jKdXLRuXbt5mkhHa0Q1R6IVANTCmj5aZbP9T+ZcYi7NInBve5GWa7p
 ucn+jAfSEZRcLZyIiPSFRLROu+60Bq4vqHPM98UX9bUX8zKy844O9VjZYnorbM57
 GpunVFQM4mULRtWzVuIFL3T+wMSVsu7I4EwszF/9U8+aXAZfU6CTNMp/KCasMv25
 s3EUUKZArR4FVAAdvmyNL56tTfZIcIy8oKZk4y1+bA==
X-ME-Sender: <xms:lgbQYgR3xdzYw1hv_bssT9VKzZkMkqBcxfx_nvzDu52uxo1hO6FAgg>
 <xme:lgbQYtxgp-BZTgyuIIZ-bCFYKVLTjoWU8c8e4jeQoGxZDUqYihLCLehZyEJjhBKSu
 _A8R0_rXz25X9pKKlI>
X-ME-Received: <xmr:lgbQYt09ehIFOOMpZfa2ZJw8Wir9tFjZF-TDepluxKzCZxkrq9h-0BlB1GqwfGIJvuhZ5wbjsFSlB0rRMJshBBMfTjnVmYpEc1Wdl9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lgbQYkBRQKRQ5lluVeBJQUN8DLiiK7wFgtFyldPIheJ2VLlr6fqOKA>
 <xmx:lgbQYpjcpVu_Q81EiXZt1oerIdxkQvqg-btWB9olwsR9QtCDHfGA_A>
 <xmx:lgbQYgoZ1rYr_rcW7lY6Q72ELe1fYgyBiS7yXw225LxJfTGaMexKKQ>
 <xmx:lwbQYqVXWMVlAtN_N2pJfICBysstitKA2vIT7gZqo2iF98MQu2uL0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 08:05:42 -0400 (EDT)
Date: Thu, 14 Jul 2022 14:05:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/5] drm/modes: parse_cmdline: Make mode->*specified
 handling more uniform
Message-ID: <20220714120541.dpjl3dxptqvcit6b@houat>
References: <cover.1657788997.git.geert@linux-m68k.org>
 <3696bcbf95fa1ae98f452c7ea32072642b46caa7.1657788997.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zqphagzjfcqkdkrb"
Content-Disposition: inline
In-Reply-To: <3696bcbf95fa1ae98f452c7ea32072642b46caa7.1657788997.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zqphagzjfcqkdkrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 11:04:08AM +0200, Geert Uytterhoeven wrote:
> The various mode->*specified flags are not handled in an uniform way:
> some flags are set by the corresponding drm_mode_parse_cmdline_*()
> function, some flags by the caller of the function, and some flags by
> both.
>=20
> Make this uniform by making this the responsibility of the various
> parsing helpers, i.e.
>   - Move the setting of mode->specified from caller to callee,
>   - Drop the duplicate setting of mode->bpp_specified and
>     mode->refresh_specified from callers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--zqphagzjfcqkdkrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtAGlQAKCRDj7w1vZxhR
xbYSAP4n8byE76xnaz+zJlmcuONil87f7RhgXKvX6yMYqCt6uwEA2sWGngLBw1vm
nCeY8s9hiGX9FigyClThmd0pVfQYxQc=
=uRN9
-----END PGP SIGNATURE-----

--zqphagzjfcqkdkrb--
