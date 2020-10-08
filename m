Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E9288390
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09286EC62;
	Fri,  9 Oct 2020 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C8A6E112
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 09:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79F17ACAC;
 Thu,  8 Oct 2020 09:35:24 +0000 (UTC)
Message-ID: <4fcb8adf6241e601109cfae5945f38be0e67e0f6.camel@suse.de>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
 <maxime@cerno.tech>
Date: Thu, 08 Oct 2020 11:35:21 +0200
In-Reply-To: <CAPY8ntAr+wV0F-GCxHLg+30tuu8van51BFQ9Nh_C1LD+CPRcLA@mail.gmail.com>
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
 <20201006152623.sjc3jxagj4wh7g5f@gilmour.lan>
 <CAPY8ntAr+wV0F-GCxHLg+30tuu8van51BFQ9Nh_C1LD+CPRcLA@mail.gmail.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0014887428=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0014887428==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GGTW+6nQFXkETNpj3DA5"


--=-GGTW+6nQFXkETNpj3DA5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave, sorry for the late reply.

On Tue, 2020-10-06 at 18:14 +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Tue, 6 Oct 2020 at 16:26, Maxime Ripard <maxime@cerno.tech> wrote:
> > Hi Dave,
> >=20
> > On Fri, Oct 02, 2020 at 04:57:05PM +0100, Dave Stevenson wrote:
> > > Hi Maxime
> > >=20
> > > On Fri, 2 Oct 2020 at 16:19, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > Hi Tim,
> > > >=20
> > > > On Thu, Oct 01, 2020 at 11:15:46AM +0100, Tim Gover wrote:
> > > > > hdmi_enable_4k60=3D1 causes the firmware to select 3.3 GHz for th=
e PLLC
> > > > > VCO to support a core-frequency of 550 MHz which is the minimum
> > > > > frequency required by the HVS at 4Kp60. The side effect is that i=
f the
> > > > > display clock requirements are lower than 4Kp60 then you will see
> > > > > different core frequencies selected by DVFS.
> > > > >=20
> > > > > If enable_uart=3D1 and the mini-uart is selected (default unless
> > > > > bluetooth is disabled) then the firmware will pin the core-freque=
ncy
> > > > > to either core_freq max (500 or 550). Although, I think there is =
a way
> > > > > of pinning it to a lower fixed frequency.
> > > > >=20
> > > > > The table in overclocking.md defines options for setting the maxi=
mum
> > > > > core frequency but unless core_freq_min is specified DVFS will
> > > > > automatically pick the lowest idle frequency required by the disp=
lay
> > > > > resolution.
> > > >=20
> > > > I'm wondering if there's some way to detect this from Linux? I gues=
s it
> > > > would be nice to be able to at least detect a broken config to warn=
 /
> > > > prevent an user that their situation is not going to be reliable / =
work
> > > > really well (like if they have a 4k display without hdmi_enable_4kp=
60
> > > > set, or the issue we're discussing here)
> > >=20
> > > The main filter in the firmware is the parameter
> > > hdmi_pixel_freq_limit. That can either be set manually from
> > > config.txt, or defaults appropriately based on hdmi_enable_4kp60.
> > > Under firmware_kms [1] I read back those values to use as a filter
> > > within crtc_mode_valid[2].
> > > I can't think of a nice way of exposing that without the vc4 driver
> > > gaining a DT link to the firmware, and that starts to get ugly.
> >=20
> > I had in mind something like if the clock driver can infer that somehow
> > through some the boundaries reported by the firmware maybe? IIRC,
> > hdmi_enable_4kp60 will already change the max frequency reported to
> > 550MHz instead of 500MHz
>=20
> Yes, that's plausible, but I don't know enough about the clock
> infrastructure for advertising limits to know what works there.
> Tell me what you need from the mailbox service and I'll see what I can do=
.
>=20
> We do already have RPI_FIRMWARE_GET_MAX_CLOCK_RATE and
> RPI_FIRMWARE_GET_MIN_CLOCK_RATE. It'd take a few minutes of staring at
> the code (or a quick test) to confirm if they definitely are changed
> for CORE clock by hdmi_enable_4kp60 - I think it does.

Tim commented earlier that you meant to pin CORE frequency when enable_uart=
=3D1.
In practice it doesn't seem to be the case, but it would solve the UART
problem for most use cases. Would that be feasible?

If we have to change the CORE frequency during runtime we could, while we
search for a proper solution, print a warning that we're about to break the=
 low
speed peripherals.

Regards,
Nicolas


--=-GGTW+6nQFXkETNpj3DA5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9+3VkACgkQlfZmHno8
x/6lNQf/RX2DLfzMbpiRUL7IE3tjUlCl92Irb0CiVN54cIbjREI3mpHvnODwZ54B
O2PoojpqTltsyyixX6sI3vYUyiYbaWNCC8NEMd2+2h4RFFqdDjZU+L80yQcL7Ms4
dEOaTNjfm3Fo2wxgUXrt79Z4yotEnT1UVAhqdXXFj+18EMzJfFddMk/0UsO0wP0f
COkCwXpBy4m3RD/orkS8QHNZxcl2YXzG0GLqm2FCrnypLSCFgXHIzLkyxaHMwxK8
sE1yZfgoG2QlE7HYFVfNyksx2DT9p0f6EKh7Qi4vk82WsJlJfkywpf3k8wI1jm3J
ayS4IGCyOSMUrvlZUX/REvUPN3mLLQ==
=jTkd
-----END PGP SIGNATURE-----

--=-GGTW+6nQFXkETNpj3DA5--


--===============0014887428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0014887428==--

