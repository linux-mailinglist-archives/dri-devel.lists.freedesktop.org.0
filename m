Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA5285962
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183D6E89F;
	Wed,  7 Oct 2020 07:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12656E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 15:26:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8DF8FB4A;
 Tue,  6 Oct 2020 11:26:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 06 Oct 2020 11:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=XVvl+TcUjqRrvpH+Af1XcXoFBtY
 BObBimd5gmwU57Mw=; b=A6a59ePBVWis3JnCMLKaoEu4oiB/c7FqU16aXuN+a5U
 ByIlUcyZIubF3xEDmtZtO7VTivlUrIWx6x+lXhVBIu7GB2jygM/4IdnD3RoJb175
 gq6NsATT8cmmecH+JTu7nQNmK5X6T+wO+ooEZ8FRpqpDuumnbsQ3N3Og3JWGAWjl
 7L27z3I7JeubaR0F46itiboMEzrQ6ZHRh9bXghut9jrONtc0lDsAFPMobvE8Opfx
 n5lwo0Fc21YcK26Dz8bdZIRU9I0gn7weywCm9KZN8FDO1Z4VepPS5blLSOS+Ravp
 Uzkb8g82FFIpDuuVjHCtkSveDbvBFr+7ucdCdFsI6Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XVvl+T
 cUjqRrvpH+Af1XcXoFBtYBObBimd5gmwU57Mw=; b=o0nzk1wz4WX3tcF2/7nutH
 XMS26VsqE4V8B+bt4zdCs0aG3D8UH7Y5w28EFUfnZbri4ruMPPOZhU17cQ0V8t0H
 ssO4xQlwG4NYr/UUicrGn2Jylg2N4xT7hEyrAiKCYQp/ALBNl+PsNXR4N7VMZ4iQ
 T9j83OT/ObTIIUx8+KXAvNTenD5DJ1pFzqgKT13FxxmX2ubHEGa4yw0nEeCNyamI
 /ictGq4RWmyvVeNOXF7ZAi19Sr/M6diWRDk3pqherYmCPYR+XX+qzPPl81Y0npjX
 8Ny3UasbvM1Vghxus21gzqPkYDyJM5AM4unghxYMuGzYoY81GiMw7TrPMlwHYRyA
 ==
X-ME-Sender: <xms:oYx8X445EExjvPM-aX8SFjILjtvgOz5vbqjQRFy4dEmPmZV8FADRgg>
 <xme:oYx8X54xfHFHpgRJVK5AyUANpNJZSbWvdJURYe1SGftFwp8qSwuSvHLz7wfbJr6TM
 5vxXlQURRQXWgNhFSI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeggdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oYx8X3dsfZ964xNbQeqnZrqXAjFTtBoKjOwRqmCUwIJuvWPaNy9Jqw>
 <xmx:oYx8X9KEcQyf8nQNGwBLzRAux2eAf5Q4bAocU4auU1QL1GNZM1SifQ>
 <xmx:oYx8X8L9hRMtlmgITK5imDx7zSuCYny2J5Xh3_qMxxtjKWggiJr4VQ>
 <xmx:o4x8X6zZMqVN5v0uaQgP_WKeI4mlde2Vn8AUx8ShW4a40RY5FVd7D8sWB-g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A19393280064;
 Tue,  6 Oct 2020 11:26:25 -0400 (EDT)
Date: Tue, 6 Oct 2020 17:26:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20201006152623.sjc3jxagj4wh7g5f@gilmour.lan>
References: <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
 <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
 <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
 <CAAvKZ65WqQqH-9JVdb5M6HcKbR3yQdvZha8n9UXXCfciYRq4aA@mail.gmail.com>
 <20201002151954.wazqc5riesdomlpx@gilmour.lan>
 <CAPY8ntCkY9F0e=hOyg=rs5G2a=iEbukWgmr0adXrwJQPm=uY6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCkY9F0e=hOyg=rs5G2a=iEbukWgmr0adXrwJQPm=uY6A@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1106267907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1106267907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2vhbw75wrhkhefhs"
Content-Disposition: inline


--2vhbw75wrhkhefhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, Oct 02, 2020 at 04:57:05PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Fri, 2 Oct 2020 at 16:19, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Tim,
> >
> > On Thu, Oct 01, 2020 at 11:15:46AM +0100, Tim Gover wrote:
> > > hdmi_enable_4k60=3D1 causes the firmware to select 3.3 GHz for the PL=
LC
> > > VCO to support a core-frequency of 550 MHz which is the minimum
> > > frequency required by the HVS at 4Kp60. The side effect is that if the
> > > display clock requirements are lower than 4Kp60 then you will see
> > > different core frequencies selected by DVFS.
> > >
> > > If enable_uart=3D1 and the mini-uart is selected (default unless
> > > bluetooth is disabled) then the firmware will pin the core-frequency
> > > to either core_freq max (500 or 550). Although, I think there is a way
> > > of pinning it to a lower fixed frequency.
> > >
> > > The table in overclocking.md defines options for setting the maximum
> > > core frequency but unless core_freq_min is specified DVFS will
> > > automatically pick the lowest idle frequency required by the display
> > > resolution.
> >
> > I'm wondering if there's some way to detect this from Linux? I guess it
> > would be nice to be able to at least detect a broken config to warn /
> > prevent an user that their situation is not going to be reliable / work
> > really well (like if they have a 4k display without hdmi_enable_4kp60
> > set, or the issue we're discussing here)
>=20
> The main filter in the firmware is the parameter
> hdmi_pixel_freq_limit. That can either be set manually from
> config.txt, or defaults appropriately based on hdmi_enable_4kp60.
> Under firmware_kms [1] I read back those values to use as a filter
> within crtc_mode_valid[2].
> I can't think of a nice way of exposing that without the vc4 driver
> gaining a DT link to the firmware, and that starts to get ugly.

I had in mind something like if the clock driver can infer that somehow
through some the boundaries reported by the firmware maybe? IIRC,
hdmi_enable_4kp60 will already change the max frequency reported to
550MHz instead of 500MHz

Maxime

--2vhbw75wrhkhefhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3yMnwAKCRDj7w1vZxhR
xR/iAQD6pwgr2GpbJCVGim38pNOLxZo5Rqj2JwUV2k0DX+7aogD7BRzKIBKaqme7
8XvNoJP3M2U/v4jVWse/ISyU9jMM/Ao=
=Bl+M
-----END PGP SIGNATURE-----

--2vhbw75wrhkhefhs--

--===============1106267907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1106267907==--
