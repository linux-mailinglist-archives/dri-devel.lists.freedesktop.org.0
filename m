Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1723347F3A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60A46ECB5;
	Wed, 24 Mar 2021 17:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9506ECB5;
 Wed, 24 Mar 2021 17:22:55 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id 94so18174184qtc.0;
 Wed, 24 Mar 2021 10:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+LJ5KGeLprNG9/Wh48Bkm80XGY/R+j8JNkdwxNZvBw=;
 b=fBTnCPGv+4QB7S9AF+pwL+AT6CbYliHib54Z0l4wnOxkpdx3/Os+yi9i2s7C5Dm+fK
 flcCAIMPBkb+g9tdP/mno4H4n0xIeRc+rcAa/3qLzrR19ym/DLyWdr6ImxFN+UKR3L2Z
 zUHvAs2f71UQz++6tYan/Vztve39RjQVkYYXHyJhub9Fms90SpRxJe8afZryw9s6s01v
 MnyHCQFvRHs1pkx8cCxS32Cx9n9X0WT/tOiPlpnI27LIpav4UxWCqNy62QkJ0VLS6p/6
 YtDyKue+uD1xHAApWxB+qKMiCY9+v5ymlrtjW0MtALTjTjBWm7VysuXBcMCt1vURe0Rl
 HDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+LJ5KGeLprNG9/Wh48Bkm80XGY/R+j8JNkdwxNZvBw=;
 b=STZPrH9cZ2W0eBYGiCLWvlO8MUUabd7EAWzQ+R6miKiLRs1kvAZGESUbV/7HZp+sOc
 1dJVfjAxIplvTpw+wqR5Yt/c1JvM9VkCxuLYdApAX/c5gDPn1dwpa3ZoaPIbuVilatJn
 LS9HQYp+4GOHMhP928L/vzq1XEWWeKvKfZTlH7j8id008EWXetVffWQBCXV2DjcgaxhZ
 SNvAmXp1CUU4kP7L0z0hmIaiRjXIIQXVZFT+4vPv4sEqIl1UtQsK+76EPvJKx6puuvIa
 n6A7PlkAYohQJ580Y+HrtySQ01QInCt10YTGrg13KHFtAKk1BAPes3T+HGEQa6j1rnzc
 ro/A==
X-Gm-Message-State: AOAM5305HKT6tx48ytJqAWpH8AezzZPaMAuoZd+zjcM2uA84qEwVYejr
 seZ/mbALYvmY2QVIiIdk99Ymmh2MTRI8LH++Uc0=
X-Google-Smtp-Source: ABdhPJzxpWkKmW5oJm8pBaSc7Bu9Q0UNZk3J6tCNMRVw2etapWVLHDW2x4EMRN6W/oYxaYKGVFT3oEEDS7CpaW5E/oo=
X-Received: by 2002:ac8:4c90:: with SMTP id j16mr4020959qtv.223.1616606574741; 
 Wed, 24 Mar 2021 10:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210324121335.2307063-5-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 24 Mar 2021 17:22:28 +0000
Message-ID: <CAM0jSHOQ2m+zugDy6Mv7LAVDeL3c1R_17GeQ3szk1F8TM92rfQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915: Handle async cancellation in
 sentinel assert
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Mar 2021 at 12:14, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> With the watchdog cancelling requests asynchronously to preempt-to-busy we
> need to relax one assert making it apply only to requests not in error.
>
> v2:
>  * Check against the correct request!
>
> v3:
>  * Simplify the check to avoid the question of when to sample the fence
>    error vs sentinel bit.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
