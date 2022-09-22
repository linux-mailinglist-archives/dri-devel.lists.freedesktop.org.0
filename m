Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E55E64EE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4FF10EB3A;
	Thu, 22 Sep 2022 14:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C811D10EB32;
 Thu, 22 Sep 2022 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8g87Kq8e5SpIZN5RyDSlZuQpb7aBxvPY3D7ufRb5ZfQ=; b=o8kwp5NPu+P2PDp+E2KIvnP5Bt
 CkaYHrOCM/OCOtwMz2+8OAN7TjoVKO+hvTUM7GstobynaHw6G3P3+Qv80wnrdSlXZANId6vs4gxQc
 xMM3fJYVDqcixSYGm7SNbxfbAdNRl1t83HXcQPE47bkpbTQLJP0r0XyRHjcqTUJu9OffbDuIkGiO4
 3o4swb7eM/4fkeBVXUlRjf++U/AYVFCOivXzEMPh9ZHUhZivzaWoWhh4eSZq0HAWXKW5VIeyUxdC5
 xmuiapNG+JphnRncSsL1aExjELbshsDhQq1vsYlKrxjMlqXZpk+kAJZIRWjCQqE54j6S+HTuv+Hnj
 p5pcrRjA==;
Received: from 201-93-50-1.dial-up.telesp.net.br ([201.93.50.1]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1obN09-001i8N-9C; Thu, 22 Sep 2022 16:16:29 +0200
Message-ID: <0f89f4a8-3ab4-b840-6c19-a0d59c1e8cd6@igalia.com>
Date: Thu, 22 Sep 2022 11:16:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/6] Add support for atomic async page-flips
To: Simon Ser <contact@emersion.fr>
References: <20220830172851.269402-1-contact@emersion.fr>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220830172851.269402-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 8/30/22 14:29, Simon Ser wrote:
> This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> commits, aka. "immediate flip" (which might result in tearing).
> The feature was only available via the legacy uAPI, however for
> gaming use-cases it may be desirable to enable it via the atomic
> uAPI too.
> 
> - v1: https://patchwork.freedesktop.org/series/107683/
> - User-space patch: https://github.com/Plagman/gamescope/pull/595
> - IGT patch: https://patchwork.freedesktop.org/series/107681/
> 
> Main changes in v2: add docs, fail atomic commit if async flip isn't
> possible.
> 
> Tested on an AMD Picasso iGPU.
> 

I tested on an AMD vangogh GPU and worked with the IGT tests.

This series is Reviewed-by: André Almeida <andrealmeid@igalia.com>

> Simon Ser (6):
>    amd/display: only accept async flips for fast updates
>    drm: document DRM_MODE_PAGE_FLIP_ASYNC
>    drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
>    drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>    drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
>    amd/display: indicate support for atomic async page-flips on DC
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 10 +++++++
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
>   drivers/gpu/drm/drm_atomic_uapi.c             | 28 +++++++++++++++++--
>   drivers/gpu/drm/drm_ioctl.c                   |  5 ++++
>   drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>   drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>   drivers/gpu/drm/vc4/vc4_kms.c                 |  1 +
>   include/drm/drm_mode_config.h                 | 11 ++++++++
>   include/uapi/drm/drm.h                        | 10 ++++++-
>   include/uapi/drm/drm_mode.h                   | 11 ++++++++
>   11 files changed, 83 insertions(+), 4 deletions(-)
> 
