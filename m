Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD8C41DA78
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 15:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860296E40B;
	Thu, 30 Sep 2021 13:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EB16E3F5;
 Thu, 30 Sep 2021 13:04:48 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id e15so25003737lfr.10;
 Thu, 30 Sep 2021 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=o+4eSVAKrZEsPcw4dpXxfrqsUjsymJtzaRHSa/JgmUg=;
 b=IhS/r2TLvS0vuo8maPzTPXsad/2BT51uaMQp1LkLPJrx210A/2mDwMo0JeMYNpGMtF
 ZsySL9QVXt39jQhTXvlkSvSxQCPgo9fK3Rh5vnF6PLxB3tvWC3wDmYSbIEbFB2c5NpT7
 zvQkhdwSzWD/T6X7gd1v4S9baXYj0W/IBgzVoVwOL/gYapDD3C7MjWhEHLRELlUwRmcD
 tDcJHIuqJ3ciUxUMBZ+IzfCOXNAxSSMsPzlfEPuBy2RLd6TYC3h1IEAUe5+j0Q5Soxmv
 M+3+HSkn2RtI9fyCw9qIokThU6cBQg0wVOnbJcumrK8eddb3nc01oQxZbtXNAyGjbZvm
 nQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=o+4eSVAKrZEsPcw4dpXxfrqsUjsymJtzaRHSa/JgmUg=;
 b=S/DDpG+LtQQOmKQmPSd1hX2O/ISGaHJSumafY3cCLws5B9ILQZdsiWAKZczSxAe9Fm
 CJbjpmVVlG0tT2iTi3+4KHc0+sWHB619UVsnplLkVpVTBxWNn/iLyv1ldShdAKpoBUB+
 V+ni542JKqey/TnAC1p6TraHDk3r3UpvxbjFOzn+Ld95ekQuK8ry8JX+M6xtQjEHOimT
 Rzb5dMpWJabap+dlvGv7QfIS0qyojqaOxoYDLAJWCZTHsgVYhsNC4hIeXn/Gixrg5VuB
 YbIc/EPvgyVry6t2Wbs7vKNzOZuXN7ZPM153d5WfGg8nTtsMp2xHmGDWiBaQAmvgVUuP
 bqvA==
X-Gm-Message-State: AOAM5304OAKgEDllEd/l54zccsbGbQ4CzIIzevz4mU0tJhJnNVYGgPWx
 H3LhIGugkYdPPJdFl8MJXYM=
X-Google-Smtp-Source: ABdhPJwJ+KH5jRthwhiRCi9YGtM5XK8x2hV2h9HgimF4k7J93IBM56FSn+eQ8QdZE0zz7GSBeFfyqQ==
X-Received: by 2002:a2e:83c5:: with SMTP id s5mr5661372ljh.515.1633007085825; 
 Thu, 30 Sep 2021 06:04:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n8sm401925lfl.260.2021.09.30.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:04:44 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:04:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: sebastian@sebastianwick.net, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>, Jeremy Cline
 <jeremy@jcline.org>
