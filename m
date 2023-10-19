Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257157CF1FF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7610E08A;
	Thu, 19 Oct 2023 08:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB2C10E066
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 736CBCE2928;
 Thu, 19 Oct 2023 08:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09A0C433C8;
 Thu, 19 Oct 2023 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697702808;
 bh=qmLnK61kpm7Lch/INgd/SaFSiC5I79WfNm+4Dqkvna0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ph6d2s4uonfV1kMKOY71S+/fj0HENmKeZK6wJnhtrHlbTy0nrezxKVn48gaK67pvu
 Sw4UkU1cS0wAhIz5ssxPrK92EBNDbaLupZsXtYR+aCnSLjHojKGq1H5yu+mnfRB9tM
 YZAuEXy5tTBAmiDXfZvpvcZc+eMflN1gMaLRsstN6/odWvB1ut3yWyOVDUgCkx9t0B
 3gzX1fCp3xqR4cgQN4YRBsor0Nt9xg4MJlJoGI74JfKkahlJ4ftU5WaT7PEFU3AkyJ
 FYgZABF22S+bBJWsBmPcSSFes73GtZiLhkM0SyrNxRNNCGD0ICBhtT8OU8aMFgjsn5
 ekbCmtPb9PmVw==
Date: Thu, 19 Oct 2023 10:06:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
Message-ID: <hrfj43uaoozwbm6wqvpbnqp2axqubuuu4rlantbmmrbddtitq5@6u6y7jibmpfg>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011143809.1108034-1-thierry.reding@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 11, 2023 at 04:38:07PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> This contains two patches that bring simplefb up to feature parity with
> simpledrm. The patches add support for the "memory-region" property that
> provides an alternative to the "reg" property to describe the memory
> used for the framebuffer and allow attaching the simple-framebuffer
> device to one or more generic power domains to make sure they aren't
> turned off during the boot process and take down the display
> configuration.

I just talked with Sima about it in the hallway at XDC. I'm fine with
those patches in principle, but it looks to me that simpledrm doesn't
have support for power domains and we'll want that :)

Thanks!
Maxime
