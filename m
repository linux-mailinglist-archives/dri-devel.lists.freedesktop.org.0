Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C436329C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Apr 2021 01:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEED6E03E;
	Sat, 17 Apr 2021 23:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9266E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 23:03:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd23so38675878ejb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 16:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=awh5awoCxMMNiV/7Kf29qR5FFX37u+O+sxaqHZhsHlM=;
 b=qdwF8fQXzNyz1Um55Sq9mMsOqRLOqHYwqARV0AANFao1ooGPOXPFCda4gGjkCBoMof
 9nv2BrSDv2HI3gUNE79/GH3WF7mVBDqf9XA/AraluM2P0pkCRsTCl4DGUdpPHOaT3Y+9
 qXqaWUTTyLa2+N2HNnpQWy8R2ABzj8hNuldF8dbOOvO34/hjOftitAc7SY6nHh7RL8It
 pLyZOjuh+reLI3gTXkH0Ea3CICSZNZ20CN6EfXt8bUC7ff8ygndT6pcY8B1fYn/hOz7F
 CA+73UqgFw+HJAutibw/gmPrGpSYriKYUZPbMi9TbIq56WiyhG6X7/Cyqs7msSD6gDDf
 rL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=awh5awoCxMMNiV/7Kf29qR5FFX37u+O+sxaqHZhsHlM=;
 b=jQiLcmmn6SyLYteXAZM17WJJdYxAzm5c1QSbSO4O1G3ocIcrjp99wCBB7AK7SVKFAH
 zij2fD85Tm3txQAsHqFpp3g8FGGa1Fov3TSH+5UVMon5DvL38t2/TAemA2bWkoCUvEiD
 JEwAHFNN+slfJE2FoJBm36FL80y8GVgcT6OfNE65z/RUxbmCBdjfZq6InSJgs63Cqsv0
 vhmLsZBj3zsVzE1nK/gOQKornX93/+36Hwd//nDiJKO3kan53qj8QRXn1ArGuL7Y2b0i
 MLO7s207QxUA06xMV4X4/mcybloQIH6iRRJn41PDRanfAA5AFNc/hitk4R/gJxx/nPum
 ahuA==
X-Gm-Message-State: AOAM531HOAHV7ONFggDDvsxHiStGJDLNSeXKC8KCii6ztSJVNFE8YK6N
 BWB3cylvE0Vsdo/+mmhYeN4dwX2PQ4GIfexJnrnqLLgp
X-Google-Smtp-Source: ABdhPJzpbt5ewsVC/q19XdbX+qOqd5F2Bk9Ox1foytDZ0ajRhFfZoSdsXpxnLwooQACBK4MEn751OXxBV6kX91cWfjc=
X-Received: by 2002:a17:906:5f95:: with SMTP id
 a21mr14608471eju.456.1618700589820; 
 Sat, 17 Apr 2021 16:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <f7add0a2-162e-3bd2-b1be-344a94f2acbf@vmware.com>
In-Reply-To: <f7add0a2-162e-3bd2-b1be-344a94f2acbf@vmware.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 18 Apr 2021 09:02:58 +1000
Message-ID: <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
Subject: Re: [git pull] drm/vmwgfx fixes for 5.12-rc8
To: Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

Please make sure to always cc dri-devel and/or Daniel on these so if
I'm away they don't get lost, but also so that they make it into
patchwork for processing.

If you have a chance can you resend it, I'll see if we can process
this out of band and get it to Linus before release.

Dave.

On Thu, 15 Apr 2021 at 07:14, Zack Rusin <zackr@vmware.com> wrote:
>
> The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:
>
>    Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)
>
> are available in the Git repository at:
>
>    git@gitlab.freedesktop.org:zack/vmwgfx.git tags/vmwgfx-fixes-2021-04-14
>
> for you to fetch changes up to 2ef4fb92363c44e8a6f93fd0877b6a7dee6f874d:
>
>    drm/vmwgfx: Make sure bo's are unpinned before putting them back (2021-04-14 16:41:31 -0400)
>
> ----------------------------------------------------------------
> vmwgfx fixes for regressions in 5.12
>
> Here's a set of 3 patches fixing ugly regressions
> in the vmwgfx driver. We broke lock initialization
> code and ended up using spinlocks before initialization
> breaking lockdep.
> Also there was a bit of a fallout from drm changes
> which made the core validate that unreferenced buffers
> have been unpinned. vmwgfx pinning code predates a lot
> of the core drm and wasn't written to account for those
> semantics. Fortunately changes required to fix it
> are not too intrusive.
> The changes have been validated by our internal ci.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
>
> ----------------------------------------------------------------
> Zack Rusin (3):
>        drm/vmwgfx: Make sure we unpin no longer needed buffers
>        drm/vmwgfx: Fix the lockdep breakage
>        drm/vmwgfx: Make sure bo's are unpinned before putting them back
>
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c |  4 ++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 17 ++++++++---------
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  5 +----
>   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     | 14 ++++++++++++++
>   4 files changed, 27 insertions(+), 13 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
