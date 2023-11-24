Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29B7F6CF7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFB410E5E7;
	Fri, 24 Nov 2023 07:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95E10E5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 07:38:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39D6361FBF;
 Fri, 24 Nov 2023 07:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCAEC433B9;
 Fri, 24 Nov 2023 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700811499;
 bh=cHYu7s5xEpUKR/KUu6zosLbry7O/OXCpcriYL9+eynw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oh6UlYOtFJKfOywL2u67NW5lbbbZuCBNtYX+uBAjqjs2hhAdlehEB1NQQRfkSb5PM
 7ausyoRq/GNfV7veK31pcXca/hOthtLZx1zZ9NxCpIim8Zl7OFzO2d2X0jkQQhJk6l
 TqqSEIniz5oY9s3S2jQhTrKPT9GVSV81qa2EHyHE6MJUblR82bOrUM7qv55N1FlBTV
 4mf1smg4oguUjrPB8sPsoiqxvQhKFB+8sn+O1BC2g+cOm7bbA9V5YQEXwXMZ64x72D
 snzNfFb0/ocKF5rg0mKBu6PNmUWCx0Rq3+kQ6om1Klp94b7kpsIV+HtySF5V4r1iLk
 MKpqgMo3DATKg==
Date: Fri, 24 Nov 2023 08:38:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <gghxzhkd3hnry6qloc3axzojps7bv7cf7lmpcweu6ucadhelh6@spjfikjfzt23>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
 <10c4ae94-525f-4ac1-9d59-80bb4f7d362e@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2e3vfplf3w4vhnaj"
Content-Disposition: inline
In-Reply-To: <10c4ae94-525f-4ac1-9d59-80bb4f7d362e@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2e3vfplf3w4vhnaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 01:52:26AM +0800, Sui Jingfeng wrote:
> On 2023/11/23 16:08, Dmitry Baryshkov wrote:
> > > I'm agree with the idea that drm bridges drivers involved toward to a=
 direction
> > > that support more complex design, but I think we should also leave a =
way for the
> > > most frequent use case. Make it straight-forward as a canonical desig=
n.
> > Not having anything connector-related in the drm_bridge driver is a
> > canonical design.
>=20
> What you said is just for the more complex uses case. I can't agree, sorr=
y.
>=20
> By choosing the word "canonical design", I means that the most frequently=
 used
> cases in practice are the canonical design, 95+% motherboards I have seen=
 has
> only one *onboard* display bridges chip. For my driver, I abstract the in=
ternal
> (inside of the chip) encoder as drm_encoder and abstract the external TX =
chip as
> drm_bridge, this design still works very well.
>=20
>=20
> Originally, I means that this is a concept of the hardware design.
> You are wrong even through in the software design context, the
> transparent simple drm bridge drivers(simple-bridge.c) also *allow*
> to create drm connector manually. I don't think I need to emulate
> more example, please read the code by youself.

Ok. That's it. We've been patient long enough. You have been given a
review and a list of things to fix for your driver to be merged. Whether
you follow them or not is your decision.

We won't tolerate insulting comments though.

Maxime

--2e3vfplf3w4vhnaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWBS6AAKCRDj7w1vZxhR
xV34AQCz710W6l+pqHVmnN65/ken9vPhvpEMfiUkcQIzarcRvgD+LacFo0COf1Ot
dcbPr76F+Hw8q8Q95b7aIhVgJyZydQQ=
=nZjB
-----END PGP SIGNATURE-----

--2e3vfplf3w4vhnaj--
