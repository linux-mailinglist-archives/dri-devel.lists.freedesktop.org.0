Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE13F83B7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 10:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BA96E560;
	Thu, 26 Aug 2021 08:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACC16E544;
 Thu, 26 Aug 2021 08:24:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 62AA75C024B;
 Thu, 26 Aug 2021 04:24:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 26 Aug 2021 04:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=9kPdsSoJLmJ4YEa3S6wPUCOUzrW
 YgacuCGBwDMsOsMA=; b=AmAWYeAeAWZik9HZ77q0Sjr2RkFIELPRak/6lAdq8Wt
 TGPM7RaV8Di7yGi8R6g66fOgDWBjjHWxRdN27njMlJISqAPPGOLnOCglo1+lCSAm
 BNTpaPpNvl42gDOZcdS18+IHh11PgubQtyY8/HQLIgMk5cWk8MOENPMeqZpJZ016
 lCDj87d65qPcQm0RXp4EvfSpgThl8DFpdn86e7kG1RriGOso0S2ltfA0gWjQ8V3G
 LQjp4CE3CrZnvCAzS79nNOXKC1/WGR6rcHn9SZqEPv5rtHQK/6uKUBk9Mgflhqop
 DWxSNURncH4d5YtNwisjBjK1nmxtwC+eqXzAdm+jcpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9kPdsS
 oJLmJ4YEa3S6wPUCOUzrWYgacuCGBwDMsOsMA=; b=thBFqMr6gVSg6a8vSYi1Ip
 1o6RESodbjxyuI5GlH8LPoFx/GnNW7L5jR1WIFnHPPh6jWCJ/JOrb8tnWigNeY/+
 TJzjz268hGVQ+wmulhpvpgsXeM54rHQaihdKUv6R4hyx6h6kVG5/zEQEHXoq8DpO
 G+1dT6fI8zQjGQPUzfYOt1CN9CTvpkIx4TEKT0UkEUvWKTC10X7gxjZoUtmZsTVu
 3IZYno/1M92EuUZ2apLBR4gMm2r1w5iamclI9II44AYuhNYhA2NYFZ3gMQeCye/1
 GfAtkPv3OYvMB7WXNK+/mBgpD+QmbloMBDYDXaP3zP+6d9XluhgWOzF2Kk1PDhDQ
 ==
X-ME-Sender: <xms:n08nYWSGiRfcVF4b17XbglVuDej0y-7o7rsPLrHwgaXlc_axV0lK1A>
 <xme:n08nYbwscnhvRLZTPALikBHHpwQXIQkVZb3f4gZKxWb-2IjW2UI7rjC72ZzyFi8M5
 D4-5N0uaNRReHW1Tlg>
X-ME-Received: <xmr:n08nYT1MfhmLiWPZSFHP_TvCle0NXhA0zUFmLS7BEvv4UXl08u68gEhpBY9FT9Pz9zCVW25eqoaC6-_JU3L_lUey-d7HccIbeuWp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduuddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:oE8nYSCwZMYrH4K5DJs-XG5xYGy0ucdHk0X5O8Zy5jPpJdYs6ZcqWg>
 <xmx:oE8nYfiB30j8e-kDsgrBOdBR512HDHMMr2uh1S4S6-dsJ_OuhwiNqQ>
 <xmx:oE8nYerCdTe1HmO2cING9Fztshz9bL6_eP5LIxjT4hdb8UxUOIUqbQ>
 <xmx:ok8nYQW-_BiA3w2qVfwB0dieFytgiicrq7gNF3wWev7iKmri6u988A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 04:23:59 -0400 (EDT)
Date: Thu, 26 Aug 2021 10:23:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
Message-ID: <20210826082357.xttccb5thrv2eo2e@gilmour>
References: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
 <871r6jgrin.fsf@intel.com>
 <15400f71-dfe6-3142-d191-596ef9af7e7a@redhat.com>
 <b24d3733d0b0c79fa6fce4f4e696b0c3a338469a.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nqtspzy4ohcif3xd"
Content-Disposition: inline
In-Reply-To: <b24d3733d0b0c79fa6fce4f4e696b0c3a338469a.camel@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nqtspzy4ohcif3xd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 04:03:43PM +0000, Vivi, Rodrigo wrote:
> On Tue, 2021-08-24 at 18:48 +0200, Hans de Goede wrote:
> > Hi,
> >=20
> > On 8/24/21 10:45 AM, Jani Nikula wrote:
> > > On Fri, 20 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> > > > Hello drm-misc and drm-intel maintainers,
> > > >=20
> > > > My "Add support for out-of-band hotplug notification" patchset:
> > > > https://patchwork.freedesktop.org/series/93763/
> > > >=20
> > > > Is ready for merging now, as discussed on IRC I based this series
> > > > on top drm-tip and when trying to apply the i915 parts on top
> > > > of drm-misc this fails due to conflict.
> > > >=20
> > > > So as Jani suggested here is a pull-req for a topic-branch with
> > > > the
> > > > entire set, minus the troublesome i915 bits. Once this has been
> > > > merged
> > > > into both drm-misc-next and drm-intel-next I can push the 2 i915
> > > > patch do drm-intel-next on top of the merge.
> > > >=20
> > > > Note there are also 2 drivers/usb/typec patches in here these
> > > > have Greg KH's Reviewed-by for merging through the drm tree,
> > > > Since this USB code does not change all that much. I also checked
> > > > and the drm-misc-next-2021-08-12 base of this tree contains the
> > > > same last commit to the modified file as usb-next.
> > > >=20
> > > > Daniel Vetter mentioned on IRC that it might be better for you to
> > > > simply
> > > > pick-up the series directly from patchwork, that is fine too in
> > > > that
> > > > case don't forget to add:
> > > >=20
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > >=20
> > > > To the entire series (given in a reply to the cover-letter)
> > > >=20
> > > > And:
> > > >=20
> > > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >=20
> > > > To the usb/typec patches (patch 7/8), this was given in reply
> > > > to a previous posting of the series and I forgot to add this
> > > > in the resend.
> > >=20
> > > Since this is mostly touching drm core, I think it should be merged
> > > to
> > > drm-misc-next first, and drm-intel-next after. Please let us know.
> >=20
> > I agree this should go to drm-misc-next first.
> >=20
> > (I was planning on pushing this to drm-misc-next myself,
> > but then ended up going with the topic branch because of the
> > conflict in the i915 bits.)
>=20
> Just to be clear and avoid confusion: This pull request does apply
> cleanly on drm-misc-next nd drm-intel-next right now.
>=20
> I'm just waiting for drm-misc-next maintainers to pull this to drm-
> misc-next so I can pull it to drm-intel-next.
>=20
> Maxime, is that your round now?
> or Thomas?

That's me, I just pushed it to drm-misc-next

Thanks!
Maxime

--nqtspzy4ohcif3xd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYSdPnQAKCRDj7w1vZxhR
xeHLAP933LyJx7+i8gE0tFrZUucUOR7CL9sGEMdw2BNhTI8svAD+LmYFP2fyFjfX
Fhi6sNYy0uf8ipGpmpbk7FmSPnNbegc=
=86wS
-----END PGP SIGNATURE-----

--nqtspzy4ohcif3xd--
