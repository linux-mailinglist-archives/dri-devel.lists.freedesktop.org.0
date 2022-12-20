Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86F651D74
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F310E360;
	Tue, 20 Dec 2022 09:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED0F10E35F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:34:00 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id c11so2620749qtn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WpdfPBP970vLU8Qrw/EG17JgG4XDBxab8NOfDbJupFY=;
 b=y7408V504YZ5mMMmMUwybH14MH9GMvFOncLTfk8FUOhy44HaQ3KtXmi342/uLgMosd
 EvbpNY1C8Vu3uy/QeerPzZI+K05q8hAv6M8Spc8/GTVfDBKCwgvWEies1Psxit6ESdKj
 /HIwj+kNetJlMgEmw33Wmy4z0zXItaOHYeJcdKPJnmzdquLlVY9vvHUgwz/7LpAX/pfa
 5tjqkMeAYOi9OODR1zpChuk/TB0HOGehllNRgrlYBZ05CJ1axj3BKv+9nV32mcJtdfig
 AdCF4Wz1dm4UihDzdlwDrDbkrymDyNLPepS3gc7rqCEn/WGn+Ic6o0XlhGF2DlyZ798l
 UAlA==
X-Gm-Message-State: ANoB5pmhGwC6fFayb8SFh4zUbG0oYHLxKfwxfr0Ks7ZqKtA90lRZrsnk
 C0ZgcjMrKYrI6oCDsAV+HH9yMI/KILsdPg==
X-Google-Smtp-Source: AA0mqf6bfW6k2ui6teD+3dFw5sAAlG0ikbWG5M9OkqcvQn+f8YBMz54LZzLOuEAxl6nzEVvvB2SCFg==
X-Received: by 2002:ac8:1014:0:b0:3a4:3137:79b3 with SMTP id
 z20-20020ac81014000000b003a4313779b3mr54337131qti.64.1671528838294; 
 Tue, 20 Dec 2022 01:33:58 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 de26-20020a05620a371a00b006cfc01b4461sm8521502qkb.118.2022.12.20.01.33.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:33:58 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id j206so12336141ybj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:33:58 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr40430651yba.380.1671528837883; 
 Tue, 20 Dec 2022 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
 <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
 <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
In-Reply-To: <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Dec 2022 10:33:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS+jOeFcHU=gQcaYdOMCk9oruSWiuCX-voXAbx61yYuA@mail.gmail.com>
Message-ID: <CAMuHMdWS+jOeFcHU=gQcaYdOMCk9oruSWiuCX-voXAbx61yYuA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Tue, Dec 20, 2022 at 10:22 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 20/12/2022 10:09, Geert Uytterhoeven wrote:
> > On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >> On 19/12/2022 22:47, Laurent Pinchart wrote:
> >>> (CC'ing Sakari and Hans)
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> >>>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >>>>  2 files changed, 71 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> index 8c2719efda2a..8ccabf5a30c4 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>>              .bpp = 32,
> >>>>              .planes = 1,
> >>>>              .hsub = 1,
> >>>> +    }, {
> >>>> +            .fourcc = DRM_FORMAT_RGBX1010102,
> >>>
> >>> Ah, here the format makes sense.
> >>>
> >>>> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
> >>>
> >>> But this is horrible :-( Could we use the same names as DRM for new
> >>> formats, when there is no conflict with existing V4L2 formats ?
> >>>
> >>> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> >>> the format definitions.
> >>
> >> V4L2 describes pixel formats based on how they appear in memory from the
> >> lowest to highest memory address.
> >
> > So that means big endian?
>
> Yes.
>
> >> If I am not mistaken, DRM uses the CPU order. So that explains the difference
> >> in naming. I don't think we should hide that difference. And V4L2 has been
> >> quite consistent in following memory ordering in the naming (except possibly
> >> for some of the really old pixelformats).
> >
> > DRM uses little endian.
>
> So not CPU order, but always little endian order? I.e., on a big endian system
> a given DRM_FORMAT_ would have the same memory layout as on a little endian
> system?

Indeed. Big-endian formats must set the DRM_FORMAT_BIG_ENDIAN flag:

    #define DRM_FORMAT_BIG_ENDIAN (1U<<31) /* format is big endian
instead of little endian */

unless the big-endian format has a standard (little-endian) equivalent:

Old PPC drivers may violate that, so there is some quirk handling...

/*
 * DRM formats are little endian.  Define host endian variants for the
 * most common formats here, to reduce the #ifdefs needed in drivers.
 *
 * Note that the DRM_FORMAT_BIG_ENDIAN flag should only be used in
 * case the format can't be specified otherwise, so we don't end up
 * with two values describing the same format.
 */
#ifdef __BIG_ENDIAN
# define DRM_FORMAT_HOST_XRGB1555     (DRM_FORMAT_XRGB1555         |    \
                                       DRM_FORMAT_BIG_ENDIAN)
# define DRM_FORMAT_HOST_RGB565       (DRM_FORMAT_RGB565           |    \
                                       DRM_FORMAT_BIG_ENDIAN)
# define DRM_FORMAT_HOST_XRGB8888     DRM_FORMAT_BGRX8888
# define DRM_FORMAT_HOST_ARGB8888     DRM_FORMAT_BGRA8888
#else
# define DRM_FORMAT_HOST_XRGB1555     DRM_FORMAT_XRGB1555
# define DRM_FORMAT_HOST_RGB565       DRM_FORMAT_RGB565
# define DRM_FORMAT_HOST_XRGB8888     DRM_FORMAT_XRGB8888
# define DRM_FORMAT_HOST_ARGB8888     DRM_FORMAT_ARGB8888
#endif

However, given the number of bugs related to big-endian formats,
I doubt DRM has any real use on big-endian hardware (i.e. not
counting hobbyists trying to migrate from fbdev to DRM ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
