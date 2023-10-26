Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE37D7E0D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CEB10E772;
	Thu, 26 Oct 2023 08:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6210E106;
 Thu, 26 Oct 2023 08:04:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BDD71B80935;
 Thu, 26 Oct 2023 08:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D14AC433C8;
 Thu, 26 Oct 2023 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698307492;
 bh=EAQ7g0hX/FrxSMaglusDeCTnn471+1/pfyILaNojVhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgekZGHe9w5dxxPKuk6zn5H1uJjUgh68Hyyq0hVSmesw81fAlMk4TVQuV+fG/Ifi1
 bi/OMcbGSszHDTuVCfHrQcOiYv3LTv20fvoU1SpywODggvG/p4HrkVYhfgA8G/qA1K
 hq13Qi/F68Tl8sEwYkUI/j7oUhxsyaodVcl4/HP7yzK7y4t2wRZwYwoTFSM79ueRYJ
 t1gpgTbHagm39EF4326A8/n1Bjl28LzBwLUXBy4K6CFtS7RkxG0Hs4hxI6M4heugEC
 rmhGrFUtI9Er0T2HPvwVxaNJz1ohb/CzatsuXO6zXUA8YxRIjNRkVZhOVjkzn/xjKi
 l94O/mMwJ6K+Q==
Date: Thu, 26 Oct 2023 10:04:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t5jjjcy33i2jy7lt"
Content-Disposition: inline
In-Reply-To: <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
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


