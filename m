Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423FB48ED3A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 16:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8410F10E247;
	Fri, 14 Jan 2022 15:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2112A10E247
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 15:39:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s1so16261571wra.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 07:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jXNZEwZWopLOube/TnweFY3ylo8I5Y2kE5XMP8T2Ov8=;
 b=GkA9wucmubdrjrj4HneXKrK4hY0rkwpHiu8yjvg7DW8CIA2Kj7calNHWl9P1/5bljC
 jwNsVAVW8u7yujluNC4gFO3H5hSjSdbfB9sgoyBJmXsYHvH0u6RJfENudlVYSDRNfMbv
 epahwH1PX2JjR6kNErO0/y+MODd5P81O6BksU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jXNZEwZWopLOube/TnweFY3ylo8I5Y2kE5XMP8T2Ov8=;
 b=AgmRVaYWH0c9BU69LQ+9lHlmKJPtFbsNIN8p3548JdAVs0qCtwIbqmYFfrsCc1diai
 cRxkgBu6+TOhky4rmgAUpGBbUzqXSMJJpUyjN/x+fjXxz7H56uMxENSoF59jgf7Y9p37
 /StjY7C19TYVKwjtPqft2FWJjOWpqoDaDZjB2rreYDeWVtg9NWm0gwrA3ZkRSFyy1u4H
 SKHdhfLHBPZy5/haUrUBwpAT4O0VU9mSKXvHSfp0soFMEa9CQpti1hEAIdgSuGfOeFeA
 U0I+/KSarjevV9P+bX3uoE6XAYsfsZhZf3Z/wyvInTLE+AOwtq2RuleedhJxIYiVEOyK
 buJA==
X-Gm-Message-State: AOAM530BuhkWs0hr28dAlur4ColMKqGNoRKuNI+JP1OLvM9Er6ZcOsAV
 FT8Unp23ua63v615SLmSOgLgFw==
X-Google-Smtp-Source: ABdhPJxNZevE538tP4LShv3GxRNUO05WLuxfh+vCKMDuC4dcVo7/YRyf135J03GVFYQhhkynhoeovQ==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr8652918wri.1.1642174758565;
 Fri, 14 Jan 2022 07:39:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bg19sm11655468wmb.47.2022.01.14.07.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:39:18 -0800 (PST)
Date: Fri, 14 Jan 2022 16:39:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <YeGZI6oG+pMaDAas@phenom.ffwll.local>
References: <YeGHu7qU92pjuQOn@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeGHu7qU92pjuQOn@linux-uq9g>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 03:24:59PM +0100, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> 
> here are two more fixes for this week. I cherry-picked both from 
> drm-misc-next.
> 
> Best regards
> Thomas
> 
> drm-misc-next-fixes-2022-01-14:
>  * atomic helpers: Fix error messages
>  * mipi-dbi: Fix buffer mapping
> The following changes since commit 5da8b49de472c1da8658466d4f63ef8d9251a819:
> 
>   dt-bindings: display: bridge: lvds-codec: Fix duplicate key (2021-12-22 14:02:04 -0400)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-01-14

Thanks, pulled to drm-next.
-Daniel

> 
> for you to fetch changes up to 5d474cc501b90b82c182b5d00439eb6790a82e21:
> 
>   drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy (2022-01-14 14:43:02 +0100)
> 
> ----------------------------------------------------------------
>  * atomic helpers: Fix error messages
>  * mipi-dbi: Fix buffer mapping
> 
> ----------------------------------------------------------------
> Claudio Suarez (1):
>       drm: fix error found in some cases after the patch d1af5cd86997
> 
> Liu Ying (1):
>       drm/atomic: Check new_crtc_state->active to determine if CRTC needs disable in self refresh mode
> 
> Thomas Zimmermann (1):
>       drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 14 +++++++-------
>  drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
