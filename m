Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1E4F7E72
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CE310E752;
	Thu,  7 Apr 2022 11:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425FF10E74C;
 Thu,  7 Apr 2022 11:52:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 390AE3201805;
 Thu,  7 Apr 2022 07:52:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 07 Apr 2022 07:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=CYQK1Aw0zHXhtboijYB6+yQFzMqQpbyg+dX8KI
 bADhc=; b=iqcSpjURnuazV1vebxsY365jW7r+bLu6vSHCaAP53+2VuQ0yq2UX6W
 CtrUsXuPyQriT0aNdSYZdbciKYSpyG+V+8HTfuCGvtT1n8oIu0YnWsN7Yh9NLs2a
 KZQWJ5OhG3q24zCXei/ZTf1prl/xVkH8gmymDuAQkd3GtETqRcXiRFDJlihLM9qD
 4ulc6/DAc8PtMF1G4vQTbEGNN6AVteIxLBXL80XR3Ah+cERtnm0+iHnZB3QltEjZ
 khUtIw03vkO4AZj85Kvlm+5jU/MUlEAuRajFqg7t/kug3E0SdP+xwwd8sUt8WQE6
 rauS8Up+aEHy+b9FhFPAq98ohyuMoPKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CYQK1Aw0zHXhtboij
 YB6+yQFzMqQpbyg+dX8KIbADhc=; b=HlHjRz5Rx644dmkU1WDtV80YdcFjZwS/p
 9zngXyhxJdhm41RgQSwHPb1GQGQMXy4mkTGCZ4Sw/3BwU/ZmPlT0LLfdWIU0agNJ
 B0lJTrUXEiRoWvCdqClj8QTaS+ZwD8iv0Dk/a7zuu5vKyKM1lB+gGZhKD1JT6gz0
 xzvszyW7Fce0m+dTjlPqpypjfaqGnjQsiSJP9BplsQP2I2Hro585VQtVXPmz2yiQ
 w37u1YFy3AqHzd4FV4wyjYGXkYNnkisj/GBJCSfN6GtuPKSxH588QIhSiQ40xdCE
 +SOgbcIeYIPTc3u871EyhwZORmQDptFFBIq0NB4WO7UK6BQ2ZVHhQ==
X-ME-Sender: <xms:e9BOYr8k2iIttSBISJDoMiu9Guh221u22Yu-n94-0-K-zsaFPcgjkQ>
 <xme:e9BOYntb7532HhbRvY2KRVFSVXfXBqca3WS7W6qNjrgmyfeFbwhn4mE2uCIfK3cPa
 UQ9XDErcxitqwb30Y0>
X-ME-Received: <xmr:e9BOYpDN3kFJcE3fCB5MfeoSx-UfAcFiq6cbcMK2BnOTt_fLbe-YIPHP6KKPYikbbObE6uy9DwRcaSHwemhKSk_5JBMGB1_YXQNLToA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:e9BOYndSMN4-sVPwuIsyMe4QC2Sl9sNUWOewYMvmR0R-y7lqyV1PAA>
 <xmx:e9BOYgPLoXgybQbPQmv2_vMRg1Ga_8dggnHZHYgTrm_VYtGoHh_oaw>
 <xmx:e9BOYpm-8voMKbyoi0nRpkvvE6lHGNsZUFeKAdRo_ia9E-WqO59QMQ>
 <xmx:e9BOYvr-6uUXPvPfoboOBzsEI12On0sU1Zh2qvjB7GMrbZmSXnnPQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 07:52:26 -0400 (EDT)
Date: Thu, 7 Apr 2022 13:52:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <20220407115224.uzcljfhvx4ix6sfw@houat>
References: <3b8e6439-612e-f640-e380-51e834393e94@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ajx4b27gcfb32gg"
Content-Disposition: inline
In-Reply-To: <3b8e6439-612e-f640-e380-51e834393e94@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6ajx4b27gcfb32gg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Apr 07, 2022 at 12:56:27PM +0200, Maarten Lankhorst wrote:
> drm-misc-next-fixes-2022-04-07:
> drm-misc-next-fixes for v5.18-rc2:
> - fix warning about fence containers
> - fix logic error in new fence merge code
> - handle empty dma_fence_arrays gracefully
> - Try all possible cases for bridge/panel detection.
> The following changes since commit 7344bad7fb6daa4877a1c064b52c7d5f9182c4=
1b:
>=20
>   drm/edid: fix CEA extension byte #3 parsing (2022-03-24 11:41:14 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-202=
2-04-07
>=20
> for you to fetch changes up to 67bae5f28c895f8737a1974c3f31cf12b9170b14:
>=20
>   drm: of: Properly try all possible cases for bridge/panel detection (20=
22-03-30 10:16:05 +0200)
>=20
> ----------------------------------------------------------------
> drm-misc-next-fixes for v5.18-rc2:
> - fix warning about fence containers
> - fix logic error in new fence merge code
> - handle empty dma_fence_arrays gracefully
> - Try all possible cases for bridge/panel detection.

I merged it in drm-misc-fixes earlier this week, so drm-misc-fixes is
the only PR that needs to be merged

Maxime

--6ajx4b27gcfb32gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk7QeAAKCRDj7w1vZxhR
xYkEAPwOdp8Kp1KCdc4OBIf//Oj42qCxULWDH5Yeh73J2n89IAEAlDkfFp00CcuN
NT5hW8moR1776WMa2eq2a6lZEk7btQQ=
=p7G2
-----END PGP SIGNATURE-----

--6ajx4b27gcfb32gg--
