Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EA9121F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4725510F146;
	Fri, 21 Jun 2024 10:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mLiqWfnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DFA10F146
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:16:36 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6326f1647f6so16389687b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718964996; x=1719569796;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aYfkRkvWDe23stEeUFzeV/AvOcAK0Hj0q8keSG12AZ8=;
 b=mLiqWfnmP0y8hXs8r5Yh+jz5p772qCsFPInO8Mr41RzhglsrpFJq1a+2348XnQKY/j
 bDNOfXxcXHDVwavo8jcudf/bgcyYTn0ve2K0gQfQ64IktscVtUKzlc+gKa1Qn3bkzQot
 urXa5Cx3TN0ODAQqE+MzzG9dXB4pxLw7aiYFAa4ho9TfNK1dGO+cHu1+Jdo7UAXyGT1z
 fXYnnmZhGi6ouF8btO2OYarjEAXcx3j1yU1xlVy2/J92pmOV1+IWfH0r2q8dCTkMHhXo
 ZJaQikE7STUR87V9a41OXqoeKZw1F6zVi+2JmA7gS6eW4kAPndxieNfUHj973YxjBQxi
 okGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718964996; x=1719569796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aYfkRkvWDe23stEeUFzeV/AvOcAK0Hj0q8keSG12AZ8=;
 b=U9No7SjPioBMh0Aa6chUhUXd3BqzvZLipLjqP29WNsgAk4tGKjxAmmOTN7LjcnXnO4
 IhkqpvSiCojItd/82OYmPaAOMY6uVn8FpVZcSN2KBo+GxEod5IvWpTPadH0rnlh5SkUs
 fHu3xpWZraZ5z+RLbdyS28b5yiBr6Q4Rk8/cz204daa8AYvBVOkAO6fwgOMNdFcEVYpO
 KAWMtTM7sbFs2XklgV34aVL2OIdHh4HT4Sl04xPPeNOmDqrSnKFo/e9Hek1JbSo0wvDK
 WyrlvSGAcnbjwOjuF0sRmxb969Sh7C7/6Ni8l/2paveQS8+BU54pduHz/e2tARQ23O0O
 uBsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8whssaU+s2LC3JQ7ZQokhGq2wo368hCbiBXv7CtpyLYXDhHZKlp/cJurRQ/2xYWeay1++1Ek4FCFFKolghthRdLxA5R9q7ejxD+ACWt76
X-Gm-Message-State: AOJu0YxU1HdQyngSZVxKgZyokpV+ewylTZG9JSHP1g2Pd+yLq7h7V3b+
 kHmXmd+nSzqeNxEMxNfIltCe10qf1lbk62ojVfq8zET1tp0SPncgegjL1y0mr6nZ+6YefgHMDRb
 QGxMW+i0TfATPT7+JaaC3RO7/p28AOKVYqxnegg==
X-Google-Smtp-Source: AGHT+IH8aYbD0RUkjq2z0c4IJ/rIlnbdEBXQVtj67wYYcChUYr4IiQ7xDSIiiTqWW1vOiR0ICmufRspTpc1fiOFylgU=
X-Received: by 2002:a05:6902:1885:b0:dfd:bd4d:c0d3 with SMTP id
 3f1490d57ef6-e02be215a0cmr10131266276.58.1718964995604; Fri, 21 Jun 2024
 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
 <20240621-determined-venomous-partridge-eddeb9@houat>
In-Reply-To: <20240621-determined-venomous-partridge-eddeb9@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 Jun 2024 11:16:20 +0100
Message-ID: <CAPY8ntAbaxr-SnqyVR3Drnq-v5Q7ND7tSNzB+pLFFX0wssBAxw@mail.gmail.com>
Subject: Re: [PATCH 00/31] Preparatory patches for BCM2712 (Pi5) support
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Morning Maxime

On Fri, 21 Jun 2024 at 09:55, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Dave,
>
> Thanks for taking the time to send this.
>
> I've gone through most of the patches and it looks pretty good already,
> but I have a few general remarks:
>
>   - We merged in drm-misc-next the new HDMI infrastructure recently and
>     it will heavily conflict with some of these patches, so you need to
>     rebase against either linux-next or drm-misc-next.

Unless I've really messed up, this is already against drm-misc-next -
sorry for not stating that.
I've just pulled and rebased again, but I believe the top commit from
the tree I created the patches against was
c1391205754f drm/tests: add drm_hdmi_state_helper_test MODULE_DESCRIPTION()
merged yesterday. I certainly had my VEC patches in the tree.

>   - The author and SoB fields for my patches don't match anymore,
>     possibly due to mailmap doing its magic.

