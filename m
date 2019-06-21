Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE64E34A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F9C6E84D;
	Fri, 21 Jun 2019 09:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEBB6E84D;
 Fri, 21 Jun 2019 09:19:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so5794036wmj.5;
 Fri, 21 Jun 2019 02:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uqOVQTxmNExiORglBPUYXCzHT8Z+/V19PnzivbaHVFg=;
 b=c5e1qrAl+s6q6CL1OTMqo7i4iGBAStBqrF1tTMxZjoYNgFRQdi3mQ7Nj/gt2Apa9Ca
 tKkoK4EtFwEDQA2D999G+8wELhiHSlxOiSxGc1F60YSVFs7iRkrgHjiwfvegvfDyyoFI
 XSrqlqWoKiLCP45zHupn6qddoFvlEeMtk2Nl1rqQtgyV4KpqP9wTeOxB9ehduDf0RseE
 62mt5PXTa9WzLMPlCvwTh21QMaHCnVW3NM9rHJtyZYdSVvfQsBrEmf7iYg/IlGZS+arh
 nUqmjPSJyeJvczeM0v8qK8+0m7AFdrwBgO4/vl00U6ldYS7Kp8ok3gCGbldacgkwSriu
 LkSw==
X-Gm-Message-State: APjAAAUz/3SpG2szT5Es1whl9w8rfW9jMehlUtag8c4OXhsPmhe8AnFO
 cWcbixStGEFhf7l/mBsstKU=
X-Google-Smtp-Source: APXvYqyqeaEKJauyN71saFZvZTDk0qi91ACjIQXrzW5Yfpqp1okzyBsUv4pQHA0207ShjTomFKY7Lw==
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr3294210wma.105.1561108771060; 
 Fri, 21 Jun 2019 02:19:31 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id r12sm1761771wrt.95.2019.06.21.02.19.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 02:19:30 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:19:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH 3/5] drm/panel: Add attach/detach callbacks
Message-ID: <20190621091928.GA11839@ulmo>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-4-dbasehore@chromium.org>
 <20190611085722.GX21222@phenom.ffwll.local>
 <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uqOVQTxmNExiORglBPUYXCzHT8Z+/V19PnzivbaHVFg=;
 b=AtY+EMm+8qKifhQvPhh0SzfwY8M40OwmQaZCjKlTFlON5z0akSBcx0Fj8962OPK3ax
 qSeCVT1pZ7yHTxx1zUODdIkRlJf0v2QfrzZ0vXrWHmop2DQLKfQxfTbLBOBUC3Fxovef
 hDWBmtqxaYo6hkz7FeuQGR9PkIz/Zg6AGkClzwe+5erBgT7hzbe60jJOYiN54ZTgWgFU
 IpuQhCE6lGLTOnsgqCJda4W/R3IpPzppR+Jz8j05S+TyH4UcgUcxA+vs3ci829X4uaaC
 UJKoOhqFMxgLLlRlQN2h2ZniFUDim5S9N8yK6CW5Ff2EI0fqFEnV3fTcbrlZl1Xf0ebw
 7e5Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1152610530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1152610530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 05:25:47PM -0700, dbasehore . wrote:
> On Tue, Jun 11, 2019 at 1:57 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jun 10, 2019 at 09:03:48PM -0700, Derek Basehore wrote:
> > > This adds the attach/detach callbacks. These are for setting up
> > > internal state for the connector/panel pair that can't be done at
> > > probe (since the connector doesn't exist) and which don't need to be
> > > repeatedly done for every get/modes, prepare, or enable callback.
> > > Values such as the panel orientation, and display size can be filled
> > > in for the connector.
> > >
> > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_panel.c | 14 ++++++++++++++
> > >  include/drm/drm_panel.h     |  4 ++++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index 3b689ce4a51a..72f67678d9d5 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -104,12 +104,23 @@ EXPORT_SYMBOL(drm_panel_remove);
> > >   */
> > >  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *=
connector)
> > >  {
> > > +     int ret;
> > > +
> > >       if (panel->connector)
> > >               return -EBUSY;
> > >
> > >       panel->connector =3D connector;
> > >       panel->drm =3D connector->dev;
> > >
> > > +     if (panel->funcs->attach) {
> > > +             ret =3D panel->funcs->attach(panel);
> > > +             if (ret < 0) {
> > > +                     panel->connector =3D NULL;
> > > +                     panel->drm =3D NULL;
> > > +                     return ret;
> > > +             }
> > > +     }
> >
> > Why can't we just implement this in the drm helpers for everyone, by e.=
g.
> > storing a dt node in drm_panel? Feels a bit overkill to have these new
> > hooks here.
> >
> > Also, my understanding is that this dt stuff is supposed to be
> > standardized, so this should work.
>=20
> So do you want all of this information added to the drm_panel struct?
> If we do that, we don't necessarily even need the drm helper function.
> We could just copy the values over here in the drm_panel_attach
> function (and clear them in drm_panel_detach).

Yeah, I think we should have all this extra information in the struct
drm_panel. However, I think we need to more carefully split things such
that the DT parsing happens at panel probe time. That way we can catch
errors in DT, or missing entries/resources when we can still do
something about it.

If we start parsing DT and encounter failures, it's going to be very
confusing if that's at panel attach time where code will usually just
assume that everything is already validated and can't fail anymore.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0MoR0ACgkQ3SOs138+
s6HqSA/+K8hfGyhC4XmLpKlVudKyrd41RyGRD7AunVOl6aE/CaukHevacdCPSUtk
d/jaIe1fC3ImLE/uIZQDQBsBL3JzwrJHo0RVxijTJ7P9X1jrMR1ynK5sOWW0dPxR
Sd87iKVNNu0Rl8CxAYzucxHrr2Up2W6uT02H0Lbxk+idIWKixRrPbUAVCMpFHTyr
MbaVLkRd1sOEqLzetlU7HoUCx3wKgWdQgeRllgTDYgGutEQWnizljTrTglT0IAeQ
U2LAykWBhhM4LBxYoEcdfOnosYQpKrg9suaNHNXknN+KEB5lnt/UbWCi5poLg1P4
vyXMGFN8GwXXRNEKP0hYKGlLTzM19i3g9FRXAzeKv1hxmYhdG6S3dnzX22TG75No
g0mUT2aFCEImAtMtQaCsucDHAnU/+YfmTekla4NxZo2UdOh0GYyKTaZ8OKsaETu+
Hb+l76/ebe16vU+nJUYzKF5i/T+UlplLKLLGF8ivNBDSbWDD4l5Gh+hec2akFAVd
U/CvEE85FyPaUIM9rTztStgICDwaxJNk62apvYouCkIIHOR3QVlgkxvk6DM6O5/c
AjfC0dJqHvnx1HYiD0Sz65SeWArm/ujA1tcNZAFKLtPN2P5CHo6b2P2C1DfclkCw
HBVMLmjbClz3caQjKmTvXk9YSnSSZBejdPW6zptywAik+UBj2r0=
=ph6O
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--

--===============1152610530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1152610530==--
