Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD94ED541
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6613510F5DD;
	Thu, 31 Mar 2022 08:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99110F5DD
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:13:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A54405C0164;
 Thu, 31 Mar 2022 04:13:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 31 Mar 2022 04:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=GvBKgqGMcUPI6REoKQHVzfllHu/AhOoJJshk2Q
 aByGg=; b=PXwxGZmU2/dPKahygmFjWH0i35DTafPoqwsfgCnqWYiVx8AclOsJVV
 VlTGI98xgML+6314oYMH1xue81o63YzQFmuAUi9xINYDWkjM8WUOZ4Mlrqzh53V9
 BB39fqU+KiTpytKlzvdsXzGITylFJ2nTTGh9bG1eT4ocWu6JImu1K7ozLERYwH+l
 x65NZvDVFs7co7h1GrI/GZcU+iwJXJxW708R88fMveBElq4oAjoiAHM61yxOxC2P
 hjajWgSwsBREkcrvTo+J823GV3K9N9r//WX9O0wSTC2xw/jRHwtGnjIdl7vXCviz
 qoKFWsrwDTGzuHgfRlfMCq1KcKonZKAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GvBKgqGMcUPI6REoK
 QHVzfllHu/AhOoJJshk2QaByGg=; b=gyS8YG7mkUAhpn4UVMFWlPVMEO46jfTTe
 TrwsxNJzr7Wr3BCYiJHYiKxcI/6/1J4lGWKb/MVfUeeLhJrhVvodQFQxB49RsrJC
 aPOPZCZAn23d+v94mcHU5RQJFs4tPJNhGMt2VYgTzDwcyBH9VVUvTaiXYhk3OmTx
 sgvzsCKt9ND6NTDcedm5gD/abLbUOt7ptEzsp9FeCfrmbji0zys11aWW4Av1UE99
 odWyn38aLWenzjiX2o1hqI82GlO9Vgenq9rpRn0VdWKIsvEcHLKby/yAeykkXpaV
 4keZJORjf8hkdp8V1Q4NsdtAvyPzT5kVDWm4RZJWPM7WV8fV30lmg==
X-ME-Sender: <xms:qGJFYj9wmie2diVO-y9SL_G1xF4sN4yTHbcpvOUX0FbAIqEWZpEVqQ>
 <xme:qGJFYvuApAFDPAnROqio6S2R1xKU0Xtq92HW5uzkBA7sdSqoAil6MJqORU__UWpK7
 IsXe9Zw96GKoPnIVRo>
X-ME-Received: <xmr:qGJFYhDFsAfznQtXS7qE9Yxhu9bNHYmQUUhMJqFQicW2u7-IVWHgD4XOLJVYOlFvk8Wvy8e8FbueODj1HXVqivNd_-rNWnE4HSoyUzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfejvden
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qGJFYvez8-YNBE4xbvpueisek1l-7W3zSO3iqS5Eo_ueOQ90a8xiKg>
 <xmx:qGJFYoNOa58176oPWiud2uWXFC8b7IO8AnblSGwRnFpo-6ss96BuoQ>
 <xmx:qGJFYhm85MR6pgpkfS2MBGy_hWeuxSNRuQi7X1XthtfjDfl3_MZY_Q>
 <xmx:qGJFYlondYyE4fkMBMfHLPbhZ2bxMJR_8GNpSyk9-T2ZCeOducxlqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 04:13:27 -0400 (EDT)
Date: Thu, 31 Mar 2022 10:13:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: KMS Legacy Cursor Support
Message-ID: <20220331081324.l6jdellj7rk5pzew@houat>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
 <20220311142205.ztg6njrubmnjud7c@houat>
 <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
 <YkQmrQCt5IPOMxj8@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rkbjliba5c6w7ed4"
Content-Disposition: inline
In-Reply-To: <YkQmrQCt5IPOMxj8@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rkbjliba5c6w7ed4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I'm using this thread as the occasion to discuss the legacy cursor stuff
a bit further.

I've been trying to address the issue detailed here:
https://lore.kernel.org/all/20220221134155.125447-1-maxime@cerno.tech/

And the last patch in particular:
https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/

On Wed, Mar 30, 2022 at 11:45:17AM +0200, Daniel Vetter wrote:
> On Tue, Mar 15, 2022 at 12:53:30AM +0300, Dmitry Osipenko wrote:
> > On 3/11/22 17:22, Maxime Ripard wrote:
> > > Hi Dmitry,
> > >=20
> > > On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
> > >> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spott=
ed a
> > >> UAF bug in drm_atomic_helper_wait_for_vblanks().
> > >>
> > >> SuperTuxKart can use DRM directly, i.e. you can run game in VT witho=
ut
> > >> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
> > >> non-blocking atomic page flips and UAF happens when a new atomic sta=
te
> > >> is committed while there is a previous page flip still in-fly.
> > >>
> > >> What happens is that the new and old atomic states refer to the same
> > >> CRTC state somehow. Once the older atomic state is destroyed, the CR=
TC
> > >> state is freed and the newer atomic state continues to use the freed
> > >> CRTC state.
> > >=20
> > > I'm not sure what you mean by "the new and old atomic states refer to
> > > the same CRTC state", are those the same pointers?
> >=20
> > Yes, the pointers are the same. I'd assume that the newer atomic state
> > should duplicate CRTC state, but apparently it doesn't happen.
>=20
> The legacy cursor hack stuff does this, and it pretty fundamentally breaks
> everything. Might be good to retest with that disabled:
>=20
> https://lore.kernel.org/dri-devel/20201023123925.2374863-1-daniel.vetter@=
ffwll.ch/
>=20
> The problem is a bit that this might cause some regressions, for drivers
> which don't yet have the fancy new cursor fastpath for plane updates.

I've been trying to force it to be disabled in either atomic_check or
atomic_setup, and it was either slow (check), or ineffective (setup).

It's not really clear to me what this hack is about, and what we could
do to make sure the cursor plane gets updated without waiting for
vblank. vc4 has async plane update support, so I'm sure it's just some
plumbing to do but I'm not sure where and why

Thanks!
Maxime

--rkbjliba5c6w7ed4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkVipAAKCRDj7w1vZxhR
xQuxAQChh7jhvovIUKA8qPLEixVCmRiSKPIEzc5koHDGus44JAEAi0qjq02fjNXW
tJmrgisBnsJGIcb4ooZ+z4oa1epxNAU=
=bopo
-----END PGP SIGNATURE-----

--rkbjliba5c6w7ed4--
