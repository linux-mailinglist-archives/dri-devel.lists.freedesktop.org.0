Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9766605BB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786EA10E8A1;
	Fri,  6 Jan 2023 17:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512F210E8A0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:30:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so4035470wmk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pLGNK8Q+34qpO+L8QcDQiYZ6O0H195xUAjxzQafSpWk=;
 b=dbAlpH+WTDZUx9oaGIuFqkDxr8kTh333WXelK2V/2+uimZ8Ul3EoNXoEusWgT/EUzD
 cYktL1Etjjni4ZqO/+R9Ll+ZUU2VmLEu9+K2Dhtr6jRPnQ+ejWzWgjlBpRJ35LLjpbQl
 tkQjsPVDd/Q4mFSUAAYD35y3TLS76Mvsohc+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLGNK8Q+34qpO+L8QcDQiYZ6O0H195xUAjxzQafSpWk=;
 b=0m/jNipYmP/k8poXxqC1Z20kWfkXEMA+MjptT+t/oz6ItryZZSwO/FDfcdfq+0MJOV
 GkGMScg7EqXPlNEvdRFclKSA8UaSB/FtJDmJILo1Fv7zXMu0PaVAETQKMFezrv77byLt
 0nYJljMeEj8bOUxwgSMkbKWYG9dDXidtUqUblt2BOf58biSWVQ00HVabD8xl4ESWcWWV
 /1/+8bVYNgeBQZMCP1I6SYJXiy0gMgbUEqgFUYm/DD2coTZHx4OYop1GSRRUCaz7u+xm
 7656ZIgAE9YqXI/XYgFsJnT/HGbNlnZ4q6lZ08ygUPfQXNbwhAX0Y0FixRTHQmpTwrd6
 I+Pw==
X-Gm-Message-State: AFqh2koE8F2fISs/nx9RirnxpkEjWf2yCXUL4IKS96zmHENErSEGFyOR
 RCU9HwyG3DPDnMYkAVpLkpls/A==
X-Google-Smtp-Source: AMrXdXs2txZjSP9votayYGf9e4OhgCeHyRLe18MH8DJ+sads2k/YvPdWI9N7e0stcVETvW3RFsinSA==
X-Received: by 2002:a05:600c:2e44:b0:3d3:4406:8a3c with SMTP id
 q4-20020a05600c2e4400b003d344068a3cmr39529082wmf.32.1673026230692; 
 Fri, 06 Jan 2023 09:30:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm2840525wmm.23.2023.01.06.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:30:29 -0800 (PST)
Date: Fri, 6 Jan 2023 18:30:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <Y7hasy4680qoO0Qx@phenom.ffwll.local>
References: <Y7cszBkLRvAy6uao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7cszBkLRvAy6uao@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 03:02:20PM -0500, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> 
> Only GVT related fixes for this round.
> 
> I have another fix queued for i915_vma_unbind_async from Nirmoy that will
> target stable 5.18, but I figured it out late so I didn't run CI on that yet.
> So I'm holding this for now. Maybe and extra PR tomorrow or it will
> wait for the next week.
> 
> Here goes drm-intel-fixes-2023-01-05:
> 
> Only gvt-fixes:
>      - debugfs fixes (Zhenyu)
>      - fix up for vgpu status (Zhi)
>      - double free fix in split_2MB_gtt_entry (Zheng)
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:
> 
>   Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-01-05

Pulled, thanks a lot.
-Daniel

> 
> for you to fetch changes up to 87809d3196c2a7a015ab80ca1cb8c19b659bc5f6:
> 
>   Merge tag 'gvt-fixes-2023-01-05' of https://github.com/intel/gvt-linux into drm-intel-fixes (2023-01-05 08:03:38 -0500)
> 
> ----------------------------------------------------------------
> Only gvt-fixes:
>      - debugfs fixes (Zhenyu)
>      - fix up for vgpu status (Zhi)
>      - double free fix in split_2MB_gtt_entry (Zheng)
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
> 
> Rodrigo Vivi (1):
>       Merge tag 'gvt-fixes-2023-01-05' of https://github.com/intel/gvt-linux into drm-intel-fixes
> 
> Zheng Wang (1):
>       drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
> 
> Zhenyu Wang (2):
>       drm/i915/gvt: fix gvt debugfs destroy
>       drm/i915/gvt: fix vgpu debugfs clean in remove
> 
> Zhi Wang (1):
>       drm/i915/gvt: use atomic operations to change the vGPU status
> 
>  drivers/gpu/drm/i915/gvt/debugfs.c   | 36 +++++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
>  drivers/gpu/drm/i915/gvt/gtt.c       | 21 +++++++++++++++------
>  drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++++-----
>  drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 35 +++++++++++++----------------------
>  drivers/gpu/drm/i915/gvt/scheduler.c |  4 +++-
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 12 +++++-------
>  8 files changed, 80 insertions(+), 48 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
