Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258DA77EA9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9BB10E5B2;
	Tue,  1 Apr 2025 15:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="mF3pMUUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7410E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:14:44 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-476b89782c3so62687121cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1743520483; x=1744125283;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kF5PXIoeMjDQGNj6HtCBg+FijPQ8aiEElhntbyKpmQU=;
 b=mF3pMUUWjNIcDO3LgIHlmvJKoeek/XhbfN6xAZARdEGF+Ohy7pHf8t+aNobCFUud+E
 jOd540F/mRvL62mY2ymngMQUpQ06GI1d5brPdHhJVw381xh0R2+KYbaK7G4qJu32zt1A
 ZR5KnwT08+NJ92BMGPt9JY+EXNChw9R3BaspVMrJpGTa8/2aQYfD2R0bYWK41jHSaDLw
 2/2oujT+WCcf6AgjSP/ujg8pV1kO0msnP0/4Gm9ffysGqjopMaWa09I8jIGe+O0bP+Nq
 m1rdwlESYoCtLF/7N69IdUfVu0U5qaavaBFkcQ4uhUreF+QCYE1HgQXBT3OFzql198xW
 n8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743520483; x=1744125283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kF5PXIoeMjDQGNj6HtCBg+FijPQ8aiEElhntbyKpmQU=;
 b=O9qFIHE1IJQ3GjjJxV4HolVD/6g7ILHyMJv96sobdznv4vLwVpdaLlg7Y2bpHPddrE
 YeR5WqGPJ/7cS8FgGxIN94HMxjbbm7bMc/CDMejodeBj6mhKh16j1+uVFHAJGr3iG1mp
 4VBYJkeoj0/0JhJXWht9S36whx1H7o0ISSlx+Hs+fczxyyPwAoteAvMHKlybHxBBIM5g
 Pk3UtsEaRoLAq9viuZjco5pWekjExbJCWtkU9DSkdvishBFaWrXaG5t95O5w91zXcfZY
 TckyJ0ecGYq7uvR2CmHYu7V73NcjmnGm0oV60CUBf2ykriABGMfGGbpANWwg7Nu2aIJj
 qn/w==
X-Gm-Message-State: AOJu0Yx6a+BIg79C+o8cKI8hi3gtk5TO4eeimbtKNEUG9/ecs40M9U68
 DtCQGa/PUG9GEJgxIgTiaSHp3AX3xiO2zJHZ6r198ofyPgLKkTDP/n+aAtvHGgFS69mdEneMz3d
 mFCSBeO0b1qP8su/Tbp1ww6LHCMtTJWhX5LC70g==
X-Gm-Gg: ASbGncvQxKy/BKxJdE3PjFJMB7d/95QrCdpmfQm6FXszgpDvLCpYmZYYnke/7LlNUm9
 PNL2b4TM/XObbxMN+M9YZoISPUggqiIMIS1b2D1i3+sDThm8VM4kb23DYTvUj+4FAx4kOfHQQYR
 T8PmhURiD1w8VWQ3bYVN+zKBM=
X-Google-Smtp-Source: AGHT+IG/6o22bgLO8gypopmq93KMhQXUD2ouGdW3beT+zn6GpJZioeneAByX4hRsQ5M6CJAW9PYHbQYESkoa1FYhXQo=
X-Received: by 2002:a05:6214:300b:b0:6e8:f949:38c6 with SMTP id
 6a1803df08f44-6eef5ed4831mr51479786d6.33.1743520483018; Tue, 01 Apr 2025
 08:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
In-Reply-To: <20250326234748.2982010-7-alex.hung@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 1 Apr 2025 16:14:31 +0100
X-Gm-Features: AQ5f1Jq83jhYE5DeMNdtCJBK9LdwSzxVMKHurDwEQvQ5LjhNo6OcNPPflV6X384
Message-ID: <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
To: Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
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

Hi Alex,

On Wed, 26 Mar 2025 at 23:50, Alex Hung <alex.hung@amd.com> wrote:
> +static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> +                           struct drm_plane *plane, enum drm_colorop_type type)
> +{
> +       struct drm_mode_config *config = &dev->mode_config;
> +       struct drm_property *prop;
> +       int ret = 0;
> +
> +       ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
> +       if (ret)
> +               return ret;
> +
> +       colorop->base.properties = &colorop->properties;
> +       colorop->dev = dev;
> +       colorop->type = type;
> +       colorop->plane = plane;

'plane' seems really incongruous here. The colorop can be created for
any number of planes, but we're setting it to always be bound to a
single plane at init, and that can only be changed later.

I can see the sense in allowing different pipelines to move between
different planes, but then it shouldn't be set at init time. I think
you want to just drop the 'plane' argument here, and only set the
plane during an atomic commit when actually switching the state.

It would also be helpful for userspace to know how color pipelines
could be used, and to back that up with igt. Questions I have whilst
reading this:

1. Is it guaranteed that, if any plane on a device supports the
COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
(Given the amdgpu cursor-plane discussion, it looks like no, which is
unfortunate but oh well.)

2. Is it guaranteed that, if a COLOR_PIPELINE property exists on a
plane, that BYPASS will be one of the supported values? (The current
implementation does this, which seems sensible, but if the plan is to
not make this a uAPI invariant, e.g. to support planes with mandatory
CM steps, this should probably be explicitly documented.)

3. Can a given color pipeline potentially be used on different planes,
i.e. a colorop used to represent a separate hardware processing block
which may be used on any plane but only one plane at a time? (This
should be documented either way, and if they are unique per plane, igt
should enforce this.)

3. Can a given color pipeline be active on multiple planes at a time?
(If so, the implementation definitely needs rethinking: the colorop
would need to have a list of planes.)

4. Can a given color pipeline be active on multiple planes on multiple
CRTCs at a time?

5. For a given colorop property, is it an invariant that the colorop
will only appear in one color pipeline at a time? (I believe so, but
this probably needs documenting and/or igt.)

Either way, I suspect that clorop->plane is the wrong thing to do, and
that it maybe wants to be a list of planes in the drm_colorop_state?

Cheers,
Daniel
