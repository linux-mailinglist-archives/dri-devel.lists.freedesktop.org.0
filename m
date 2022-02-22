Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176654BF014
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 04:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B3010E545;
	Tue, 22 Feb 2022 03:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C4410E545
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:33:03 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id c7so17559528qka.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 19:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLWBhKe0X/ruh/r28hHG79mG03RtefhG1kN8xtLSGgc=;
 b=y5R0Wp9ynN/ZP2BYjD43SEkuS2nEX+NDWjzm4xL0lSe+nKfDb4UQNJArEJHOL6h7Fp
 A6MmSPJCdf64GqnhUYFpWeMYPGJRhbdWJl6/nF2OEEPtJ0I6KYltiDsS3lhCUgfztbe7
 V4Xkm/6wXxaDvT7CZhTAzDGN7ekSOrOwKeJ3fyxoa8+tnfxR8daid9U2sbKd4QgYrsuV
 6jOkEen/wq0l73nJzYSogD3O0s4CYYUbFw+4bqNpW6F5zmMFs0QgTlll1bvaG7dwgKVy
 nI5x4rCpdxn+f5kG5nGNjR53zTbDVi5r878W00FRoRm2OsXbYyfk115M40PYzBZwhdsf
 02LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLWBhKe0X/ruh/r28hHG79mG03RtefhG1kN8xtLSGgc=;
 b=oyy/U1X1/LijvruTQHJbS5w3YvbQd9SIN3dINnTGgQ+dxttcoL7xNBTsTA1tWy7nO5
 0jp20gw828gdNT4Ib31kCk6L8J93g8AlZ9KUUaEB/QI1NqNiw3eecuNFpV329AI1W3WR
 QaRp6w9YJbtsl7Cx+5xYhsdVv7RGD2XnfeGs1X5a8N499WOEE8yr0+drlpI18mGMBlX2
 IYnF44hJicqgWPNE3plYrR9GEHRpDqaF5c+xowl8+LLz3O7OX8WwWR+b7/TpZnPF6AZi
 u/MY2dibNhs8LEYXbBARamtO0YuMPgWmN426zbcJPQSS/85ha0/GcIDPEtqSYXmI2pvn
 aaJg==
X-Gm-Message-State: AOAM532CbAhTqgNPXck2TudNhFlUagsW0kFq+Zqfs7lcrA4gSJMl8WXc
 TlKbsEPotKFgs5e5RRO4HA6GZIuehXL7vDjf250Oag==
X-Google-Smtp-Source: ABdhPJw46TUgRsjaAYwmuHOKYwpFeQyyRSsJwy+d1Dq1hDqgAXGMeD2OMee/voUqaBanPsg9tVyKTp0XBNq4m6kNrZs=
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr11687543qko.203.1645500782561; Mon, 21
 Feb 2022 19:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <CAA8EJpqr6MB64EAtLU3nBjgjx1COwn4auenCCw4kHB489VG0CA@mail.gmail.com>
 <d69038d6-a853-d2d9-81de-0ad10c4d6a3a@quicinc.com>
 <54fc4268-6418-817b-7cec-28a9dc9ba7b5@quicinc.com>
 <YgSbk11nQ6bd4SWK@pendragon.ideasonboard.com>
In-Reply-To: <YgSbk11nQ6bd4SWK@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Feb 2022 06:32:50 +0300
Message-ID: <CAA8EJpqCgnLiQ7G+xY0E1j4PPbvPo+d-4vN+8-Nw84TWMSDmYA@mail.gmail.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Feb 2022 at 07:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Abhinav,
>
> On Wed, Feb 09, 2022 at 05:40:29PM -0800, Abhinav Kumar wrote:
> > Hi Laurent
> >
> > Gentle reminder on this.
>
> I won't have time before next week I'm afraid.

Laurent, another gentle ping.

