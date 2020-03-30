Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF91977F5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 11:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6956B89DC1;
	Mon, 30 Mar 2020 09:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6187589DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 09:39:52 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id a24so16361347iol.12;
 Mon, 30 Mar 2020 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c1gUtwRvLYdtrLbJA/IGQZdtPAAqrGpsy+JPnbE+NNQ=;
 b=qbVjwtVD2BzCf+Qpuozkb4s5p58/+w8HArwivwoaXjhQM4BRBbJZD1kjXjvrGMR2Sc
 c01PLmgHVLFPuJdFniHGMXu2w6rLIvzSQLvalO8Q/dKJVfnW9vg91QmDa9qpqpZ7A/ZS
 NDnjOyLxG5uOej6SWj2xLai2CEnoKXDf6G/88kxwgjdURScr1KviSCU82A3r3qOvk7Za
 GBKGw86I9wMmNFgdiGiFT5xs9qqCa/TWhd9uDOg/D0UssIN9Xx67PlvK9ktcyPpHSzvN
 QQdk9LkTYzni3Q3RY1WZbO9dB2TpaMazsGCIZeybPYWY90TNh+m5vd71koBGJ9unsrrI
 ZAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1gUtwRvLYdtrLbJA/IGQZdtPAAqrGpsy+JPnbE+NNQ=;
 b=dZ0KYYDEOCMXhfxFL9Jv0xj8KIJsU9pX2JgsEIsk/YWVMqrsxkI7JyEPKPbTgh0A1t
 dc3c7YFTnXhuOn8U7uzhBsx1cen4OMT1xp4yvhrpMiael1KFABEgRP6JJouPoT7f6aYl
 bnP53VPllXkDzNwyouFdwpDcNrFYTZLx25yeTAOiRbqbAdfd36fAh09FMXA0pQ8mrApE
 IfI5RiHmzCvx0KxkusNe12x0Frr7Eu4j+TOpYV5AzZkCg2pxoWl8ZzwBdQeWPPvWZxzt
 +PU0Uv7mHcLzGuWn7hBAopBOyi+Gk9mcDrhQg9lwleSfpcS2Z1M2kbahboK0p6gUPaId
 1x3w==
X-Gm-Message-State: ANhLgQ0o8SyOaCqEN5WGLzLB/iJrkDzudj1ZJwQFbwxJGerXBQSbgFH/
 CXtHVdYfR/zYX2Pu9vpJb0cdNwGoYFTalR0NyODLY4FP5mM=
X-Google-Smtp-Source: ADFU+vtaoT6KjcJ9ecQiB0qXnt+YZYGFPOYnZ5jKaU4tddPcw7WZUkopfgN0n8FZ4HONOwByDpEh1zQSusUc3tl1iv0=
X-Received: by 2002:a6b:c916:: with SMTP id z22mr9873080iof.138.1585561191793; 
 Mon, 30 Mar 2020 02:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
In-Reply-To: <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Mon, 30 Mar 2020 10:39:41 +0100
Message-ID: <CABnpCuBu0w7th2g+0EJvrFr2RFDC-uhHhOF1gvfsM-K0sjM5mg@mail.gmail.com>
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx-request@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 9:18 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Today I've noticed that this patch went to final v5.6 without even a day
> of testing in linux-next, so v5.6 is broken on Exynos and probably a few
> other ARM archs, which rely on the drm_prime_sg_to_page_addr_arrays
> function.
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Not sure what the full merge pipeline is here, but my original patch
was not sent to the stable mailing list. So I would assume that it
went through the normal release gates / checks ? If there was a fault
on the way I uploaded the patches I do apologise however I did follow
the normal guidelines as far as I understood them.

Personally I did validate this patch on systems with Intel and AMD GFX,
unfortunately I do not have any ARM based dev kits that are able to run
mainline (was never able to get an Nvidia TK1 to boot outside of L4T)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
