Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C939A8A36C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC8F10E7E6;
	Tue, 15 Apr 2025 15:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="loWozUvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444610E7E6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 15:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 395F543852;
 Tue, 15 Apr 2025 15:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD30C4CEEB;
 Tue, 15 Apr 2025 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744732404;
 bh=W6Fvl1K7fKXPPKAM32Emk/h6KeYYqQ1cLu0Rj4bwCGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=loWozUvtLWm+OMRpPsZeKzhrTKC8RzMXNRem4vneHdOVkFgXFByZoI48hukvZlBea
 DSWaMbcL/55v9cJrC5rRmiT9HaSDuBzC3fFJURZoCg5lri2u1W3DcOcVJCQFoQwese
 /wqcvN/bfwILlXJe5vq9sEXbEBlsjwPX1kkXX0FtJXAw6ak3iL3UKw7sDiYsNXLS9t
 TxQoh17aEYd+tUJ6yAqKA0tpeJxK1yxFje0GrPxIdcEYu5K6Tn08/DvKj0q1IZz4rf
 yuzwJ338JIO4NdEAiEqYxeMOGTYxIReEcMVYC7eCNU+jhSq6UWSK3v26ybiNm2+PAT
 v9zEXfPW/dOFQ==
Date: Tue, 15 Apr 2025 16:53:19 +0100
From: Lee Jones <lee@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, danielt@kernel.org, jingoohan1@gmail.com,
 Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] docs: backlight: Clarify `actual_brightness`
Message-ID: <20250415155319.GZ372032@google.com>
References: <20250408192729.4091391-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408192729.4091391-1-superm1@kernel.org>
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

On Tue, 08 Apr 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Currently userspace software systemd treats `brightness` and
> `actual_brightness` identically due to a bug found in an out of tree
> driver.
> 
> This however causes problems for in-tree drivers that use brightness
> to report user requested `brightness` and `actual_brightness` to report
> what the hardware actually has programmed.
> 
> Clarify the documentation to match the behavior described in commit
> 6ca017658b1f9 ("[PATCH] backlight: Backlight Class Improvements").
> 
> Cc: Lennart Poettering <lennart@poettering.net>
> Cc: richard.purdie@linuxfoundation.org
> Link: https://github.com/systemd/systemd/pull/36881
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  Documentation/ABI/stable/sysfs-class-backlight | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
> index 6102d6bebdf9a..909cacde85041 100644
> --- a/Documentation/ABI/stable/sysfs-class-backlight
> +++ b/Documentation/ABI/stable/sysfs-class-backlight
> @@ -26,7 +26,9 @@ Date:		March 2006
>  KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
> -		Show the actual brightness by querying the hardware.
> +		Show the actual brightness by querying the hardware. This
> +		takes into account other factors besides the value programmed
> +		for 'brightness' and may not match the value in 'brightness'.

Which factors?  Under what circumstances may the values not match?

>  Users:		HAL
>  
>  What:		/sys/class/backlight/<backlight>/max_brightness
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]
