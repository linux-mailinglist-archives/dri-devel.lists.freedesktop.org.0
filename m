Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD97D6C37
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 14:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FA010E64F;
	Wed, 25 Oct 2023 12:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D8D10E649;
 Wed, 25 Oct 2023 12:45:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9EF42CE3851;
 Wed, 25 Oct 2023 12:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A376C433C7;
 Wed, 25 Oct 2023 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698237902;
 bh=NpzQ9qHRjySkxPMIQIfKH78Kx7piv7QmHamr5dkzg7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K4EZFx0y3NoHsS9aVpzI4wQOiq5LFfl8lA2lRbkrpXooQ4iSPl9KN//5i445s9DoN
 qAk0QGtBQ7Qvxggeq5YgXQG5XuDjSTVee7vtlacxMX7lFEtAJN8HweScxL0gX6Rcdh
 bnC3VzLx4TOu1AGbCG9y7ug591clv8qAzLfngd1nZYzp0ghi+fUdaEd1iNFfOtlJ+l
 Wf83er4I9tn/F9wREiq6MmEroEXOrQbw5ZfntrMfuvaNaTzBs1fwbHsYITyQ0Bk3g0
 lAco+WhSmOulB6T3+jqDvzh6ECGpjF4ik8fkmMAinmYecQxzStrfola+PQ8Yo5ye4+
 O/oy3jhbBjzFQ==
Date: Wed, 25 Oct 2023 14:44:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kczefdkwiwg32tj2"
Content-Disposition: inline
In-Reply-To: <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kczefdkwiwg32tj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 02:19:51PM +0300, Dmitry Baryshkov wrote:
> On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> >
> > Explaining why would help
>=20
> A kind of explanation comes afterwards, but probably I should change
> the order of the phrases and expand it:
>=20
> The atomic_pre_enable / atomic_enable and correspondingly
> atomic_disable / atomic_post_disable expect that the bridge links
> follow a simple paradigm: either it is off, or it is on and streaming
> video. Thus, it is fine to just enable the link at the enable time,
> doing some preparations during the pre_enable.
>=20
> But then it causes several issues with DSI. First, some of the DSI
> bridges and most of the DSI panels would like to send commands over
> the DSI link to setup the device.

What prevent them from doing it in enable when the link is enabled?

> Next, some of the DSI hosts have limitations on sending the commands.
> The proverbial sunxi DSI host can not send DSI commands after the
> video stream has started. Thus most of the panels have opted to send
> all DSI commands from pre_enable (or prepare) callback (before the
> video stream has started).

I'm not sure we should account for a single driver when designing a
framework. We should focus on designing something sound, and then making
that driver work with whatever we designed, but not the other way
around. And if we can't, we should get rid of that driver because it's
de-facto unmaintainable. And I'm saying that as the author of that
driver.

> However this leaves no good place for the DSI host to power up the DSI
> link. By default the host's pre_enable callback is called after the
> DSI bridge's pre_enable. For quite some time we were powering up the
> DSI link from mode_set. This doesn't look fully correct.

Yeah, it's not.

> And also we got into the issue with ps8640 bridge, which requires for
> the DSI link to be quiet / unpowered at the bridge's reset time.
>=20
> Dave has come with the idea of pre_enable_prev_first /
> prepare_prev_first flags, which attempt to solve the issue by
> reversing the order of pre_enable callbacks. This mostly solves the
> issue. However during this cycle it became obvious that this approach
> is not ideal too. There is no way for the DSI host to know whether the
> DSI panel / bridge has been updated to use this flag or not, see the
> discussion at [1].

Yeah. Well, that happens. I kind of disagree with Neil here though when
he says that "A panel driver should not depend on features of a DSI
controller". Panels definitely rely on particular features, like the
number of lanes, the modes supported, etc.

Panels shouldn't depend on a particular driver *behaviour*. But the
features are fine.

For our particular discussion, I think that that kind of discussion is a
dead-end, and we just shouldn't worry about it. Yes, some panels have
not yet been updated to take the new flags into account. However, the
proper thing to do is to update them if we see a problem with that (and
thus move forward to the ideal solution), not revert the beginning of
that feature enablement (thus moving away from where we want to end up
in).

> Thus comes this proposal. It allows for the panels to explicitly bring
> the link up and down at the correct time, it supports automatic use
> case, where no special handling is required. And last, but not least,
> it allows the DSI host to note that the bridge / panel were not
> updated to follow new protocol and thus the link should be powered on
> at the mode_set time. This leaves us with the possibility of dropping
> support for this workaround once all in-kernel drivers are updated.

I'm kind of skeptical for these kind of claims that everything will be
automatic and will be handled fine. What if we have conflicting
requirements, for example two bridges drivers that would request the
power up at different times?

Also, we would still need to update every single panel driver, which is
going to create a lot of boilerplate that people might get wrong.

I have the feeling that we should lay out the problem without talking
about any existing code base first. So, what does the MIPI-DSI spec
requires and what does panels and bridges expect?

Maxime

--kczefdkwiwg32tj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkNywAKCRDj7w1vZxhR
xYIdAP9PbpeyIE0X74jUaXHN6mAfkT+xcxdOpc1D77WN0VbA0gEA2/73asuJtKhK
KTH1Pj57iemOVPDZWxGgANraRbBuWwY=
=Mzkb
-----END PGP SIGNATURE-----

--kczefdkwiwg32tj2--
