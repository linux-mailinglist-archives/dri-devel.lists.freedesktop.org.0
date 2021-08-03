Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA503DEDB0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 14:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAFF6E140;
	Tue,  3 Aug 2021 12:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D256E0C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 12:15:25 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso20408058otb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSOhii9Pkds7u2GLLF3iL2oicT+PRJhz5VYiGW29+Xo=;
 b=UXznTkX+xqMFCKwMze5WemqhAaqiZIhOHsLv3VxYCKpKx6yF4aWDs631GpzUqFuveS
 YKDbOaz77smSfgJCzdY3ZCGHXTk8Px8oDovkv63SwCKD3iM2rx44MfEkIxEhtTWZhQkU
 LcrUY4RmnMole7YTQhywgNzubUKuzzeJ8G5zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSOhii9Pkds7u2GLLF3iL2oicT+PRJhz5VYiGW29+Xo=;
 b=qE4b0ye0GZlLAFUix+ZZuLz4rb1IU4wV6LGf9CthTW55VKAPnjni2p3lxA5MFkS9jr
 LiWkthvV9r8M/VKsnWoy7oPx5Sf+yQJRRbXUE7DeJpsaYqUbQyDwFXWN4HRvamupF0SV
 Kva17w0PKEoLfIj33HFlENriyUAPllsTLqkFSg4/H5wSEUk4NbmE/XN+R43/CbHkHxKv
 ZmISNeu5ucQLGkqF7yGLEc2Z5XaELuu+bloaBnj9wYxqHsMVfSUUoCwccVk2eTBk2gey
 PgUbiFNiZot3AjWF+uNhrWsdLh6j79Fe1Du1CbhevangTcaWpE9cwf4NY5VyHgsMrU0P
 nPiw==
X-Gm-Message-State: AOAM531TjLWnUq9KUkLIXlBLzS0KDPvNgn5egQeplgYFCc5Tn1d7icMP
 H39voihZNkifrDu8R5KOKtWGwGmSC2r+KXN8uMUL0xBWJqE=
X-Google-Smtp-Source: ABdhPJyP2FFiHIAc61/QjnTCwg1Q1GuNdxtE70yGUdfwKMgBd/O/taiGCehBLR5MLMr4e4bIOqxcvGcfmqNHYefcFao=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr15053453otp.188.1627992924277; 
 Tue, 03 Aug 2021 05:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051121.72017-1-matthew.brost@intel.com>
In-Reply-To: <20210803051121.72017-1-matthew.brost@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Aug 2021 14:15:13 +0200
Message-ID: <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable GuC submission by default on DG1
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 3, 2021 at 6:53 AM Matthew Brost <matthew.brost@intel.com> wrote:
>
> Minimum set of patches to enable GuC submission on DG1 and enable it by
> default.
>
> A little difficult to test as IGTs do not work with DG1 due to a bunch
> of uAPI features being disabled (e.g. relocations, caching memory
> options, etc...).

Matt Auld has an igt series which fixes a lot of this stuff, would be
good to do at least a Test-With run with that.

Also I'm assuming that for ADL-P we'll get this equivalent patch set
soon, and there we should be able to get real results?
-Daniel

>
> Tested with the loading the driver and 'live' selftests. Submissions
> seem to work.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Daniele Ceraolo Spurio (1):
>   drm/i915/guc: put all guc objects in lmem when available
>
> Matthew Brost (2):
>   drm/i915/guc: Add DG1 GuC / HuC firmware defs
>   drm/i915/guc: Enable GuC submission by default on DG1
>
> Venkata Sandeep Dhanalakota (1):
>   drm/i915: Do not define vma on stack
>
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 +++++++
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 +++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 90 ++++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +
>  8 files changed, 138 insertions(+), 20 deletions(-)
>
> --
> 2.28.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
