Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA0D478F64
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBB510E8B9;
	Fri, 17 Dec 2021 15:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9910E8B4;
 Fri, 17 Dec 2021 15:22:08 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id v22so2889239qtx.8;
 Fri, 17 Dec 2021 07:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2S35lepjl3bDhb1DrA5zDzqzSwyxD9irklsL6oLGsy4=;
 b=BLRqNDlRNIMlyxhiU45mSvyok7b25u63tVTM5Rp3KMBtbaO/H88gUGz/33gNOgNZTw
 gITSGMv3pkHGMZuVpYGlGetXzsu5wrawwtxbK8s/AjVOkHy23upfMhmbKx8p2RjSqwhp
 nCJzS+1iubdvEXb0b1oZm2gd955DK6ep+8/HysIgbSux70+hElcd/weE8Esn3gHHdMXM
 kXBaTQ/DzylUOJ03AHzyXFM1U4GI5jt8MZ/yjEh+tQ1Dz5s6ManuNJOYUJblwWG0IPJi
 G/jR2HJAXj8gY3BbimPbOw0MOeXj6HgPvmTdd0BBQ8GeGiuwJtLlLK5taUQhkb0kUZhG
 Y3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2S35lepjl3bDhb1DrA5zDzqzSwyxD9irklsL6oLGsy4=;
 b=Ji+BZ4Y+ntHo6Q93HynWgWZ8bIb7FkImRw1VvYJJCWFtV77CEOWMeAM54NPdsEr0zp
 s+7FuzOnW0gHWFV4Jf1lcHMBllcGsOwLZUbNWWXf4IRZKXT7HYOv82eF2tFwqaGOvuwW
 CSfmN/dH7eyVWYssQHNZADQn8x7Jwv9p4zBslbyK9xrEqp54V2WJqXcsSPMbHYRuc4pW
 AWDWcapz52SZPQ1HJWGcV1bCOlEA+/j2DCA2HYcZ0kqqUmFl3XMuJn8i37yJECH6L3GY
 5w2rSimKtfCXUYN7Kv4r1z2EOqtZTDMS0Z7qcr4oeJcCYqanYA6yUX26vxCUYeMncAcM
 gaTw==
X-Gm-Message-State: AOAM5306h+WN0SY1GBUTwSBvhgxE2pkqX4N3wYLLY/u7y2i9lCGYHgO0
 eRVrVngqvuU4riuWMKQLYGjpXO0pNRiiEuSLO0YpnJh1wKw=
X-Google-Smtp-Source: ABdhPJzBEFDQw1QLaORL8MiML/s4jTHG2rcqU+wAcMUcZQ0YQMoC2LKsiBcDNFpXPa7j0U7utNQyfMcPZAD3Olgc1Nc=
X-Received: by 2002:ac8:4d87:: with SMTP id a7mr2765964qtw.410.1639754527843; 
 Fri, 17 Dec 2021 07:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-4-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 15:21:41 +0000
Message-ID: <CAM0jSHM-chOPZ2n7_mhzDy1tXn_JW7TqKAT74gPtmQyVkZVrPg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 03/17] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v3.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> the special handling, all callers use the defaults anyway. We only remap
> in ggtt, so default case will fall through.
>
> Because we still don't require locking in i915_vma_unpin(), handle this by
> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> unpin, which only fails if we race a against a new pin.
>
> Changes since v1:
> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
>   from __i915_vma_get_pages(). (Matt)
> Changes since v2:
> - Free correct old pages in __i915_vma_get_pages(). (Matt)
>   Remove race of clearing vma->pages accidentally from put,
>   free it but leave it set, as only get has the lock.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
