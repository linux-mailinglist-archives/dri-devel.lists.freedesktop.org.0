Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39308620225
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 23:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115510E522;
	Mon,  7 Nov 2022 22:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D28910E507;
 Mon,  7 Nov 2022 22:09:02 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id h132so5819683oif.2;
 Mon, 07 Nov 2022 14:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8WFpgQq8Y7QedOh/YJZQQXewgEix+V6uGX2TcXdO9w=;
 b=p00tkjLeys45tVFogBbZVXTld2p3Bl/5du47Z4DW/v5l96zufbuask9yCbhyh+OxqP
 ahFE9Njdb3T068ts6uYo3rAt8rTxoLXn+wFbhprbr1slMhMxP9NMLZ2gLpPVQUUrPZi3
 9dd2bueE9bisemxqMQM6YksM9yBTlrbsA/KGyXqe6QDC46vo4lySLghy0dRiulId6qhb
 WwzqRH1msRqwPKBmlOw80Z3wl2RWuX3zARyvkRTSLogrkIw4WOYhkMJVZjgvQ6hj9Wic
 Bo9KaXz1cdjRcoYX+wS2qzX1tnL5tD0aJzecs4+AjLtZ2Tvjv8KbLWi1suiIAJ/QLkBJ
 dh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8WFpgQq8Y7QedOh/YJZQQXewgEix+V6uGX2TcXdO9w=;
 b=cRKgTDj1mA8NZu9tkSAw//T8h2PEA8yCPGpapoIXnauiFTuf3pzBpE3CiilMXRNAIy
 09t+yKvw3dnqeAcMyjPO6+U1SH6zrZgo0Y11ZBKAINVsW9iMQGpSrCPB8HaLqPYs+p+V
 mMdV22JHGn95kqnuKDbNgNYM2fFhpyqfQFj1WI+L72CSujqFHHjfjlNAuHxgKXqjMlUg
 +7QdMyYbL5CIkEijgsskGGEvjJ4dJLlC2jJAWAUUegqWTXttoSx2dRp6uba1KwD+coAm
 y5QNyhZxEXRQnUa4jm9HR+FmxybeyIXCl3FqhcEYAW6SrTeYGcHCnYFfk33eRMD8sEtd
 g6Hg==
X-Gm-Message-State: ACrzQf0Le4HiBx7ZQKjNuN3/BZ7RROHEfxwLq1v7e73RoEwLxR9LjzCk
 bFqbAsOlA/szRNivsaw2RFaNCz+SGYNVqaiq0cY=
X-Google-Smtp-Source: AMsMyM6/OBPe2ZXj1kLtWZltCntmAmNkyMEjkPp2PDd4GS0xwenw3PAkRHur8ygD2PTiKh6kH2Vz/qm0LZ0rOJC4pcg=
X-Received: by 2002:a05:6808:300d:b0:35a:7041:1200 with SMTP id
 ay13-20020a056808300d00b0035a70411200mr7587423oib.38.1667858941028; Mon, 07
 Nov 2022 14:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
In-Reply-To: <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Nov 2022 14:09:19 -0800
Message-ID: <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 1:32 PM Jessica Zhang <quic_jesszhan@quicinc.com> wr=
ote:
>
>
>
> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> >> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >> properties. When the color fill value is set, and the framebuffer is s=
et
> >> to NULL, memory fetch will be disabled.
> >
> > Thinking a bit more universally I wonder if there should be
> > some kind of enum property:
> >
> > enum plane_pixel_source {
> >       FB,
> >       COLOR,
> >       LIVE_FOO,
> >       LIVE_BAR,
> >       ...
> > }
>
> Hi Ville,
>
> Makes sense -- this way, we'd also lay some groundwork for cases where
> drivers want to use other non-FB sources.
>
> >
> >> In addition, loosen the NULL FB checks within the atomic commit callst=
ack
> >> to allow a NULL FB when color_fill is nonzero and add FB checks in
> >> methods where the FB was previously assumed to be non-NULL.
> >>
> >> Finally, have the DPU driver use drm_plane_state.color_fill and
> >> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fil=
l,
> >> and add extra checks in the DPU atomic commit callstack to account for=
 a
> >> NULL FB in cases where color_fill is set.
> >>
> >> Some drivers support hardware that have optimizations for solid fill
> >> planes. This series aims to expose these capabilities to userspace as
> >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Androi=
d
> >> hardware composer HAL) that can be set by apps like the Android Gears
> >> app.
> >>
> >> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to=
 a
> >> DRM format, setting COLOR_FILL to a color fill value, and setting the
> >> framebuffer to NULL.
> >
> > Is there some real reason for the format property? Ie. why not
> > just do what was the plan for the crttc background color and
> > specify the color in full 16bpc format and just pick as many
> > msbs from that as the hw can use?
>
> The format property was added because we can't assume that all hardware
> will support/use the same color format for solid fill planes. Even for
> just MSM devices, the hardware supports different variations of RGB
> formats [1].

Sure, but the driver can convert the format into whatever the hw
wants.  A 1x1 color conversion is not going to be problematic ;-)

BR,
-R

> Thanks,
>
> Jessica Zhang
>
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_plane.c#L697
>
> >
> >>
> >> Jessica Zhang (3):
> >>    drm: Introduce color fill properties for drm plane
> >>    drm: Adjust atomic checks for solid fill color
> >>    drm/msm/dpu: Use color_fill property for DPU planes
> >>
> >>   drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++---------=
--
> >>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
> >>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
> >>   drivers/gpu/drm/drm_plane.c               |  8 +--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++-------=
-
> >>   include/drm/drm_atomic_helper.h           |  5 +-
> >>   include/drm/drm_blend.h                   |  2 +
> >>   include/drm/drm_plane.h                   | 28 ++++++++++
> >>   10 files changed, 188 insertions(+), 76 deletions(-)
> >>
> >> --
> >> 2.38.0
> >
> > --
> > Ville Syrj=C3=A4l=C3=A4
> > Intel
