Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2C62A60D0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 10:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6710F6E96A;
	Wed,  4 Nov 2020 09:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23EF6E969
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 09:43:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p1so2143727wrf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lEv4v5EmULMb/ms42XJcNV7F3yLyss4vuS+lGaVOZwY=;
 b=LPqgcg/kiZMFu8TlIGT9IAe4MGP4xKHKC9wWNKdewzkgtmCRqGySLoA/pakjEnq7Lu
 M7rEeiovzzbpwM3Hv0Ml3dmds1oAd0djDaCFUi+i2ffnhSa/9BfcYdHFQx259TlGJAzE
 y+QfeRQVp7FRU8obnPN7fDuoIMzXcvumWAf8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lEv4v5EmULMb/ms42XJcNV7F3yLyss4vuS+lGaVOZwY=;
 b=LIOCSEd5ddU2GDYN+3ioF2bwCD2zEC5+7a1ep13lclqoWMY5hPLxpBJ476JupQ8lDw
 6Vys1KrIEN2DJKwoggnhtJKfW/x+zId8Vmi0zZiGzbrlFhbN8z2BWK7revCaTaI/W4tl
 ZYe8md5r/Rxb6iIvfqEX6drsyw556KUo6tav4sNAf1wj2iXPBxl7G4PtsLMV7wa0W7n4
 W9qcgN1NpJB8OyiSfgnITlqTm4BvAN/jrve/x770qmQCWTdLy/klVXAjiDbmCcidxo4y
 fdzwVFV2WghsZnvAyCfnDaqJQij0Lyh3ptlEFopX4/evdb0+O0R5ec+CSje7hPlOnrYK
 ZKNQ==
X-Gm-Message-State: AOAM531kCyFtxWhXPViKeF3A6KyJC0eUH5Gr0hWn8dCjV1tjGKswv2FM
 OaYcuNPUvs914bkLB2tR2934uQ==
X-Google-Smtp-Source: ABdhPJwlY5iUbnJsERzg3nMEYRaSm6ku4ZooiceZMm70iyIJrKlJs45cWCfhD9CAKy9QiUjLyP5nAA==
X-Received: by 2002:a5d:4648:: with SMTP id j8mr30920288wrs.131.1604482996465; 
 Wed, 04 Nov 2020 01:43:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a12sm1736095wrr.31.2020.11.04.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:43:15 -0800 (PST)
Date: Wed, 4 Nov 2020 10:43:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 0/2] amdgpu's drm_driver becomes const
Message-ID: <20201104094314.GM401619@phenom.ffwll.local>
References: <20201104031129.361178-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104031129.361178-1-luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 10:11:27PM -0500, Luben Tuikov wrote:
> Hi Daniel,
> 
> These two patches follow up your latest
> DRM work to make definitions of struct drm_driver
> in DRM low-level drivers, constant, in amdgpu.
> 
> This set doesn't descend from my previous patch
> "drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)",
> since our branch doesn't have it, and I can see
> that your const patches aren't in drm-next yet,
> but they are based on my conversion patch.
> Perhaps you can graft these two patches locally
> and dispatch them via drm-next. (There'll be
> a one-line conflict, namely the devm_drm_dev_alloc().)

Ah cool, thanks for doing this. I'll take your series here and include it
in mine and resend the entire pile.
-Daniel
> 
> Thanks and Regards,
> Luben
> 
> Alex Deucher (1):
>   drm/amdgpu/virt: fix handling of the atomic flag
> 
> Luben Tuikov (1):
>   drm/amdgpu: Make struct drm_driver const
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 32 +++++++++++++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  | 25 +-----------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c |  4 ++-
>  3 files changed, 32 insertions(+), 29 deletions(-)
> 
> -- 
> 2.29.2.154.g7f7ebe054a
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
