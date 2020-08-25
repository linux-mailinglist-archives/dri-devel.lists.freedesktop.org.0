Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BC2528CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F546EA32;
	Wed, 26 Aug 2020 08:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECB26E296
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 15:06:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 275BE2CD;
 Tue, 25 Aug 2020 11:06:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 11:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3I3j5EOU60U1Ry7H1RtmtTOIRsx
 0SMf4gLT/+JVsv3s=; b=qIpyzpWqvt49gOQjIw0P0YCE2o/ZjNok7k0l03cLlv+
 ZNuULsmpjgGUIgHy7RDdPRQ6tB30SnDfI67RXYZWdKMv5Bm8MggcpzKmHXkAv/Rh
 deoC3EWpwQGa991tom1omCJZuh1oMAUqOg3hIfGHEOXWNhDjfyngbihaqb9SKl/h
 a3qlD4IbkfRjq6zenklH3d43+CwRAEKcUDYe9h2lNBrKjiYf9vlatkMtz/98M0kp
 R06d/Arif3zzDdMXJbUn/zhOmTaXBQhwpmSqfUBFwpLoQQlSx3kY9RsxX54QOABL
 38OA7qovlZ/SQshAtEfv3qAZiTrvYF4Qzwb9vmb7U6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3I3j5E
 OU60U1Ry7H1RtmtTOIRsx0SMf4gLT/+JVsv3s=; b=qzOmkcJu5rhTpkZVcdNhea
 bN4ZfR5/9NMiAQfypTNM3a/2wYBmsuFeh+hAvANlrlhodAp6AJb+vBuJscM6LoaM
 8bRICOzMMOBrxLps3y8Lusrq8vCNl/ZnnXxghVld9K3kxIdb4b26454xnQpSW+Yv
 pACmmzRT/K7nrc0zemOoPQ7LgGW33mryry5kf15hPBFqnq7Wc1cUYx9/jcTYQA2I
 1ipQFOOTQ9WKZGM2sZ9LQ1UNMfBYb+iotUo/Is4vaKR1nbqMo0E0nikRdIF/uALW
 81DctUrFdzz7tZKnztYKE8FRuqt5ZaoxRVuvdNemrpn/TMF6qaHZEAk4HFC2ZUQw
 ==
X-ME-Sender: <xms:4ChFX0bSx9W0Znia52kwIwRyTGKvg5JNkn1Xqchou6x4CYpRS5VtTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4ChFX_aHfWHINNwK6U-Fw35J35K8kmyiTo9Wr4mD8L0WZ2fWb7yElw>
 <xmx:4ChFX-8_wuzxIem1Ch830fXwF5JwhpY4fWY2sXBzEJ9tu22ZQ5ASNQ>
 <xmx:4ChFX-peXcuf1lTBpFTmkcOTpsnuQD8wkeVGkybIPEzAlyzlFimteA>
 <xmx:4ihFX7L70Inwhrj51vikWUZKeo623Hway8xr1A2iFuJ78Phb5-nCDgr7Pn4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B3AE3280067;
 Tue, 25 Aug 2020 11:06:08 -0400 (EDT)
Date: Tue, 25 Aug 2020 17:06:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v4 29/78] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
Message-ID: <20200825150606.utlynhzo664bwksy@gilmour.lan>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <a1f22aadc60a2f32022831a6348c8bbd6e1954c3.1594230107.git-series.maxime@cerno.tech>
 <CAPY8ntBLWrfagZ5-kQz+5Mkw4_KaaTP63_L3D4owJAfA5kFpzw@mail.gmail.com>
 <20200729144251.us6a2pgkjjmm53ov@gilmour.lan>
 <ff6eca99-d98e-5b50-8b74-bba82928dda2@i2se.com>
MIME-Version: 1.0
In-Reply-To: <ff6eca99-d98e-5b50-8b74-bba82928dda2@i2se.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1236043714=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1236043714==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gbp4s6jsz2sfula3"
Content-Disposition: inline


--gbp4s6jsz2sfula3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, Jul 29, 2020 at 05:50:31PM +0200, Stefan Wahren wrote:
> Am 29.07.20 um 16:42 schrieb Maxime Ripard:
> > Hi,
> >
> > On Wed, Jul 29, 2020 at 03:09:21PM +0100, Dave Stevenson wrote:
> >> On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
> >>> In order to avoid pixels getting stuck in the (unflushable) FIFO betw=
een
> >>> the HVS and the PV, we need to add some delay after disabling the PV =
output
> >>> and before disabling the HDMI controller. 20ms seems to be good enoug=
h so
> >>> let's use that.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>> ---
> >>>  drivers/gpu/drm/vc4/vc4_crtc.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4=
_crtc.c
> >>> index d0b326e1df0a..7b178d67187f 100644
> >>> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> >>> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> >>> @@ -403,6 +403,8 @@ static void vc4_crtc_atomic_disable(struct drm_cr=
tc *crtc,
> >>>         ret =3D wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDE=
N), 1);
> >>>         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
> >>>
> >>> +       mdelay(20);
> >> mdelay for 20ms seems a touch unfriendly as it's a busy wait. Can we
> >> not msleep instead?
> > Since the timing was fairly critical, sleeping didn't seem like a good
> > solution since there's definitely some chance you overshoot and end up
> > with a higher time than the one you targeted.
>=20
> usleep_range(min, max) isn't a solution?

My understanding of usleep_range was that you can still overshoot, even
though it's backed by an HR timer so the resolution is not a jiffy. Are
we certain that we're going to be in that range?

Maxime

--gbp4s6jsz2sfula3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0Uo3gAKCRDj7w1vZxhR
xTjQAQCZiLqHqiPNSDq7T1euBsIbQ+XTGhdLmdnBZbUIO+1VPwEA1z/O7HFK3t4N
IhM8AxotumyFnRcchBjauHOWLcdL+Qo=
=am4A
-----END PGP SIGNATURE-----

--gbp4s6jsz2sfula3--

--===============1236043714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1236043714==--
