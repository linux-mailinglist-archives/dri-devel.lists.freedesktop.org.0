Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FEB88FEB6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8A4112400;
	Thu, 28 Mar 2024 12:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hGPmrgbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7DE112400
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:09:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49BA46171F;
 Thu, 28 Mar 2024 12:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B462C433C7;
 Thu, 28 Mar 2024 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711627751;
 bh=bDdIQy3o9k9pDQhfcYuWNGkTquDBCyB4T3JOLOgtkNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGPmrgbRnQJRoCHhQpGt0HJ6PALN9gotcdgM0UlhKS1MUU/Bb7c6LK+ap/VBA3t2e
 dwLyEcgurYBkE2vZ1B9LEGWjZ5TlSK89ZF8067ImM9lK68gt9htkKaTFBd+HvyMl6E
 WBWKpB5ymJuAihuUgJCtAllNu4+sWGcFjqPP2xB3ZiZNJ7BRysglmoXwQPD5ba/eyY
 D2yMd02yc7bMD0+1oT27a+P7JTb1CpLpXf4FP3SPqGMh6WzK4CkF8Y2BEmVe73raoK
 O+gvT6yLaOi+tRgLImcytU5WLOTOzVvu7kZKu6U7CJ+PXo9IRIZhKYMl/GZimQQjxi
 m+4qp0ZmSqVXw==
Date: Thu, 28 Mar 2024 12:09:07 +0000
From: Lee Jones <lee@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH v2 1/2] video: backlight: make backlight_class constant
Message-ID: <20240328120907.GG13211@google.com>
References: <2024032805-putdown-mushy-a0f9@gregkh>
 <171162770830.1983471.4181539912129600848.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171162770830.1983471.4181539912129600848.b4-ty@kernel.org>
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

On Thu, 28 Mar 2024, Lee Jones wrote:

> On Thu, 28 Mar 2024 12:59:06 +0100, Greg Kroah-Hartman wrote:
> > Since commit 43a7206b0963 ("driver core: class: make class_register() take
> > a const *"), the driver core allows for struct class to be in read-only
> > memory, so move the backlight_class structure to be declared at build time
> > placing it into read-only memory, instead of having to be dynamically
> > allocated at boot time.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] video: backlight: make backlight_class constant
>       commit: 6683414cff25dc5b6e7dfe9dadf42b718384c892
> [2/2] video: backlight: lcd: make lcd_class constant
>       commit: d51564f749fe4e4efd570b0591f2d23696c90cc7

I also added Daniel's r/b.

-- 
Lee Jones [李琼斯]
