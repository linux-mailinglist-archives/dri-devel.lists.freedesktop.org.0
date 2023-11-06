Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2437E1BA9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 09:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4BF10E27C;
	Mon,  6 Nov 2023 08:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D150410E27C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 08:06:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 79DA8CE0AE3;
 Mon,  6 Nov 2023 08:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A2DC433C7;
 Mon,  6 Nov 2023 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699258003;
 bh=Whd5oMeK1I9z/RUheGQ8JiStxsgf9qTYIkZSz85OYdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PNdxyDS3jworj1+C0NH2REiaGfzncqug8QtE6qfBuuUIVF8DSAPW/gJmDozHtomCa
 gMo9aGUD6TEcDQp610EUrhWJZnMx/QVRPkCRoy9JLgmkuNSpItEaOFwdrusQQn8Y4m
 SC9zIcjtG2MD5oh+KFoH/2SvdULeQHPtZ/DIPtp9J28OPmZ3wqLnNUUsg+KkvmEaLa
 ljyebD1W8HLi4uOB51GNcTAqxdiV1Du+uQ7FQeeJsagrF+t/saZwBfE4siAaP/IV9H
 10ZgVLZRE5+dNlDjzlm4yMh1OW0GlpGkbQp5xIqbMQxZfI9j/A3vl/Mwl4vCU2h4hL
 PURoXRQv7gq1g==
Date: Mon, 6 Nov 2023 09:06:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
Message-ID: <ze5xz52jt4helttcmntzmr6fr4ohu7wtslywalbxc4w7w6uvly@nwweqyyl4wf2>
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
 <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
 <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p2nzhnzkeentgd7g"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p2nzhnzkeentgd7g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 07:33:48AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Nov 1, 2023 at 11:31=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 1 Nov 2023 at 23:26, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > If a non generic edp-panel is under aux-bus, the mode read from edid =
would
> > > still be selected as preferred and results in multiple preferred mode=
s,
> > > which is ambiguous.
> > >
> > > If a hard-coded mode is present, unset the preferred bit of the modes=
 read
> > > from edid.
> >
> > Can we skip the EDID completely if the hardcoded override is present?
>=20
> Yeah, I wondered about that too. The blending of the hardcoded with
> the EDID predates my involvement with the driver. You can see even as
> of commit 280921de7241 ("drm/panel: Add simple panel support") that
> the driver would start with the EDID modes (if it had them) and then
> go onto add the hardcoded modes. At least for eDP panels, though,
> nobody (or almost nobody?) actually provided panel-simple a DDC bus at
> the same time it was given a hardcoded panel.
>=20
> I guess I could go either way, but I have a slight bias to adding the
> extra modes and just making it clear to userspace that none of them
> are "preferred". That seems like it would give userspace the most
> flexibility

I disagree. "Flexibility" here just means "the way to shoot itself in
the foot without knowing it's aiming at its foot".

If a mode is broken, we shouldn't expose it, just like we don't for all
modes that require a maximum frequency higher than what the controller
can provide on HDMI for example.

> and also is closer to what we've historically done (though,
> historically, we just allowed there to be more than one "preferred"
> mode).

I have no idea what history you're referring to here

> One thing we definitely want to do, though, is to still expose the
> EDID to userspace even if we're using a hardcoded mode. I believe
> that, at least on ChromeOS, there are some tools that look at the EDID
> directly for some reason or another.

If the EDID is known to be broken and unreliable, what's the point?

Maxime

--p2nzhnzkeentgd7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUiekQAKCRDj7w1vZxhR
xR1VAQCofZ+KM2NOqwhY9yNFvg4GhfbYs4dwJhQgF3RshcktIgD9Ehj8YqDSWbBH
P1yONCZAX6hgfJfa9PsZWOv8UxAyPg8=
=L+kT
-----END PGP SIGNATURE-----

--p2nzhnzkeentgd7g--
