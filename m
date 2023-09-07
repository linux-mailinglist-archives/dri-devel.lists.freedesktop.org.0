Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA67972FB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6510E7E7;
	Thu,  7 Sep 2023 14:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3210E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 14:15:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40B9F61222;
 Thu,  7 Sep 2023 14:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D9BC4AF5D;
 Thu,  7 Sep 2023 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694096101;
 bh=+tT7zdwguVER3/BCqqTMECMwPPDZhdc/saZPpjtcvGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ar0Hs+WddQoVJEwrOxmgzc22NLAc54TEV00cmBOEkw+MNDbZMeiIVGU8tvki61W+W
 2lmbjjq0kLh4HFX4AQONtV8vKyVR3UTccMegJXx3O3mVcliM0EgrFCL7yw6/cSYH9D
 VrGQuKvpFJOwFqDjQgbDMP28EhkBoGPR9fdYP2ahvfF0iOtEHOgGiZnlRh06Rn0Obi
 pU6RGdF0PFnZbt2mqoP0MLMywziOH2ddoIXv6d6G9CdmBMCy6OLLvDm0xGodN8BYZQ
 /buAW7gmSfLrrURYdS3ay07xrF8894XjcYxH2IERpEmw4V5Pe77Ggm7K5i4zeNhG6D
 iT+SXFuyGrXqg==
Date: Thu, 7 Sep 2023 16:14:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <xtyiu2i2m2xokxfrgwocdcw4sy2oreszgwczmbnfvp4kbmrdvb@vr5huyfhmmmh>
References: <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
 <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
 <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qhek4xcd5nd2zhxz"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qhek4xcd5nd2zhxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:45:49AM -0700, Doug Anderson wrote:
> > > In any case, I don't think there's any need to switch this to
> > > refcounting as part of this effort. Someone could, in theory, do it as
> > > a separate patch series.
> >
> > I'm sorry, but I'll insist on getting a solution that will warn panels
> > that call drm_atomic_helper_shutdown or drm_panel_disable/unprepare by
> > hand. It doesn't have to be refcounting though if you have a better idea
> > in mind.
>=20
> As per above, I think this already happens with the boolean? Won't you
> see an error message like this:
>=20
> dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
>=20
> ...from drm_panel_unprepare()

Urgh. I missed that part, sorry for dragging you into that refcounting
discussion then.

> > > > > The above solves the problem with panels wanting to power sequence
> > > > > themselves at remove() time, but not at shutdown() time. Thus we'd
> > > > > still have a dependency on having all drivers use
> > > > > drm_atomic_helper_shutdown() so that work becomes a dependency.
> > > >
> > > > Does it? I think it can be done in parallel?
> > >
> > > I don't think it can be in parallel. While it makes sense for panels
> > > to call drm_panel_remove() at remove time, it doesn't make sense for
> > > them to call it at shutdown time. That means that the trick of having
> > > the panel get powered off in drm_panel_remove() won't help for
> > > shutdown. For shutdown, which IMO is the more important case, we need
> > > to wait until all drm drivers call drm_atomic_helper_shutdown()
> > > properly.
> >
> > Right, my point was more that drivers that already don't disable the
> > panel in their shutdown implementation will still not do it. And drivers
> > that do will still do it, so there's no regression.
> >
> > We obviously want to tend to having all drivers call
> > drm_atomic_helper_shutdown(), but not having it will not introduce any
> > regression.
>=20
> I'm still confused here too. The next patch in this patch series here
> that we're talking about is:
>=20
> https://lore.kernel.org/dri-devel/20230804140605.RFC.5.Icc3238e91bc726d4b=
04c51a4acf67f001ec453d7@changeid/
>=20
> Let's look at an arbitrary concrete part of that patch: the
> modification to "panel-tdo-tl070wsh30.c". For that panel, my RFC patch
> removed the tracking of "prepared" and and then did this:
>=20
> @@ -220,16 +209,14 @@ static void tdo_tl070wsh30_panel_remove(struct
> mipi_dsi_device *dsi)
>   dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
>=20
>   drm_panel_remove(&tdo_tl070wsh30->base);
> - drm_panel_disable(&tdo_tl070wsh30->base);
> - drm_panel_unprepare(&tdo_tl070wsh30->base);
> + drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
>  }
>=20
>  static void tdo_tl070wsh30_panel_shutdown(struct mipi_dsi_device *dsi)
>  {
>   struct tdo_tl070wsh30_panel *tdo_tl070wsh30 =3D mipi_dsi_get_drvdata(ds=
i);
>=20
> - drm_panel_disable(&tdo_tl070wsh30->base);
> - drm_panel_unprepare(&tdo_tl070wsh30->base);
> + drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
>  }
>=20
> As per our discussion, the plan is to send a V2 of my patch series
> where I _don't_ create the call drm_panel_helper_shutdown() and thus I
> won't call it. That means that the V2 of the patch for
> "panel-tdo-tl070wsh30.c" will remove the calls to drm_panel_disable()
> and drm_panel_unprepare() and not replace them with anything.

Right, that's what we should do.

> As per our discussion, in V2 we will make drm_panel_remove() actually
> unprepare / disable a panel if it was left enabled. This would
> essentially fold in the drm_panel_helper_shutdown() from my RFC patch.
> This would make tdo_tl070wsh30_panel_remove() behave the same as it
> did before.

Not really? You would get a warning from drm_panel_remove(), but our
discussion very much implied still disabling it...

> Ugh, though I may have to think about this more when I get to
> implementation since I don't think there's a guarantee of the ordering
> of shutdown calls between the DRM driver and the panel. Anyway,
> something to discuss later.
>=20
> However... tdo_tl070wsh30_panel_shutdown() will no longer power the
> panel off properly _unless_ the main DRM driver properly calls
> drm_atomic_helper_shutdown().

=2E.. with the expectation that all KMS drivers should call
drm_atomic_helper_shutdown() anyway (thanks to your other series) and
thus we wouldn't trigger that remove warning anyway.

> Did I get anything above incorrect? Assuming I got it correct, that
> means that our choices are:
>=20
> a) Block landing the change to "panel-tdo-tl070wsh30.c" until after
> all drivers properly call drm_atomic_helper_shutdown().

I don't think we care about all drivers here. Only the driver it's
enabled with would be a blocker. Like, let's say sun4i hasn't been
converted but that panel is only used with rockchip anyway, we don't
really care that sun4i shutdown patch hasn't been merged (yet).

> b) Add a hacky call to drm_panel_remove() in
> tdo_tl070wsh30_panel_shutdown() to get the old behavior. This would
> work, but IMO it's ugly and I'm pretty strongly against it.

Yeah, it's ugly.

> c) Ignore the regression and just say that this panel won't get power
> sequenced properly until its DRM driver is updated. I'm strongly
> against this.

That would work too, but the first one looks like the best trade-off to
me.

Maxime

--qhek4xcd5nd2zhxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPna4gAKCRDj7w1vZxhR
xScvAP9bk+iZMjn57Hy/+ltFy69NtWKixNapI2YW+5e7YNIjBgD9E8RB/vtZvmv4
Ub2ivigzUNFQmjDopCvQDbov647MHAE=
=nWwr
-----END PGP SIGNATURE-----

--qhek4xcd5nd2zhxz--
