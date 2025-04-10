Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B6A83F19
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945010E875;
	Thu, 10 Apr 2025 09:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qfJPXZNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475D010E875
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 429EF68445;
 Thu, 10 Apr 2025 09:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E227C4CEE3;
 Thu, 10 Apr 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744278068;
 bh=6AJS6CuDOL5YXoCyhgTDKqDfnzqEc5Se4QRNrdUe/4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfJPXZNjcSj1Lf/TdyaCrgIZF2DqCbSqV40QNs/Tld1Rnqa35LrOaC8AAHelkTEgy
 YNWTzpFuSJ+5NA2quiRLTgz7dIi4K7AVhk49vGskH+V4WMzydwuoVZnEB2Fw8O1GAU
 jhGiamgI6LM6o5x2hGpr63BqkuIxdMhXX6SyYbwTQ2cwldrBid2dx3ZivfngPOSzRu
 Pr4zdS1Ep2dlfDT9e7263UjxSwLAQL3i9ZzGg8IUL2f0NPssvUZ9mBSRNTR9w9AeCQ
 eQMHOt6Hd+XEzk2LVCojIVLbOroKOirSURQYz+6Rv77T1vHzlbwtLxMQoLPgpzc6TN
 seOxR9L+GPalg==
Date: Thu, 10 Apr 2025 10:41:03 +0100
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <20250410094103.GS372032@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>
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

On Thu, 10 Apr 2025, Lee Jones wrote:

> On Fri, 21 Mar 2025 10:53:53 +0100, Thomas Zimmermann wrote:
> > This series removes the remaining dependencies on fbdev from the
> > backlight, lcd and led subsystems. Each depends on fbdev events to
> > track display state. Make fbdev inform each subsystem via a dedicated
> > interface instead.
> > 
> > Patches 1 to 3 make fbdev track blank state for each display, so that
> > backlight code doesn't have to.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/11] fbdev: Rework fb_blank()
>         commit: 93e41f968d7c6ea1cedc6b365917cbb787ef08f6
> [02/11] fbdev: Track display blanking state
>         commit: 7e3711eb87c584ed224a7ad7000eba36e6fa3a51
> [03/11] fbdev: Send old blank state in FB_EVENT_BLANK
>         commit: dfb4bf1ac40162ff5ea3715a10f6af2dcf3030c5
> [04/11] backlight: Implement fbdev tracking with blank state from event
>         commit: 726491f2038ec71122d45700f3abf36fdb277aaa
> [05/11] backlight: Move blank-state handling into helper
>         commit: 4bfb77f3381627640e97e0e423c93a2ea93e7de7
> [06/11] backlight: Replace fb events with a dedicated function call
>         commit: b01beb2f1f6bcda17634a5b529865ffc5a9b795f
> [07/11] backlight: lcd: Move event handling into helpers
>         commit: e98696cea7e289447a5d2328546b947629301616
> [08/11] backlight: lcd: Replace fb events with a dedicated function call
>         commit: bc70cc84f5a2ebfd7e7112e9b8837e0c7954fc65
> [09/11] leds: backlight trigger: Move blank-state handling into helper
>         commit: 28f8bab711c0984005a6dd4cc980b4ba8409b817
> [10/11] leds: backlight trigger: Replace fb events with a dedicated function call
>         commit: dc2139c0aa3283e5749109641af1878ed7bf7371
> [11/11] fbdev: Remove constants of unused events
>         commit: d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0

Okay, these have been submitted for build testing.

Once complete, I'll send out a PR.

Note to self: ib-backlight-leds-fbdev-6.16

-- 
Lee Jones [李琼斯]
