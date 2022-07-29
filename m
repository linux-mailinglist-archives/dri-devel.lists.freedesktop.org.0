Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4358514E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9C310E322;
	Fri, 29 Jul 2022 14:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF04B10E0A1;
 Fri, 29 Jul 2022 14:08:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B7B6ECE29C0;
 Fri, 29 Jul 2022 14:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988F6C433D6;
 Fri, 29 Jul 2022 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659103675;
 bh=cUXcZAT76ZabW6lC7i4r3goD7kw1XreIuadvSWS0sng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bVItfyvIGROdWste07gaHkciQVKLZj2Wnu4y2OrU7JpKC/VY4NM65LXlENon0y+9+
 RGnVxxrrcwNQMrwI5xl/j1q2tiB0m56dyTwrE2P+jjrAuMHgaNH0EDFq0cjGAvZ9nN
 udvbxRL/YFB5otA8VdvffsLqO1xEHdLSY5pg3EBAaT/zcK1jNCxIWo23TI2PxrxjOr
 IE4mVZg3HQgNqgiiXXAza+Tu/8mkt1QFvnLbSi4d9/OoLob39WGZ4FMIisHvaV2LMo
 fDxc2Jzm2Xonnzh17zMdLEbNPyENcw+EQ0oaySgIGV3AmugxQSKqDnHmd1V7VokRYD
 tLoClKUIJZ+Jw==
Date: Fri, 29 Jul 2022 15:07:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YuPps+cvVAMugWmy@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
 <YuPiJWQ1/wQbkvD8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lMMlcIGCjceHAIpO"
Content-Disposition: inline
In-Reply-To: <YuPiJWQ1/wQbkvD8@hovoldconsulting.com>
X-Cookie: Dime is money.
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
 Doug Anderson <dianders@chromium.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lMMlcIGCjceHAIpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2022 at 03:35:33PM +0200, Johan Hovold wrote:

> I guess we just need to drop all those regulator-allow-set-load
> properties for now even if using DT for power-management configuration
> this way does seem to run against the whole DT-as-hardware-description
> idea (e.g. we may want to add them back when/if active- and idle loads
> are specified by the corresponding Linux drivers).

Well, there's also a question of if the hardware can usefully make use
of the facility - is there any non-suspend state where the regulator
needs to be on but is drawing so little current that it's worth trying
to select a lower power mode?

> But that doesn't address the problem that was trying to highlight here,
> and that you had noticed years ago, namely that using set_load only
> works reliably if *all* consumers use it.

> Shouldn't an enabled regulator from a consumer that didn't specify a
> load somehow result in HPM always being selected (e.g. count as INT_MAX
> load as Doug suggested some years ago)?

Possibly, but note that as well as the consumers with software drivers
you also have to consider any passive consumers on the board which may
not have any representation in DT so the actual numbers may well be off
even if every consumer is trying to keep things up to date.  You also
come back to the "let's just shove a random number in here" problem.

For ultimate saftey we probably want a command line option to gate the
feature which people can set to say they've audited their full
software/hardware integration stack.

> At some point in the discussion I thought Mark suggested removing
> set_load from drivers that don't actually manage active and idle loads.
> That would also work, at least until the day one of the drivers adds
> support for idle loads.

Yes, if the driver isn't actively managing loads it's probably not doing
anything useful.

The difficulties with this sort of system integration question is an
unfortunate consequence of DT, having to describe what's safe for an
unknown software stack is fundamentally hard.  I do question how much
effort it's worth putting into enabling this, especially in cases where
the regulator is shared - how much power is actually saved in the grand
scheme of things given that this is only taking effect when the system
is out of suspend and we tend to be talking about some percentage of the
power being drawn on something which is presumably already consuming
very little power for this to be at all relevant?

--lMMlcIGCjceHAIpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLj6bIACgkQJNaLcl1U
h9BSSQf/eAdvLr6Oa23fgbGkvVf3vFVUAXordLXh1s2WpGE7ULmzOAETnrSqD+y2
ZBiHcceuxWistf4AYnco7OZYGMeethjT0JUSU0gv6+C6H8oLuMZbI9/krqP8zwN2
Ld5PvOB/fc2KGy/0Ox31e+pnsj8hK0WBQUVwVtalxkM0ltx0n92rwvsJCYK97OP8
JNEt1aa4QEpnmocrB5KcsU1n1uJE4jrq7aZxxi1C+XlOwi8x4I+a6d9F7fnv+8Sc
C6wRxlVsmSTwE7G47dBrk2/jhQZTenfpXwRktn8lrHDvFFHKyx4Yx3N2dGO27nC1
zE9ytCAAJyTBkIPr+OniWH5PKcnfWA==
=tOZj
-----END PGP SIGNATURE-----

--lMMlcIGCjceHAIpO--
