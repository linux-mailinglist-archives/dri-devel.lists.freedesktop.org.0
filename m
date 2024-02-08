Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D796B84DEB5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F810E5F0;
	Thu,  8 Feb 2024 10:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CLTTh2gU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3509C10E5F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:53:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACCAF61BC8;
 Thu,  8 Feb 2024 10:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6034C433B1;
 Thu,  8 Feb 2024 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707389589;
 bh=wBeYdUBNJaBkDPT3NHcSUBRjPj9TIlvLdhLYgROCToE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLTTh2gUPf7X+du/kpXt5N6d8vyKMod7zdhYCpAkk8ftEkOe1iwkixVKEgx3dQaAk
 XYU9lDce1kwLNZ7oU7X3FxsZUhpTzucTaU7M5+PDAzhZYuZ617AddRSRcd5qMxVuu4
 1oEPcSYVk8kG8LhplCoFipC/B9Novif9PSh4JY7hYBc814/jNuaHGWjg5PuEUja2/2
 5TiKmWuhNb3o3lczdbWr4WwVd2RbjTt2X7AKKsojlvLVnssePOhhUgfOl6ZGCyajrL
 QcEXgbl6fw07HkyYrh/z2kBvoIn7ejWJTbr2lfVWI9XESB3nxNEDmXBAJYksLuZfJG
 54XEt4QBk+Lfg==
Date: Thu, 8 Feb 2024 10:53:04 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/4] backlight: hx8357: Clean up and make OF-independent
Message-ID: <20240208105304.GI689448@google.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
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

On Thu, 01 Feb 2024, Andy Shevchenko wrote:

> A few ad-hoc cleanups and one patch to make driver OF-independent.
> 
> Chagelog v2:
> - renamed init to init_fn and typedef accordingly (Daniel)
> - added tags (Daniel, Javier)
> 
> Andy Shevchenko (4):
>   backlight: hx8357: Make use of device properties
>   backlight: hx8357: Move OF table closer to its consumer
>   backlight: hx8357: Make use of dev_err_probe()
>   backlight: hx8357: Utilise temporary variable for struct device
> 
>  drivers/video/backlight/hx8357.c | 57 +++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 30 deletions(-)

Someone may wish to address this:

WARNING: DT compatible string "himax,hx8369" appears un-documented -- check ./Documentation/devicetree/bindings/
#58: FILE: drivers/video/backlight/hx8357.c:636:
+		.compatible = "himax,hx8369",

-- 
Lee Jones [李琼斯]
