Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9D6F6650
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207E210E3C5;
	Thu,  4 May 2023 07:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D09810E3C5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:51:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 19B665C01C9;
 Thu,  4 May 2023 03:51:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 04 May 2023 03:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1683186717; x=1683273117; bh=Un
 h8Be5JCi4I8bLpxjq8H35CHb3/xGwHRmN8DXPgk9I=; b=Goqx0Q1H85laslrbUD
 j89IdR8EdkbaS92EdgD8KDxf4NBy8hNdhUL6a6YqlF1SWlkwrsWvJsPCEjB1j9wV
 ZtZAw5lxC1UZo9dxQWlRo75J8e/HrUc2N/T42AqMQB3xqGFGGjYiwYy6ridWzCw5
 3mbNWgMrayx7tn5rwNYdfoiAbtXlNcyOApOLkKJgLvo9GpsYrJrvpqfH1QWBEp1F
 zTqXn+x3pq+uwiRfg6fcupcXEX5KvYu7E5EPkNNQU777v+LfDDt7/uNwgkamQFny
 WHurWix6pRYbdrTb9EYuyI1qcFoM5oxUZ+X5e+sIcS9Ws0FBjgU39F6DdR6VyyKS
 n7Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683186717; x=1683273117; bh=Unh8Be5JCi4I8
 bLpxjq8H35CHb3/xGwHRmN8DXPgk9I=; b=GgDfqmAhI9gi/vd/nPRhx3FeQX4mq
 hRylghkH3LSvyfpT3mduMQd4iELca7uGwHkiQ4sNXvotaM5HeaY2+0FSq6HcUROB
 IIkJTUk8COl0EOePl65Cq+gATrz18k8JaKO+svzVRiUxiQCoZHGlb/m0PNcXsuuF
 sTc5hVr5GqP4AhyTOEfIzom7bqJz8F8fi3c2LmgxgfttmzWmpAAGuG0dM+kOFgfj
 wK2DHZjpIjDuOdepz6LFbiemho1f8Tz0Yqd52jEfWr4826uTMFhWl3IriXYdhu/u
 NBIZFHcFa3kxADrUshj9PnHCxXwMwRCwbbAOoGBQrnCQyfygtrKYlpGUA==
X-ME-Sender: <xms:HGRTZL29VdOkCqzPjL4dsLB2krjwGBgWNgAqBsnrsim9cGv-gbMCnA>
 <xme:HGRTZKGzKxxH16u-eKHoW1rGhu2JPyvUYsdgacLwedDY0uBOQ1jDDZiYlwsMpTMjj
 VJqq-cJ1-E1GeDsYYw>
X-ME-Received: <xmr:HGRTZL55ym_fisFPUC4OfaL1cBGPCu7Elz4Sd9xQIniGJCi88ecQzThNrZ1OpgmqgXvxqnJj4dp7iq6tXEW7zECwzPCr3Ko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdffgffhfeekfeejueejieehffffkefgueelkeetieejgfefiedtfeej
 feefjeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:HGRTZA32ocaofO51_53WJxB3NuFgrLqCsufcPaz4sjwcyq8Q_xEDRA>
 <xmx:HGRTZOE1RWyKJ7613fWN7p_fXgjR4bqLTSc2ybwTUFxqJPCV467wNQ>
 <xmx:HGRTZB-zMpIYYDBPGFEYKoKZIWlEuQnRoCviljArnhD6WlGMWY416Q>
 <xmx:HWRTZOUSVw-BKoJB_H0JwqlpAy1g63wjdweh0UcTqizy_qPvTSQvVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 May 2023 03:51:55 -0400 (EDT)
Date: Thu, 4 May 2023 09:51:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
Message-ID: <nlycqgae2r3urwh536hyklyutmdzdoz3ssabcjqdfoxlqlbjln@5u5dr552albo>
References: <20230310063910.2474472-1-saravanak@google.com>
 <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
 <CAGETcx_0NaSTFFn34nvax2_pG+_5BJtOD0j0wrqU0NSCqwfKWA@mail.gmail.com>
 <CAGETcx-CF83Acp5CQ=RMJq9DD6f_Y70c37zSbLq2R6L5VyoKHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="righsvrxnusueuiy"
Content-Disposition: inline
In-Reply-To: <CAGETcx-CF83Acp5CQ=RMJq9DD6f_Y70c37zSbLq2R6L5VyoKHg@mail.gmail.com>
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
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>, kernel-team@android.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--righsvrxnusueuiy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Wed, May 03, 2023 at 09:40:05PM -0700, Saravana Kannan wrote:
> On Fri, Mar 17, 2023 at 3:36=E2=80=AFPM Saravana Kannan <saravanak@google=
=2Ecom> wrote:
> >
> > On Sun, Mar 12, 2023 at 7:45=E2=80=AFAM Martin Kepplinger
> > <martin.kepplinger@puri.sm> wrote:
> > >
> > > Am Donnerstag, dem 09.03.2023 um 22:39 -0800 schrieb Saravana Kannan:
> > > > After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> > > > detection more robust"), fw_devlink prints an error when consumer
> > > > devices don't have their fwnode set. This used to be ignored
> > > > silently.
> > > >
> > > > Set the fwnode mipi_dsi_device so fw_devlink can find them and
> > > > properly
> > > > track their dependencies.
> > > >
> > > > This fixes errors like this:
> > > > [    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > > link with regulator-lcd-1v8
> > > > [    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > > link with backlight-dsi
> > > >
> > > > Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > >
> > > Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> >
> > Maintainers,
> >
> > Nudge nudge. Will this be picked up for 6.3-rcX?
>=20
> Greg,
>=20
> Can you pick this up please? It's a fix that hasn't been picked up for
> a few months.
>=20
> Here's the link to the actual patch for your convenience:
> https://lore.kernel.org/lkml/20230310063910.2474472-1-saravanak@google.co=
m/#t

Sorry, I'm not quite sure what happened. I've applied it to drm-misc-fixes

Maxime

--righsvrxnusueuiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFNkGgAKCRDj7w1vZxhR
xfZIAQDbntwHYPRiIlfJr7JyoRTzalDO2LHNiiH6GNx2bjmqvQEAiwbvXWeL8fbY
CZC5wq1GuRi4W99zTKPCvzGCkQIgCwE=
=XjEf
-----END PGP SIGNATURE-----

--righsvrxnusueuiy--
