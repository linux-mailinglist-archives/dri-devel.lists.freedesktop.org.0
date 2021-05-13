Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C537FE16
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 21:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED076EDA9;
	Thu, 13 May 2021 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D246EDA8;
 Thu, 13 May 2021 19:27:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r11so8159483edt.13;
 Thu, 13 May 2021 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rzQPaErfdwjaR38odpbaOzMJ0qc/e3lnEHwr05dUVtQ=;
 b=qaRWtQ1TXz9E0sJ1P2pCvBc/QqjxQgSPiNnSmyxluWnCRgm7ZyrqRug/mvzIzepia6
 1L88HHKD5LeJHRlhKBapxvfHRKg8q58QOkCsQ+M8TN2VBVFW/35soqRBqeKIfO9/lLvM
 IT293kupyFBHUXyf288lKRFSlsBvt+4W1zGLMPPINZ4Gkhfqxxvx+uB+2SZsiKXNNzDC
 Q4Rsy+f4wu4GoW0IkC2ZuAmXIa1Du+7gYbe1+F735Oz9uV7vhnLvgO7C58Ifl8eI+EJH
 ku/uQbqpN5FbG96QBfBITZ92RT/xcGe0zwLzMexIKamiOSyYrTaY7dlltoxAjFWtgXbV
 V9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rzQPaErfdwjaR38odpbaOzMJ0qc/e3lnEHwr05dUVtQ=;
 b=cTDtZDsUBDj0dyHpNPfZ/BghsBrVCNVPFYKMndvH5si7K69oZOFZvY50hPEBLGAuYE
 8lBRFJD+fGk8L833HSHkS2dNOGRITCky+UN0tgtFhrghYJ2CSxJfhVB66cAG+wSr4NU9
 akSFseGtU3w+Yp+m0PmbsPX9PG1piiioZbLvzkr/x6bV6L/MpDOwK9AV39h6B1aNaPMF
 wEhE/doXtCKI16d6YankKNTCK+JpwV+Qz/QyV1EY5vj67ZovRQhioiaE2pNRwTWgyxT4
 kttwx6kBwdp+BDlRRzW2aBCoEMAhZcQRtQczombuN+uB0c1ttIg+Hldgrjfhmx6S71lb
 DmqQ==
X-Gm-Message-State: AOAM530bvUQ9RgW6P0CRlPfILNY1lYGNRYTe6bzBOPiBY9ql/KoX1aD1
 DQ/txHle6/2oqfHnWRYHsVusR7OnuTFq9W2ilr4=
X-Google-Smtp-Source: ABdhPJxWiYyujLDZNcQtMxQk6RRvdeHdZzfFSJsRsFF+8rT/yg8fKTQA2io+PKLcsE+jpj7zVQiSngKIkmkl2rlRMFI=
X-Received: by 2002:a50:fd13:: with SMTP id i19mr10083839eds.386.1620934059981; 
 Thu, 13 May 2021 12:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <20210319210317.32369-2-mario.kleiner.de@gmail.com>
 <YFUUm0atqi3ox17k@intel.com>
 <CAEsyxyhxBVp0yFrRc9Zq9D0b62Tdf+-6oWc+Y6AwHTSFWX5g1w@mail.gmail.com>
 <YFVZa0sU7ciMQIX2@intel.com> <YJOOjpyPshTbIY8U@intel.com>
