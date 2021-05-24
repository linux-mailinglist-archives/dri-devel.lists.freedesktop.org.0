Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6DF38E6D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34E6E55E;
	Mon, 24 May 2021 12:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20B86E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 12:45:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 60BF93286;
 Mon, 24 May 2021 08:45:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 08:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=EqrWjydNtPHKtRRAqpTKU5Ag/Mj
 Ht7wOFilARXgopKU=; b=H6A2E4J0aWmrW6AKKpi7MwFNhCdXUOMziP4p5qJQtnV
 gYaUuoH/V98KSRjNL/Ksp0fw+wMtFfPXXxso5kvbn7M0BJKksAeb2C2uynLHIUTd
 xC9V2JUhwnm4NayDdpbGEJU455hMgpPyyzBwVfYo0cbFB55wNbGzs2koPGBuIJ+B
 nB1XIKsUEeCazg8LkdwM453qpP1Cy1gid1fiYt+GRzGBx7Zcf7Y/P3bcPhyNHOJB
 zE6W41l89L+pz502j62Qsk9r/iDJInBtMBULkyIrGOeQCN4k5XDLR77vT4TSN0Lh
 EvHhiHTdizBd44Xm9yDOsOC/JAVmPE9DCVnEOrRMBPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EqrWjy
 dNtPHKtRRAqpTKU5Ag/MjHt7wOFilARXgopKU=; b=GWQpOSilQd+X/p4DVr/fVo
 zrLj26NfcZL8Cs/gKk9vYM3qpNPjrTyaDpbYCP+rwALKUY+9oA2GYvcxXxfrTmvK
 5PQGfKbg05CaV8iNEztLSL5sI8OyAIGCFIXHzCpV0+KN1kUzseVTcM4HRLb4eqTu
 yZTs2JFfTAD/ng+Ef7vzP0+++QTJnfFKidQdoFW7FivWtyY+UNJW70kt7Y2AByA9
 2hkVVgH9d4PS4FaTvxBn7Tv36EwDG98iq11tZemy48+Gv2Zg4/Fqjje9Fps8RswK
 tUBiKyU9l7s3ik7nVRypZjVlCw6f8RuMiw/65SDsKhvemabM1437XuH3upa9YM9g
 ==
X-ME-Sender: <xms:0p-rYJSPQ6Biq4Byb799D4tH1m8mVNmLBrubGKyhGl_T-TrtHI09HA>
 <xme:0p-rYCw2Kewt5Lp0rgljP3XjdXCi7kON6XG2Zh7ip55q3j8EXYlPDjvZo0hghy-8F
 HmjftVPrEVBxb09ZjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0p-rYO3wJ6QbziyKXlzjXAriEYKXQDHG6VlT6w_UxNGVh22g3LekBw>
 <xmx:0p-rYBDv1axzpLy2V8v6T09QwXDR15koyfsKtvNfd-BNMMHPY9FbUA>
 <xmx:0p-rYCju4krJ1cRueqSB7iCPskPCJN5qbknk7Zet15bpZWi8rBn_Tg>
 <xmx:1J-rYJqQHxmAsalHcobUmWaWU0HmEDM5CdVumMIG7gGPyml5xJ6VHjAeZqg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 08:45:06 -0400 (EDT)
Date: Mon, 24 May 2021 14:45:04 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v4 00/12] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Message-ID: <20210524124504.i6dlxjkb265wjcxw@gilmour>
References: <20210507150515.257424-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ybk7u4ui2mnpwcg"
Content-Disposition: inline
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4ybk7u4ui2mnpwcg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 05:05:03PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here is a series that enables the higher resolutions on the HDMI0 Control=
ler
> found in the BCM2711 (RPi4).
>=20
> In order to work it needs a few adjustments to config.txt, most notably to
> enable the enable_hdmi_4kp60 option.
>=20
> Let me know what you think,
> Maxime

Applied all the patches but patch 12 since we have an ongoing bug on the
core clock rate that ends up with the display being stalled.

Maxime

--4ybk7u4ui2mnpwcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKuf0AAKCRDj7w1vZxhR
xaQ0AP9K0DT2OKNbbVSyuFIPIw2N7lTpaZXRYT9RDSA0gvcfkwD+M713WPYGMptc
AjzhyDphIrCKynuseSNxJV8h9Yo2AgY=
=6vVh
-----END PGP SIGNATURE-----

--4ybk7u4ui2mnpwcg--
