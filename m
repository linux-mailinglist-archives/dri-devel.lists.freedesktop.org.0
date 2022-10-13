Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B25E5FD89B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D64310E20A;
	Thu, 13 Oct 2022 11:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C374E10E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:44:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 664435C017E;
 Thu, 13 Oct 2022 07:44:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 07:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665661469; x=1665747869; bh=B2UfjN5kNB
 l+GC1G7nfd7ii8etiSTiR1mN01GA/49vw=; b=kUavE2SV09dUeIXUCnle3NBBkH
 6P2RubK88JVTQnrensZWw7NmreUi6yDXTsJ1YZbMJIDuXdkme0HAcESCvsjl5hLJ
 cPFYQ3jBhVWpySeKOXC8wWs8seOtNWdQdF8M1XFp5Pwhd8TyftRuWWdOTv3S7DEm
 i7nSWOkBwnJgkhq/5Ofp18F6Enk5XtOLlZXhybq3TLJD5KYnXEaNor/QCS7zTsI0
 qNK9WCRkYSDPNnZ0eBoUqrS3TLfjdzgIbKjYOkB58noVo5Sj9htEo5mk1+R5yl0L
 oqw14SY8ODOfqR6OLsMSdX7I4bcexJP2RQdYgwT7TCn3OH6Hc8readWj1kYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665661469; x=1665747869; bh=B2UfjN5kNBl+GC1G7nfd7ii8etiS
 TiR1mN01GA/49vw=; b=jz6N66kICrz0fjG9g2GNX8ABmgXUc2kP1adG5gq/tXcS
 8CvJSxreXzV4tTVXDIyDv9uvFGc31wZxyivhx36x64Nu+5V5HmRv/RDe9IxXq4xm
 10BMDzDV1dWTS0to2jK/7lctq0VEoht7nD2JpGguS/gKZmiY2agHI38H21HA3a5e
 W1ZC5e6cUd+NBfJkQVEOVJeKBHcRdjCYOzaKmcJcHyHuGTiWQYZ2bT025owBs8pQ
 uUtG9KiLoibXDbVTjeHdvbnDq7i9CgVHJq3YJxthNt5wvCLPR2Sl7EuivGkIN4fe
 zvH/9IP5o8K/RamDGusxPyzS31Vk7jecIS1eGnTNTQ==
X-ME-Sender: <xms:HfpHY0TNZKW15XVclztjhVl8A7zOzZSXW7_RqWiex8nnGhg5GOIU3w>
 <xme:HfpHYxya_HYsxARH61MWxqBvKlzyZsXkfNzr8IeDi2gznCZkrL2h3fBJVWgofGwXP
 8RzfHH-ruuE-YXrs5I>
X-ME-Received: <xmr:HfpHYx0eM-3jIK-hRoQgoH5kk5l8ttPvFVQyhrtjD04uaDlsuKIxI_Rs_nEnxKAG8yWwoWqwsIpqbRkQIg6sSKkMvwDcnsvjw4LP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HfpHY4BMcRlhkIIRbNVdf1v2L8j771aWVYzBdQ94TOTCXue2_IPj6w>
 <xmx:HfpHY9hWPGJNjeHEz3yx54DILEojAa6UT-hvQu38DLQWJZu9zTHz_Q>
 <xmx:HfpHY0qmvek0zjkGs9zf8iuVUUz1YhCjbYNT7LeFjjsTUQ6i2FXyQQ>
 <xmx:HfpHY-XHCV08WupXeiwO5G_KmDeEZ7AVXhFN5oJEqlVq10--Zy_sKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 07:44:28 -0400 (EDT)
Date: Thu, 13 Oct 2022 13:44:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/vc4: Add module dependency on hdmi-codec
Message-ID: <20221013114426.qpqxv2hfcmsoxocl@houat>
References: <20220902144111.3424560-1-maxime@cerno.tech>
 <16437681-c38a-7b4a-a3b0-bc65d75a805d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nkujd4srdubh2yjm"
Content-Disposition: inline
In-Reply-To: <16437681-c38a-7b4a-a3b0-bc65d75a805d@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nkujd4srdubh2yjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Thanks for reviewing this

On Thu, Oct 13, 2022 at 11:27:15AM +0200, Javier Martinez Canillas wrote:
> On 9/2/22 16:41, Maxime Ripard wrote:
> > The VC4 HDMI controller driver relies on the HDMI codec ASoC driver. In
> > order to set it up properly, in vc4_hdmi_audio_init(), our HDMI driver
> > will register a device matching the HDMI codec driver, and then register
> > an ASoC card using that codec.
> >=20
> > However, if vc4 is compiled as a module, chances are that the hdmi-codec
> > driver will be too. In such a case, the module loader will have a very
> > narrow window to load the module between the device registration and the
> > card registration.
> >=20
> > If it fails to load the module in time, the card registration will fail
> > with EPROBE_DEFER, and we'll abort the audio initialisation,
> > unregistering the HDMI codec device in the process.
> >=20
> > The next time the bind callback will be run, it's likely that we end up
> > missing that window again, effectively preventing vc4 to probe entirely.
> >=20
> > In order to prevent this, we can create a soft dependency of the vc4
> > driver on the HDMI codec one so that we're sure the HDMI codec will be
> > loaded before the VC4 module is, and thus we'll never end up in the
> > previous situation.
> >=20
> > Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_dr=
v.c
> > index ffbbb454c9e8..2027063fdc30 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.c
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> > @@ -490,6 +490,7 @@ module_init(vc4_drm_register);
> >  module_exit(vc4_drm_unregister);
> > =20
> >  MODULE_ALIAS("platform:vc4-drm");
> > +MODULE_SOFTDEP("pre: snd-soc-hdmi-codec");
>=20
> While this will solve the issue, I'm not a big fan of the MODULE_SOFTDEP()
> macro to be honest. I always have the feeling that's fragile and something
> that may not be updated if for example a module name changes in the futur=
e.
>=20
> I wonder if instead the HDMI_CODEC_DRV_NAME platform device should not be
> registered earlier and in a place that's not cleaned up in the probe error
> path. For example in vc4_drm_register() instead of vc4_hdmi_audio_init().
>=20
> Granted, that would register the platform device even when HDMI isn't used
> which is disadvantage of doing it at vc4_hdmi_bind() time. But still, feel
> that is more robust to rely on the Linux device model than module softdep=
s.

Yeah, I wished we had something more robust.

Another complication stems from the fact that when we register that
device the codec ops are passed as platform_data, and we'll dereference
the device private data in those. If we do it in bind, it gets very easy
to dereference something that hasn't been allocated yet.

It will probably be NULL, but a NULL pointer dereference is already
pretty bad :)

Also, this "only" widens the window that the module loader has, but the
window is still there. MODULE_SOFTDEP, even though it relies on the name
is thus is fairly fragile, closes it entirely, for every module loading
situation (with or without udev in the system).

> Having said that, I don't have a strong opinion and this patch is correct
> and has been in the mailing list for a long time. So feel free to push it
> if you think is the correct approach to solve this:
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!
Maxime

--nkujd4srdubh2yjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0f6GgAKCRDj7w1vZxhR
xQzJAQDcOZabGf5WuMCKZ5SyJhqeWbPeSizQalNCu14l/OM/zwD/S4MLWEiA8L8R
T9Lg1LTkeqRzbm7kXTZxWwqPTm09jQk=
=mlou
-----END PGP SIGNATURE-----

--nkujd4srdubh2yjm--
