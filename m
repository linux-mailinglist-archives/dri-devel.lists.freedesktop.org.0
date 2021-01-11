Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DB2F2962
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E7F6E071;
	Tue, 12 Jan 2021 07:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB26289DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 10:29:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38316580557;
 Mon, 11 Jan 2021 05:29:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 05:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=YZXFEHRVUr3V+AEbjPO03cseRYi
 /P0yN90ljuM26SGI=; b=MRgfIkzwwXAu8YfCHoQ23fXhAzYEI29Nf/Newf90lt9
 xVdtsC7h/rt87eTugQSjxfJkxPhZy0/Ug7u6hMuKvPjWWhlFU62OXQ/cwZZPqMjB
 NAR8i0JhzqMMNBr0LQx1xnWUJPmUU6ULnDizMLBXGkaa6FMn2g4QBjfNUTMMRbsH
 zYggJ08uwk48zQ6o6r6KSUQhsDJ7O6rBhsgsitoAsdVaWCtflmpgCgnxngKoirfE
 LveMTcaN8w1svFThFcPUvhOKfyNxT1ziOwJR/7730PKOKOD16ulPGMydoFZn/dT3
 ObLWe316nk0qoxQ3SGbSzdb8orEf2w+5FhmHsDS72vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YZXFEH
 RVUr3V+AEbjPO03cseRYi/P0yN90ljuM26SGI=; b=I4Hkn+41HffOpUEiy9af3c
 St7n4vY8+LuugawTrAwKqLHS1+BVr+Ml5AIRJKyE4ulz0epWl+FPUs5ot7X+j6Ov
 XAxfSvZrpA07TrPIPh4nKMG1iHZx0h8D9rfeyLzWnFBA5DYI2ta+lj8MMvfAaar/
 9wZvWTP9wu41C5B/F9b/61/4LmIjQX75Q0LJNIHqUPDajtuOhh6uOxhd0kncR2hP
 9um+9IiNbz+JEMDVA4HmYvItB8p11z0qpHloH9eoyVHZQSg192iqrKUbS7ats7eA
 R46o0Z1V3s9O9YHa0FcUj0zLbXJJARegBeYHj/C6cZA3DNRl6mHJgQIicwnxeFug
 ==
X-ME-Sender: <xms:kCj8X1Pjk2mQHJ3XOOMuSyDaB_SkdxRvbCLrDy3bsAHr1IIXT0WKhg>
 <xme:kCj8X394rqTxn-a4ddXbDUY86jVNYfpAH9vlK5h3whgQ7KXRln__nAQJ-RTNv9s4p
 2jqo8iCojUGyVh9k-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kCj8X0TA_wzjXnj3pznTY2K--tRVZ1CVTUXTNhcvga7U2HO17zPJ6A>
 <xmx:kCj8XxthNcsAk7rQsnk3V2rPg5vA2wGnfk7hWxcPzmVv4cwPM9Uk3Q>
 <xmx:kCj8X9deIKY-oDyMz6WS77NJFUCJzQF5LxsMtI9bDsPsMV2RNZsQjA>
 <xmx:kij8X9-gaF_E0K2Yqq0uuPrjCB8wkZVZM7YvN2Gi8z0a9r-vwnCSkw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CD5624005B;
 Mon, 11 Jan 2021 05:29:36 -0500 (EST)
Date: Mon, 11 Jan 2021 11:29:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 05/15] drm/vc4: hdmi: Restore cec physical address on
 reconnect
Message-ID: <20210111102935.tyairu2pw2phfmfo@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-6-maxime@cerno.tech>
 <CAPY8ntDXJWR-vssSLsRbh7RTd-40SQApOxWGwt2LkeoyxCdYMw@mail.gmail.com>
 <CAPY8ntAx56BhKLVGyNUjjOYSaaJ1H2wku=Co8oqb38bPDEvGKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAx56BhKLVGyNUjjOYSaaJ1H2wku=Co8oqb38bPDEvGKA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>,
 Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0157028669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0157028669==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qmysxmbkp2dmwhyb"
Content-Disposition: inline


--qmysxmbkp2dmwhyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thanks for your review