Subject: Repository for additional color and HDR related documentation (Re:
 [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC)
Message-ID: <20210930160430.1e4fbc23@eldfell>
In-Reply-To: <20210923104354.585ed9b1@eldfell>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <20210921163158.688c26bc@eldfell>
 <0c673cf8-2b90-c1ca-a0b0-c809e7e10c2c@amd.com>
 <20210922113105.2e42754c@eldfell>
 <823898e8-a8fe-cc74-e5b4-c4907826efbc@amd.com>
 <20210923104354.585ed9b1@eldfell>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddt++=ysGel8BF_eUzWWEl2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/ddt++=ysGel8BF_eUzWWEl2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Sep 2021 10:43:54 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Wed, 22 Sep 2021 11:28:37 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
>=20
> > On 2021-09-22 04:31, Pekka Paalanen wrote: =20
> > > On Tue, 21 Sep 2021 14:05:05 -0400
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >    =20
> > >> On 2021-09-21 09:31, Pekka Paalanen wrote:   =20
> > >>> On Mon, 20 Sep 2021 20:14:50 -0400
> > >>> Harry Wentland <harry.wentland@amd.com> wrote:
> > >>>      =20
> >=20
> > ...
> >  =20
> > >    =20
> > >> Did anybody start any CM doc patches in Weston or Wayland yet?   =20
> > >=20
> > > There is the
> > > https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/u=
nstable/color-management/color.rst
> > > we started a long time ago, and have not really touched it for a whil=
e.
> > > Since we last touched it, at least my understanding has developed
> > > somewhat.
> > >=20
> > > It is linked from the overview in
> > > https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requ=
ests/14
> > > and if you want to propose changes, the way to do it is file a MR in
> > > https://gitlab.freedesktop.org/swick/wayland-protocols/-/merge_reques=
ts
> > > against the 'color' branch. Patches very much welcome, that doc does
> > > not need to limit itself to Wayland. :-)
> > >    =20
> >=20
> > Right, I've read all that a while back.
> >=20
> > It might be a good place to consolidate most of the Linux CM/HDR discus=
sion,
> > since gitlab is good with allowing discussions, we can track changes, a=
nd
> > it's more formatting and diagram friendly than text-only email. =20
>=20
> Fine by me, but the way things are right now, we'd be hijacking
> Sebastian's personal repository for these things. That's not ideal.
>=20
> We can't merge the protocol XML into wayland-protocols until it has the
> accepted implementations required by the governance rules, but I wonder
> if we could land color.rst ahead of time, then work on that in
> wayland-protocols upstream repo.
>=20
> It's hard to pick a good place for a cross-project document. Any other
> ideas?
>=20
> > > We also have issues tracked at
> > > https://gitlab.freedesktop.org/swick/wayland-protocols/-/issues?scope=
=3Dall&utf8=3D%E2%9C%93&state=3Dopened =20

Hi all,

we discussed things in
https://gitlab.freedesktop.org/swick/wayland-protocols/-/issues/6

and we have a new home for the color related WIP documentation we can
use across Wayland, Mesa, DRM, and even X11 if people want to:

https://gitlab.freedesktop.org/pq/color-and-hdr

Yes, it's still someone's personal repository, but we avoid entangling
it with wayland-protocols which also means we can keep the full git
history. If this gets enough traction, the repository can be moved from
under my personal group to somewhere more communal, and if that is
still inside gitlab.fd.o then all merge requests and issues will move
with it.

The README notes that we will deal out merge permissions as well.

This is not meant to supersede the documentation of individual APIs,
but to host additional documentation that would be too verbose, too
big, or out of scope to host within respective API docs.

Feel free to join the effort or just to discuss.


Thanks,
pq

--Sig_/ddt++=ysGel8BF_eUzWWEl2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFVtd4ACgkQI1/ltBGq
qqeuAg/+Myd7Qdq39RFm3xljW4XBoE5xgzsEr9UBFBUbW+E/P4yoV7oJY1qqe+gV
2XHxSu6alfYY/y7qga5g05N9cyZ7FFxsmlUVVFHadhHBIehOk8MkMEJyoVRmfKVq
U5D3oIOlJtFMrQ4rQXcn5OET1NTrWNU4st8DjoScWK88YnIjIky71BvK+oVJ83Hy
TbKg4CYPQdtAE1SGp3SIg/dmiOoCpt1C1Pr2796A0KqRdT1FXHQNmdX8iJFqTmn0
TvZh9adW46xzchSxBT23Yac2yV3DtNfagNA2kQRkSexYIlWJURfLV1KsHL8jqDzF
MP+Ul6y77loCgeGPO3b8tZDU6VAliDjQg0YiwlcOjRBvH+WSElPsiV7/iIEGnujs
BGZ67hnH0e39e3WTKD9UKH48l+Q+3IlZjlr9V64kQnbzAKZHx+bW9PYFZ0puAmpP
DmtgLaSz8ndu+q2VGOFHTKpEz1nDYSk++1xyxFBDp+PNrd7wNZ1JsRN+7/rFmaPv
fwp+nbs3FF+y7fAjFo3RTifTq1hcP9oW+GPEGja2m41Ly9SXRc9g7ZYk1yQK/ZG/
arKZUCdcgKtlDftRzpLjeOyn9H59t3pXTEKYvWU0HEVDv4TwsYKItbw+cAUkI0en
wkOmAT8JfMw42xFRCUXeAu6/ubl7T78rSuXBzSXJNKTfZvX8pkE=
=Ziuu
-----END PGP SIGNATURE-----

--Sig_/ddt++=ysGel8BF_eUzWWEl2--
