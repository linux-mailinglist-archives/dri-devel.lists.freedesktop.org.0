Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831567E5A1B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5D810E160;
	Wed,  8 Nov 2023 15:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7933410E160;
 Wed,  8 Nov 2023 15:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6F8D5B81C69;
 Wed,  8 Nov 2023 15:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94ACDC433C7;
 Wed,  8 Nov 2023 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699457682;
 bh=J9xVmtM/HahuIILcD7pLHb56PQSjwAI5+CwSkKmNpGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iyVfJBF7fXKlOtm1WvcN5O8kT5/+9NYO/ne6r7s83tLaGrK734b0RiQglJLgQpQX9
 b0ah39xOIlMlJizyF5PR0ks7h8GFZrMJm9AsLb+bTEBqcnPUB5FyYikeV3wxD+zcwy
 rSNkm7F7Z9+V9JSNcYAHa2eUisu9KxQU0UKISGz8NPywhUJBfBQz+rU9gFVotd3BKo
 ViGT8fKsQcF6+fH/91OXxX9OVdjeI8OfVP2902KWrihzd/D2jr15+2O8XAnY1RNyeX
 QGVohtf5olxrYqhmwt7SC8pDiAwahzN8+fNWXhNF5/HS9+lhx/UkyGGlDpcDRUJHfy
 bGuCiIP3F+Lxg==
Date: Wed, 8 Nov 2023 16:34:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <kuzbg4a52onojyfh2cc7h7c4iruzfbbbo2lm2jve72rnrpfk6f@2hars5pwujg3>
References: <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
 <2023110704-playback-grit-7a27@gregkh>
 <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
 <2023110704-deem-jigsaw-0bbf@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kxv6ogo77qrteawk"
Content-Disposition: inline
In-Reply-To: <2023110704-deem-jigsaw-0bbf@gregkh>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kxv6ogo77qrteawk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your answer

On Tue, Nov 07, 2023 at 04:26:34PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 07, 2023 at 01:18:14PM +0100, Maxime Ripard wrote:
> > On Tue, Nov 07, 2023 at 12:22:21PM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Nov 07, 2023 at 11:57:49AM +0100, Maxime Ripard wrote:
> > > > +GKH
> > >=20
> > > Why?  I don't see a question for me here, sorry.
> >=20
> > I guess the question is: we have a bus with various power states
> > (powered off, low power, high speed)
>=20
> Great, have fun!  And is this per-device or per-bus-instance?

Per bus instance

> > low power is typically used to send commands to a device, high speed to
> > transmit pixels, but still allows to send commands.
> >=20
> > Depending on the devices, there's different requirements about the state
> > devices expect the bus to be in to send commands. Some will need to send
> > all the commands in the low power state, some don't care, etc. See
> > the mail I was replying too for more details.
> >=20
> > We've tried so far to model that in KMS itself, so the framework the
> > drivers would register too, but we're kind of reaching the limits of
> > what we can do there. It also feels to me that "the driver can't access
> > its device" is more of a problem for the bus to solve rather than the
> > framework.
>=20
> This is up to the specific bus to resolve, there's nothing special
> needed in the driver core for it, right?

Yeah, we weren't really looking to handle this into the driver core, but
rather if there was a set of guidelines or feedback on implementing
those kind of features for a bus.

> > Do you agree? Are you aware of any other bus in Linux with similar
> > requirements we could look at? Or any suggestion on how to solve it?
>=20
> There might be others, yes, look at how the dynamic power management
> works for different devices on most busses, that might help you out
> here.

Thanks for the pointers, we'll have a look
Maxime

--kxv6ogo77qrteawk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUuqjwAKCRDj7w1vZxhR
xapoAQCtWDINqjYiWVkPAhUtwPTWoT7+cKNl5hbZl54zepr90gD9FFWar6/phKvE
jZfxo3gFVnhRNdVW8qbKy5lV+L6ivAw=
=+xHz
-----END PGP SIGNATURE-----

--kxv6ogo77qrteawk--
