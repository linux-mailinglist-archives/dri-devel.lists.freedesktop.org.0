Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CA49B642
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0738810E374;
	Tue, 25 Jan 2022 14:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA13010E374
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:31:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2189A5C0051;
 Tue, 25 Jan 2022 09:31:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Jan 2022 09:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=UioDS7bIIR9pBSPUFKuW1SvnQf1rAgYbRXCxgT
 Fitkg=; b=K5qyME3jHAEz5knw9t6SnuvlkQN6f23qval+p8ijL/BQp+HXmX4fUd
 H7rXu09VNWk6m04iba7eidcjy/Gu6+Y8TLpjoosg0/n8IvYpbb9vXX75/huLv0Y6
 yKv321gHxaZ8I1ltDOb8q+Tq1xQ5u8fbxhPrz4LxrUpEyViPPpdxnOGYaVn6UzBB
 rAgE72dFw/YjmjzMP19+vk7swfGvN76r1eIJuc0eUTMPuHHQp0kJki3iZhFWRW/J
 0s5mEHPRj2lUP46Y8/R6yC3tzG5awxKByAC1tWFxedwoPxj1wuhHC2LEZspNU0D/
 TuN5WAHnbPPpDbEdNqqX9K3NJspA0K2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UioDS7bIIR9pBSPUF
 KuW1SvnQf1rAgYbRXCxgTFitkg=; b=VnyrOVCHpuJtLjnxkAaIfg3p0IppkS3XV
 loRafFppefz0cBGeC/h2tEai3C/GQm4RiHZaiAg/Fe6aLKdDZg5KaCg4jEGyY0BM
 y6QhdkTSbR78+VrdhixCogL4xkx/CPJF/OfYL1ZQNKW29xF1y0NDIgirgfP3EyHQ
 0PICwvQp47D2TGlbN+uYLOK0xYiBj0SqL7B/yFSQpwydDrhbhU2iBNyvA96Vfv57
 3tA+MD3Wevi5z+wXJYOvHBnELwde7r0njQEP1uu6aXR9yv9aTOXZ3fo33Cb6Lgjr
 17oHGKPAVgkhJWKoAmbfKMXQI6ldOu82At9w6NUjOHAv+8pNQkdRg==
X-ME-Sender: <xms:qAnwYdtyJuVbjCPiSfAvguz01_0dU9vjy-SJOjvjMIJQRshNf9eDYA>
 <xme:qAnwYWfFaTAUcFNGB_tr_ZAkfmFCoqoKJGGbnVnLlaBgwSvy4ZSvYvhzddEsQBFLO
 tRYghPTa0GvYh8bd9M>
X-ME-Received: <xmr:qAnwYQzvt-htM4jh8cq0VtvCnxi3QVA0jGcpEl_9pTP9QilpCyDl_pqeWmYEM1qXE9JiJUFGQn9SNlM2ojzrdbHOXX_1X0R---UTv_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhkeeiffdvkeetfefghfehffelhfekhfejtefhteekleejgeeijeeihfejvdet
 ffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:qAnwYUP8CGMwnViH-KS2o6PeqgaYDQcvGts2Kc9dGFcXPZPEUPyaHQ>
 <xmx:qAnwYd9efyGu8Aif4dLv-oFJA6YHg-5J2y25VSjGDl5LvPRaNlK9ww>
 <xmx:qAnwYUVb8grZPLfnGiwGoWDveBZtYwPfNGkdSC22vEpxou5Q6od7zQ>
 <xmx:qQnwYQkq7hEDLM_mTdtXdTwJBamRqC-uEZ4m9aMoZTuH4eE_oadJkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:31:04 -0500 (EST)
Date: Tue, 25 Jan 2022 15:31:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
Message-ID: <20220125143102.gpwoj3w4yoyeeams@houat>
References: <20220125142928.750258-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cmryoqspjsowkygz"
Content-Disposition: inline
In-Reply-To: <20220125142928.750258-1-maxime@cerno.tech>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cmryoqspjsowkygz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 03:29:28PM +0100, Maxime Ripard wrote:
> Even though we have the other drm_display_info fields reset, the DC
> modes are missing.
>=20
> This shouldn't be an issue since it's explicitly reset every time a new
> EDID is parsed.
>=20
> Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20220125093251.594772=
-1-maxime@cerno.tech

Sorry, this one can be ignored, I ended up sending the patch instead of
the b4 thanks email.

maxime

--cmryoqspjsowkygz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfAJpgAKCRDj7w1vZxhR
xX6tAP9Qm5wgD1fL1pLV8R8ftokYp+p8o/kvq4QyF5K2CQNhhAEAwgaVo58nhqAa
onJNrk9Oq+CozhqDYvPGvAB7UC2Gwg0=
=haLW
-----END PGP SIGNATURE-----

--cmryoqspjsowkygz--