In-Reply-To: <YJOOjpyPshTbIY8U@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 13 May 2021 21:27:28 +0200
Message-ID: <CAEsyxyhk15CmD6iQCun2Nz24Oj30MgG3C08fUv-eTu58VrcjGQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/fourcc: Add 16 bpc fixed point framebuffer
 formats.
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 6, 2021 at 8:37 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Sat, Mar 20, 2021 at 04:09:47AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Mar 19, 2021 at 10:45:10PM +0100, Mario Kleiner wrote:
> > > On Fri, Mar 19, 2021 at 10:16 PM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Mar 19, 2021 at 10:03:13PM +0100, Mario Kleiner wrote:
> > > > > These are 16 bits per color channel unsigned normalized formats.
> > > > > They are supported by at least AMD display hw, and suitable for
> > > > > direct scanout of Vulkan swapchain images in the format
> > > > > VK_FORMAT_R16G16B16A16_UNORM.
> > > > >
> > > > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
> > > > >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> > > > >  2 files changed, 11 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_f=
ourcc.c
> > > > > index 03262472059c..ce13d2be5d7b 100644
> > > > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > > > @@ -203,6 +203,10 @@ const struct drm_format_info *__drm_format_i=
nfo(u32 format)
> > > > >               { .format =3D DRM_FORMAT_ARGB16161616F,   .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > >               { .format =3D DRM_FORMAT_ABGR16161616F,   .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > >               { .format =3D DRM_FORMAT_AXBXGXRX106106106106, .dep=
th =3D 0, .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1=
, .has_alpha =3D true },
> > > > > +             { .format =3D DRM_FORMAT_XRGB16161616,    .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 }=
,
> > > > > +             { .format =3D DRM_FORMAT_XBGR16161616,    .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 }=
,
> > > > > +             { .format =3D DRM_FORMAT_ARGB16161616,    .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > > +             { .format =3D DRM_FORMAT_ABGR16161616,    .depth =
=3D 0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > >               { .format =3D DRM_FORMAT_RGB888_A8,       .depth =
=3D 32, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > >               { .format =3D DRM_FORMAT_BGR888_A8,       .depth =
=3D 32, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > >               { .format =3D DRM_FORMAT_XRGB8888_A8,     .depth =
=3D 32, .num_planes =3D 2, .cpp =3D { 4, 1, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm=
_fourcc.h
> > > > > index f76de49c768f..f7156322aba5 100644
> > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > @@ -168,6 +168,13 @@ extern "C" {
> > > > >  #define DRM_FORMAT_RGBA1010102       fourcc_code('R', 'A', '3', =
'0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
> > > > >  #define DRM_FORMAT_BGRA1010102       fourcc_code('B', 'A', '3', =
'0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
> > > > >
> > > > > +/* 64 bpp RGB */
> > > > > +#define DRM_FORMAT_XRGB16161616      fourcc_code('X', 'R', '4', =
'8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
> > > > > +#define DRM_FORMAT_XBGR16161616      fourcc_code('X', 'B', '4', =
'8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
> > > > > +
> > > > > +#define DRM_FORMAT_ARGB16161616      fourcc_code('A', 'R', '4', =
'8') /* [63:0] A:R:G:B 16:16:16:16 little endian */
> > > > > +#define DRM_FORMAT_ABGR16161616      fourcc_code('A', 'B', '4', =
'8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
> > > >
> > > > These look reasonable enough to me. IIRC we should be able to expos=
e
> > > > them on some recent Intel hw as well.
> > > >
> > > > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>
> > > >
> > >
> > > Thanks Ville!
> > >
> > > Indeed i looked over the Intel PRM's, and while fp16 support seems to
> > > be rather recent (Gen8? Gen9? Gen10? Can't remember atm.), iirc, I
> > > found references to rgb16 fixed point back to gen5 / Ironlake.
> >
> > fp16 has been around since forever (gen4+)
> > uint16 is much more recent, IIRC is something ~glk+
>
> FYI I just hacked something together for i915:
> git://github.com/vsyrjala/linux.git uint16
>
> Tests seem to pass on a glk here at least.

Great! Thanks for doing this. I reviewed those 3 patches of yours,
look good to me, also added R-b's to the individual patches on your
git://github.com/vsyrjala/linux.git uint16:

Reviewed-by: Mario Kleiner <mario.kleiner.de@gmail.com>

Too bad uint16 isn't supported already on KBL hw, which is the most
modern Intel hw i have atm, so i can't test them.

-mario
