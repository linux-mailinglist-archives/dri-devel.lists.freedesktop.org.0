Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198A358176
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320A6EA8F;
	Thu,  8 Apr 2021 11:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32066EA8E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:15:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b9so1717905wrs.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AcAFUqp6UAoctTPigHac0GLdbrDMBzvgfm1w3MAPCVc=;
 b=gGVo0KdtGQFzn+gxvhAI7/mbF2A4l4VfZBwtPQU6K9eV3ca1vm5pLoji6HAfVncZrs
 1LLFVDeqlQleRFCHV19mRzY0GQCTbs4IrhypdEy/VGbI001vRiAYAJ/jqzBOz251K1Zl
 4PeICtkXuYO/XR2Hil7Uer17XqYYN7+RcIUEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AcAFUqp6UAoctTPigHac0GLdbrDMBzvgfm1w3MAPCVc=;
 b=UGrm7ImfQ2YH+JgaJPYvfc0nqm27pAdNEA+a8cmcH09cVDJtYJ3V/gawpPtLWnmf8C
 tci3ySpvm9sah3+lDyzy+awbdVoviyC66VaFSp8ibygow+qAI6AjXk/F0afZycJOzCUe
 OHfP+WQvCB4xodVEC2P4RDUz9TMI7LwmoWemj0HaBePDBRRfvm5xHk38SuAClYiewF8w
 zXTkWWuXinlrlKO6Q0ic1NP0USnUN6GuFy0jKqwzpmKxuZWE5lgSTGHcV18qqEhkwvLU
 7rjdmGrMrbkO5IFbg1sRvmN5xD++PjKaOla1/OHCs50TEjAZMtnvd2hG4qOClfCOKBLI
 li5A==
X-Gm-Message-State: AOAM533F9OZG83rg0WkyNcupxzNQDe1RHliXxqiKiRHAafvtWnI4xlke
 VTEfG50rFgq8dwCkoDn4UcgCAg==
X-Google-Smtp-Source: ABdhPJxsrvJEP26+VkzvzCqzDNRxmHcvrkr2wjLdHOCmOy+nZZfHQ5wDk3KDW5f115ZZy75z4/ZORA==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr10713632wru.0.1617880530387; 
 Thu, 08 Apr 2021 04:15:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o2sm18376833wry.4.2021.04.08.04.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:15:29 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:15:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
Message-ID: <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> One would normally hope not to be under enough memory pressure to need
> to swap GEM objects to disk backed swap.  But memory backed zram swap
> (as enabled on chromebooks, for example) can actually be quite fast
> and useful on devices with less RAM.  On a 4GB device, opening up ~4
> memory intensive web pages (in separate windows rather than tabs, to try
> and prevent tab discard), I see ~500MB worth of GEM objects, of which
> maybe only 10% are active at any time, and with unpin/evict enabled,
> only about half resident (which is a number that gets much lower if you
> simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> see a bit higher in practice, but cannot isolate swapped out GEM pages
> vs other), that is like having an extra 100+MB of RAM, or more under
> higher memory pressure.
> 
> Rob Clark (8):
>   drm/msm: ratelimit GEM related WARN_ON()s
>   drm/msm: Reorganize msm_gem_shrinker_scan()
>   drm/msm: Clear msm_obj->sgt in put_pages()
>   drm/msm: Split iova purge and close
>   drm/msm: Add $debugfs/gem stats on resident objects
>   drm/msm: Track potentially evictable objects
>   drm/msm: Small msm_gem_purge() fix
>   drm/msm: Support evicting GEM objects to swap

Given how much entertainement shrinkers are, should we aim for more common
code here?

Christian has tons of fun with adding something like this for ttm (well
different shades of grey). i915 is going to adopt ttm, at least for
discrete.

The locking is also an utter pain, and msm seems to still live a lot in
its own land here. I think as much as possible a standard approach here
would be really good, ideally maybe as building blocks shared between ttm
and gem-shmem drivers ...
-Daniel

> 
>  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
>  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
>  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
>  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
>  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
>  6 files changed, 272 insertions(+), 108 deletions(-)
> 
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
