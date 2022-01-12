Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9B48C51F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 14:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92310EC11;
	Wed, 12 Jan 2022 13:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD810EC11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 13:51:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 135C35801F7;
 Wed, 12 Jan 2022 08:51:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 12 Jan 2022 08:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MLA47hZB1A4Qpb5hssg01vfnJip
 n57xpzNo0zfRv1Sk=; b=E/XE/OAvd6p+HarUW+eHIk4TKY23snVAEnbwHiOLYoV
 F9CJsAVNntW0Tumzl13g3HkVg4r0e60Vz+FGtjIWfBLBdCfTE8b1Ge9BN8IVdpJY
 Eiu6eYfCNBgzDxa+I8mxP88eN7uPfhv4KzE7cR38v2umqePMcdcSvL+ePY2gGvUT
 TlKSYH6efZmw9GzX5+ida3qBKcscmtXn2g0o28c10/usUGDoUtE/Y3B4A64qvTne
 MDzPEyQ1nSxG2sN7VcvnLZZqBFtQPof2kGA5A6S/CrrLvbirjHnxJyFy2GYopxVQ
 xFGmhw74Z3dkiRV+Y+0JkG7ewUTgT0QZ2Apfb4B8ndg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MLA47h
 ZB1A4Qpb5hssg01vfnJipn57xpzNo0zfRv1Sk=; b=GXJV4rmfo/RafX/62NIGNT
 MQPluOvANwW2ld6EUeie+B0Jrv72rav5xYIvVAH6Gyq+dryBz9usv0Qo2zSgOMKY
 kGTLNhdo/otTORQyq5/xOICBlruF2X4vtFH0c+AEwn8gyhM7LzEZ94oorRPIzz9H
 HXv1F5894Rn+eCBSc4mhBFcTDCuQoTy09pc/mqWm0VwEFjeGtQZkZpfynB8PPcnW
 e+7+/OnIhZLjvc8npJgPxnmTsazbPTdvpVApR8pj4BXccZv58SdSrjekpMyWf1QF
 Vr7PH9Y0q4uhbSiaLIVdEe+kD7OaaoRlq1/qK4x1YrKgkqBqSY7JgDGw60ALGYoQ
 ==
X-ME-Sender: <xms:9dzeYUT59e-PAk2Qsb4jP6YUOCwRNbzBiq26eAVHZKc7nnWVV6_quQ>
 <xme:9dzeYRxWVDS3h-bxENOSEyJQCFeMatNALanLOYkc_XQlE6nBv_29nqt9r5QbBAoph
 9EbIS2mx445acbCalc>
X-ME-Received: <xmr:9dzeYR0qdq7ImNfEpmxvgp46pjJHktMZe_8cVkR4M3rO3h9TBS5Z5EZhnBHK99XkyAOGIg52sYX4qv1B0iAepLDlyjhXrZjUUiBOmH0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtddugdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelgefhjeefjeduudduffejheehtefguedvieejjedvfefhkeevtedthedvhfek
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9dzeYYBoxa9ihjQQQ_3rxSeJW9KRF1LOMmdfI_LwfM1sWwmCGCuoYQ>
 <xmx:9dzeYdhCNMUL1gxuDrdCC5_xUMz6GbGiFQCU9i5Q5xJBpz5CByu00Q>
 <xmx:9dzeYUoiVVtsIZuJHN-QPErqyql5e7R0NdLghIZ6eN5Quf-uEWrxHw>
 <xmx:9tzeYVw-sdptMcAwBDDL214Ex6VA-HuT1YetBEUp9rqQWltcLFq--Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jan 2022 08:51:48 -0500 (EST)
Date: Wed, 12 Jan 2022 14:51:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/3] clk: Implement a clock request API
Message-ID: <20220112135147.dbkmsnlqyipq7urq@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <a5400ae3-f181-91fc-bc35-db989584c70b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t2qv6kke3mwujz2s"
Content-Disposition: inline
In-Reply-To: <a5400ae3-f181-91fc-bc35-db989584c70b@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t2qv6kke3mwujz2s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Wed, Jan 12, 2022 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> 14.09.2021 12:35, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >=20
> > This is a follow-up of the discussion here:
> > https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmo=
ur/
> >=20
> > This implements a mechanism to raise and lower clock rates based on con=
sumer
> > workloads, with an example of such an implementation for the RaspberryP=
i4 HDMI
> > controller.
> >=20
> > There's a couple of things worth discussing:
> >=20
> >   - The name is in conflict with clk_request_rate, and even though it f=
eels
> >     like the right name to me, we should probably avoid any confusion
> >=20
> >   - The code so far implements a policy of always going for the lowest =
rate
> >     possible. While we don't have an use-case for something else, this =
should
> >     maybe be made more flexible?
>=20
> Hello Maxime,
>=20
> On NVIDIA Tegra we use interconnect framework for converting of
> workload-based memory bandwidth requirement to the memory clock rate
> [1]. All Tegra SoCs have two display controllers and other memory
> clients, ICC takes care of summing and updating memory bandwidth for us,
> which in the end results in a freq change of the shared memory controller.
>=20
> [1] https://git.kernel.org/linus/04d5d5df9
>=20
> Not so long time ago me and Thierry Reding were looking at yours v1 and
> back then Thierry suggested that the same ICC approach might work for
> yours case. I'm now looking at the v2 and yours discussion with Stephen
> Boyd, and it appears that ICC is indeed what you really need. Have you
> considered to use ICC?

The goals seem to be similar indeed, but most of these clocks feed some
internal state machine in those devices and are not related to the
memory bandwidth at all. So there's no real interconnect to model there :/

Maxime

--t2qv6kke3mwujz2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd7c8wAKCRDj7w1vZxhR
xVuPAP9/9WqdgEDuYNDuYiROyAiSVfLJJPhtDldKsoecRjwokgD/ZDi8CesqnZXj
fnIDTx+JuQiyTMzhpUz/iwl0Lx+NSQE=
=mcMz
-----END PGP SIGNATURE-----

--t2qv6kke3mwujz2s--
