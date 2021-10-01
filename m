Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C342B41F023
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E1F6EE12;
	Fri,  1 Oct 2021 14:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964C6EDE9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:59:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so219704wmg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jJY3uvVzN0+VKIpmed9vmKmw2VVI6RacX8HsYm/goNY=;
 b=f5QVKtGJ5k9YZXEPvvvDUeHpDPpJckx+aesGc+HHJD4Mt/L2+BvFkCXq8ZB++QSFBD
 wnFyRdRgp1Ynhb9SEmyFJ2WX3ipOeM4sJpUS6cBY3RpS5XAYEg3fJcIoXY27Gw2vwXeQ
 G+TXvF3/LVWYhq7q28zee5nPlRkVvtSofUwz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jJY3uvVzN0+VKIpmed9vmKmw2VVI6RacX8HsYm/goNY=;
 b=NftOXgbPoD+p1y5o6EQ9v2qLITQtGGaH98K2vR7/ZtyTzS9IxmPeII1lNXTD1zsqXO
 TD+RPLsgCb3ccXD4FJoNs8bC+3fNM+Uonuu43aNZXi2uQB4dtU3ILm/FUjvQm3cseh1W
 MQyZ8RLihNXZbu8lc5AWEf0o9JGf2pf2N/vsyD9jsF1v/KcjQlE0y7BKNoT7bpieNwIR
 oVjgg9mlfLvKQZ0nAcah6aXR8Bphx6DYgFSG46GWTrpQ66QTL00Ym46boIQ0ZivT46w2
 4gDncdWoF0y32XxE9gAVw7YWJcz4P4oxLrpR9Y545nGxsW/UywCKKouHZY8JnkqOIhJc
 WdDA==
X-Gm-Message-State: AOAM532ObCUwja3mrzVd229Dv7Q+CaKNcDekLagJuB/GSZhcbUFuz70X
 4tj398LsHYLCfyyeXv3elwEfIUFcYzvZPw==
X-Google-Smtp-Source: ABdhPJzwJRUp2ynFM0uvvs3tHsF6rU4Eus0M8GsESjG+LJMbs4tweVrKyqVAFlHgjzPUYLH7gYFcow==
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr5093862wmc.113.1633100344627; 
 Fri, 01 Oct 2021 07:59:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y23sm8226866wmi.16.2021.10.01.07.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:59:04 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:59:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <YVciNsllheJM6bom@phenom.ffwll.local>
References: <87lf3ev44z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf3ev44z.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 30, 2021 at 11:50:20AM +0300, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> drm-intel-fixes-2021-09-30:
> drm/i915 fixes for v5.15-rc4:
> - Fix GVT scheduler ww lock usage
> - Fix pdfdocs documentation build
> - Fix request early tracepoints
> - Fix an invalid warning from rps worker
> 
> BR,
> Jani.
> 
> The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
> 
>   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-09-30
> 
> for you to fetch changes up to 4b8bcaf8a6d6ab5db51e30865def5cb694eb2966:
> 
>   drm/i915: Remove warning from the rps worker (2021-09-27 12:46:40 +0300)

Merged into drm-fixes, apologies for being a bit late, I was held up in a
drm-misc-fixes chaos.
-Daniel

> 
> ----------------------------------------------------------------
> drm/i915 fixes for v5.15-rc4:
> - Fix GVT scheduler ww lock usage
> - Fix pdfdocs documentation build
> - Fix request early tracepoints
> - Fix an invalid warning from rps worker
> 
> ----------------------------------------------------------------
> Akira Yokosawa (1):
>       drm/i915/guc, docs: Fix pdfdocs build error by removing nested grid
> 
> Jani Nikula (1):
>       Merge tag 'gvt-fixes-2021-09-18' of https://github.com/intel/gvt-linux into drm-intel-fixes
> 
> Matthew Auld (1):
>       drm/i915/request: fix early tracepoints
> 
> Tejas Upadhyay (1):
>       drm/i915: Remove warning from the rps worker
> 
> Zhi A Wang (1):
>       drm/i915/gvt: fix the usage of ww lock in gvt scheduler.
> 
>  drivers/gpu/drm/i915/gt/intel_rps.c                         |  2 --
>  drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h  | 10 +++++-----
>  drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h | 10 +++++-----
>  drivers/gpu/drm/i915/gvt/scheduler.c                        |  4 ++--
>  drivers/gpu/drm/i915/i915_request.c                         | 11 ++---------
>  5 files changed, 14 insertions(+), 23 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
