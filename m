Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021B67DCC0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE15210E3E4;
	Fri, 27 Jan 2023 03:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210F10E3E4;
 Fri, 27 Jan 2023 03:55:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k4so4939040eje.1;
 Thu, 26 Jan 2023 19:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ocwlvVVRwbuYPWxcE07iTDqSaV/OyweQxO5lM24FLrg=;
 b=JR6e/ZUvBcVeqhG6fnc+zYKDWAhSlViQ7SBV+T34Wn7KIThgieQBvXEN/NkOF8CjX4
 c9qUgJDrGdWvP/ktrRjss5iiciB9cRdjI3pTQD56ZGf396wRWBtBUZf7Mhfh5oZ28LIh
 9P3F7TALrIFRYkyU+QRFTZ2o/psJ3Mo0GBAdhIMEPeB640SzgjUfu/dSqcGMyVhvUx9Z
 xpF+/XrNxuC0zljqM5I9Bvw7e3uUJoPn0nIdQmymtLk51hxuhir2ZgXFCQ2dY9GBvlPI
 B6j7w2t0PzqAQpJUCarlENo/6Q6NyBU2rWywpEVlcXho1RF9cBEkT32/gG/muTKBq94u
 OjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocwlvVVRwbuYPWxcE07iTDqSaV/OyweQxO5lM24FLrg=;
 b=UiSjHhNtL7q5B5jHh1FZegtD7EEgUhw6Z0gEoGknWzpPI4X/MHv3Qw+Zm6FhmlOvt1
 Z1xBa3Fm69uUCmXriciwUz9mcWr7hG6mkTHoFmT6PkeWp4/9NXwav/BKMm8UeByuDULH
 egBRjY3gHfu8ktEgPArKg2j84fNRThTC1Aj8rTfnfxDhxyNZujoQZppXDmlH05PUlqnq
 GXU203bCSIHH91yge7R9noBKB3I8QbjXeaR9jWK4lNWKSzZbE9u72QgQJxbDDjns9gCa
 ma47TfpZKlOnBfodd9uBaQaNZlZ+pK5VYVYPGUcIOiXTkR2ljKdc0JC+TTNl1RkMCsB1
 NZbA==
X-Gm-Message-State: AFqh2kpWBIjryR8Ht+1SOJscQzlV+ViU0kg2fhpTmaJ1WqRdhjd+Jnf7
 rDFCVPqMgTld23uV2pLxq3YO8X5rMTdg9pLaqHU=
X-Google-Smtp-Source: AMrXdXsS68fiCxg4Ak+9N/1iWAU6p9z/wehS+2LyShiGBRRDnGpRNDONi6/u3qcSksMZq6E5nq2kwabPITng8+2D5QE=
X-Received: by 2002:a17:906:ce43:b0:84d:6f4a:3b15 with SMTP id
 se3-20020a170906ce4300b0084d6f4a3b15mr5259881ejb.48.1674791726033; Thu, 26
 Jan 2023 19:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20230126163605.3524630-1-arnd@kernel.org>
 <5ad53f8f-155a-d1e8-68e3-c82577816c76@amd.com>
In-Reply-To: <5ad53f8f-155a-d1e8-68e3-c82577816c76@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Jan 2023 13:55:13 +1000
Message-ID: <CAPM=9ty76NiuhUyk=AA75YUx=LXBU26OX4hCUFL=M7exh=eSRw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display/mst: fix an unused-variable warning
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Arnd Bergmann <arnd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 at 07:06, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> On 1/26/23 11:35, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The newly added code is in an #ifdef, so the variables that
> > are only used in there cause a warning if CONFIG_DRM_AMD_DC_DCN
> > is disabled:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_check':
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9698:43: error: unused variable 'mst_state' [-Werror=unused-variable]
> >   9698 |         struct drm_dp_mst_topology_state *mst_state;
> >        |                                           ^~~~~~~~~
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9697:41: error: unused variable 'mgr' [-Werror=unused-variable]
> >   9697 |         struct drm_dp_mst_topology_mgr *mgr;
> >        |                                         ^~~
> >
> > Fixes: c689e1e362ea ("drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Applied, thanks!
>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index be1232356f9e..c966bb05f6c7 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -9694,8 +9694,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
> >       struct drm_connector_state *old_con_state, *new_con_state;
> >       struct drm_crtc *crtc;
> >       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> > +#if defined(CONFIG_DRM_AMD_DC_DCN)
> >       struct drm_dp_mst_topology_mgr *mgr;
> >       struct drm_dp_mst_topology_state *mst_state;
> > +#endif
> >       struct drm_plane *plane;
> >       struct drm_plane_state *old_plane_state, *new_plane_state;
> >       enum dc_status status;
>

I've pushed an alternate fix to drm-fixes as I pulled in a tree this
morning and it failed to build on arm here.

Dave.
