Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17D87AB36
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D510EA30;
	Wed, 13 Mar 2024 16:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B1mcMxZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96BE10E834
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 16:33:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E23761491;
 Wed, 13 Mar 2024 16:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4303DC43390;
 Wed, 13 Mar 2024 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710347635;
 bh=Z8+NUNpRE+2VDl0oGhDDoGU2zsP/cVwd07jGMJxdApE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B1mcMxZY2FUzH8ySkDlroxMN/syRJftbD0gVPi2ZOlRKaZf+rc5UBbvcr1apBJHtK
 tv3LB+b+KJm5anJtYokkac4MlQJ1q94JpldrlZLhHN/QUfqg6ipUdnAHGkNbtUs/jc
 mpaVb68go5pPQwRsM02tzbpQcU89FO7zIOBB15oaNgn11w+lAgEUuPXFkAFleH5bJn
 obcLd1E9pAciaXEaSBA999ISHlXaHotl+/x6wWULWhpxZOa9z0LbVCDruZ1LGmMQFn
 CYLGRVeV5NKZS6UNp32PlJIWYYFHYaWcSUf96MJXxn+NIo0BTLC9lt3c29st1hf5v0
 5fFzDzpRnRkdw==
Date: Wed, 13 Mar 2024 16:33:51 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] backlight/omap1-bl: Remove unused struct
 omap_backlight_config.set_power
Message-ID: <20240313163351.GH1522089@google.com>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313154857.12949-3-tzimmermann@suse.de>
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

On Wed, 13 Mar 2024, Thomas Zimmermann wrote:

> The callback set_power in struct omap_backlight_config is not
> implemented anywhere. Remove it from the structure and driver.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/omap1_bl.c     | 3 ---
>  include/linux/platform_data/omap1_bl.h | 1 -
>  2 files changed, 4 deletions(-)

Just a quick one - I'm sure Daniel will be here soon to conduct a proper
review.

Could you attempt to use the subject line format expected by a given
subsystem please?

`git log --oneline -- <subsystem>` is your friend.

Thanks.

-- 
Lee Jones [李琼斯]