--t5jjjcy33i2jy7lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 06:16:14PM +0300, Dmitry Baryshkov wrote:
> On 25/10/2023 15:44, Maxime Ripard wrote:
> > On Thu, Oct 19, 2023 at 02:19:51PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >=20
> > > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> > > >=20
> > > > Explaining why would help
> > >=20
> > > A kind of explanation comes afterwards, but probably I should change
> > > the order of the phrases and expand it:
> > >=20
> > > The atomic_pre_enable / atomic_enable and correspondingly
> > > atomic_disable / atomic_post_disable expect that the bridge links
> > > follow a simple paradigm: either it is off, or it is on and streaming
> > > video. Thus, it is fine to just enable the link at the enable time,
> > > doing some preparations during the pre_enable.
> > >=20
> > > But then it causes several issues with DSI. First, some of the DSI
> > > bridges and most of the DSI panels would like to send commands over
> > > the DSI link to setup the device.
> >=20
> > What prevent them from doing it in enable when the link is enabled?
> >=20
> > > Next, some of the DSI hosts have limitations on sending the commands.
> > > The proverbial sunxi DSI host can not send DSI commands after the
> > > video stream has started. Thus most of the panels have opted to send
> > > all DSI commands from pre_enable (or prepare) callback (before the
> > > video stream has started).
> >=20
> > I'm not sure we should account for a single driver when designing a
> > framework. We should focus on designing something sound, and then making
> > that driver work with whatever we designed, but not the other way
> > around. And if we can't, we should get rid of that driver because it's
> > de-facto unmaintainable. And I'm saying that as the author of that
> > driver.
>=20
> That's not the only driver with strange peculiarities. For example, see
> commit 8a4b2fc9c91a ("drm/bridge: tc358762: Split register programming fr=
om
> pre-enable to enable"), which was one of the issues that actually prompted
> me to send this this patchset (after my previous version of this patch be=
ing
> rejected because of sunxi).

The datasheet for that bridge is available so at least we can try to fix
it (and bridges are much simpler than controllers anyway). It's not
something we can do with the sunxi driver.

> > > However this leaves no good place for the DSI host to power up the DSI
> > > link. By default the host's pre_enable callback is called after the
> > > DSI bridge's pre_enable. For quite some time we were powering up the
> > > DSI link from mode_set. This doesn't look fully correct.
> >=20
> > Yeah, it's not.
> >=20
> > > And also we got into the issue with ps8640 bridge, which requires for
> > > the DSI link to be quiet / unpowered at the bridge's reset time.
> > >=20
> > > Dave has come with the idea of pre_enable_prev_first /
> > > prepare_prev_first flags, which attempt to solve the issue by
> > > reversing the order of pre_enable callbacks. This mostly solves the
> > > issue. However during this cycle it became obvious that this approach
> > > is not ideal too. There is no way for the DSI host to know whether the
> > > DSI panel / bridge has been updated to use this flag or not, see the
> > > discussion at [1].
> >=20
> > Yeah. Well, that happens. I kind of disagree with Neil here though when
> > he says that "A panel driver should not depend on features of a DSI
> > controller". Panels definitely rely on particular features, like the
> > number of lanes, the modes supported, etc.
>=20
> In the mentioned discussion it was more about 'DSI host should not assume
> panel driver features', like the panel sending commands in pre_enable or
> not, or having pre_enable_prev_first.
>=20
> So the pre_enable_prev_first clearly lacks feature negotiation.
>=20
> > Panels shouldn't depend on a particular driver *behaviour*. But the
> > features are fine.
> >=20
> > For our particular discussion, I think that that kind of discussion is a
> > dead-end, and we just shouldn't worry about it. Yes, some panels have
> > not yet been updated to take the new flags into account. However, the
> > proper thing to do is to update them if we see a problem with that (and
> > thus move forward to the ideal solution), not revert the beginning of
> > that feature enablement (thus moving away from where we want to end up
> > in).
> >=20
> > > Thus comes this proposal. It allows for the panels to explicitly bring
> > > the link up and down at the correct time, it supports automatic use
> > > case, where no special handling is required. And last, but not least,
> > > it allows the DSI host to note that the bridge / panel were not
> > > updated to follow new protocol and thus the link should be powered on
> > > at the mode_set time. This leaves us with the possibility of dropping
> > > support for this workaround once all in-kernel drivers are updated.
> >=20
> > I'm kind of skeptical for these kind of claims that everything will be
> > automatic and will be handled fine. What if we have conflicting
> > requirements, for example two bridges drivers that would request the
> > power up at different times?
>=20
> Well, we do not support DSI sublinks, do we?

No, but we start to consider adding support for muxes for example. A DSI
mux + a DSI bridge behind it might trigger that behaviour, even if we
don't support sublinks.

> > Also, we would still need to update every single panel driver, which is
> > going to create a lot of boilerplate that people might get wrong.
>=20
> Yes, quite unfortunately. Another approach that I have in mind is to add =
two
> callbacks to mipi_dsi_device. This way the DSI host will call into the
> device to initialise it once the link has been powered up and just before
> tearing it down. We solve a lot of problems this way, no boilerplate and =
the
> panel / bridge are in control of the initialisation procedure. WDYT?
>=20
> > I have the feeling that we should lay out the problem without talking
> > about any existing code base first. So, what does the MIPI-DSI spec
> > requires and what does panels and bridges expect?
>=20
> There is not that much in the DSI spec (or maybe I do not understand the
> question). The spec is more about the power states and the commands. Our
> problem is that this doesn't fully match kernel expectations.

You're explicitly asking for comments on that series. How can we provide
any comment if you're dead-set on a particular implementation and not
explain what the problem you are trying to solve is?

Thinking more about it, I'm even more skeptical about the general
approach that this should be implemented at the bridge level (or in
KMS).

It looks to me that this is very much a bus problem. USB device drivers
also require the bus to be powered and generally available to send data
to their device, and you don't fix that up in the HID or storage
drivers, you make the bus behave that way.

What prevents us from fixing it at the bus level?

Maxime

--t5jjjcy33i2jy7lt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTodoAAKCRDj7w1vZxhR
xXxfAP9VCXaQR2cQ7p55Qlz1ohFIbsH/qdui1vb3BqtSku+upgEAjT4JPOz2oULJ
J5eoQVTdscVpioLNgkJXMKMNMAd0+A0=
=lsQF
-----END PGP SIGNATURE-----

--t5jjjcy33i2jy7lt--
