Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C984A3A1BC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 16:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4210E0D9;
	Tue, 18 Feb 2025 15:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K/Bfy9y9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9610E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 15:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 502FB5C601B;
 Tue, 18 Feb 2025 15:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E116BC4CEE7;
 Tue, 18 Feb 2025 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739893976;
 bh=Lfy3wqOCBbjxg5nNsnZbpi/kGngbJgptpe7heB+ZnUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/Bfy9y9GvvUCCcinsoy9LUwBfEUgAY7EsZTD9cvt7fqLwcGpXMHwq4sY1UkKTiHA
 IOt9JnV9XpERQg1rywCHuIE/vKBfkunfNpS2djpqLBoeaWRBh82U2QDKTxMXc5B3mW
 Q7oy9UqlgveAwOrkGE7vXiyle+mv0YX9s6/N09vGh7dV3Jl/AWWMHMqnJR/ahHeUYh
 9j65F3nRQ+eXHK0PEvPrVMs4kxW3alnNZmbi8qYdZ4e3nfzVCHwWX4+dvGPppnO1Pg
 MGHv+gjZMUjMjMXQHR+80vhf+4tJgvipE+ZYMIIwE5TWaglnES8eB/VpltrIsFNI+p
 NRSYrXILM7zqg==
Date: Tue, 18 Feb 2025 16:52:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, 
 Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>,
 Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Jianhua Lu <lujianhua000@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
Message-ID: <20250218-primitive-kickass-seagull-008bf2@houat>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
 <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fpteilqt6emhj7js"
Content-Disposition: inline
In-Reply-To: <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
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


--fpteilqt6emhj7js
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 02:14:43PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > > Hi,
> > >=20
> > > On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Srivatsa <asrivats@re=
dhat.com> wrote:
> > > >
> > > > A lot of mipi API are deprecated and have a _multi() variant
> > > > which is the preferred way forward. This covers  TODO in the
> > > > gpu Documentation:[1]
> > > >
> > > > An incomplete effort was made in the previous version
> > > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> > > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > > replacemts and not the rest of the API.
> > >=20
> > > You didn't seem to take most of the suggestions I gave in response to
> > > your v1 [3]. Specifically:
> > >=20
> > > a) I asked that you CC Tejas. I've added him again.
> > >=20
> > > b) I asked that you CC me on the whole patch series, which you didn't
> > > do. I can find them, but I'd find it convenient in this case for them
> > > to be in my Inbox.
> > >=20
> > > The first patch conflicts with what Tejas already landed in
> > > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
> > > second patch _also_ conflicts with what Tejas already landed. See
> > > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > > mipi_dsi wrapped functions"). Later patches also also conflict. See
> > > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
> > > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > > functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
> > > transition to mipi_dsi wrapped functions"). Maybe you should sync up
> > > with drm-misc-next before submitting.
> >=20
> > Yes, you should definitely work from drm-misc-next there, and sync with
> > Tejas.
> >=20
> > > I also questioned whether this really made sense to try to do with a
> > > Coccinelle script and I still don't think so. It looks like Dmitry has
> > > already reviewed the first few of your patches and has repeated my
> > > advice. If you want to help with the effort of addressing this TODO
> > > item then that's great, but I'll stop reviewing (and start silently
> > > deleting) any future submissions of yours that say that they're done
> > > entirely with a Coccinelle script unless you address this point and
> > > convince me that your Coccinelle script is really smart enough to
> > > handle all the corner cases. I'll also assert that you should review
> > > Tejas's submissions to see how these conversions are expected to go.
> >=20
> > I couldn't find that in your first answer though. What corner cases do
> > you have in mind, and why do you think coccinelle can't handle them?
>=20
> As can be seen from the reviews:
>=20
> - sleeps between DSI calls
> - properly propagating the error at the end of the function

These two are legitimate feedback, but I don't see how coccinelle cannot
deal with them.

> - making decision whether to create the context at the caller or the
>   callee side. E.g. in patch 8 it is better to allocate context in
>   hx8394_enable() and pass it to .init_sequence() instead of keeping
>   some of error handling.

Yeah, that one is definitely subjective, and is going to need manual
review.

Maxime

--fpteilqt6emhj7js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7Ss0QAKCRAnX84Zoj2+
dukDAYDXcF39vpxiWmY6ypqgL/3oHzXWyDI/hPJjKLqlSm/RBJvFdXWqH7cTvsJF
BGl9h0kBgJTBJ0vvu/UwpgZ/UyHD1S710s4lhY5YyyHuho6JwZzsb+tXPmRgz5E1
/h560Q3h1w==
=9vo/
-----END PGP SIGNATURE-----

--fpteilqt6emhj7js--
