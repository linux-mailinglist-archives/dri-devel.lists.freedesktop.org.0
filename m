Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEBF7E3CA2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE1A10E143;
	Tue,  7 Nov 2023 12:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5E310E13D;
 Tue,  7 Nov 2023 12:18:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 392EBB81699;
 Tue,  7 Nov 2023 12:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16449C433C8;
 Tue,  7 Nov 2023 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359497;
 bh=OTPITfqoNgf8Jzf8gCNGibipMX2tb1QEAd6RqdUSFCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErkAgx2RlSbgqNuK93lfa05dXA86rnpmhfM3cU4WQFYbRPcBcW/JoBe8xE0Q60nJB
 QnzybSObkncybEV90rL/vgxrw9inzONRa/W/F3hc/1UxVTiACMJ4CIgSglV7dcX8bv
 oYI7H07T1jEXslAmOQaCIkxHiSWDRcHPXAgEMvLdUQrmq6q9yB8DAcoDF19aabn9ZJ
 jRu+KQwBOpyupjliuRv7NQ6POOca6d2zc7uZQ3n/Opqu1Ku3VQ0Or95OU/jmvykL/w
 4kUtQEyDWZOqT+yb6i9jXYa18Nkd36THaI1EzzcWDb3mdD/p8UGchClV+oYjaJEIVD
 wt9/alUabVVDQ==
Date: Tue, 7 Nov 2023 13:18:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
 <2023110704-playback-grit-7a27@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dlcuzb3mgsgh2p4c"
Content-Disposition: inline
In-Reply-To: <2023110704-playback-grit-7a27@gregkh>
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


--dlcuzb3mgsgh2p4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 12:22:21PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 07, 2023 at 11:57:49AM +0100, Maxime Ripard wrote:
> > +GKH
>=20
> Why?  I don't see a question for me here, sorry.

I guess the question is: we have a bus with various power states
(powered off, low power, high speed)

low power is typically used to send commands to a device, high speed to
transmit pixels, but still allows to send commands.

Depending on the devices, there's different requirements about the state
devices expect the bus to be in to send commands. Some will need to send
all the commands in the low power state, some don't care, etc. See
the mail I was replying too for more details.

We've tried so far to model that in KMS itself, so the framework the
drivers would register too, but we're kind of reaching the limits of
what we can do there. It also feels to me that "the driver can't access
its device" is more of a problem for the bus to solve rather than the
framework.

Do you agree? Are you aware of any other bus in Linux with similar
requirements we could look at? Or any suggestion on how to solve it?

Thanks
Maxime

--dlcuzb3mgsgh2p4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUorBgAKCRDj7w1vZxhR
xX4iAPwJyqaJwy9edtHIOgX1Ky1Mp1GAxI1ipJP7MO22Wy9lAAD/V/u6QTmSypUr
ObUiBBEweBdU/Zz6s4t5E56TaLF4PQI=
=W84/
-----END PGP SIGNATURE-----

--dlcuzb3mgsgh2p4c--
