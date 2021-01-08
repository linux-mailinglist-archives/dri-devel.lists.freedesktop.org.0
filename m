Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F442EF419
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024886E82D;
	Fri,  8 Jan 2021 14:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320226E826
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:43:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id e25so8649659wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zz6s1vLUquVIaMSsU3Vyn+Tdw2WdAT7heodUrvSNM4s=;
 b=X5DrkUDovLN8/y/LWQotWq8rFdZhEk+U1c9napJhXFCQuWnNybzAZTjgDsfjwV8LzU
 cXKex96lQOmm8p6FPa+8CBGvHqAr0BaZnT3f/0Wa4GkRnOdz6SO0hCLA3d77SQomEte3
 DVSlVD5tMR56V0F5eq3m3HOlYo8jbvAyzD73o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zz6s1vLUquVIaMSsU3Vyn+Tdw2WdAT7heodUrvSNM4s=;
 b=Vu1Cjzf9RDAyceAADrBJO9Sec9fO21Td5/4H+m6OHuVKMBtYsSsn2V9rPqzYmnU17W
 Q3NMDFffSC9ah+uOthCIdM2892oRJEreqPipeS+EwsOXnP1yZPKTVfsECKsELgXJi6m3
 BHv56pvxf9uomByOB3O/Tz7MDBNe2O4yoIfRv9gHCgWZA0aIWMHPYTvlP9Uh1VXWo342
 ecic1I5IqwbsBNrArv/+58d7xxV3zaKHbn//172XACsJyZX0EbgwlO6XHaU1cUwgLm2a
 szeGJG+vYrxKd3wdCsaezl1clYqb6a7zMvVjcKMZ4gCpVPAIXOVm9H0sc1lu6xmHFqrA
 oqbA==
X-Gm-Message-State: AOAM532sww/mV8bO9xQsf3cOFEVtm9076DKOcG/AE11fhav1pcWd5KoY
 cudRDjM6azZQ36MkqlMMFfKV2w==
X-Google-Smtp-Source: ABdhPJwJ1sBT1PbMGNuy5atJZmbHtN6XOvxg9ezY32hnetIrwNVIqLAqHU83WjKlMvNy+a+jJVkvuA==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr3312347wmc.10.1610117025848; 
 Fri, 08 Jan 2021 06:43:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o124sm12775655wmb.5.2021.01.08.06.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:43:45 -0800 (PST)
Date: Fri, 8 Jan 2021 15:43:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH 0/3] Revert "drm/amd/display: Expose new CRC window
 property" and changes associated with this commit
Message-ID: <X/hvnwDPq+sSW+d8@phenom.ffwll.local>
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Roman Li <Roman.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 03:53:18PM -0500, Rodrigo Siqueira wrote:
> Hi,
> 
> A couple of weeks ago, Daniel highlighted  [1] some issue related to a
> patch entitle "drm/amd/display: Expose new CRC window property". After
> discussion, we realize that we can revert that patch because we will
> need to create a debugfs or full UAPI for CRC soon, which will make this
> code obsolete. We got two other patches related to this same code; for
> this reason, this patchset reverts all changes associated with that
> specific commit.
> 
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Roman Li <Roman.Li@amd.com>
> Cc: Bindu R <Bindu.R@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> 1. https://www.spinics.net/lists/dri-devel/msg283767.html 

Thanks for taking care of this. Since it's not super pressing I'll leave
it to Alex for merging with the usual -fixes pull request train next week.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> 
> Thanks
> 
> Rodrigo Siqueira (3):
>   Revert "drm/amd/display: Fix unused variable warning"
>   Revert "drm/amdgpu/disply: fix documentation warnings in display
>     manager"
>   Revert "drm/amd/display: Expose new CRC window property"
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   2 +
>  5 files changed, 14 insertions(+), 229 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
