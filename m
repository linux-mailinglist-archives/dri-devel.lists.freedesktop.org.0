Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D9FC131
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C916E32F;
	Thu, 14 Nov 2019 08:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AFE6E092
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:01:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 0B85D46C;
 Wed, 13 Nov 2019 04:01:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Nov 2019 04:01:30 -0500
X-ME-Sender: <xms:aMbLXQs5uYEKTl5wE-PZ96l7rH9KZck1lzoYFpCkphzlozfAHX50Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeftddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehgtderredtredvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppe
 eltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvges
 tggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aMbLXYmUtAmLl3pUOg7wmYtyJTDyf_BEgrxsmYolUVijRc0IDnvH3g>
 <xmx:aMbLXSL7T67TbUQo5FJ2bLic1WOQ9d--EJkVTZY-rs3zmb6nVcp6jQ>
 <xmx:aMbLXeJpmVWdvZoClM15OWB0-2D-T-GsUwssIvcbpBqKUKaJTdR_dA>
 <xmx:acbLXdtJE5xl80liukXLUTbh99q9WKNnsiwASuFwsTkcQ7FyL0dCLKIdsNI>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2BA38005A;
 Wed, 13 Nov 2019 04:01:27 -0500 (EST)
Date: Wed, 13 Nov 2019 10:01:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: anx6345: Fix compilation breakage on systems
 without CONFIG_OF
Message-ID: <20191113090126.GF4345@gilmour.lan>
References: <20191112204551.541449-1-maxime@cerno.tech>
 <CAKMK7uGML6fiP3YmG4gg1AVJSE06-pvw6NynAF7w41QBdG+3wQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGML6fiP3YmG4gg1AVJSE06-pvw6NynAF7w41QBdG+3wQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=39Ke7TkwV7h5jV+K/69RoDAR+Eg
 1Y+wbUPxv2/uF2ZU=; b=CDVfkxTUzuFaRlOzLjy61d85ovNb5Zne/u0zpkJw4V0
 ma2gY04miX0AjhWxpVx2GdvMBs/EJZy89sOtBuMfuqQX8e17sdiVmhkq+5nTSuVs
 VxWFBybnb6Zd3yCkK0iycEqUsp71B/saK3qnCc535NBDMQexMQQo6+veM3N3/qYE
 pCU2twjM5OK8ptRF9OMhp5tigT61IKsul2nWA0EXVItB/0NbVkpL6be3ZJPRPt8X
 3WIETswO239zzQRXQdIw12aWdIcewyIk2flgZBdHBFTOePrD8ZDRQMEolRQjG3xe
 rqQ5LtY22hbu+9UPE4MJbYWOdLeBod3iGc6AhEaz7Lg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=39Ke7T
 kwV7h5jV+K/69RoDAR+Eg1Y+wbUPxv2/uF2ZU=; b=TgGlCblHn8sHQsGoDqOxDW
 /1GCS3vzLDkXarHYRW5iaFHMqDSufDf45fC4nfORNK6FrWB1tWAAQL8+kQHGeBB0
 xyd6WhG9zWESkwbRpuXG+KVV3CAnqbwVuk9+baU/J30cL/hA8zDPYUKxuCeMVGNj
 Qd0Ftf3x3nr282PAZv2upsBd7mhS/wiP0yBSn6y7A9RhfA6GbRU6zQ4XURql5o49
 ATFZFaMWUvan8GoC7svbmLrdGM6fBkPN2+tp7W8riMcpBQ3ixnp1ciu9dG3gd2IY
 uvGIfTDWaaXS/B60koObwm5Ke8sMFbs/C0hyOVvLnFwpDGP7AgFAFYCzQaCVwmBw
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Torsten Duwe <duwe@lst.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1590271126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1590271126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jn9znQ5OoOl0oegR"
Content-Disposition: inline


--jn9znQ5OoOl0oegR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 09:05:42AM +0100, Daniel Vetter wrote:
> On Wed, Nov 13, 2019 at 8:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The driver assumes that the platform uses the device tree, and thus relies
> > on some fields (of_node) being declared in some structures (drm_bridge).
> >
> > This isn't true for all platforms, so make sure we can only compile the
> > ANX6345 on platforms where DT support is selected.
> >
> > Cc: Torsten Duwe <duwe@lst.de>
> > Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed, thanks

Maxime

--jn9znQ5OoOl0oegR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcvGZgAKCRDj7w1vZxhR
xSNYAP9cpuTlwHHS4a10YLNGZ9ptk12vkuhI6UPDy2eufmpGSgD9FigpxRBJhl3L
YiD00bvxHKiM+Rg+wfU04g++if1B3gc=
=QUw7
-----END PGP SIGNATURE-----

--jn9znQ5OoOl0oegR--

--===============1590271126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1590271126==--
