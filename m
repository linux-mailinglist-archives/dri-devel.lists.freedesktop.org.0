Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323104A71B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5AF10E5B1;
	Wed,  2 Feb 2022 13:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30A810E5A8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:40:34 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id s1so4133444qtw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 05:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=33CDNvFFFLQ5UlFYXirJdXdJ1bRnXIcUvObN10eCY3c=;
 b=EmkntzB2sCFQwyaHiboNteG/UL1fakBxzgPS4wkZHrYgqlBjBk6bVwyBhC7LQkQ83w
 nYsCE0ICTQb2O1CFMj2WRGkiTFloy0UBIeouGOh3KnjRXgWmWl1DkpkkwVyV39iMJh3J
 k2+kWIbTkKJzWF38c6MLCML/frET+dAZAUobdFHfzYJGq0moZ4HWEGm+rI37GCj/U1uG
 CksOxkyvdlw758s6v/hIHydl7VGbK7n45VCV/FGDkqDF6Cd7eKCBlEcwFCz1pLrVefa5
 OrtvgGIkfZ5OCA2QuE+OVY4ehi2eEvmPKHNschfJvG80qXdz4A8PS4fR871kQwamyyAo
 5ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33CDNvFFFLQ5UlFYXirJdXdJ1bRnXIcUvObN10eCY3c=;
 b=JKA7CSNu4idNGLfv3bRo+8Lmfqofhh0fSkAKdO6DLMyywEZe4/9aWrBPrMAtCy+pWO
 lZKbzw9QioBGt0d8nsSzAZwzHfv1Ww9eHr1tjn1K6wN1FmbtsHM88vBOgAKYWlbdCERs
 Wy9RNz44+QOpR2P6wuw3ZUh1BVTzXsqdwrwChN5btFjif/c+x+3rr4Yy3/NbHSHWgDIm
 RIBxFuWqG3P446tY2allCvNPSb7sXJdN/xctc7e1cqDr+k5iVVNQ6Z/JqJIKCDTdyog2
 IB81s/IY1A54ZfQNDeP3kt1pmTGDDGlaJduNPe7acF4nSiEiciFvRf9kHYk0MWq8aQw2
 vGig==
X-Gm-Message-State: AOAM533wD2PMIuHXnJwib2F/ZZPkVnansKlhpFHFE6VynpgSmMVF2HSk
 JVZ3wP8RIV9ALOxADwKNcQHWMAGfb4V3RT/m63s3gA==
X-Google-Smtp-Source: ABdhPJwWqaID7gBrLffvG0yFslhpdfndDfT57qzRUOXOzsMWoOgfWN5UOLc7ocxMhb2+zw4WWgUB2sr5MkSLSg2hZxg=
X-Received: by 2002:ac8:7fca:: with SMTP id b10mr23198480qtk.62.1643809233873; 
 Wed, 02 Feb 2022 05:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
In-Reply-To: <87y22ts948.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Feb 2022 16:40:22 +0300
Message-ID: <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 intel-gfx@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Feb 2022 at 16:15, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Wed, 02 Feb 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > Hi Kandpal,
> >
> > Thank you for the patch.
> >
> > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> >> Changing rcar_du driver to accomadate the change of
> >> drm_writeback_connector.base and drm_writeback_connector.encoder
> >> to a pointer the reason for which is explained in the
> >> Patch(drm: add writeback pointers to drm_connector).
> >>
> >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> index 66e8839db708..68f387a04502 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> >>      const char *const *sources;
> >>      unsigned int sources_count;
> >>
> >> +    struct drm_connector connector;
> >> +    struct drm_encoder encoder;
> >
> > Those fields are, at best, poorly named. Furthermore, there's no need in
> > this driver or in other drivers using drm_writeback_connector to create
> > an encoder or connector manually. Let's not polute all drivers because
> > i915 doesn't have its abstractions right.
>
> i915 uses the quite common model for struct inheritance:
>
>         struct intel_connector {
>                 struct drm_connector base;
>                 /* ... */
>         }
>
> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> radeon, tilcdc, and vboxvideo.

For the reference. msm does not wrap drm_connector into any _common_
structure, which is used internally.

> We could argue about the relative merits of that abstraction, but I
> think the bottom line is that it's popular and the drivers using it are
> not going to be persuaded to move away from it.

As I wrote earlier, I am not sure if these drivers would try using
their drm_connector subclass for writeback.
ast: ast_connector = drm_connector + respective i2c adapter for EDID,
not needed for WB
fsl-dcu: fsl_dcu_drm_connector = drm_connector + drm_encoder pointer +
drm_panel. Not needed for WB
hisilicon, mgag200: same as ast
tilcdc: same as fsl-dcu
vboxdrv: the only driver that may possibly benefit from using
vbox_connector in the writeback support, as the connector is bare
drm_connector + crtc pointer + hints (width, height, disconnected).

I have left amd, nouveau and radeon out of this list, too complex to
analyze in several minutes.

I'd second the proposal of supporting optional drm_encoder for
drm_writeback_connector (as the crtc/encoder split can be vague), but
I do not see the benefit for the drivers to use their own
drm_connector subclass for drm_writeback.
It well might be that we all misunderstand your design. Do you have a
complete intel drm_writeback implementation based on this patchset? It
would be easier to judge if the approach is correct seeing your
target.

>
> It's no coincidence that the drivers who've implemented writeback so far
> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> because the drm_writeback_connector midlayer does, forcing the issue.
>
> So I think drm_writeback_connector should *not* use the inheritance
> abstraction because it's a midlayer that should leave that option to the
> drivers. I think drm_writeback_connector needs to be changed to
> accommodate that, and, unfortunately, it means current writeback users
> need to be changed as well.
>
> I am not sure, however, if the series at hand is the right
> approach. Perhaps writeback can be modified to allocate the stuff for
> you if you prefer it that way, as long as the drm_connector is not
> embedded in struct drm_writeback_connector.

-- 
With best wishes
Dmitry