Too much magic in git :-(
I went through and updated all your SoB fields, but mailmap appears to
mean that the author shown by git log is not the same as the patches
created by git format-patch. Never believe what you see. (That feels
like a bug in git format-patch).

>     You can fix this by using, for the SoB:
>     git filter-branch --msg-filter 'sed -i s/maxime@cerno.tech/mripard@kernel.org/' drm-misc-next..
>
>     And for the authorship:
>     git commit --amend --author="Maxime Ripard <mripard@kernel.org>"
>     for each commit.
>
>   - All of the fixes need Fixes that are currently missing on most tags

Just as long as no one tries pulling them all back to stable. The
number of dependencies would be huge in many cases.

>   - And the commit prefix isn't consistent, especially for vc4_plane.c,
>     the upstream convention so far has been drm/vc4: plane, instead of
>     drm/vc4_plane.

Done.

  Dave

> Maxime
>
> On Thu, Jun 20, 2024 at 04:46:01PM GMT, Dave Stevenson wrote:
> > Hi
> >
> > This set is a number of minor fixes that we've had downstream for a while,
> > and then lays down the some infrastructure changes to facilitate adding support
> > of BCM2712. I'm just finalising those patches so they should follow on fairly
> > soon.
> >
> > Thanks
> >   Dave
> >
> > Dave Stevenson (8):
> >   drm/vc4: Force trigger of dlist update on margins change
> >   drm/vc4: Set AXI panic modes for the HVS
> >   drm/vc4: Limit max_bpc to 8 on Pi0-3
> >   drm/vc4: Don't write gamma luts on 2711
> >   drm/vc4: UV planes vertical scaling must always be enabled
> >   drm/vc4: Fix dlist debug not resetting the next entry pointer
> >   drm/vc4: Remove incorrect limit from hvs_dlist debugfs function
> >   drm/vc4: Move the buffer offset out of the vc4_plane_state
> >
> > Dom Cobley (7):
> >   drm/vc4: vc4_plane: Keep fractional source coords inside state
> >   drm/vc4: Handle fractional coordinates using the phase field
> >   drm/vc4: hdmi: Avoid log spam for audio start failure
> >   drm/vc4_plane: Add support for YUV444 formats
> >   drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
> >   drm/vc4: hdmi: Avoid hang with debug registers when suspended
> >   drm/vc4: hvs: Remove ABORT_ON_EMPTY flag
> >
> > Maxime Ripard (15):
> >   drm/vc4: hdmi: Warn if writing to an unknown HDMI register
> >   drm/vc4: hvs: More logging for dlist generation
> >   drm/vc4: hvs: Print error if we fail an allocation
> >   drm/vc4: plane: Add more debugging for LBM allocation
> >   drm/vc4: plane: Use return variable in atomic_check
> >   drm/vc4: crtc: Move assigned_channel to a variable
> >   drm/vc4: Introduce generation number enum
> >   drm/vc4: Make v3d paths unavailable on any generation newer than vc4
> >   drm/vc4: hvs: Use switch statement to simplify
> >     vc4_hvs_get_fifo_from_output
> >   drm/vc4: hvs: Create hw_init function
> >   drm/vc4: hvs: Create cob_init function
> >   drm/vc4: hvs: Rename hvs_regs list
> >   drm/vc4: plane: Change ptr0_offset to an array
> >   drm/vc4: hvs: Rework LBM alignment
> >   drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers
> >
> > Tim Gover (1):
> >   drm/vc4: Enable SCALER_CONTROL early in HVS init
> >
> >  drivers/gpu/drm/vc4/tests/vc4_mock.c       |  14 +-
> >  drivers/gpu/drm/vc4/vc4_bo.c               |  28 +-
> >  drivers/gpu/drm/vc4/vc4_crtc.c             |  35 ++-
> >  drivers/gpu/drm/vc4/vc4_drv.c              |  22 +-
> >  drivers/gpu/drm/vc4/vc4_drv.h              |  29 +-
> >  drivers/gpu/drm/vc4/vc4_gem.c              |  24 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi.c             |  30 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi_regs.h        |   5 +-
> >  drivers/gpu/drm/vc4/vc4_hvs.c              | 343 +++++++++++++--------
> >  drivers/gpu/drm/vc4/vc4_irq.c              |  10 +-
> >  drivers/gpu/drm/vc4/vc4_kms.c              |  14 +-
> >  drivers/gpu/drm/vc4/vc4_perfmon.c          |  20 +-
> >  drivers/gpu/drm/vc4/vc4_plane.c            | 281 +++++++++++------
> >  drivers/gpu/drm/vc4/vc4_regs.h             |   1 +
> >  drivers/gpu/drm/vc4/vc4_render_cl.c        |   2 +-
> >  drivers/gpu/drm/vc4/vc4_v3d.c              |  10 +-
> >  drivers/gpu/drm/vc4/vc4_validate.c         |   8 +-
> >  drivers/gpu/drm/vc4/vc4_validate_shaders.c |   2 +-
> >  18 files changed, 540 insertions(+), 338 deletions(-)
> >
> > --
> > 2.34.1
> >
