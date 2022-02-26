Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5064C5774
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 19:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3647410E2DE;
	Sat, 26 Feb 2022 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290E710E1EB;
 Sat, 26 Feb 2022 18:27:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so3620577wms.2; 
 Sat, 26 Feb 2022 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iJpvMzlqMC4HheA5RLD+sbf7sH35NJXdLGWveEDGe+M=;
 b=bDRZWXowr5gWVSpFk8sanQENYSDHcZ4YZf2zFYFuccGvdPj9gN+nQyTdrO7sO3KjS7
 DVX2DlIgNwKb4vh20don6o/qxc+XapsmXZIF3pqbcF7aBkIvOlugcjvbbf0a2HaaiNy/
 /u1//I/KqgIFduqSJ0ydFqGVcqhc12jpKFf4AaQSbBt1WVOFkdwpwuLkmdh0+HxjUDwF
 l5FGpyYBHNsFrnu5cJmqtS3tIvrH/Ubu4HbwG20+zNqqY42KQ8ZTliDhdCZE0ct/TgVl
 VlNljpfixtdhT+rtwMo6QgzeFsCLWGssmZHMz+HLvE1eALWiGc0p1yTc3LA8N2RhAY5+
 ADJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJpvMzlqMC4HheA5RLD+sbf7sH35NJXdLGWveEDGe+M=;
 b=NL/Pp7bc5ZO7nCAo4IXxk5quYwOgH4KK2ZTbnbYaOkV2DT5fpUafCBKb/NicSX0Bxf
 hdP/pKYNdxSoVPof2NuhQDQgweAAZJyM9NKj8mdu+gYNCt6ul0BfZY4MgdkqklZqvez8
 57wii0F6aLYlgVbWhSXU6KRb+1pE1B/ZmZi6DwDfkOZMc33yIak39CmQ0j2pdNEY6t0S
 OIq2dCjFqSrUf44QqHUGpgvG+/UQ55+AbJSfGznd7IzFCC1moOjLhkORh6p40FIlwBtR
 Vcpu9GbLPH/oBovk8sleBAPWmRiUDX6ABZcU4JVQOPSw/jNeWc052bbJ+SJ3t42O0IXB
 FZww==
X-Gm-Message-State: AOAM533cKh35UX57jeDuYg0lCLG1vOrQOq3/zB46HnGw3uzHHlT694p+
 KoTTJ1jb4T3kh1Af4GBifz8qx+dAmmFVIWckh9wAaNS1
X-Google-Smtp-Source: ABdhPJz4TyHnbl7OPbNv57SN2l0fZPdXnezIGHo3ul+xiBZSNUFo92UlPc1u6cArJaCeX32uXxWHbyoYiTGbRjrOIwE=
X-Received: by 2002:a05:600c:68b:b0:380:d3e3:5bac with SMTP id
 a11-20020a05600c068b00b00380d3e35bacmr7596607wmn.127.1645900049481; Sat, 26
 Feb 2022 10:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
In-Reply-To: <87v8xxs2hz.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 26 Feb 2022 10:27:59 -0800
Message-ID: <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
To: Jani Nikula <jani.nikula@intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>,
 Carsten Haitzler <carsten.haitzler@arm.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 7:41 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Wed, 02 Feb 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > Hi Jani,
> >
> > On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> >> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> >> > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> >> >> Changing rcar_du driver to accomadate the change of
> >> >> drm_writeback_connector.base and drm_writeback_connector.encoder
> >> >> to a pointer the reason for which is explained in the
> >> >> Patch(drm: add writeback pointers to drm_connector).
> >> >>
> >> >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >> >> ---
> >> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> >> >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> >> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> >> index 66e8839db708..68f387a04502 100644
> >> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> >> >>   const char *const *sources;
> >> >>   unsigned int sources_count;
> >> >>
> >> >> + struct drm_connector connector;
> >> >> + struct drm_encoder encoder;
> >> >
> >> > Those fields are, at best, poorly named. Furthermore, there's no need in
> >> > this driver or in other drivers using drm_writeback_connector to create
> >> > an encoder or connector manually. Let's not polute all drivers because
> >> > i915 doesn't have its abstractions right.
> >>
> >> i915 uses the quite common model for struct inheritance:
> >>
> >>      struct intel_connector {
> >>              struct drm_connector base;
> >>              /* ... */
> >>      }
> >>
> >> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> >> radeon, tilcdc, and vboxvideo.
> >>
> >> We could argue about the relative merits of that abstraction, but I
> >> think the bottom line is that it's popular and the drivers using it are
> >> not going to be persuaded to move away from it.
> >
> > Nobody said inheritance is bad.
> >
> >> It's no coincidence that the drivers who've implemented writeback so far
> >> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> >> because the drm_writeback_connector midlayer does, forcing the issue.
> >
> > Are you sure it's not a coincidence ? :-)
> >
> > The encoder and especially connector created by drm_writeback_connector
> > are there only because KMS requires a drm_encoder and a drm_connector to
> > be exposed to userspace (and I could argue that using a connector for
> > writeback is a hack, but that won't change). The connector is "virtual",
> > I still fail to see why i915 or any other driver would need to wrap it
> > into something else. The whole point of the drm_writeback_connector
> > abstraction is that drivers do not have to manage the writeback
> > drm_connector manually, they shouldn't touch it at all.
>
> The thing is, drm_writeback_connector_init() calling
> drm_connector_init() on the drm_connector embedded in
> drm_writeback_connector leads to that connector being added to the
> drm_device's list of connectors. Ditto for the encoder.
>
> All the driver code that handles drm_connectors would need to take into
> account they might not be embedded in intel_connector. Throughout the
> driver. Ditto for the encoders.

The assumption that a connector is embedded in intel_connector doesn't
really play that well with how bridge and panel connectors work.. so
in general this seems like a good thing to unwind.

But as a point of practicality, i915 is a large driver covering a lot
of generations of hw with a lot of users.  So I can understand
changing this design isn't something that can happen quickly or
easily.  IMO we should allow i915 to create it's own connector for
writeback, and just document clearly that this isn't the approach new
drivers should take.  I mean, I understand idealism, but sometimes a
dose of pragmatism is needed. :-)

BR,
-R

> The point is, you can't initialize a connector or an encoder for a
> drm_device in isolation of the rest of the driver, even if it were
> supposed to be hidden away.
>
> BR,
> Jani.
>
