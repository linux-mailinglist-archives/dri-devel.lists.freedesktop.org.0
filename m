Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15460AF64
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134610E889;
	Mon, 24 Oct 2022 15:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7B710E889;
 Mon, 24 Oct 2022 15:48:06 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w196so11235512oiw.8;
 Mon, 24 Oct 2022 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mKouYzDAVaebW3eRAaoEHgMpUhqQzrmyQsbqdM9olFk=;
 b=d+uPJ7i3lDEL9OCrpv5dKOxgsuOmgGpZW09JLUqrn0dNZ/KLzPiAH/HwNkCdancwYa
 6ylx4UDy9amyFLwBvtCQJ7rPj4QFPcsUK4aJgbpwCoh96KbAbB8p+nKSIt411J1+0PDW
 KGrv9JBaSfsUKSZq/ojP85QBV5Z66TS5AF3GgETk26lVNgHLBsZsP7gi3GDYaf8SjUe/
 roBwJA0N2OQgFp1R7cvuHIi7i8LxPcVua9jkIiBTHGmyaw1Pu/z5u5/CswV/IwZ1t3Gt
 w5ByF2yI2GGqf33fmyBU84GK72+4jp5hhqvZXSfk7sbMfw51TXh9s8EuZNEJa5juA2Nf
 cOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mKouYzDAVaebW3eRAaoEHgMpUhqQzrmyQsbqdM9olFk=;
 b=N087RVkmOtQvnj0jZyPwoOU1bGItlCF/0zYQjrmCinN1kw2rtLmyqPD0gDFv5P4i72
 X1Y4jd6Ij8t9XyvQf1Nuyu1mrPKKyC/dcJpEYmlhyiTGZobpfiSv/FpvwwoHQV3Dhh6X
 Ds19zyl4Yfh5evCdFXuPPdFYLV/TbfKln7fGJ/5nzwqksJYd+/KvboC+A6HyAAJJaCa2
 oEoPyT9HqpbNIDGhI+7iCr+zRO57J8bO4+76Q+gy8q413M2PeTlkJsBA15aJ/Dbkkzht
 ud4ZOXc9kzgDCAR2kNKnmyLWb1yYYk/164XKP1UgEVazA7c5h5W3UtPAgAfq6jR2HhRs
 yQPg==
X-Gm-Message-State: ACrzQf0a56AHzpDUQq8Lwg3go81KHG307tz3AK4yhRUqkrNfKjHe6ODo
 +FgWJ0YfOP7VQMpb1MP6bwW4JN0NoQh6RyfixYA=
X-Google-Smtp-Source: AMsMyM4JPf2XNUKCev2tt817BkiDtzcvTdVMvXtyv3j+6EujUzjIR7g1oGFmi6AUa77aPWJnB6N2zok7ifMRHt5eCs4=
X-Received: by 2002:a05:6808:309b:b0:355:196b:f8f0 with SMTP id
 bl27-20020a056808309b00b00355196bf8f0mr16202307oib.38.1666626485561; Mon, 24
 Oct 2022 08:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
In-Reply-To: <20221024124323.tfyxcadyd4nz56jz@houat>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Oct 2022 08:48:15 -0700
Message-ID: <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
Subject: Re: Must-Pass Test Suite for KMS drivers
To: maxime@cerno.tech
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Arkadiusz Hiler <arek@hiler.eu>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
>
> Hi,
>
> I've discussing the idea for the past year to add an IGT test suite that
> all well-behaved KMS drivers must pass.
>
> The main idea behind it comes from v4l2-compliance and cec-compliance,
> that are being used to validate that the drivers are sane.
>
> We should probably start building up the test list, and eventually
> mandate that all tests pass for all the new KMS drivers we would merge
> in the kernel, and be run by KCi or similar.

Let's get https://patchwork.freedesktop.org/patch/502641/ merged
first, that already gives us a mechanism similar to what we use in
mesa to track pass/fail/flake

Beyond that, I think some of the igt tests need to get more stable
before we could consider a "mustpass" list.  The kms_lease tests seem
to fail on msm due to bad assumptions in the test about which CRTCs
primary planes can attach to.  The legacy-cursor crc tests seem a bit
racy (there was a patch posted for that, not sure if it landed yet),
etc.

The best thing to do is actually start running CI and tracking xfails
and flakes ;-)

BR,
-R

> I did a first pass to create a draft of such a test-suite, which would
> contain:
>
> igt@core_auth@basic-auth
> igt@core_auth@getclient-master-drop
> igt@core_auth@getclient-simple
> igt@core_auth@many-magics
> igt@core_getclient
> igt@core_getstats
> igt@core_getversion
> igt@core_hotunplug@hotrebind-lateclose
> igt@core_hotunplug@hotunbind-rebind
> igt@core_hotunplug@unbind-rebind
> igt@core_setmaster
> igt@core_setmaster_vs_auth
> igt@device_reset@unbind-reset-rebind
> igt@drm_read
> igt@dumb_buffer
> igt@fbdev
> igt@feature_discovery@display
> igt@kms_3d
> igt@kms_addfb_basic
> igt@kms_async_flips
> igt@kms_color
> igt@kms_concurrent
> igt@kms_cursor_crc
> igt@kms_cursor_edge_walk
> igt@kms_cursor_legacy@basic-busy-flip-before-cursor
> igt@kms_cursor_legacy@basic-flip-after-cursor
> igt@kms_cursor_legacy@basic-flip-after-cursor
> igt@kms_display_modes
> igt@kms_dither
> igt@kms_dp_aux_dev
> igt@kms_flip@basic-flip-vs-dpms
> igt@kms_flip@basic-flip-vs-modeset
> igt@kms_flip@basic-flip-vs-wf_vblank
> igt@kms_flip@basic-plain-flip
> igt@kms_flip_event_leak@basic
> igt@kms_force_connector_basic@force-connector-state
> igt@kms_force_connector_basic@force-edid
> igt@kms_force_connector_basic@force-load-detect
> igt@kms_force_connector_basic@prune-stale-modes
> igt@kms_getfb
> igt@kms_hdmi_inject
> igt@kms_hdr
> igt@kms_invalid_mode
> igt@kms_lease
> igt@kms_panel_fitting
> igt@kms_pipe_crc_basic
> igt@kms_plane_alpha_blend
> igt@kms_plane
> igt@kms_plane_cursor
> igt@kms_plane_lowres
> igt@kms_plane_multiple
> igt@kms_plane_scaling
> igt@kms_prop_blob
> igt@kms_properties
> igt@kms_rmfb
> igt@kms_scaling_modes
> igt@kms_sequence
> igt@kms_setmode
> igt@kms_sysfs_edid_timing
> igt@kms_tv_load_detect
> igt@kms_universal_plane
> igt@kms_vblank
> igt@kms_vrr
> igt@kms_writeback
>
> Most of them are skipped on vc4 right now, but I could see that some of
> them fail already (kms_rmfb, core_hotunplug), so it proves to be useful
> already.
>
> What do you think? Is there some more tests needed, or did I include
> some tests that shouldn't have been there?
>
> Thanks!
> Maxime
