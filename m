Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCD6D788E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0710E8B1;
	Wed,  5 Apr 2023 09:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4154110E8B1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 09:39:14 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so19276a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680687552; x=1683279552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FOrXB4jQhMXQdSjEL5FabYEQRABLxegvAFbpASDrIwM=;
 b=gHS6DW2LyFfW+tjeQrVFbAEWVqwiv1xLEtjuG+olqalkkaLDenTDKqCKuhR5+pZjag
 gpyhF3HBKMMvNqWAKP9gh6VygwCUsUasNNTYABu9J4QpbKwilnBiFsg23SSptS1IsRPl
 9BmTgZNG9dkxVJMyJ0KugDql3Mzk+XCXZB0wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687552; x=1683279552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOrXB4jQhMXQdSjEL5FabYEQRABLxegvAFbpASDrIwM=;
 b=OHQVLnRRVTZqvW3IAicm0O/QjbZ9e+oi7RIobni/mN53rN2Xeo4X2FeiedRwu3U87D
 X3yF/QGxdvVKtK7tJBVbniPS+2WUCwV+XjLtNmz2oNiW7r5eydKPAeNTLjOvcIoTJ9Py
 ohCY2rWapLscZk5CddrYNJ3NGeJQIlFGlEy3HpRaW6Q5RwRoXMHYq+NBKm5tPflGClDJ
 zTx16SNalVWOIuqQUcx7E8ZIwjqoZ4e11Bv8d4Hvp0SZ7J/tOCGGj7CG92ramVcEDr73
 hy+YBWRPtsccGBtwy+cpS05s4i4pZrc23fsABnyWlSf1Toty1YNit4HUbVigwu4cBFVC
 y38A==
X-Gm-Message-State: AAQBX9cQUGpbI0kobGGfZVQH7Sya1ITSRFPB3oBy3xpsKaaRuKDlY+pm
 gvYrcu3euzOfLKfCGAZ332pa2A==
X-Google-Smtp-Source: AKy350aQevqJTey6sqtOt21Khn9Ud2q/8TAFmpBZ4oOI6VHp67X88lklA8gDn7nETqZ+O/CWmuov3A==
X-Received: by 2002:a05:6402:1e8e:b0:501:ea97:5192 with SMTP id
 f14-20020a0564021e8e00b00501ea975192mr1362242edf.4.1680687552494; 
 Wed, 05 Apr 2023 02:39:12 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k17-20020a50c091000000b004fa99a22c3bsm6966156edf.61.2023.04.05.02.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:39:12 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:39:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZC1BvoPqTRk+DkDs@phenom.ffwll.local>
References: <87zg7mzomz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg7mzomz.fsf@intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:04:04PM +0300, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> drm-intel-fixes-2023-04-05:
> drm/i915 fixes for v6.3-rc6:
> - Fix DP MST DSC M/N calculation to use compressed bpp
> - Fix racy use-after-free in perf ioctl
> - Fix context runtime accounting
> - Fix handling of GT reset during HuC loading
> - Fix use of unsigned vm_fault_t for error values
> 
> BR,
> Jani.
> 
> The following changes since commit 7e364e56293bb98cae1b55fd835f5991c4e96e7d:
> 
>   Linux 6.3-rc5 (2023-04-02 14:29:29 -0700)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-04-05
> 
> for you to fetch changes up to dc3421560a67361442f33ec962fc6dd48895a0df:
> 
>   drm/i915: Fix context runtime accounting (2023-04-03 11:37:00 +0300)

Pulled, thanks

> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.3-rc6:
> - Fix DP MST DSC M/N calculation to use compressed bpp
> - Fix racy use-after-free in perf ioctl
> - Fix context runtime accounting
> - Fix handling of GT reset during HuC loading
> - Fix use of unsigned vm_fault_t for error values
> 
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       drm/i915/huc: Cancel HuC delayed load timer on reset.
> 
> Matthew Auld (1):
>       drm/i915/ttm: fix sparse warning
> 
> Min Li (1):
>       drm/i915: fix race condition UAF in i915_perf_add_config_ioctl
> 
> Stanislav Lisovskiy (1):
>       drm/i915: Use compressed bpp when calculating m/n value for DP MST DSC
> 
> Tvrtko Ursulin (1):
>       drm/i915: Fix context runtime accounting
> 
>  drivers/gpu/drm/i915/display/intel_dp_mst.c          |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c              |  5 +++--
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 ++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c               |  7 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h               |  7 +------
>  drivers/gpu/drm/i915/i915_perf.c                     |  6 +++---
>  6 files changed, 25 insertions(+), 14 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
