Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05A7E3AA3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 11:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EB710E50F;
	Tue,  7 Nov 2023 10:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09610E50F;
 Tue,  7 Nov 2023 10:57:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D2A66B815C2;
 Tue,  7 Nov 2023 10:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD84DC433C7;
 Tue,  7 Nov 2023 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699354672;
 bh=SZv0J0mT59n2rZKjNBl8CMR8RlpgRNfa0+MUCGFThB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/f56Qzx1DTTqtDZ23652PJa4QPOvkmUrSpgkQDF0xV4MpQZ/yFMzHZutCIEyf7Fh
 COtX6iCuuiR//L5Q5vpD/D/8QUbe7t31vf7fjTFpDEjwDDl5QykQKuwgJFq9SzvJS8
 GaTudeP8naxDp1BWECaGrfA8lh/jpEqUZxlckGsct6hmWMhA/oJ+Xx0ie7WAsJM9lP
 vquzOGQE5axH9BEa9ANyw4jNqC2w4ZeANezDp7qt/dywkNn2FC2Hx2Kb0wWaOzXt7P
 4opfSncIL6l074QFgGrGtzw9asAQnsAE2JmMHRe8kEMniNlyUKLWpOw5bGhU97JOd3
 BPkTvIHuYF5Vg==
Date: Tue, 7 Nov 2023 11:57:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gxtcgkxgr2bmmbci"
Content-Disposition: inline
In-Reply-To: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
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


--gxtcgkxgr2bmmbci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+GKH

On Thu, Oct 26, 2023 at 11:41:34AM +0300, Dmitry Baryshkov wrote:
> > > > Also, we would still need to update every single panel driver, whic=
h is
> > > > going to create a lot of boilerplate that people might get wrong.
> > >
> > > Yes, quite unfortunately. Another approach that I have in mind is to =
add two
> > > callbacks to mipi_dsi_device. This way the DSI host will call into the
> > > device to initialise it once the link has been powered up and just be=
fore
> > > tearing it down. We solve a lot of problems this way, no boilerplate =
and the
> > > panel / bridge are in control of the initialisation procedure. WDYT?
> > >
> > > > I have the feeling that we should lay out the problem without talki=
ng
> > > > about any existing code base first. So, what does the MIPI-DSI spec
> > > > requires and what does panels and bridges expect?
> > >
> > > There is not that much in the DSI spec (or maybe I do not understand =
the
> > > question). The spec is more about the power states and the commands. =
Our
> > > problem is that this doesn't fully match kernel expectations.
> >
> > You're explicitly asking for comments on that series. How can we provide
> > any comment if you're dead-set on a particular implementation and not
> > explain what the problem you are trying to solve is?
>=20
> Ah, excuse me. I thought that I explained that in the cover letter.
>=20
> DSI device lifetime has three different stages:
> 1. before the DSI link being powered up and clocking,
> 2. when the DSI link is in LP state (for the purpose of this question,
> this is the time between the DSI link being powered up and the video
> stream start)
> 3. when the DSI link is in HS state (while streaming the video).
>=20
> Different DSI bridges have different requirements with respect to the
> code being executed at stages 1 and 2. For example several DSI-to-eDP
> bridges (ps8640, tc358767 require for the link to be quiet during
> reset time.
> The DSI-controlled bridges and DSI panels need to send some commands
> in stage 2, before starting up video
>=20
> In the DRM subsystem stage 3 naturally maps to the
> drm_bridge_funcs::enable, stage 1 also naturally maps to the
> drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> the DRM call chain.
> Earlier we attempted to solve that using the pre_enable_prev_first,
> which remapped pre-enable callback execution order. However it has led
> us to the two issues. First, at the DSI host driver we do not know
> whether the panel / bridge were updated to use pre_enable_prev_first
> or not. Second, if the bridge has to perform steps during both stages
> 1 and 2, it can not do that.
>=20
> I'm trying to find a way to express the difference between stages 1
> and 2 in the generic code, so that we do not to worry about particular
> DSI host and DSI bridge / panel peculiarities when implementing the
> DSI host and/or DSI panel driver.
>=20
> Last, but not least, we currently document that it is fine to call DSI
> transfer functions at any point during the driver's life time (at
> least that was the interpretation that we have agreed in the
> DSI-related threads). It has its own drawbacks for the DSI host
> drivers. The hosts have to deal with the DSI commands being sent at
> the different times, when the host is fully powered down, when it is
> running in the LP mode and when it is fully running and streaming
> video. By defining DSI lifetime more precisely, we can limit the
> period when the DSI commands can be legitimately sent, simplifying DSI
> host drives.

Thanks for writing this :)

> > Thinking more about it, I'm even more skeptical about the general
> > approach that this should be implemented at the bridge level (or in
> > KMS).
> >
> > It looks to me that this is very much a bus problem. USB device drivers
> > also require the bus to be powered and generally available to send data
> > to their device, and you don't fix that up in the HID or storage
> > drivers, you make the bus behave that way.
> >
> > What prevents us from fixing it at the bus level?
>=20
> Yes, this can also be possible. Do you mean adding code / callbacks to
> struct mipi_dsi_device ?

Yes, even more so with your summary above, I really think this should be
dealt with at the bus layer.

To put it in a different way, if we had an (imaginary, probably)
MIPI-DSI device that didn't fit into KMS but in any other framework, we
would still have all the constraints you list above. It really is a bus
matter, not something that bridges need to express.

I had a look at the other buses we have in the kernel and it looks like
HSI might have the same requirements?

Maxime

--gxtcgkxgr2bmmbci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUoYLQAKCRDj7w1vZxhR
xb5/AP9ur7o+WNgPDxCmvT8EAcxrlM8qGwtHOpSPORzeRKdLoAEA9fFl6YYXKCR/
7vsBwaX6Z10UcCEvv9k1HEKXLhxVcgw=
=uM1e
-----END PGP SIGNATURE-----

--gxtcgkxgr2bmmbci--
