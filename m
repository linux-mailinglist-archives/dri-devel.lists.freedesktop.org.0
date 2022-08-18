Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A851559879A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717B59FC85;
	Thu, 18 Aug 2022 15:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9614BE01
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:38:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 73EF132009AB;
 Thu, 18 Aug 2022 11:38:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 18 Aug 2022 11:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660837115; x=1660923515; bh=oaljbVcobV
 yOplORNbZ1SgF1YbiCHABvu29L5JIUNzY=; b=bJVRJc2WeD3RBHy093SGg9hsaE
 zUp4uBAxSy658sZTugBXUwA6aKIkukGb6k3zxhMqQ0j8V97qEU3uzunfE8wRVcO+
 c/3oJzT+Rv1fnGyNXQIkXK/jY7eJzhrMGsSP2EwIK5zQAxaAOMILJoBHivo9r7Xf
 rGZ2qRRBzatHKVh99GaqC06F3gZCykRQOwaa3D0KJ7ZTBVdz2CeoNSiSzH+5GQe+
 BUndR9GBc7NEZWNPenicXgYVeadOYqhYHvV/qplXsVyFp8JkdQ4WaL9GukJrpl5g
 qiXGiOhcq2bWYRk9qfE3NLjIjCflniAeGK0jbRse3Re1tdgy9ITmBOYhnqZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660837115; x=1660923515; bh=oaljbVcobVyOplORNbZ1SgF1YbiC
 HABvu29L5JIUNzY=; b=nwR/FFbq95KszXlCgaw707ExG0bmPZtRcLVcGf7XCC11
 r9wfj1klVLtNBqF+ppDKC6z4pRdQCCR62RcQRFnZzSXF1Eh8gHE/J+q4z+rkxCc6
 HwY+MY9bZIqkUfFi8QzbcJF6onxIatUaXj0pqdK76NY4lxRccV+e1OlomZyHcueq
 GH6pZ+dfJNiK4Gv8U+b4HBEuqWeULDv4I9vyRbpa2AUJVb+8k1gANfF3aAiFKJyW
 Vjh8+unUQ6vz0JvNUuweQwUKc7PlE4mkBsN+3QVVzNCk+z4exTxw832VLMYiw4kO
 4V9Ft2gmV5tyNOprjYY7YqxTv7jqar58dklOmVP1UQ==
X-ME-Sender: <xms:-1z-Yl7ix1tes2Tw4_UrlvM5N3JDclrEfxcetoboENwmfF8Aqk0HFw>
 <xme:-1z-Yi7yGSTXO0qEejQSrf31hTV81kmT5YoUI8hjoSJBJ1rMCMXgDYguxknA5arkK
 Mzbrhy7CUpscmCppT8>
X-ME-Received: <xmr:-1z-YsfJaczgVGNLv8RVwfkB7HH6nZhiQ7VYoKSuk8M_ACB3NxFFio69eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeehleeiieegtdevgfefhfeigeeuueelteetfeeljeeuudekieefgefgjeet
 hffhteenucffohhmrghinhepshhpihhnihgtshdrnhgvthdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-1z-YuIfq-7QQBPPTtg46T3LVqaO-_JKQ-uYqiJaFdmYpZKnff3hzw>
 <xmx:-1z-YpJjHfoTyJ1csmIQMFxlSBzAEKPLcfhnyJLNNzCItEvqiz8CYg>
 <xmx:-1z-Ynwtd81NAPDn4jOUHxeqmp7CnQa_eTC2YQZNdPWCKFx7cxJqbA>
 <xmx:-1z-Yh-bilvqY5GLA46IZ3lxtEtqZKEDZqpTCnjzr5F3GCs_-r5dtA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 11:38:35 -0400 (EDT)
