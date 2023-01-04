Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F8465D908
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251BD10E441;
	Wed,  4 Jan 2023 16:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9F710E441
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 16:21:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F47C6177F;
 Wed,  4 Jan 2023 16:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C471C433EF;
 Wed,  4 Jan 2023 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672849279;
 bh=4P5Io4msd12mkdoVuac9CSz+gC7WUcaBjm2ZmeY+G+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OdClYZR0/b3SNqvBTmKm3OMl9gch5IbOjgK2Ac5rnG/SSZ1bMLwbiFN+9wLU8X956
 Fbm7nXp7cYWLnj7LbeDj3i6LZ7WRBxWl+kD1IHeqh/dDtDtnIMF+zJTCcUB9jU0qkU
 8dr9DjsyrAO7OJNpkzd0/oEtcL3MHFx6zusb15mKzqdOz3Vb6Xesybxx3MRpGzdUti
 FCerTOu/3pERM7KFTFtkvpivRCZP4ZeGghrmk0NK6Ci7DS0QtaKt7ifLUbVKbYJ3yS
 GB/p+yUvZdTJRt3PaR9MFJCCOkwrhkw72fxLO0j9qHXmeENKhEnhu/Hji/ooMImaGL
 ZAwGk0capC/vA==
Date: Wed, 4 Jan 2023 16:21:12 +0000
From: Lee Jones <lee@kernel.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next] backlight: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <Y7WneKovX/UR8P+3@google.com>
References: <202212051556478226726@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202212051556478226726@zte.com.cn>
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Dec 2022, ye.xingchen@zte.com.cn wrote:

> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/video/backlight/lm3533_bl.c | 10 +++++-----
>  drivers/video/backlight/lp855x_bl.c |  4 ++--
>  drivers/video/backlight/lp8788_bl.c |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Is this v3?

-- 
Lee Jones [李琼斯]
