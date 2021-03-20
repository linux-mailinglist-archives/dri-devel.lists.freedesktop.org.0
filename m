Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB773429E7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 03:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335946EB21;
	Sat, 20 Mar 2021 02:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51E6EB21;
 Sat, 20 Mar 2021 02:09:52 +0000 (UTC)
IronPort-SDR: vJIqK6Jn816MhbLLGYdPOgHB19eUwjNGAH5XSVolzVsNJ6t91vfAFU/7QGujq1j/tNUS/7CACr
 oB8FtX8eovsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="251347129"
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="251347129"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 19:09:51 -0700
IronPort-SDR: HG5k7S7+5p94OQgzINPbQtGGSYwyKAK7vUkp0tmAUdgNhDPsLguwlcYzEb5ksgBEUqjHEx9IYd
 qw9/CgX/0X4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="440293816"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 19 Mar 2021 19:09:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 20 Mar 2021 04:09:47 +0200
Date: Sat, 20 Mar 2021 04:09:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH 1/5] drm/fourcc: Add 16 bpc fixed point framebuffer
 formats.
Message-ID: <YFVZa0sU7ciMQIX2@intel.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <20210319210317.32369-2-mario.kleiner.de@gmail.com>
 <YFUUm0atqi3ox17k@intel.com>
 <CAEsyxyhxBVp0yFrRc9Zq9D0b62Tdf+-6oWc+Y6AwHTSFWX5g1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyhxBVp0yFrRc9Zq9D0b62Tdf+-6oWc+Y6AwHTSFWX5g1w@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 10:45:10PM +0100, Mario Kleiner wrote:
> On Fri, Mar 19, 2021 at 10:16 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Mar 19, 2021 at 10:03:13PM +0100, Mario Kleiner wrote:
> > > These are 16 bits per color channel unsigned normalized formats.
> > > They are supported by at least AMD display hw, and suitable for
> > > direct scanout of Vulkan swapchain images in the format
> > > VK_FORMAT_R16G16B16A16_UNORM.
> > >
> > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
> > >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> > >  2 files changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourc=
c.c
> > > index 03262472059c..ce13d2be5d7b 100644
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -203,6 +203,10 @@ const struct drm_format_info *__drm_format_info(=
u32 format)
> > >               { .format =3D DRM_FORMAT_ARGB16161616F,   .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > >               { .format =3D DRM_FORMAT_ABGR16161616F,   .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > >               { .format =3D DRM_FORMAT_AXBXGXRX106106106106, .depth =
=3D 0, .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .=
has_alpha =3D true },
> > > +             { .format =3D DRM_FORMAT_XRGB16161616,    .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> > > +             { .format =3D DRM_FORMAT_XBGR16161616,    .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> > > +             { .format =3D DRM_FORMAT_ARGB16161616,    .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > > +             { .format =3D DRM_FORMAT_ABGR16161616,    .depth =3D 0,=
  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > >               { .format =3D DRM_FORMAT_RGB888_A8,       .depth =3D 32=
, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > >               { .format =3D DRM_FORMAT_BGR888_A8,       .depth =3D 32=
, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > >               { .format =3D DRM_FORMAT_XRGB8888_A8,     .depth =3D 32=
, .num_planes =3D 2, .cpp =3D { 4, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_a=
lpha =3D true },
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fou=
rcc.h
> > > index f76de49c768f..f7156322aba5 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -168,6 +168,13 @@ extern "C" {
> > >  #define DRM_FORMAT_RGBA1010102       fourcc_code('R', 'A', '3', '0')=
 /* [31:0] R:G:B:A 10:10:10:2 little endian */
> > >  #define DRM_FORMAT_BGRA1010102       fourcc_code('B', 'A', '3', '0')=
 /* [31:0] B:G:R:A 10:10:10:2 little endian */
> > >
> > > +/* 64 bpp RGB */
> > > +#define DRM_FORMAT_XRGB16161616      fourcc_code('X', 'R', '4', '8')=
 /* [63:0] x:R:G:B 16:16:16:16 little endian */
> > > +#define DRM_FORMAT_XBGR16161616      fourcc_code('X', 'B', '4', '8')=
 /* [63:0] x:B:G:R 16:16:16:16 little endian */
> > > +
> > > +#define DRM_FORMAT_ARGB16161616      fourcc_code('A', 'R', '4', '8')=
 /* [63:0] A:R:G:B 16:16:16:16 little endian */
> > > +#define DRM_FORMAT_ABGR16161616      fourcc_code('A', 'B', '4', '8')=
 /* [63:0] A:B:G:R 16:16:16:16 little endian */
> >
> > These look reasonable enough to me. IIRC we should be able to expose
> > them on some recent Intel hw as well.
> >
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> =

> Thanks Ville!
> =

> Indeed i looked over the Intel PRM's, and while fp16 support seems to
> be rather recent (Gen8? Gen9? Gen10? Can't remember atm.), iirc, I
> found references to rgb16 fixed point back to gen5 / Ironlake.

fp16 has been around since forever (gen4+)
uint16 is much more recent, IIRC is something ~glk+

> That
> would be pretty cool! The precision limit for the encoders on Intel is
> also 12 bpc atm., right?

Yes.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