Date: Thu, 18 Aug 2022 17:38:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Message-ID: <20220818153833.ppx2uc7ccqykuwga@houat>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
 <abc70ec9-cf6a-3057-0d80-65a3cb81ea2b@i2se.com>
 <20220815141253.ku5tlwien4lipqn6@houat>
 <129cc9c4-b99f-cff4-bd16-093441e39a66@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vojox5pgwzzotnsc"
Content-Disposition: inline
In-Reply-To: <129cc9c4-b99f-cff4-bd16-093441e39a66@gmail.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vojox5pgwzzotnsc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 09:52:59AM -0700, Florian Fainelli wrote:
> On 8/15/22 07:12, Maxime Ripard wrote:
> > On Wed, Aug 10, 2022 at 10:33:48PM +0200, Stefan Wahren wrote:
> > > Hi Florian,
> > >=20
> > > Am 09.08.22 um 21:02 schrieb Florian Fainelli:
> > > > On 8/4/22 16:11, Florian Fainelli wrote:
> > > > > On 6/13/22 07:47, Maxime Ripard wrote:
> > > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > >=20
> > > > > > The BCM2835-37 found in the RaspberryPi 0 to 3 have a power dom=
ain
> > > > > > attached to the HDMI block, handled in Linux through runtime_pm.
> > > > > >=20
> > > > > > That power domain is shared with the VEC block, so even if we p=
ut our
> > > > > > runtime_pm reference in the HDMI driver it would keep being on.=
 If the
> > > > > > VEC is disabled though, the power domain would be disabled and =
we would
> > > > > > lose any initialization done in our bind implementation.
> > > > > >=20
> > > > > > That initialization involves calling the reset function and
> > > > > > initializing
> > > > > > the CEC registers.
> > > > > >=20
> > > > > > Let's move the initialization to our runtime_resume implementat=
ion so
> > > > > > that we initialize everything properly if we ever need to.
> > > > > >=20
> > > > > > Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable
> > > > > > to runtime_pm")
> > > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > >=20
> > > > > After seeing the same warning as Stefan reported in the link belo=
w,
> > > > > but on the Raspberry Pi 4B:
> > > > >=20
> > > > > https://www.spinics.net/lists/dri-devel/msg354170.html
> > > > >=20
> > > > > a separate bisection effort led me to this commit, before is fine,
> > > > > after produces 4 warnings during boot, see attached log.
> > > > >=20
> > > > > Is there a fix that we can try that would also cover the Raspberry
> > > > > Pi 4B? Is it possible that this series precipitates the problem:
> > > > >=20
> > > > > https://www.spinics.net/lists/arm-kernel/msg984638.html
> > > >=20
> > > > Maxime, Dave, anything you would want me to try? Still seeing these
> > > > warnings with net-next-6.0-11220-g15205c2829ca
> > >=20
> > > At first this issue doesn't occur in Linux 5.19. So it's something ne=
w. I
> > > was able to reproduce with todays linux-next, but interestingly it do=
esn't
> > > occur in drm-misc-next.
> >=20
> > Yeah, it should be fixed by
> > https://lore.kernel.org/all/20220629123510.1915022-38-maxime@cerno.tech/
> > https://lore.kernel.org/all/20220629123510.1915022-39-maxime@cerno.tech/
> >=20
> > Both patches apparently didn't make the cut for the merge window, if it
> > works for you we can always queue them in drm-misc-fixes
>=20
> Both of these patches eliminate the warning, I don't have a good set-up y=
et
> for ensuring that HDMI/V3dD is functional however:
>=20
> Tested-by: Florian Fainelli <f.fainelli@gmail.com>

I ended up applying it today (without your Tested-by, since it was partial =
though)

Maxime

--vojox5pgwzzotnsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5c+QAKCRDj7w1vZxhR
xTwdAP9cDBKz5+KjFktgBfepfYZ3q4xoAOTY0iQtp5fJiwqfawD/VwKYY0JW43CA
aTi+u0WBxf3mR68cwY8kkRKdFddxAwE=
=YK+d
-----END PGP SIGNATURE-----

--vojox5pgwzzotnsc--
