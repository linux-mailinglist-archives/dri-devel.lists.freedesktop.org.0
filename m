Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902B57D0B7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 18:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00AB10E9AB;
	Thu, 21 Jul 2022 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E310E08C;
 Thu, 21 Jul 2022 16:06:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 074C9B823A1;
 Thu, 21 Jul 2022 16:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCAFC341C0;
 Thu, 21 Jul 2022 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658419601;
 bh=s8xeRnOct+FSrRLuDnVjoDrk1lcFnJ4sNmdHqdLZjyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8GxrIgrPevpvhKSj3MpdPSs883nobdr60tmmqptVY8xAwg1tZMWYU53td+TBqtIF
 92UbCLNtTLb+LO+uPtCi1hdjk6nBHzZtmgWIvVDpNtFEGA3RrkSNG4YpZcg0YvInsk
 4IkOMHjtmqe906fJiSYpERdKfJ3z/RLyhnhSHc95zqOz+VzksnemiTT+UkklIXmjHp
 IO8clZIg9437kflBhXNN6+xzT6YletRme11kZNicQ7VazO6FxL8n/2p8Mq/wg0sVZV
 0VQ1pPJXt+mxM3Dt+66mtmm619fR4AIL1X/4X94KjphqAeo6Qf3iVm54SBR/WOqOME
 xz09WKw54tXfQ==
Date: Thu, 21 Jul 2022 17:06:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <Ytl5icJyICD1fbzP@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
 <YtlrV5R+JMxb7Dlu@sirena.org.uk>
 <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="797VOFF2drkIGdfE"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--797VOFF2drkIGdfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 21, 2022 at 08:43:48AM -0700, Doug Anderson wrote:

> I guess I'd put it this way, though: how many drivers in Linux today
> have _two_ calls to regulator_set_load(): one for the "active" state
> and one for the retention state. Looks like UFS maybe. Any others? For
> most devices the pattern is:

Oh, I'm not saying there's sensible implementations in drivers.  In
general I'd say that as with voltage if a driver is not actively
managing the load during runtime it should not be setting it at all, one
time configuration should be left to the constraints if it's needed.

--797VOFF2drkIGdfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZeYgACgkQJNaLcl1U
h9Bitwf/T7m2MuB1BDNcYxER8zA/bmfsSd02RVjQBt889bIiIQndg6hsiAsYJDzL
YiHt3f0B5VwYWEYQ7qHJJNv2XTnkLyck+/KrZy9mzJifwbD9JuozXIquclLzsUse
NP5zX0uDOJBsNX23i0B/d6R650tJvYSHY3++cxMkHCPFxL7VgB/meefwMrpPdNAJ
DMSiihQNvJRcI8c+Iy41pA4lRJaEl6EG/B3my5nFYsj8+guxaNkLkIpWt8dq2VMl
a6jslx3UiscBq9BxK3MCAvhLON57wr9nnKlFJfaheIqqn1bXKYQ+ufJX2YxPpyXI
1WmQBt54MQiyiEAO777PA6jPhC021Q==
=HOZd
-----END PGP SIGNATURE-----

--797VOFF2drkIGdfE--