>
> > On 2/6/2022 11:20 PM, Abhinav Kumar wrote:
> > > Hi Laurent
> > >
> > > On 2/6/2022 3:32 PM, Dmitry Baryshkov wrote:
> > >> On Wed, 2 Feb 2022 at 16:26, Laurent Pinchart
> > >> <laurent.pinchart@ideasonboard.com> wrote:
> > >>>
> > >>> Hi Jani,
> > >>>
> > >>> On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> > >>>> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> > >>>>> On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> > >>>>>> Changing rcar_du driver to accomadate the change of
> > >>>>>> drm_writeback_connector.base and drm_writeback_connector.encoder
> > >>>>>> to a pointer the reason for which is explained in the
> > >>>>>> Patch(drm: add writeback pointers to drm_connector).
> > >>>>>>
> > >>>>>> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > >>>>>> ---
> > >>>>>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> > >>>>>>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> > >>>>>>   2 files changed, 7 insertions(+), 3 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >>>>>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >>>>>> index 66e8839db708..68f387a04502 100644
> > >>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >>>>>> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> > >>>>>>     const char *const *sources;
> > >>>>>>     unsigned int sources_count;
> > >>>>>>
> > >>>>>> +  struct drm_connector connector;
> > >>>>>> +  struct drm_encoder encoder;
> > >>>>>
> > >>>>> Those fields are, at best, poorly named. Furthermore, there's no
> > >>>>> need in
> > >>>>> this driver or in other drivers using drm_writeback_connector to
> > >>>>> create
> > >>>>> an encoder or connector manually. Let's not polute all drivers because
> > >>>>> i915 doesn't have its abstractions right.
> > >>>>
> > >>>> i915 uses the quite common model for struct inheritance:
> > >>>>
> > >>>>        struct intel_connector {
> > >>>>                struct drm_connector base;
> > >>>>                /* ... */
> > >>>>        }
> > >>>>
> > >>>> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> > >>>> radeon, tilcdc, and vboxvideo.
> > >>>>
> > >>>> We could argue about the relative merits of that abstraction, but I
> > >>>> think the bottom line is that it's popular and the drivers using it are
> > >>>> not going to be persuaded to move away from it.
> > >>>
> > >>> Nobody said inheritance is bad.
> > >>>
> > >>>> It's no coincidence that the drivers who've implemented writeback so
> > >>>> far
> > >>>> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> > >>>> because the drm_writeback_connector midlayer does, forcing the issue.
> > >>>
> > >>> Are you sure it's not a coincidence ? :-)
> > >>>
> > >>> The encoder and especially connector created by drm_writeback_connector
> > >>> are there only because KMS requires a drm_encoder and a drm_connector to
> > >>> be exposed to userspace (and I could argue that using a connector for
> > >>> writeback is a hack, but that won't change). The connector is "virtual",
> > >>> I still fail to see why i915 or any other driver would need to wrap it
> > >>> into something else. The whole point of the drm_writeback_connector
> > >>> abstraction is that drivers do not have to manage the writeback
> > >>> drm_connector manually, they shouldn't touch it at all.
> > >>
> > >> Laurent, I wanted to shift a bit from the question of drm_connector to
> > >> the question of drm_encoder being embedded in the
> > >> drm_writeback_connector.
> > >> In case of the msm driver the drm_encoder is not a lightweight entity,
> > >> but a full-featured driver part. Significant part of it can be shared
> > >> with the writeback implementation, if we allow using a pointer to the
> > >> external drm_encoder with the drm_writeback_connector.
> > >> Does the following patch set stand a chance to receive your ack?
> > >>   - Switch drm_writeback_connector to point to drm_encoder rather than
> > >> embedding it?
> > >>   - Create drm_encoder for the drm_writeback_connector when one is not
> > >> specified, so the current drivers can be left unchanged.
> > >>
> > >
> > > I second Dmitry's request here. For the reasons he has mentioned along
> > > with the possibility of the writeback encoder being shared across
> > > display pipelines, strengthens our request of the drm encoder being a
> > > pointer inside the drm_writeback_connector instead of embedding it.
> > >
> > > Like I had shown in my RFC, in case the other drivers dont specify one,
> > > we can allocate one:
> > >
> > > https://patchwork.kernel.org/project/dri-devel/patch/1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com/
> > >
> > >
> > > We think this should be a reasonable accomodation to the existing
> > > drm_writeback driver.
> > >
> > > Thanks
> > >
> > > Abhinav
> > >
> > >>>
> > >>>> So I think drm_writeback_connector should *not* use the inheritance
> > >>>> abstraction because it's a midlayer that should leave that option to
> > >>>> the
> > >>>> drivers. I think drm_writeback_connector needs to be changed to
> > >>>> accommodate that, and, unfortunately, it means current writeback users
> > >>>> need to be changed as well.
> > >>>>
> > >>>> I am not sure, however, if the series at hand is the right
> > >>>> approach. Perhaps writeback can be modified to allocate the stuff for
> > >>>> you if you prefer it that way, as long as the drm_connector is not
> > >>>> embedded in struct drm_writeback_connector.
> > >>>>
> > >>>>> Nack.
> > >>>>>
> > >>>>>>     struct drm_writeback_connector writeback;
> > >>>>>>   };
> > >>>>>>
> > >>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >>>>>> b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >>>>>> index c79d1259e49b..5b1e83380c47 100644
> > >>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > >>>>>> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct
> > >>>>>> rcar_du_device *rcdu,
> > >>>>>>   {
> > >>>>>>     struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> > >>>>>>
> > >>>>>> -  wb_conn->encoder.possible_crtcs = 1 <<
> > >>>>>> drm_crtc_index(&rcrtc->crtc);
> > >>>>>> -  drm_connector_helper_add(&wb_conn->base,
> > >>>>>> +  wb_conn->base = &rcrtc->connector;
> > >>>>>> +  wb_conn->encoder = &rcrtc->encoder;
> > >>>>>> +  wb_conn->encoder->possible_crtcs = 1 <<
> > >>>>>> drm_crtc_index(&rcrtc->crtc);
> > >>>>>> +  drm_connector_helper_add(wb_conn->base,
> > >>>>>>                              &rcar_du_wb_conn_helper_funcs);
> > >>>>>>
> > >>>>>>     return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > >>>>>> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct
> > >>>>>> rcar_du_crtc *rcrtc,
> > >>>>>>     struct drm_framebuffer *fb;
> > >>>>>>     unsigned int i;
> > >>>>>>
> > >>>>>> -  state = rcrtc->writeback.base.state;
> > >>>>>> +  state = rcrtc->writeback.base->state;
> > >>>>>>     if (!state || !state->writeback_job)
> > >>>>>>             return;
> > >>>>>>
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
