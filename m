Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319159FFE7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B188EBC87C;
	Wed, 24 Aug 2022 16:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99B812AF94
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:13:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6A7F1320092B;
 Mon, 15 Aug 2022 10:12:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 10:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660572775; x=1660659175; bh=95mnvlvEkK
 9mcSKd+kXococ32XhrGijoHEj32aw3dTo=; b=KUQstMpzpwAhkWnnt1cZfvs0z4
 HZMs7KNFQuc1k6Zi0PpRjijfcCOs4eyFKbVkqniFvjMun7QqCr4hPW1ANW36akzN
 D2B+J7gkdXb3ssXurvxgAfxCvWSuOFwf3A/U7WmjRcdteXoPYsxyDJjOOTNooydp
 hd5YF4YKDbXdCR7Iha3DftQ2Xir/hrN2msLJYfeO7W5JbSGm/w0hh8Nz3gZiBMBx
 Z3YdzAce3ZJYDRAIOyvi3lMQ86b82gr3S88xX8PzupJhBFNo3oNWZUA2Z6JK4pOq
 CPJDjr1+UwwxLpvWiHl3hCOVl0ZWOXwDmOvKvyLI2IwmCT8PIWkqDtYc/fSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660572775; x=1660659175; bh=95mnvlvEkK9mcSKd+kXococ32Xhr
 GijoHEj32aw3dTo=; b=NkB9gui6R6v16173wtaAHvR5mlbwl46SixOuyOz2oIa8
 brcabkES/gu4L4AHcTx668lzi8XUSelIDs2rA8uDnqVSjclFUoerCkd6SHJUByRN
 /LKujfQsPBegVWrScCsVRqJGZMhmDk4qGvABIO9vDYXDTTjkUYbF4HZGQCOKk1H0
 Giao1wjgP4xh13ZN3CkMD8Cpk+CbcEh05vAhcXzfSXSFvmrpavJjad6k+Vwjhblu
 ksV0vcNllD+Z0CnuwDX5aMPR+KeKVzxwSQHgBlUs5yVIRK5cqPlLihVbawKCuebc
 G0XlzvuFYLHapbdD+42YRhCyGuc+ExJP8T18oPPn/A==
X-ME-Sender: <xms:Z1T6YvboOsrEDL8TJ45WQhA396Ci87UgGEr4Qjo81CWI2kXnwLLhwg>
 <xme:Z1T6YuZQIGcrqLLl1E9URHLxwNXCqYIz58hrUcvoF3efrurbuLzan--GtX1vUVgnf
 FMPdYTbda1K-WDOeMw>
X-ME-Received: <xmr:Z1T6Yh9u2fA8hT54d4IhRRiQyhpzEAiPcknVq5TvUrwp0SdObxXI6n-cp28l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeehleeiieegtdevgfefhfeigeeuueelteetfeeljeeuudekieefgefgjeet
 hffhteenucffohhmrghinhepshhpihhnihgtshdrnhgvthdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Z1T6Ylop-5AumVIataLeVsDqxWv7f8FwoEl2zlE0qXBBlQjAh8GY9w>
 <xmx:Z1T6Yqo7U8kv8sSURKHWNR-u3VSp9bFwE5vTBbtVqz45tJ5odol5Tw>
 <xmx:Z1T6YrS_qW0AUW7mgQLD8tJLGeVgZqR44T-o6CNAg5Rz_X9TlBrhcw>
 <xmx:Z1T6Yrd3rElC4NgR3cCK_tnR7baTd9o9lD4RH_8CD9SIKBq22XBQBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 10:12:54 -0400 (EDT)
Date: Mon, 15 Aug 2022 16:12:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Message-ID: <20220815141253.ku5tlwien4lipqn6@houat>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
 <abc70ec9-cf6a-3057-0d80-65a3cb81ea2b@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="73oi5wd36zdvpqte"
Content-Disposition: inline
In-Reply-To: <abc70ec9-cf6a-3057-0d80-65a3cb81ea2b@i2se.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--73oi5wd36zdvpqte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 10:33:48PM +0200, Stefan Wahren wrote:
> Hi Florian,
>=20
> Am 09.08.22 um 21:02 schrieb Florian Fainelli:
> > On 8/4/22 16:11, Florian Fainelli wrote:
> > > On 6/13/22 07:47, Maxime Ripard wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >=20
> > > > The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
> > > > attached to the HDMI block, handled in Linux through runtime_pm.
> > > >=20
> > > > That power domain is shared with the VEC block, so even if we put o=
ur
> > > > runtime_pm reference in the HDMI driver it would keep being on. If =
the
> > > > VEC is disabled though, the power domain would be disabled and we w=
ould
> > > > lose any initialization done in our bind implementation.
> > > >=20
> > > > That initialization involves calling the reset function and
> > > > initializing
> > > > the CEC registers.
> > > >=20
> > > > Let's move the initialization to our runtime_resume implementation =
so
> > > > that we initialize everything properly if we ever need to.
> > > >=20
> > > > Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable
> > > > to runtime_pm")
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > After seeing the same warning as Stefan reported in the link below,
> > > but on the Raspberry Pi 4B:
> > >=20
> > > https://www.spinics.net/lists/dri-devel/msg354170.html
> > >=20
> > > a separate bisection effort led me to this commit, before is fine,
> > > after produces 4 warnings during boot, see attached log.
> > >=20
> > > Is there a fix that we can try that would also cover the Raspberry
> > > Pi 4B? Is it possible that this series precipitates the problem:
> > >=20
> > > https://www.spinics.net/lists/arm-kernel/msg984638.html
> >=20
> > Maxime, Dave, anything you would want me to try? Still seeing these
> > warnings with net-next-6.0-11220-g15205c2829ca
>=20
> At first this issue doesn't occur in Linux 5.19. So it's something new. I
> was able to reproduce with todays linux-next, but interestingly it doesn't
> occur in drm-misc-next.

Yeah, it should be fixed by
https://lore.kernel.org/all/20220629123510.1915022-38-maxime@cerno.tech/
https://lore.kernel.org/all/20220629123510.1915022-39-maxime@cerno.tech/

Both patches apparently didn't make the cut for the merge window, if it
works for you we can always queue them in drm-misc-fixes

Maxime

--73oi5wd36zdvpqte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvpUZAAKCRDj7w1vZxhR
xcAoAP9G1nDrgOaBqajshCG+Nty8iWrrk/O2VXuLc6WXd1h8LAEA4dbyof/M8e0D
l5cY054CQDpeuJPPhHtv2RjesmW+BQY=
=FhAK
-----END PGP SIGNATURE-----

--73oi5wd36zdvpqte--
