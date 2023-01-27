Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804967E735
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C11110E47E;
	Fri, 27 Jan 2023 13:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4F10E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 13:58:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0EC573200BAB;
 Fri, 27 Jan 2023 08:57:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 27 Jan 2023 08:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674827878; x=1674914278; bh=gxPcqW+EzW
 chthucdr8f28ODmGsdkj3oek3horojRTI=; b=GFLqUSEUdi+gejTToJ488Uxx8z
 3fzeQD5UpJ49me1gkfkmxTokxM2b3LNckbhDVIofWKij0WFMSYfxCybp9sqG+Pj4
 cjkIPZrIuvwvQpfbAzuUcvA9m/dfiEFqyRei1rnnrZu65elcNF0M7Baezcde3rGW
 lsDArFctDlZASncbg08w5+2yh4Xp1acwwqx9JzRUMOjR6vUs14KRqVuRH0tatv5O
 wL2qbn8D8tm2zD8S4ZvsusVD6bxWgf5DdNbwrfI9uYJ24X3QS5VrJKAQ/tD4V163
 1G5TVTIzNPyKKHmevzXmYgJX9E2TWn3WuoKGx/2yV36uAj/nbV14GRAKu0bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674827878; x=1674914278; bh=gxPcqW+EzWchthucdr8f28ODmGsd
 kj3oek3horojRTI=; b=IEHQ030lh040w9N3lm8lqNedAOi46E9Z2xxpbFgT/YoQ
 iRRM5oxP4Myvi27TlC9v01uw7VZNELW1bPgPqg6meEZH8rZpk3dYmohir65da+N8
 W9/iKmo6Z9Lnxeku6KjrDn1ax2IZMpn/SDCP48KlmVz9slIWWlPsStXNMG01AcFT
 FuDRrjR7WFFmFS/4oYEB/XiJLKjwmW/EnS46IGSeMcLU/c8/BLubGPj8IvebrAAC
 1B1NLNxUmZ1UXsbb9Exd/Ommk6k/QT3Ibk1AzT5lOddSf8qtzgYmSRERlHwUh5N+
 wk3+M0t/g5PmSNWLSRs5uoN0YDK5jGL1mfLKytquhw==
X-ME-Sender: <xms:ZNjTY9OTCubv3Ns2fOHEb-bNUY3CVBUf_FqqhrdFd9-C2pAPG_8bdg>
 <xme:ZNjTY_-eyvtiRyFXcwgG9IDyKDASuVCKj2tNq2DbyOzkIfWQmTdGWgAyxYlwN4Smu
 dpp34OEbauaQhAKLYQ>
X-ME-Received: <xmr:ZNjTY8Qkk-yenrnXUBGU6Z2-15bAAaKDt6dnoR--U9a7bL4fDrM3Ca0iH-muGsHfPnFsNVfG-Bk47g3oimI8shyFpcKfnfjmMmbyOpl82QuydA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevgfevjeetkeejteeftdfhudelgfehfeekveeghedvkeduhfeutdfhleev
 ieffudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
 vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZNjTY5srQg--BnD2b-vT0XhlEzwrVKBkQtng8yaZ8IlJUUZE2fBpYg>
 <xmx:ZNjTY1eXgcvLtQyWTsjYK9KoKxcyvRiG8H180jb35mpV3PGHGiQJzg>
 <xmx:ZNjTY102QIsqVNMo1Z_Msxegf0pVONHjFKtJUfDNNbLdpAnfStaqOw>
 <xmx:ZtjTY4xyGv_780rDYLM3uTmjwjlDfr71dOBQNfa3Cr217ysMMiSLmQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 08:57:56 -0500 (EST)
Date: Fri, 27 Jan 2023 14:57:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Rodin <mrodin@de.adit-jv.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH] drm: override detected status for connectors which are
 forced on
Message-ID: <20230127135754.sirydb5vtr5taksr@houat>
References: <20221107123657.24vbgep3jqeklb2s@houat>
 <20221215170359.92422-1-mrodin@de.adit-jv.com>
 <20221222174054.tsj4rfzejrl3cc7g@penduick>
 <20230120090348.GA860002@vmlxhi-182>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2rlhppz4ufp7gd3u"
Content-Disposition: inline
In-Reply-To: <20230120090348.GA860002@vmlxhi-182>
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
Cc: michael@rodin.online, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2rlhppz4ufp7gd3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael, all,

