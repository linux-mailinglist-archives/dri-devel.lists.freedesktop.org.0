Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF2B425F0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC910E14E;
	Wed,  3 Sep 2025 15:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="I9T5mzee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1951D10E14E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:51:07 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4B16E25D4D;
 Wed,  3 Sep 2025 17:51:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXn3TEdJtINv; Wed,  3 Sep 2025 17:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1756914663; bh=1f0F6PtJuoEuyJyHHkBr1BSyx6JzviX2TSn720qBm+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=I9T5mzee7pqgMbTCrBgVvdFhYDFyhqkiwm+l5pzZOUoLgYLld2tmQla6y9ML2ZF5y
 xXxTfAY0Spe3WSnaSpyX97SKULTdoPOTkkzvc3gxO7BJjkRrKfXW7Oq8Ik32e5Jlyj
 dCmp/mt4cxunfDM7+LiZzjlVe/7WFjxloGRlxWhrB4H6UkjDftjAgHZsg9pOvaMLXf
 pUCQ4JW32dFGWM7NwZjJLyBSOxpdngtFq5pmlPOJmCCpHJLcqG5DRpT/EI0OQeQo4J
 0buouFggPM15y7Ib7mohlK4V2kQE4DvWtN8M6FfuD4ZswgaOe9tnP9op0wrosy9lPe
 xzPBBqOLOiKBA==
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 15:51:03 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Inki Dae <daeinki@gmail.com>, Inki Dae <inki.dae@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
In-Reply-To: <20250902130304.1f80f4c6@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
 <20250826121320.4931c6eb@canb.auug.org.au>
 <20250901122226.20a39858@canb.auug.org.au>
 <20250902130304.1f80f4c6@canb.auug.org.au>
Message-ID: <54f68544fa192779e15b46257dd0bfb4@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

On 2025-09-02 03:03, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 1 Sep 2025 12:22:26 +1000 Stephen Rothwell 
> <sfr@canb.auug.org.au> wrote:
>> 
>> On Tue, 26 Aug 2025 12:13:20 +1000 Stephen Rothwell 
>> <sfr@canb.auug.org.au> wrote:
>> >
>> > On Thu, 21 Aug 2025 11:27:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > >
>> > > After merging the drm-exynos tree, today's linux-next build (arm
>> > > multi_v7_defconfig) failed like this:
>> > >
>> > > drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXYNOS7870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNOS5410'?
>> > >   158 |         .hw_type = DSIM_TYPE_EXYNOS7870,
>> > >       |                    ^~~~~~~~~~~~~~~~~~~~
>> > >       |                    DSIM_TYPE_EXYNOS5410
>> > >
>> > > Caused by commit
>> > >
>> > >   d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")
>> > >
>> > > I have used the drm-exynos tree from next-20250820 for today.
>> >
>> > I am still seeing this failure.
>> 
>> I am still seeing this failure.
> 
> Today, I have just reverted that commit instead of the whole branch,

Hi, sorry for the late reply.

This commit is from commit [1] of branch [2]. However, the macro is
defined in commit [3] of branch [4]. I had sent those patches in a 
single
patchset, though.

I guess the merge strategy would be exynos-drm-misc-next, followed by 
exynos-drm-next.

Let me know if you need to know anything else. Thanks!

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=d07e4c00696f53510ec8a23dcba0c4ac87840874
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-next

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-misc-next&id=bcd0d93e902e54e6b404b574b3a6b23315bcea8d
[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-misc-next

> 
> --
> Cheers,
> Stephen Rothwell
