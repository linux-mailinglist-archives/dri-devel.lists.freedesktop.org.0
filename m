Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7584B7F6DC7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41C310E769;
	Fri, 24 Nov 2023 08:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982110E769
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:13:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9C82CE115A;
 Fri, 24 Nov 2023 08:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD18C433C7;
 Fri, 24 Nov 2023 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700813618;
 bh=WEcNKU+sV+rxevVcyZo2IDgUlh92ZvNyu1LEanfUjAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0DoYX20WM2/tp5+/f8+05KiDurCpA6fxrIOekITz8B3MAxN2dtvDCWK4mu63AR6D
 Qmkvwnq80xQPbKFyCSWBlKfXnkYRKOeE8d7LQ2TBC0MqnVyVGpodlihJNqsLysxsYN
 D8MnsKLt9xkP1/SQuL35tLUsC2NTnbDbLoJIPWRSRmE5HXQJaH7E8AZj1Dpp/c/yw/
 L0sYU4INeFOVDtHmgUi45hhUeU4pxA1I23hXqOOM1ffHfFgOnzAxx3fiweT8NJY3la
 VH9oikswckHZTX+bwWt3VgrgPcUFuU6rrwCRhpPnHuA+F56X18nyWX3r2Ukyf4Vnsf
 /hWqSsNMkZQPw==
Date: Fri, 24 Nov 2023 09:13:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <tkaucp235w3nlydj7ae66g5r75w2rtjhum65cjrahmgeae7zgz@zb77pw2ih6vs>
References: <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
 <10c4ae94-525f-4ac1-9d59-80bb4f7d362e@linux.dev>
 <gghxzhkd3hnry6qloc3axzojps7bv7cf7lmpcweu6ucadhelh6@spjfikjfzt23>
 <bb328e16-7815-4518-832f-456cf1b7e704@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qnqmnmnzzhh72fzj"
Content-Disposition: inline
In-Reply-To: <bb328e16-7815-4518-832f-456cf1b7e704@linux.dev>
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


--qnqmnmnzzhh72fzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 03:51:00PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2023/11/24 15:38, Maxime Ripard wrote:
> > On Fri, Nov 24, 2023 at 01:52:26AM +0800, Sui Jingfeng wrote:
> > > On 2023/11/23 16:08, Dmitry Baryshkov wrote:
> > > > > I'm agree with the idea that drm bridges drivers involved toward =
to a direction
> > > > > that support more complex design, but I think we should also leav=
e a way for the
> > > > > most frequent use case. Make it straight-forward as a canonical d=
esign.
> > > > Not having anything connector-related in the drm_bridge driver is a
> > > > canonical design.
> > > What you said is just for the more complex uses case. I can't agree, =
sorry.
> > >=20
> > > By choosing the word "canonical design", I means that the most freque=
ntly used
> > > cases in practice are the canonical design, 95+% motherboards I have =
seen has
> > > only one *onboard* display bridges chip. For my driver, I abstract th=
e internal
> > > (inside of the chip) encoder as drm_encoder and abstract the external=
 TX chip as
> > > drm_bridge, this design still works very well.
> > >=20
> > >=20
> > > Originally, I means that this is a concept of the hardware design.
> > > You are wrong even through in the software design context, the
> > > transparent simple drm bridge drivers(simple-bridge.c) also *allow*
> > > to create drm connector manually. I don't think I need to emulate
> > > more example, please read the code by youself.
>=20
> 'emulate' -> 'enumerate'
>
> > Ok. That's it. We've been patient long enough. You have been given a
> > review and a list of things to fix for your driver to be merged.
>
> This series is not relevant to my driver, can we please *limit* the
> discussion to this series?

Right, I conflated the two, I meant this series, or the general goal to
enable that bridge with your driver. The rest of the driver is of course
unaffected.

> > Whether you follow them or not is your decision.
>
> I'm not saying that I will not follow, just to make sure what's
> solution is you want. I need discussion to figure out.

You had direct, repeated, feedback on that already by a maintainer and
one of the most experienced dev and reviewer on bridges. If you need
more guidance, you can definitely ask questions, but asking questions
and telling them they are wrong is very different.

> > We won't tolerate insulting comments though.
>
> There is *no* insulting, please don't misunderstanding before
> *sufficient* communication, OK? Originally, I thought Dmitry may
> ignore(or overlook) what is the current status.

Saying to someone maintaining and/or reviewing that code for years now
that they are wrong and should go read the code is insulting.

Maxime

--qnqmnmnzzhh72fzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWBbLwAKCRDj7w1vZxhR
xdY5AQD/LEZkLMpbGSHD0FayjwmtzKSJdt/WA2RSKygq+cakQwEA8SyGHlCGSsMC
mD6b3nI8yAP5v8voxIq/uhpxvN67HAc=
=Mr+I
-----END PGP SIGNATURE-----

--qnqmnmnzzhh72fzj--