On Fri, Dec 18, 2020 at 02:45:54PM +0000, Dave Stevenson wrote:
> On Fri, 18 Dec 2020 at 14:21, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi  Maxime & Dom
> >
> > On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > From: Dom Cobley <popcornmix@gmail.com>
> > >
> > > Currently we call cec_phys_addr_invalidate on a hotplug deassert.
> > > That may be due to a TV power cycling, or an AVR being switched
> > > on (and switching edid).
> > >
> > > This makes CEC unusable since our controller wouldn't have a physical
> > > address anymore.
> > >
> > > Set it back up again on the hotplug assert.
> > >
> > > Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
> > > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++--------
> > >  1 file changed, 17 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index 28b78ea885ea..eff3bac562c6 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -136,20 +136,29 @@ static enum drm_connector_status
> > >  vc4_hdmi_connector_detect(struct drm_connector *connector, bool forc=
e)
> > >  {
> > >         struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector=
);
> > > +       bool connected =3D false;
> > >
> > >         if (vc4_hdmi->hpd_gpio) {
> > >                 if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
> > >                     vc4_hdmi->hpd_active_low)
> > > -                       return connector_status_connected;
> > > -               cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> > > -               return connector_status_disconnected;
> > > -       }
> > > -
> > > -       if (drm_probe_ddc(vc4_hdmi->ddc))
> > > -               return connector_status_connected;
> > > -
> > > +                       connected =3D true;
> > > +       } else if (drm_probe_ddc(vc4_hdmi->ddc))
> > > +               connected =3D true;
> > >         if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
> >
> > This needs to become an "else if(...".
> > It used to be that all the other paths would return, so were mutually
> > exclusive to this. Now they set a thing and keep going we need to
> > avoid reading the register should there be a HPD gpio or the ddc probe
> > succeeds.
> > Memory says that otherwise Pi3 always reports connected.
> >
> > I fixed this in a downstream patch already -
> > https://github.com/raspberrypi/linux/commit/d345caec1e9b2317b9cd7eb5b92=
ae453a0d3e98c
> >
> > Otherwise fine.
> >
> >   Dave
> >
> > > +               connected =3D true;
> > > +       if (connected) {
> > > +               if (connector->status !=3D connector_status_connected=
) {
> > > +                       struct edid *edid =3D drm_get_edid(connector,=
 vc4_hdmi->ddc);
> > > +
> > > +                       if (edid) {
> > > +                               cec_s_phys_addr_from_edid(vc4_hdmi->c=
ec_adap, edid);
> > > +                               vc4_hdmi->encoder.hdmi_monitor =3D dr=
m_detect_hdmi_monitor(edid);
> > > +                               drm_connector_update_edid_property(co=
nnector, edid);
>=20
> Actually looking at this again in the context of the other changes, do
> we need to call drm_connector_update_edid_property() here?
>=20
> We've just called drm_get_edid() to get the edid, and that calls
> drm_connector_update_edid_property() as well [1]

Yeah, you're right I'll drop it

> Updating vc4_hdmi->encoder.hdmi_monitor may be necessary. It's
> otherwise done in vc4_hdmi_connector_get_modes, which I sort of expect
> to be called almost immediately by the framework when connector_detect
> returns "connected". I haven't checked if that is guaranteed though.
>=20
> vc4_hdmi_connector_get_modes also includes a manual call to
> drm_connector_update_edid_property after having just called
> drm_get_edid, so that one feels redundant too.

=2Eget_modes is called in drm_helper_probe_single_connector_modes, which
is usually the helper set in .fill_modes. .fill_modes seems to only be
called when either DRM_IOCTL_MODE_GETCONNECTOR is called, or when the
connector status is forced through sysfs, so it doesn't look like it's
done automatically.

I'm not sure we need to set hdmi_monitor though, it's only used to
configure the display related side, and that can't happen without
get_modes being called.

Maxime

--qmysxmbkp2dmwhyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/wojwAKCRDj7w1vZxhR
xc/UAP4uzcrDbeddwq8fB/meHTS+faUCJJfFGqyserLZSOQPawD+PaA4lSzVPlU4
Xk3OPdAtdOnLKH0IHfvlFUdE8CeZSAc=
=GJnj
-----END PGP SIGNATURE-----

--qmysxmbkp2dmwhyb--

--===============0157028669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0157028669==--
