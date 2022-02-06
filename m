Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C074AB2D0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 00:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BC610F682;
	Sun,  6 Feb 2022 23:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F78F10F682
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 23:32:56 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id o12so9662578qke.5
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Feb 2022 15:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yKUPrrrZN1zJGy8+P0HeCrjugIvW5eEZadjOMXculXk=;
 b=f+OCM/MTHwkbvDOaLnThnQxElSpJ2eZ0Yf4ZPJbvPshHr0b4lx5hYmh7Kd1fbOIYQc
 jI00PnYCS/wtja0UCPIn6O1fK7yN5undOTaDmJzXHSJgqqmanyZ5nyi0KAMsN+vVU2bm
 +4uK9o9zdc+g4wx3JV6JteK1//6Gnqf3xkhQfw0RbEp5nR+MbXaybFA1HjYqIkV7FmlZ
 vsa+d5Vw7QfOSKVDHo5G6L9HzANgj/mJL/47CT6s6CRrytkpwSt8Jdtk/+3ensokCRPh
 9xF4COaL0gIP05mDfK35aIpO2WS8n6UFxHcidcuPhSva/ITILFrzJjPO2FY7SY7jI8k4
 YudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKUPrrrZN1zJGy8+P0HeCrjugIvW5eEZadjOMXculXk=;
 b=EWM29YmtoHmxx4KvFpGnLyLegR5bGVkjXiZuKfRlsz8eVgbjCLPRrOYU57eOdOdoHp
 a5UuMx4htYp8TsZq3SQiKpcQ5yRpLHAC4az8i4uTS5zsjWoYKkgn3t4o5xqc3nqlcAxT
 35DIyW6KhU4QVo4a+p3baLY5THbehf/CsVH6+Cr1oBLKXYY1NzYqzxlXkKtBg22Lthvl
 q2eRqWu1KzVi3k6Jgba9cfqE9PhBQ4CeGZoDBEVe356qn2xDAEgGjnGwcwrErxpC20qK
 md9cGkNSMY0ppW9GnY38n5bwYbYHJ+IE/AeVyCrB3gdzdNSdhFqVhuoMrcAkqwuAVu/s
 LPug==
X-Gm-Message-State: AOAM532nLKvuhUijks8EMHpOEi1vz7BYMQLXjLPP0B0u6CccNt7ztp65
 7VRUcXLiLqyqs4041XPXD4Nl2wlWQGX/nUiWz6QtVcXDbsE=
X-Google-Smtp-Source: ABdhPJx0/eVAlLlf25TH7z/Yc6Muyko9TQ2X+YOYufAEgyjmPgldn5IH9IeaO9m5UWsTeJmxsYua/048gfUoaNFv5jc=
X-Received: by 2002:a05:620a:1664:: with SMTP id
 d4mr5091098qko.363.1644190375442; 
 Sun, 06 Feb 2022 15:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
In-Reply-To: <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Feb 2022 02:32:44 +0300
Message-ID: <CAA8EJpqr6MB64EAtLU3nBjgjx1COwn4auenCCw4kHB489VG0CA@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Feb 2022 at 16:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jani,
>
> On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> > On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> > > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> > >> Changing rcar_du driver to accomadate the change of
> > >> drm_writeback_connector.base and drm_writeback_connector.encoder
> > >> to a pointer the reason for which is explained in the
> > >> Patch(drm: add writeback pointers to drm_connector).
> > >>
> > >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> > >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> > >>  2 files changed, 7 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> index 66e8839db708..68f387a04502 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> > >>    const char *const *sources;
> > >>    unsigned int sources_count;
> > >>
> > >> +  struct drm_connector connector;
> > >> +  struct drm_encoder encoder;
> > >
> > > Those fields are, at best, poorly named. Furthermore, there's no need in
> > > this driver or in other drivers using drm_writeback_connector to create
> > > an encoder or connector manually. Let's not polute all drivers because
> > > i915 doesn't have its abstractions right.
> >
> > i915 uses the quite common model for struct inheritance:
> >
> >       struct intel_connector {
> >               struct drm_connector base;
> >               /* ... */
> >       }
> >
> > Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> > radeon, tilcdc, and vboxvideo.
> >
> > We could argue about the relative merits of that abstraction, but I
> > think the bottom line is that it's popular and the drivers using it are
> > not going to be persuaded to move away from it.
>
> Nobody said inheritance is bad.
>
> > It's no coincidence that the drivers who've implemented writeback so far
> > (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> > because the drm_writeback_connector midlayer does, forcing the issue.
>
> Are you sure it's not a coincidence ? :-)
>
> The encoder and especially connector created by drm_writeback_connector
> are there only because KMS requires a drm_encoder and a drm_connector to
> be exposed to userspace (and I could argue that using a connector for
> writeback is a hack, but that won't change). The connector is "virtual",
> I still fail to see why i915 or any other driver would need to wrap it
> into something else. The whole point of the drm_writeback_connector
> abstraction is that drivers do not have to manage the writeback
> drm_connector manually, they shouldn't touch it at all.

Laurent, I wanted to shift a bit from the question of drm_connector to
the question of drm_encoder being embedded in the
drm_writeback_connector.
In case of the msm driver the drm_encoder is not a lightweight entity,
but a full-featured driver part. Significant part of it can be shared
with the writeback implementation, if we allow using a pointer to the
external drm_encoder with the drm_writeback_connector.
Does the following patch set stand a chance to receive your ack?
 - Switch drm_writeback_connector to point to drm_encoder rather than
embedding it?
 - Create drm_encoder for the drm_writeback_connector when one is not
specified, so the current drivers can be left unchanged.

>
> > So I think drm_writeback_connector should *not* use the inheritance
> > abstraction because it's a midlayer that should leave that option to the
> > drivers. I think drm_writeback_connector needs to be changed to
> > accommodate that, and, unfortunately, it means current writeback users
> > need to be changed as well.
> >
> > I am not sure, however, if the series at hand is the right
> > approach. Perhaps writeback can be modified to allocate the stuff for
> > you if you prefer it that way, as long as the drm_connector is not
> > embedded in struct drm_writeback_connector.
> >
> > > Nack.
> > >
> > >>    struct drm_writeback_connector writeback;
> > >>  };
> > >>
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >> index c79d1259e49b..5b1e83380c47 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> > >>  {
> > >>    struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> > >>
> > >> -  wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> > >> -  drm_connector_helper_add(&wb_conn->base,
> > >> +  wb_conn->base = &rcrtc->connector;
> > >> +  wb_conn->encoder = &rcrtc->encoder;
> > >> +  wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> > >> +  drm_connector_helper_add(wb_conn->base,
> > >>                             &rcar_du_wb_conn_helper_funcs);
> > >>
> > >>    return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > >> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> > >>    struct drm_framebuffer *fb;
> > >>    unsigned int i;
> > >>
> > >> -  state = rcrtc->writeback.base.state;
> > >> +  state = rcrtc->writeback.base->state;
> > >>    if (!state || !state->writeback_job)
> > >>            return;
> > >>
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
