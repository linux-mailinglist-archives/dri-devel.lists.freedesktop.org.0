Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BF8BA743A
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 17:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1810E1EE;
	Sun, 28 Sep 2025 15:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="hrahLz7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8A410E1EE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 15:32:01 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 3C6D120B0B;
 Sun, 28 Sep 2025 17:31:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mACc7Ir64YJ; Sun, 28 Sep 2025 17:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1759073518; bh=FJ0gsnDjkm1bP2Lu4Me+9BXyYvOwYPRgFGMGBGMpHwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hrahLz7J+7ACbNuP5Vta91eHr/KAkJ8u77B1NSbVGIg+oCRVctkHhpP1ep4GENlxB
 /u2v+XDSQAKrIMBNb8NFH+kty4tnOf8dPUrU3zn0ZR0N/9WGYIdde8+kkHwZZQUthj
 6aW8yLP15qhqfXLPmgO+YBmEyD+oU6q3x37hJSlWaggqA4oXblnAXZSv4je6T5WFJa
 LdpAPeBCxDs1WnH6EKi9ZeOwvE2p/HN9aQyHc5IOMKGXZhY19TPkeBVGKFls/uLqww
 SargUGL610UapaJEA8VNpC0APQmMbjKfs2C3UfAWwXmhOhc9n3vqJqsHhtae5ST31v
 x2JwGjMCD1vpA==
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 15:31:58 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Inki Dae <daeinki@gmail.com>, Inki Dae <inki.dae@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
In-Reply-To: <20250912124721.535e89fc@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
 <20250826121320.4931c6eb@canb.auug.org.au>
 <20250901122226.20a39858@canb.auug.org.au>
 <20250902130304.1f80f4c6@canb.auug.org.au>
 <54f68544fa192779e15b46257dd0bfb4@disroot.org>
 <20250904075923.537b45bd@canb.auug.org.au>
 <20250912124721.535e89fc@canb.auug.org.au>
Message-ID: <309f74f9ee216e8a31a210fa22c414a6@disroot.org>
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

On 2025-09-12 02:47, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 4 Sep 2025 07:59:23 +1000 Stephen Rothwell 
> <sfr@canb.auug.org.au> wrote:
>> 
>> On Wed, 03 Sep 2025 15:51:03 +0000 Kaustabh Chakraborty 
>> <kauschluss@disroot.org> wrote:
>> >
>> > This commit is from commit [1] of branch [2]. However, the macro is
>> > defined in commit [3] of branch [4]. I had sent those patches in a single
>> > patchset, though.
>> >
>> > I guess the merge strategy would be exynos-drm-misc-next, followed by exynos-drm-next.
>> >
>> > Let me know if you need to know anything else. Thanks!
>> >
>> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=d07e4c00696f53510ec8a23dcba0c4ac87840874
>> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-next
>> >
>> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-misc-next&id=bcd0d93e902e54e6b404b574b3a6b23315bcea8d
>> > [4] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-misc-next
>> 
>> The problem is that nobody has ever asked me to merge [4] into
>> linux-next ... I also presume that it will be merged into the 
>> drm-fixes
>> tree (or Linus' tree) at some point and that hasn't happened either.
> 
> This is still failing ... and it has been since Aug 21!

Hi, can you can try merging it again? The macro is in linux-next now.

> 
> --
> Cheers,
> Stephen Rothwell
