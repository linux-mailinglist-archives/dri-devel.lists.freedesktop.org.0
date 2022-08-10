Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A4658F0AB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A64410E1CD;
	Wed, 10 Aug 2022 16:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72010ECF2;
 Wed, 10 Aug 2022 16:45:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s199so12531574oie.3;
 Wed, 10 Aug 2022 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NSIuwia75AioRZjhVarBTibdxYk00sTiEecc5ZuZS9E=;
 b=kENX+o4wrssMMzqSMw1M5ozx3d9utXAbtsvarJNWyuPkDc0Nt0xz8M5ab94yxFwhpA
 2q4Tfc3dZzhbuauuTMXJ1rDTDHzoNndJZ34Gkz2IZ1Gn4VA4DHTTsgxehTQgLooSKTSj
 Mk1twBkTQH81k6OcYGdzZGUPXMCnj1doRu7wz/MMza6nfA/b8n0Qny1gf6H8denI3p1L
 ASE/p0vlAe8y8ZVTPNajx4ywJd54/Tuq05vxqKB7Pu4jGNGwD6RhS118w/aTLCfNjfak
 btlyz29j3oWlgHNvGUHomi6hBSutYtwLHzWd955xtH7Mrqx310IHeM59DpkkRbZbHBMS
 8v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NSIuwia75AioRZjhVarBTibdxYk00sTiEecc5ZuZS9E=;
 b=njMiH5BHiQ2kjBqf5IuHnRveDsL+vkvmBk6eGGN7U6LslTUWWLcgoeI3dmJMOerki1
 hskJ6ZFBD+o2ULitv8EdpO6GWP6pALR1WI/APkbphnZEpSxcrYJSWvjVYsZT8grblRba
 iZtDRn76EiZsYxwR73n1d2xiYjJQXz6n3D3ws4bdejCLk2K7fAL7XlHGKJLWT7DqemKF
 j8D4YdMoTsBpLLYlDOUi/EULrUfoDWn/EK+HYOcc9M6tYj/6tdf/Dt05sLc2SxyjSfvB
 uCo8pxDxi9MCtXfdXnBAZoljoCUZFrsq9e99tiv1wwRZJ574Y1gnTUA73bwz05QX99rc
 InEw==
X-Gm-Message-State: ACgBeo3JmVapLQ+l/WLQGN/1qWf4h9FUkgFeeAzIvRyQlCl+cSKMAU+v
 T6IkWLW+sFMsw2Th5C0V1cdBD/bfc9OFZRwVDBNAhXzC
X-Google-Smtp-Source: AA6agR5jPsxMjdCvQPJkJJ+C80rMfEQkIZzWUMSmXSQvgYmlAZKZFe2wka+OZiJrFoMim+O04MFy8r1YAwnmqV1ykp0=
X-Received: by 2002:a05:6808:19a3:b0:33e:1525:3fb4 with SMTP id
 bj35-20020a05680819a300b0033e15253fb4mr1793219oib.106.1660149920416; Wed, 10
 Aug 2022 09:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220801135259.3039679-1-imre.deak@intel.com>
 <o3jSEcvDEw1afwzuUMylF9fY-EM-Kz5wHJVoktY8yNal0kEyLHa44nNBP1OTb4emiqyTuwxSVeiT52eYgSXYwGHmaGMiI60hDYJOOhS8Q-8=@emersion.fr>
In-Reply-To: <o3jSEcvDEw1afwzuUMylF9fY-EM-Kz5wHJVoktY8yNal0kEyLHa44nNBP1OTb4emiqyTuwxSVeiT52eYgSXYwGHmaGMiI60hDYJOOhS8Q-8=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Aug 2022 12:45:09 -0400
Message-ID: <CADnq5_OK3H1QHA156G5z5w9-Mhj7ZwXaAJwfTv=E3zPTAYEaTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amd/display: Fix merge conflict resolution in
 amdgpu_dm_plane.c
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Mon, Aug 1, 2022 at 10:08 AM Simon Ser <contact@emersion.fr> wrote:
>
> Acked-by: Simon Ser <contact@emersion.fr>
>
> CC amd-gfx
>
> On Monday, August 1st, 2022 at 15:52, Imre Deak <imre.deak@intel.com> wrote:
>
> > The API change introduced in
> >
> > commit 30c637151cfa ("drm/plane-helper: Export individual helpers")
> >
> > was missed in the conflict resolution of
> >
> > commit d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip")
> >
> > fix this up.
> >
> > Fixes: d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip")
> > Cc: Simon Ser contact@emersion.fr
> >
> > Cc: Thomas Zimmermann tzimmermann@suse.de
> >
> > Acked-by: Thomas Zimmermann tzimmermann@suse.de
> >
> > Signed-off-by: Imre Deak imre.deak@intel.com
> >
> > ---
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 8cd25b2ea0dca..5eb5d31e591de 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1562,7 +1562,7 @@ int dm_drm_plane_get_property(struct drm_plane *plane,
> > static const struct drm_plane_funcs dm_plane_funcs = {
> > .update_plane = drm_atomic_helper_update_plane,
> > .disable_plane = drm_atomic_helper_disable_plane,
> > - .destroy = drm_primary_helper_destroy,
> > + .destroy = drm_plane_helper_destroy,
> > .reset = dm_drm_plane_reset,
> > .atomic_duplicate_state = dm_drm_plane_duplicate_state,
> > .atomic_destroy_state = dm_drm_plane_destroy_state,
> > --
> > 2.37.1
