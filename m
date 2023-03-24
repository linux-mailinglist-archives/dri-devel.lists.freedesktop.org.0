Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C096C7B31
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3210E523;
	Fri, 24 Mar 2023 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5728B10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:23:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso539406wmo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679649795; x=1682241795;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RTB1Z3y94oOxwWAMZkWjw2jZIS9g6+Ve9QViNWMmHvg=;
 b=D0FYIcNxlsoQLHPcUxPU8tg257/BAhn4krc497fsP59bc3GLyhhW9rc8XfHnfRCKQ8
 gygEcVxZvnv4DVyskqJgLICCrXFiJAx/k2sWZR/X0vmUqqBbFLNa2cHrjvxkf3e5RS7Q
 pVIV29XCyfv1pAlUC8l8BSc8HrzR85g8Vqm+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679649795; x=1682241795;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RTB1Z3y94oOxwWAMZkWjw2jZIS9g6+Ve9QViNWMmHvg=;
 b=UMIa/JMD7suLZQWBaE1/ttGYHzF+TaQCzQ6yUfhsq0v5OoI38zURIhqSHJfef6x/Uk
 +a9bADU3iSS+5dEwsOxFoIWnWz+olVELWRmR1MswdIItaxBC/SPFtGubXv/ClBikSj55
 3ez3p8tpKAh3ZFLvXdbP7aNolCamNcTcEzAXU9iO5IRF6iRvnpd8+SPp9nUPl67gwv2Q
 9FvJOJ2hyBoMvchdsYOk5kwFPMdZvJFLIEu75/28Ly4nXa+3uMz3KNxnhwEfscNNxBYd
 8qEPXcVpTrEWuVuoZAvM9zAZ53cQq5sbRHtktBfOdxV4kO/5lnwlUC75uXORqxHu3ic8
 MsTA==
X-Gm-Message-State: AO0yUKVVa+rvOfED6m4aDFvZYHGKGq5pQWrtHAngnoYrTxQ2aHqhiijx
 oRDdwymffgFc4UwEDR/7fGbqwA==
X-Google-Smtp-Source: AK7set8ql99RaehwjTWbx+cORt6Y36mZ+EeViMa+Pf2TVfZwyHb7s9XiTmLLrnoNLwCxMB3kV8RIFQ==
X-Received: by 2002:a05:600c:1ca5:b0:3eb:3135:11f8 with SMTP id
 k37-20020a05600c1ca500b003eb313511f8mr1260242wms.4.1679649795696; 
 Fri, 24 Mar 2023 02:23:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b002d1e49cff35sm17960143wru.40.2023.03.24.02.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:23:15 -0700 (PDT)
Date: Fri, 24 Mar 2023 10:23:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZB1sAStAsVe9q0ja@phenom.ffwll.local>
References: <878rfn7njw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rfn7njw.fsf@intel.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:46:27PM +0200, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> Otherwise a fairly regular fixes pull, except for two things:
> 
> First, I have not gotten CI results on this. I don't know what gives.
> 
> Second, I missed adding the hwmon revert to the tag. I accidentally
> picked up the commit for the previous pull, and it shouldn't have been
> there.
> 
> 
> BR,
> Jani.
> 
> 
> 
> drm-intel-fixes-2023-03-23:
> drm/i915 fixes for v6.3-rc4:
> - Fix an MTL workaround
> - Fix fbdev obj locking before vma pin
> - Fix state inheritance tracking in initial commit
> - Fix missing GuC error capture codes
> - Fix missing debug object activation
> - Fix uc init late order relative to probe error injection
> - Fix perf limit reasons formatting
> - Fix vblank timestamp update on seamless M/N changes
> 
> BR,
> Jani.
> 
> The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:
> 
>   Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-03-23

Pulled, thanks.
-Daniel

> 
> for you to fetch changes up to 22aa20e4c5dcbe6fdc480eb4fb27039b1f43217f:
> 
>   Revert "drm/i915/hwmon: Enable PL1 power limit" (2023-03-20 12:31:01 +0200)
> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.3-rc4:
> - Fix an MTL workaround
> - Fix fbdev obj locking before vma pin
> - Fix state inheritance tracking in initial commit
> - Fix missing GuC error capture codes
> - Fix missing debug object activation
> - Fix uc init late order relative to probe error injection
> - Fix perf limit reasons formatting
> - Fix vblank timestamp update on seamless M/N changes
> 
> ----------------------------------------------------------------
> Andrzej Hajda (1):
>       drm/i915/gt: perform uc late init after probe error injection
> 
> Ashutosh Dixit (1):
>       Revert "drm/i915/hwmon: Enable PL1 power limit"
> 
> Badal Nilawar (1):
>       drm/i915/mtl: Disable MC6 for MTL A step
> 
> John Harrison (1):
>       drm/i915/guc: Fix missing ecodes
> 
> Nirmoy Das (1):
>       drm/i915/active: Fix missing debug object activation
> 
> Radhakrishna Sripada (1):
>       drm/i915/mtl: Fix Wa_16015201720 implementation
> 
> Tejas Upadhyay (1):
>       drm/i915/fbdev: lock the fbdev obj before vma pin
> 
> Ville Syrjälä (2):
>       drm/i915: Preserve crtc_state->inherited during state clearing
>       drm/i915: Update vblank timestamping stuff on seamless M/N change
> 
> Vinay Belgaumkar (1):
>       drm/i915: Fix format for perf_limit_reasons
> 
>  drivers/gpu/drm/i915/display/intel_crtc.c      |  8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display.c   |  1 +
>  drivers/gpu/drm/i915/display/intel_dmc.c       | 26 ++++++++++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_fbdev.c     | 24 +++++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gt.c             |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c          | 27 --------------------------
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c  |  2 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c            |  8 ++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 22 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c      | 13 +------------
>  drivers/gpu/drm/i915/i915_active.c             |  3 +--
>  drivers/gpu/drm/i915/i915_hwmon.c              |  5 -----
>  drivers/gpu/drm/i915/i915_reg.h                | 17 +++++-----------
>  13 files changed, 88 insertions(+), 72 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
