Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1CA3C00B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8FF10E7FD;
	Wed, 19 Feb 2025 13:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IV04VHIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA30C10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:35:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 422D5A42755;
 Wed, 19 Feb 2025 13:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609DFC4CEDD;
 Wed, 19 Feb 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739972139;
 bh=6dQCoBcaN3M8jj8L/pn5TacJEiDTodGAhACpPrrYv4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IV04VHITAhLiaZdnPNUjoHFWXVbobXWFLWtWG2UhHL31C9uC9j85j4r7rqvIfmymM
 fLl0gAU64SSOat/LtfB99WovVL8164waJbE2dA88AFO8hrZeI7CZZ6iPniQoDcBudv
 KB0k+A9LllhAHONhVB0NyDf3HDt7Z48yqwIAPIz7HIc96Jm5o9llCg05amJbi/BHce
 YRGKUT3mK8oeWOjI1hKiRwsYecPR2p/s+mjpi6fgEz0+mk7GwZ15WMUGVNQ2BIoLqa
 +t00SLkqMPDhHPsrdBHRADVUv6FIvL5HXcVHITDFKX5cFZ+hJESYF7Ymjz0BHLg+kl
 mxNfVv7YYJMlQ==
Date: Wed, 19 Feb 2025 14:35:37 +0100
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
Message-ID: <20250219-marvellous-calculating-piculet-f6b9ec@houat>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
 <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
 <20250218-primitive-kickass-seagull-008bf2@houat>
 <rg4mctlqofydzexa7uwnmcsv66dhx5u2wrmytslpyltraz6p5q@ohvo7ab2ws7q>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="elwcbsq7xwvzgu3j"
Content-Disposition: inline
In-Reply-To: <rg4mctlqofydzexa7uwnmcsv66dhx5u2wrmytslpyltraz6p5q@ohvo7ab2ws7q>
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


--elwcbsq7xwvzgu3j
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
MIME-Version: 1.0

On Wed, Feb 19, 2025 at 11:11:33AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 04:52:53PM +0100, Maxime Ripard wrote:
> > On Tue, Feb 18, 2025 at 02:14:43PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> > > > On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Srivatsa <asrivat=
s@redhat.com> wrote:
> > > > > >
> > > > > > A lot of mipi API are deprecated and have a _multi() variant
> > > > > > which is the preferred way forward. This covers  TODO in the
> > > > > > gpu Documentation:[1]
> > > > > >
> > > > > > An incomplete effort was made in the previous version
> > > > > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> > > > > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > > > > replacemts and not the rest of the API.
> > > > >=20
> > > > > You didn't seem to take most of the suggestions I gave in respons=
e to
> > > > > your v1 [3]. Specifically:
> > > > >=20
> > > > > a) I asked that you CC Tejas. I've added him again.
> > > > >=20
> > > > > b) I asked that you CC me on the whole patch series, which you di=
dn't
> > > > > do. I can find them, but I'd find it convenient in this case for =
them
> > > > > to be in my Inbox.
> > > > >=20
> > > > > The first patch conflicts with what Tejas already landed in
> > > > > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > > > > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). T=
he
> > > > > second patch _also_ conflicts with what Tejas already landed. See
> > > > > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > > > > mipi_dsi wrapped functions"). Later patches also also conflict. S=
ee
> > > > > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_=
dsi
> > > > > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > > > > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > > > > functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx=
01:
> > > > > transition to mipi_dsi wrapped functions"). Maybe you should sync=
 up
> > > > > with drm-misc-next before submitting.
> > > >=20
> > > > Yes, you should definitely work from drm-misc-next there, and sync =
with
> > > > Tejas.
> > > >=20
> > > > > I also questioned whether this really made sense to try to do wit=
h a
> > > > > Coccinelle script and I still don't think so. It looks like Dmitr=
y has
> > > > > already reviewed the first few of your patches and has repeated my
> > > > > advice. If you want to help with the effort of addressing this TO=
DO
> > > > > item then that's great, but I'll stop reviewing (and start silent=
ly
> > > > > deleting) any future submissions of yours that say that they're d=
one
> > > > > entirely with a Coccinelle script unless you address this point a=
nd
> > > > > convince me that your Coccinelle script is really smart enough to
> > > > > handle all the corner cases. I'll also assert that you should rev=
iew
> > > > > Tejas's submissions to see how these conversions are expected to =
go.
> > > >=20
> > > > I couldn't find that in your first answer though. What corner cases=
 do
> > > > you have in mind, and why do you think coccinelle can't handle them?
> > >=20
> > > As can be seen from the reviews:
> > >=20
> > > - sleeps between DSI calls
> > > - properly propagating the error at the end of the function
> >=20
> > These two are legitimate feedback, but I don't see how coccinelle cannot
> > deal with them.
>=20
> Maybe it can. both issues were pointed out during review of the first
> series, there was no improvement here. I'd really ask to perform
> conversion of a single driver, so that the script (or post-script
> fixups) can be improved. I'd still expect that Anusha actually reviews
> the changed driver before posting it and verifies that there is no
> regression in the logic / error reporting.

Yeah, it makes sense, thanks!
Maxime

--elwcbsq7xwvzgu3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7XeKAAKCRAnX84Zoj2+
dq1zAYCKf0VaKTwdDAgifOhtr6CZmQ0xXsHGqPSRQeDxj1kxtni5jzUQECUY0jJ6
AlH5icIBfA4QxeNdZJINU7DbFY3UXzHVx0W83MCWHK4WzTXVICVt6PrAf3nL92l8
WWTv4RhA4Q==
=3az7
-----END PGP SIGNATURE-----

--elwcbsq7xwvzgu3j--
