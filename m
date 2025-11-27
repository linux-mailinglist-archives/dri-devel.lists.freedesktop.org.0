Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75043C8D5B1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D488010E7A6;
	Thu, 27 Nov 2025 08:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B23BLWiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B8A10E7A6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 828EB43B1F;
 Thu, 27 Nov 2025 08:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A4DC4CEF8;
 Thu, 27 Nov 2025 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764232494;
 bh=1MjFy7B9VhOqtQQ+1qTHLqjAkFtoUn7S3ppVr+tGY9k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B23BLWiqnASM3TwAZ4SKHEcQXEo8cFAFHN3UlwwPDLOARwrg18FxkF7dG2bNvQXdY
 TBxY3fTwCfZgwegT8iCe/nZl1RUHvnwJGSui5KxMdO0+niSdKpfIIiwXQiizyvN1pq
 RYzmxaGJ5c3heyiJoVdotfpaLoZqiMgMY/2chEuKjrdpW3RWI3gPAv4PTlb1yiE/Dv
 NE+VOF2T20UhP254oERIfY7JMYS2MpbJmFDrPKg2NylWXeyKd+3zajTjAKzAGPaevU
 8voD06IbvrY32qZffO6ZKInn5vidknYb/47cjR6Shu2WYfnDqevxKwVEqeKAj1lTyD
 nOMRVzpl4ozmg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Junjie Cao <caojunjie650@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 patches@lists.linux.dev
In-Reply-To: <20251120-backlight-aw99706-fix-unused-pm-functions-v1-1-8b9c17c4e783@kernel.org>
References: <20251120-backlight-aw99706-fix-unused-pm-functions-v1-1-8b9c17c4e783@kernel.org>
Subject: Re: (subset) [PATCH] backlight: aw99706: Fix unused function
 warnings from suspend/resume ops
Message-Id: <176423249224.3594795.9309451198706510683.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 08:34:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Thu, 20 Nov 2025 13:22:46 -0700, Nathan Chancellor wrote:
> When building for a platform without CONFIG_PM_SLEEP, such as s390,
> there are two unused function warnings:
> 
>   drivers/video/backlight/aw99706.c:436:12: error: 'aw99706_resume' defined but not used [-Werror=unused-function]
>     436 | static int aw99706_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~
>   drivers/video/backlight/aw99706.c:429:12: error: 'aw99706_suspend' defined but not used [-Werror=unused-function]
>     429 | static int aw99706_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] backlight: aw99706: Fix unused function warnings from suspend/resume ops
      commit: d3cc7cd7bc46af587747399e956cf4508221476f

--
Lee Jones [李琼斯]

