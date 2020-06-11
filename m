Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A11F6406
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3EE6E8B1;
	Thu, 11 Jun 2020 08:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191D6E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:54:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o26so3371810edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bw+V3wLHTM7iJAt18YSs25Q73LjKcxMJcBBocazrA4=;
 b=DiC/8+X93yYnhHRJtAvQfxbw2XSIf5yNO6ElLZQGmw+ASMt3WHFdOgvdSAY2VN1RdC
 vcjLGNCIAKNZ6aGOO1DpH6Q2SG0Ob6CQVOgobudNqacRfc3AafpN9aKQXNNRDDdDdTsa
 xE8DimKjdyNx5rixUKIhQqGV/QrHYQvWuRV3DXtxMNnAJTBo+oMxJjgonwCY6gL7/uWv
 m55DRMA4goNC29LIW03LkavMCFdUKiSO3HCqJDDdy0g7W8Bbg5Btg1qK5vMfZIK85s0U
 OESWF7AbzrsAwdKk/kfNyFkiL7da1297cO94SiiT0lz3P+LUpkO9s/Uc2rvgY+cTAYDh
 zx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bw+V3wLHTM7iJAt18YSs25Q73LjKcxMJcBBocazrA4=;
 b=GjAt4Qx91pIiSRZn4xVHo1nT+U4/OFL436p08ohvVXRFS7L5PAqIVtNtxAQh50uZ+v
 5F8B13dC/AmH4hnXO3kqXg5WI70Y5ITpLsZCgLNi75hPBNHnUxY9njlKFlnmwzpC07/0
 dmSsa3wf/mTOFfcv6A1oHGpJxHTlcxKI/vPJlSmDd7fAykRUmIdURgk7+yxfFku962Rn
 +UmNgytE9jy2+aj43nxlj5RBvSjpYh/4SVBmp8yh/HXr2+hDTyR2hEwtRBgSHgZqpr0w
 4hrfagcmGykPSIX2RQMuj7Uag4Zdsogx/goikWPVw1wr1IjaUjVPBSm2ZJxAfwfP8beQ
 gacQ==
X-Gm-Message-State: AOAM531dCxUY1vGoOCSqZ+FCPjD8ITUqU0uXEdSDBLwXX5BqgDTwpZOt
 +nR4YXr2u1uCL1iffmleMXMhZlTtQPHqnxvw+ymV/Q==
X-Google-Smtp-Source: ABdhPJxyerA60LPR4dRD2QK1TZ5tc9Pqs9AUoEwTTRAumEOjf8tBER/H4EVa++W9q3TACWCmreAnsI0J5Vi1+4jREpI=
X-Received: by 2002:a05:6402:1153:: with SMTP id
 g19mr5890903edw.127.1591865653991; 
 Thu, 11 Jun 2020 01:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
In-Reply-To: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Jun 2020 18:54:02 +1000
Message-ID: <CAPM=9twpkGsm0z7HkU9PWEKiua37zU4yrHKoKYoe30UPXQ8Lzg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.8-rc1 (updated pull)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(now with a subject you might see).

On Thu, 11 Jun 2020 at 18:38, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This is the update of the pull I sent earlier today, it's got a couple
> of more fixes along with the i915 fixes. One sun4i fix and a connector
> hotplug race The ast fix is for a regression in 5.6, and as mentioned
> previously one of the i915 ones fixes an oops reported by dhowells.
>
> definitely taking tomorrow off now :-)
>
> Regards,
> Dave.
>
> drm-next-2020-06-11-1:
> drm fixes for 5.7-rc1
>
> core:
> - fix race in connectors sending hotplug
>
> i915:
> - Avoid use after free in cmdparser
> - Avoid NULL dereference when probing all display encoders
> - Fixup to module parameter type
>
> sun4i:
> - clock divider fix
>
> ast:
> - 24/32 bpp mode setting fix
> The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:
>
>   Merge tag 'drm-intel-next-fixes-2020-06-04' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08
> 11:59:57 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-11-1
>
> for you to fetch changes up to 66057dd1d1cf2149e0f5fdaee58d6ea69bc98048:
>
>   Merge tag 'drm-misc-next-fixes-2020-06-11' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-06-11
> 17:51:15 +1000)
>
> ----------------------------------------------------------------
> drm fixes for 5.7-rc1
>
> core:
> - fix race in connectors sending hotplug
>
> i915:
> - Avoid use after free in cmdparser
> - Avoid NULL dereference when probing all display encoders
> - Fixup to module parameter type
>
> sun4i:
> - clock divider fix
>
> ast:
> - 24/32 bpp mode setting fix
>
> ----------------------------------------------------------------
> Chris Wilson (2):
>       drm/i915/gem: Mark the buffer pool as active for the cmdparser
>       drm/i915/display: Only query DP state of a DDI encoder
>
> Colin Ian King (1):
>       drm/ast: fix missing break in switch statement for format->cpp[0] case 4
>
> Dave Airlie (2):
>       Merge tag 'drm-intel-next-fixes-2020-06-10' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge tag 'drm-misc-next-fixes-2020-06-11' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>
> Jani Nikula (1):
>       drm/i915/params: fix i915.reset module param type
>
> Jernej Skrabec (1):
>       drm/sun4i: hdmi ddc clk: Fix size of m divider
>
> Jeykumar Sankaran (1):
>       drm/connector: notify userspace on hotplug after register complete
>
>  drivers/gpu/drm/ast/ast_mode.c                 |  1 +
>  drivers/gpu/drm/drm_connector.c                |  5 +++
>  drivers/gpu/drm/drm_sysfs.c                    |  3 --
>  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 56 ++++++++++++++++++++++----
>  drivers/gpu/drm/i915/i915_params.c             |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi.h             |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c     |  2 +-
>  8 files changed, 60 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