On Fri, Jan 20, 2023 at 10:03:48AM +0100, Michael Rodin wrote:
> Hi Maxime,
>=20
> thank you for your feedback!
> On Thu, Dec 22, 2022 at 06:40:54PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Dec 15, 2022 at 06:03:59PM +0100, Michael Rodin wrote:
> > > The detected status of a connector should be ignored when a connector=
 is
> > > forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
> > > adding command line interface using fb."). One negative side effect of
> > > not ignoring this is observed on the RCar3 SoCs which use the dw-hdmi
> > > driver. It continues executing drm_helper_hpd_irq_event even if its
> > > connector is forced to ON. As consequence drm_helper_hpd_irq_event ca=
lls
> > > "detect" so the connector status is updated to "disconnected":
> > >=20
> > > [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1]=
 status updated from connected to disconnected
> > >=20
> > > This status is corrected by drm_helper_probe_single_connector_modes s=
hortly
> > > after this because this function checks if a connector is forced:
> > >=20
> > > [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECT=
OR:76:HDMI-A-1] status updated from disconnected to connected
> > >=20
> > > To avoid similar issues this commit adapts functions which call "dete=
ct"
> > > so they check additionally if a connector is forced and override the =
status
> > > returned by "detect".
> > >=20
> > > Fixes: 816da85a0990 ("drm: handle HPD and polled connectors separatel=
y")
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> >=20
> > As reported here, this breaks vc4, and probably i915:
> > https://lore.kernel.org/dri-devel/20221107123657.24vbgep3jqeklb2s@houat/
> >=20
> > Maxime
>=20
> My understanding from [1,2] was that the way to avoid such regressions is
> to make sure that the "detect" callbacks of connector drivers are always
> called even if a connector is forced. This is what I have implemented in =
my
> second patch where "detect" is called first and then the return value is
> adjusted based on the "force" status. If my understanding was wrong, I
> would very much appreciate if you could give me some hints for the
> implementation of an acceptable solution.

Ah, sorry, you're right.

I was confused since you didn't mention it was a new version, and didn't
provide a changelog, I just assumed you resent the same patch.

In the time between, we also got a report for the RaspberryPi that the
behaviour is also broken on CEC:

https://github.com/raspberrypi/linux/pull/5052

If we get back to the problem we're trying to solve, it means that if
nothing is provided on the command line, we should rely on the polling
or IRQ based detection that will call detect on a regular basis. The
current detect side effects (for HDMI) are that:

  * the CEC address will be invalidated if it's disconnected, and
    set if it's connected.

  * if the scrambler was active, we re-enable the HDMI scrambler

If we want to force the connector to be disconnected, everything is
fine. If we want to force the connector on, then we should ignore the
CEC invalidation, but should keep enabling the scrambler.

And you want to avoid state transitions when the connector is forced,
which also makes sense.

I think we can get it to work by:

  - Merging your patch to call detect, but no matter the returned
    status, if it's forced to a state by the command line or some other
    mechanism, we return what was forced.

  - in the detect hook:

      * if connector->force is set to off, we just return
      	connector_status_disconnected.

      * if connector->force is set to on, and if:

      	+ the actual status is that the display is disconnected, we
          return but don't invalidate the CEC address.

      	+ the actual status is that the display is connected, we setup
          the scrambler again if needed, and set the CEC address.

So in addition to your patch, a skeleton detect hook would be something lik=
e:

static int detect(struct drm_connector *connector, bool force)
{
	if (connector->force =3D=3D DRM_FORCE_OFF)
		return connector_status_disconnected;

	status =3D /* whatever is needed to fetch the status from the hardware */;

	if (status =3D=3D connector_status_disconnected) {
		if (connector->force =3D=3D DRM_FORCE_ON)
			return connector_status_connected;

		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
	}

	edid =3D drm_get_edid(...);
	cec_s_phys_addr_from_edid(..., edid);
	reset_scrambler();

	return status;
}

Does that make sense?
Maxime

--2rlhppz4ufp7gd3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9PYYgAKCRDj7w1vZxhR
xQnoAQC0sayvsPAfsDphABbx6OE2Cb4ruRzEy3nlzUu9PbJAiQEAwOKeeiNs+wQH
jtVm3dZG1ddVKo59YE8/Pbxsw0kR+g8=
=IHup
-----END PGP SIGNATURE-----

--2rlhppz4ufp7gd3u--
