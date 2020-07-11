Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B021E953
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8996E939;
	Tue, 14 Jul 2020 07:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A996E2E2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 15:11:42 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id cm21so3841815pjb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lbJbJXyaa2RJSRZCkASSTZMtfB5x5A2cZspWwqiACVA=;
 b=VrpLtn8BFfqScK+tfsGIQIM0I62BHK7OEuBdoY9pcFhvzT5ES86WFeUflbJhIgxglL
 WshaO2OUM0C2mTqYrXp2sqW0kqFZvb4CS3RkJ3Sig4YEDRprWE6SOV4U4BvjZ3DdPD7R
 I6dISToOqhIcGSxDjRRZ8gzPnrVk1mNWLDmKaXOM4INSdN6j82JACqZA1/g5ywnnHVTJ
 F5OJsx7Xf9u1Gidm0bvqOhmkh09hHlIFxSuxrt0yL7Vcm2uwdEI6/hMZK/vdiDscCkf3
 hzORaculqZoLGkYPfURxYpGwEczH9j7DAKkClcgf/bKUukWVUgovy8GYCLpghG3BJBd4
 Z23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lbJbJXyaa2RJSRZCkASSTZMtfB5x5A2cZspWwqiACVA=;
 b=QZmN+vV4Ypy1JlNdrBvBn3DrxBIcYDOi8ddjivCFky4sythNX+OBQoeB/pcSAtZst/
 FeUk/sQdcrQxjBG9BVLTk7o5LiZxLcpcp6ZLvcRefcbh0enEQQMws2c59RHgdrOvr5N/
 ACmmzHwFMcUhGNISRY+lGIovesRRVrUEIw3V6xTSxOqpM05oPir2wTV65nr5zLDhjbLs
 8uUF6xh2gQdMKdCk+fiEWLLh0hRja417m1xu7NvUdzkJdTyq0L19KcFuf54lsVYhsELv
 6oaVd0ztSjTKrUJPb6av8w2h3UCe3K+TqpwuYZ2xdRaDLNDI8zdDUlw8ICEHDpW6vhuk
 Bf1Q==
X-Gm-Message-State: AOAM533ViDTiMJFreF6D5WJ28UpxMEl4f4dJtoRfp+ot04/XYTn88eSt
 il5ys9nCAKDEFidi2dpR7fo=
X-Google-Smtp-Source: ABdhPJzB/u0gPEdFobOYA9ljn5l2yp9NGc+p6o9q5exxeNn3ErV37CKcmUyYZSxZd55mv0+Teun/kQ==
X-Received: by 2002:a17:90a:1d06:: with SMTP id
 c6mr11678465pjd.194.1594480302299; 
 Sat, 11 Jul 2020 08:11:42 -0700 (PDT)
Received: from blackclown ([103.88.82.158])
 by smtp.gmail.com with ESMTPSA id u66sm9156189pfb.191.2020.07.11.08.11.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 11 Jul 2020 08:11:41 -0700 (PDT)
Date: Sat, 11 Jul 2020 20:41:26 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 0/4] drm: core: Convert logging to drm_* functions.
Message-ID: <20200711151126.GA12262@blackclown>
References: <cover.1594136880.git.usuraj35@gmail.com>
 <20200710175643.GF17565@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200710175643.GF17565@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1745593240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1745593240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 07:56:43PM +0200, Sam Ravnborg wrote:
> Hi Suraj.
>=20
> On Tue, Jul 07, 2020 at 10:04:14PM +0530, Suraj Upadhyay wrote:
> >=20
> > This patchset converts logging to drm_* functions in drm core.
> >=20
> > The following functions have been converted to their respective
> > DRM alternatives :
> > dev_info()      --> drm_info()
> > dev_err()       --> drm_err()
> > dev_warn()      --> drm_warn()
> > dev_err_once()  --> drm_err_once().
>=20
> I would prefer that DRM_* logging in the same files are converted in the
> same patch. So we have one logging conversion patch for each file you
> touches and that we do not need to re-vist the files later to change
> another set of logging functions.

