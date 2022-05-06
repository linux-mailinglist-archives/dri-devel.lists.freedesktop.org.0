Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03551D82D
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8010EE81;
	Fri,  6 May 2022 12:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0110EE81
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCE3361FFC;
 Fri,  6 May 2022 12:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83900C385A8;
 Fri,  6 May 2022 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651841304;
 bh=pHRiCm/AA9NpQMskq3mg/IpO9gbd+x5qsfLQYX4DHsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMeg3W/Be1/Wwdsby7iUHbTtELGzPTzyVRmNwhnFoSOFg+xmuyEYYzgT0VLwaaaSS
 NsTonFyDDdvZ9sPRH4RM6OXCph8/aCLneBOpyvnmFZcvxx2pdlsk9iqnJq8WWrJADT
 ynipXAahg+SlEJLNb3QRUK3XKE3/uCEGbKhSp2Sy58xg8S4p2UMQ0l35UJWvfWukMR
 6j+Xj06wprskRq9kf5ReK7wCR0tosgVkhTlThPeXby4nvJConogpBHCTfu9RgXmg4Y
 lUkgil/kb0e2A0SYCKlzuq7R3dOvkBA4boHgNOFZZJfYByYYS8f+5wzAONSVnPQU0s
 ja7iQ7JvT9Osw==
Date: Fri, 6 May 2022 13:48:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-ID: <YnUZFf4Yiv/eac57@sirena.org.uk>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <88edf09b-fca9-26b1-1366-94976c6ce2a0@denx.de>
 <YnQ8uqMBFJc+LV4l@sirena.org.uk>
 <bd0d10a9-e065-d3cf-e7f7-c1b656b892f1@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i7s+l1BqzNjkfM1O"
Content-Disposition: inline
In-Reply-To: <bd0d10a9-e065-d3cf-e7f7-c1b656b892f1@denx.de>
X-Cookie: <Culus-> libc6 is not essential :|
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 jagan@amarulasolutions.com, tzimmermann@suse.de, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i7s+l1BqzNjkfM1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 06, 2022 at 01:55:57AM +0200, Marek Vasut wrote:
> On 5/5/22 23:08, Mark Brown wrote:

> > I did go through it and didn't spot
> > any issues so it seemed like the testing coverage would be useful here.
> > Are there specific things you're worried about that you'd like feedback
> > on?

> Plumbing on core code is worrying.

Yeah, that's a big part of why I want things in testing.  With
something like this a lot of it is being aware of all the random
corner cases out there.

--i7s+l1BqzNjkfM1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ1GRQACgkQJNaLcl1U
h9D54gf/cmUJSpXJGxKsuqg039XPPNgeLMjIWR3M+8b9t/eZ2q54DtDQl0O8HO40
rGWQveOth4HdevqXRamsU/KpgI/hZBM752GNyBnk0sMlZ/c325LYEKEojQmEc+51
bIoTmrBihduGb7BdNX7uEuTuJGA1uEzFu0C93p2X5GLceJuOruc1mmq383H/Oo48
BgialTOvw8JaNY7MnEVeZqRqy8j4H/0Uio0Yzecafp2djgQCXLpIZOYjLJ5rm4MT
wN/vHgQAo/JhCDP1pmOFDB4uJbDatqkQNu4Pt3/yB0laF/2D5vu7Cqcik0KcYhZC
0YXFKH+fZ35nha4a6pDyj4gEGigkpg==
=sdG0
-----END PGP SIGNATURE-----

--i7s+l1BqzNjkfM1O--
