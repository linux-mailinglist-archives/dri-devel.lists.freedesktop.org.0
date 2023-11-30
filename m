Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A17FEE09
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 12:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C210E504;
	Thu, 30 Nov 2023 11:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B3010E6DF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 11:34:50 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3b85d97a529so130249b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701344089; x=1701948889; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XHw80n538+Gx5ghn40vIbarPIkmDFhTkXdjB2fzx/LU=;
 b=TvgH8inO0MW7ptFVPd5w1Qp9Gl9fv1cMJQW9jXY63e5EC5mn7pAA8bLv3dVIJYFF10
 GK8AJ3P+Nb9RXlDB0yngpYWDz+xt1UAgrUC1SnTI19mZKjQW7nGsdoRPse0i73Pj6yjC
 WuaBeSUawLmINqu8o1V7zh+jng55HknVB4SIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701344089; x=1701948889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XHw80n538+Gx5ghn40vIbarPIkmDFhTkXdjB2fzx/LU=;
 b=qGWcb62RbH1yJ5O8sBNdNNRSH26hUFNgRVHRx0pAJTRz1nebMFJtKkheqS3GP3KC80
 PcKODnOWCBssb8REevv3shMlRALnUVK3v7xzEQw2hMiV+KFfafEltUEDfJ0XUJTyYwKq
 blEuaC379UeEjMKJX4uTkTonymL2+hUcNYrL4vRmMJMYwl2HtS0e15+wlacsssugHxM+
 sNoxF1QxRVcUA6uTizS/nlNFoW2465V+9odgcnbXrr5roFKT+7McSrxDBPQFhgeYjLU2
 MbcGbwmVA1VDl6uz67BY5JEP5yHNMiRTxjMuRbqlXVrpAYW7pJxpZoXUuNr1IufYhpGJ
 tLpg==
X-Gm-Message-State: AOJu0Ywuu4+ybKY8TvDvjs3w/KQNGg2bDOj6Fz+GyNPzS1/6PNzoNLwa
 j1W0UcQnXc1ILg3PbxWxRL8DH0lFNRRq+zQiuSSbWA==
X-Google-Smtp-Source: AGHT+IH0N/VIzZwe567QMp3cIDizl5ebBnGHUsjq9IIB8lLm8pqaq5ZetdamDtbtwXmfJNw703wAjffh1A9ZXlOIsCM=
X-Received: by 2002:a05:6870:168d:b0:1fa:132a:ad11 with SMTP id
 j13-20020a056870168d00b001fa132aad11mr23165211oae.2.1701344089322; Thu, 30
 Nov 2023 03:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20231116195812.906115-1-mwen@igalia.com>
 <bc60a7fd-8de7-4856-b5ed-e1172b9b79f7@amd.com>
In-Reply-To: <bc60a7fd-8de7-4856-b5ed-e1172b9b79f7@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Nov 2023 12:34:37 +0100
Message-ID: <CAKMK7uH1BPhEm8vM=rFfAho06T-f+osjKX4ofOkjMazrhSouKw@mail.gmail.com>
Subject: Re: [PATCH v5 00/32] drm/amd/display: add AMD driver-specific
 properties for color mgmt
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, kernel-dev@igalia.com, sunpeng.li@amd.com,
 mripard@kernel.org, Melissa Wen <mwen@igalia.com>, sungjoon.kim@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 23:11, Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2023-11-16 14:57, Melissa Wen wrote:
> > Hello,
> >
> > This series extends the current KMS color management API with AMD
> > driver-specific properties to enhance the color management support on
> > AMD Steam Deck. The key additions to the color pipeline include:
> >
>
> snip
>
> > Melissa Wen (18):
> >   drm/drm_mode_object: increase max objects to accommodate new color
> >     props
> >   drm/drm_property: make replace_property_blob_from_id a DRM helper
> >   drm/drm_plane: track color mgmt changes per plane
>
> If all patches are merged through amd-staging-drm-next I worry that
> conflicts creep in if any code around replace_property_blob_from_id
> changes in DRM.
>
> My plan is to merge DRM patches through drm-misc-next, as well
> as include them in the amd-staging-drm-next merge. They should then
> fall out at the next amd-staging-drm-next pull and (hopefully)
> ensure that there is no conflict.
>
> If no objections I'll go ahead with that later this week.

Double-merging tends to be the worst because git doesn't realize the
commits match, which actually makes the conflicts worse when they
happen (because the 3-way merge diff gets absolute confused by all the
changed context and misplaces everything to the max). So please don't,
_only_ every cherry-pick when a patch in -next is also needed in
-fixes, and we didn't put it into the right tree. But even that is a
bit tricky and should only be done by maintainers (using dim
cherry-pick if it's drm-misc) because the conflicts tend to be bad and
need to be sorted out with backmerges sooner than later.

For this case merge everything through one tree with the right acks,
pull to drm-next asap and then backmerge into the other tree. Here
probably amdgpu-next with drm-misc maintainer acks for the 3 core
patches. Or if amdgpu-next pull won't come for a while, put them into
drm-misc-next and just wait a week until it's in drm-next, then
forward amdgpu-next.

Cheers, Sima

> Harry
>
> >   drm/amd/display: add driver-specific property for plane degamma LUT
> >   drm/amd/display: explicitly define EOTF and inverse EOTF
> >   drm/amd/display: document AMDGPU pre-defined transfer functions
> >   drm/amd/display: add plane 3D LUT driver-specific properties
> >   drm/amd/display: add plane shaper LUT and TF driver-specific
> >     properties
> >   drm/amd/display: add CRTC gamma TF driver-specific property
> >   drm/amd/display: add comments to describe DM crtc color mgmt behavior
> >   drm/amd/display: encapsulate atomic regamma operation
> >   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
> >   drm/amd/display: reject atomic commit if setting both plane and CRTC
> >     degamma
> >   drm/amd/display: add plane shaper LUT support
> >   drm/amd/display: add plane shaper TF support
> >   drm/amd/display: add plane 3D LUT support
> >   drm/amd/display: add plane CTM driver-specific property
> >   drm/amd/display: add plane CTM support
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  91 ++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 108 +++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 818 ++++++++++++++++--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 232 ++++-
> >  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
> >  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
> >  drivers/gpu/drm/drm_atomic.c                  |   1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
> >  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
> >  drivers/gpu/drm/drm_property.c                |  49 ++
> >  include/drm/drm_mode_object.h                 |   2 +-
> >  include/drm/drm_plane.h                       |   7 +
> >  include/drm/drm_property.h                    |   6 +
> >  include/uapi/drm/drm_mode.h                   |   8 +
> >  16 files changed, 1377 insertions(+), 109 deletions(-)
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