Agreed.

> If possible WARN_* should also be converted to drm_WARN_*
> If patch is too large, then split them up but again lets have all
> logging updated when we touch a file.
>=20
> Care to take a look at this approach?
>

Hii,
	The problem with WARN_* macros is that they are used without any
drm device context. For example [this use here](https://cgit.freedesktop.or=
g/drm/drm-misc/tree/drivers/gpu/drm/drm_edid.c#n1667) in drm_edid.c,
doesn't have a drm device context and only has one argument (namely !raw_ed=
id).
There are many more such use cases.

And also there were cases where dev_* logging functions didn't have any
drm_device context.

I would be very glad, if we came up with a possible solution to this
problem. I think we should develop drm_* logging APIs which could print
contextless logs (which would possibly be midlyering) or give every situati=
on a context.

> Also please consider if coccinelle can make this job easier.
> There is a lot of files...

I totally agree with you. I will remember this next time.

But here, in this patchset I have tried to convert all possible
cases of conversion, i.e. I have changed logging wherever there was a
drm_device context.

Thanks.

> 	Sam
>=20
> >=20
> > Suraj Upadhyay (4):
> >   drm: mipi-dsi: Convert logging to drm_* functions.
> >   drm: mipi-dbi: Convert logging to drm_* functions.
> >   drm: edid: Convert logging to drm_* functions.
> >   drm: fb-helper: Convert logging to drm_* functions.
> >=20
> >  drivers/gpu/drm/drm_edid.c      |  7 +++----
> >  drivers/gpu/drm/drm_fb_helper.c |  2 +-
> >  drivers/gpu/drm/drm_mipi_dbi.c  |  4 ++--
> >  drivers/gpu/drm/drm_mipi_dsi.c  | 15 +++++++--------
> >  4 files changed, 13 insertions(+), 15 deletions(-)
> >=20
> > --=20
> > 2.17.1
> >=20
> >=20
>=20
>=20
>=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8J1pYACgkQ+gRsbIfe
746Vlw/8CtZ9XbPZ/Iyno9amywRwx9keWlGzO8cypYgKaz46i/ez9jMqhkgsOvm8
EFv/TYk5rNnxe46XDSMM1NL+HhrXjZMBtu9eMLQNV/MlA8U/bgxLZVDo7BOizIk9
eBVDF9U8rvw3Y5HjUP6v0pDoHpKiR0r6/Zxa7AvGh6uFugIfCUU/qelBkFoAnlkA
3KHTnqgHZTlpdmMgmIwpasya1bPvm4TV60m5WaN+Gz1pWbqyAOqlroKOaHqoFRcs
yWCqUw109yOQqHVFJ1SHFTAsBtUcrx3ndbSj4GiWsprQBI1OFBngxfFjprxgTD6a
lyp2c8tWDm1kwJv8HHfFGyUG8uYaUfjxQw9bstkPdhp9z0YaAUOlpXj9uf/bQRIV
71M6febZ1+zEyEm+sVgbgxGwLz7GBc9Efp0tNryDXGfkZBXilxzi7MDEKm/M6SW7
OEXqls0XJS9kwLd8APdIokiWvM/3KJ9o65MPn6kvztcoXkoc8sxyUhKC8QmCMX7T
ijdanU91MirbNlgF/mAnLXSHSDfm2lh3xUWHgAPkvOe/tIb9j16P+71yM9bZdmj1
fS3dpzlRrHGEFQTRvBRMwr5X4HyrF9YNCe6gn46TzW6GQmdFnG6F0rngd7p8vN/9
g/hAC8NcFwnS5eVhVecAUp33OkxIy4x26F0CuONdbP7GXHvhdew=
=XNjR
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============1745593240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1745593240==--
