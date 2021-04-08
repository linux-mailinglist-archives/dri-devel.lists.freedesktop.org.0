Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE3358485
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0716EAF0;
	Thu,  8 Apr 2021 13:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE836EAD6;
 Thu,  8 Apr 2021 13:20:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D1EF85C005F;
 Thu,  8 Apr 2021 09:20:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Apr 2021 09:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0TFilmNYZpoCo33PfFme0OURG/N
 +KN8UabeU9/+7fdE=; b=JI112mzVaWEoeArZuX4uv8DdTh+sQPcUOq4mlocAiB/
 ywSiPJ0t7dU2uJgt8zuV1L0fK1AaUdLW8RrKIh06LkW7GGjazlogqsflLXkuxSQz
 AtxUtF5UbTvSbHnL8uMxQpOwM/IUTmI7qL6QvCR/ZsURBUBtrk7GrwO1aLIFbxWd
 8+m0wzek0sslQq/6PkVfFhguE1aRqP/WTsIisZ2BauUadj7BhNcv47TxcRdWSpVv
 DibfZjJkWf9PqEyIwqgWUKw9lKPsgHSyCiAHF9A5rnF99ghcNJmSdUCl1bZ/zv2Z
 IP8gR8JtDvbJKh+frZz/pJnVBz6GZrxtTXJrggIhzEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0TFilm
 NYZpoCo33PfFme0OURG/N+KN8UabeU9/+7fdE=; b=X2mwxHCRyQhp861nPzs3aS
 DUdsLY8C/9Up5AJn3IyXAnEmbPJgbIoSF9go/Aqh+0zPvMNWiYPx/fEZaC0MPN+a
 9WSNvyA1yDMR5JUwf4fQ5ELoAq60fvu3aUh5FJYhJm48bWF/NDbGnSd3zyDuB+cn
 tFcqYdSZHDtaBPp2h3TrJDBVAkLL2S6WjPxTnCCySIAfRoz7XdpikePk3drRkD6x
 pF7ApzTfCJRU3+xBNq5RfgY2gNycYc/XFz4t+aYw3jedlGJukQmkZ1MdsdczyLFx
 6fR3Mx1tCszPM9yqze2pYeqwFePb7brGKMIFi2RYGNqI3ETzrFd7BJGd55VRM2Kw
 ==
X-ME-Sender: <xms:MgNvYKMy6xq-oR3mEs4Im60uA9ibWOSM9UUx9zAZjWuOKRRjgWZvaA>
 <xme:MgNvYI8d3RXB_b1Uk3NDIgJvqaundobV9yPFGucuP7akeO_BURR65QV1ecRnEYSYT
 CXCj4mMBekIJcwRS1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MgNvYBRo6DBc9fCN0qO8R9yPwaDArtYRtz_LbrLq2m9Nu2ezhcyBwA>
 <xmx:MgNvYKu0yS-Zcep9szdpZZnwn-pydYYnuEm0gz00Kf0ZnLjJMSQ-ZQ>
 <xmx:MgNvYCdTG6XDbAJ5AF3BOzJte0uiy6vMwEo4_nAjextLlpOafU-_pw>
 <xmx:NANvYKSGZmk2OGsUVx1ahqu2K2zbyshSu5FONd7-borVPyj_Oj-IZQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D08224005B;
 Thu,  8 Apr 2021 09:20:50 -0400 (EDT)
Date: Thu, 8 Apr 2021 15:20:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane
 state pointer
Message-ID: <20210408132048.gifhgtkmoeuplhcz@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
 <20210330153527.gw33t4o2b35wwzbg@gilmour>
 <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1631956878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1631956878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3mz6ep45tw3nrcn"
Content-Disposition: inline


--u3mz6ep45tw3nrcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Mar 30, 2021 at 11:56:15AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2021-03-30 08:35:27)
> > Hi Stephen,
> >=20
> > On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > > Trimming Cc list way down, sorry if that's too much.
> > >=20
> > > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > > Many drivers reference the plane->state pointer in order to get the
> > > > current plane state in their atomic_update or atomic_disable hooks,
> > > > which would be the new plane state in the global atomic state since
> > > > _swap_state happened when those hooks are run.
> > >=20
> > > Does this mean drm_atomic_helper_swap_state()?
> >=20
> > Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> > the state currently programmed in the hardware, so the old state (that's
> > the case you have with atomic_check for example)
> >=20
> > Once drm_atomic_helper_swap_state has run, plane->state is now the state
> > that needs to be programmed into the hardware, so the new state.
>=20
> Ok, and I suppose that is called by drm_atomic_helper_commit()?

Yep :)

> So presumably a modeset is causing this? I get the NULL pointer around
> the time we switch from the splash screen to the login screen. I think
> there's a modeset during that transition.

It's very likely yeah. I really don't get how that pointer could be null
though :/

Maxime

--u3mz6ep45tw3nrcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG8DMAAKCRDj7w1vZxhR
xY8YAPwM+ZLdEm9/yUl0l3VZZpCUYMChQiPmq+Q6C5PwcRmbbAD/XYf6+RRF3hq1
do4BnroDx59ckCB5eKNUKMG9v46NUAI=
=gzYE
-----END PGP SIGNATURE-----

--u3mz6ep45tw3nrcn--

--===============1631956878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1631956878==--
