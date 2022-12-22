Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15656545AD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503A510E555;
	Thu, 22 Dec 2022 17:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3AF10E555
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 17:41:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A42F5C00AB;
 Thu, 22 Dec 2022 12:40:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 12:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1671730857; x=1671817257; bh=ljQIwBiT6P
 nqZfUaJG0+9MBh7Tku4aeaSACQIIP1dU8=; b=TjOhLknhJMWWmT8aTUKeKAYXbg
 WaHrYJYv8Y4S3RvrbTMlMpKhWwFyEUHIq3Ssz07ZIAOsra8QW62NivQBkb7wVRM0
 uSPNsg0sepUm1O5EJxwyHiDIBKXy/iWDqtWdQq45uVcgNkgTHjsNV0tukITAE9Kf
 9fzv9vSQ5i9WAGdMxzXeqGAa74A2lK0XxdV/gWXBqAkGc25tHFo5TJ9hz/QGA3aJ
 8ujqDLnDj6sEmEpVWcXrocKJFAfYZB0JUqU7hz1RfeLJ15qjm87YqAqdYLzcVKwz
 kjreOw/wJf5MB3k25xBbS2YvsB2M4MZHJBMIuG3i25kxO+fJGCSRCVFoFvZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1671730857; x=1671817257; bh=ljQIwBiT6PnqZfUaJG0+9MBh7Tku
 4aeaSACQIIP1dU8=; b=alzusaQxC2H4zn3JmcHu45Td350zSpjO3obF2/rzo9hA
 miTvotG2GKJBFZeMGnZb+fjAsRCs6VdtF+1pjKHnpLViJQ75KkN0tPTovTopgtm0
 1WnfqJdIMpECjPyfGXW9fMVZ1Hao5FunYbEgWEUMyQ0xdg3vd/ganWQD1yK2pTYE
 lpOACcD72oLJxDWU0xJAkGvFgJRaB4XWXus0VTJeW9eaLxBiSvBsC4TWBx1Zu/qQ
 rQQyilIWZwlBr/r47UPaykWJUu/U7WVNO7ZxSwIoVrA6BmCi2pkazXvaZD6M+eOG
 dwX6vF9uCey7eLWv0CWwKaagbKdfw0Fj8xKjfvQr4A==
X-ME-Sender: <xms:qJakY3kSvWR4caeGMzAPuudbv3lLRenKrFxJeIEwK67yDGYI8-WuTw>
 <xme:qJakY62vmwCrSIQ_Eo6J3EgD9klELuCstWbUO98SDipfaAiH9voRPuFSOHpZlKAzb
 wlLjh7YI2GHLYlMqGs>
X-ME-Received: <xmr:qJakY9qS-xJ1yeKQbgGaTK3E4yz1FAzeZN3hKnN8oe84iJycXecv4_0JDZ2xjQEh-FvKxEWWVOOdcCBQunBRXTZ94xbHsGZUfGWcGYQ0de8N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:qJakY_nO6MxYM900ONpyb6atx92CDsbWNGV3uI2-VNVaUU-reY2POg>
 <xmx:qJakY12a42Co_J66YMX18MJDt5F6EX6uQP7wfOynHIioFD1gVXWyXA>
 <xmx:qJakY-vjOjJzXSOxeBeldfK5yCaNQin4bTQWjp9SJXr-DmyM-SFEOA>
 <xmx:qZakY-t9icM0LNN9p1lJ4OmqS9Z7WutFqC9rwbgSYnpm5VYOYLZ2Ig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 12:40:55 -0500 (EST)
Date: Thu, 22 Dec 2022 18:40:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Rodin <mrodin@de.adit-jv.com>
Subject: Re: [PATCH] drm: override detected status for connectors which are
 forced on
Message-ID: <20221222174054.tsj4rfzejrl3cc7g@penduick>
References: <20221107123657.24vbgep3jqeklb2s@houat>
 <20221215170359.92422-1-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p37xnirrqan5m5yb"
Content-Disposition: inline
In-Reply-To: <20221215170359.92422-1-mrodin@de.adit-jv.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, michael@rodin.online,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p37xnirrqan5m5yb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 15, 2022 at 06:03:59PM +0100, Michael Rodin wrote:
> The detected status of a connector should be ignored when a connector is
> forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
> adding command line interface using fb."). One negative side effect of
> not ignoring this is observed on the RCar3 SoCs which use the dw-hdmi
> driver. It continues executing drm_helper_hpd_irq_event even if its
> connector is forced to ON. As consequence drm_helper_hpd_irq_event calls
> "detect" so the connector status is updated to "disconnected":
>=20
> [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] sta=
tus updated from connected to disconnected
>=20
> This status is corrected by drm_helper_probe_single_connector_modes short=
ly
> after this because this function checks if a connector is forced:
>=20
> [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:7=
6:HDMI-A-1] status updated from disconnected to connected
>=20
> To avoid similar issues this commit adapts functions which call "detect"
> so they check additionally if a connector is forced and override the stat=
us
> returned by "detect".
>=20
> Fixes: 816da85a0990 ("drm: handle HPD and polled connectors separately")
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>

As reported here, this breaks vc4, and probably i915:
https://lore.kernel.org/dri-devel/20221107123657.24vbgep3jqeklb2s@houat/

Maxime

--p37xnirrqan5m5yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY6SWpgAKCRDj7w1vZxhR
xRloAQDBPrPvSE361m058JRvYOTalUo/1dvgEQncDKUjTGzGkwEArxTusD7G9wLm
INu9zWHVV0EzE8s9rPJ1rnmAq2ukAAQ=
=0ovf
-----END PGP SIGNATURE-----

--p37xnirrqan5m5yb--
