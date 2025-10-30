Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D5C1FC70
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6310E8E7;
	Thu, 30 Oct 2025 11:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TUMpsPNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6167D10E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:19:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EA09417BC;
 Thu, 30 Oct 2025 11:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A0C4CEF8;
 Thu, 30 Oct 2025 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761823141;
 bh=dMWeVsXlPYq+6w66BT5t7sFQftyp1w+uf3dD7WEW+Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TUMpsPNY2Avx+CEsJhbuUOTzE6D0vmcukFqQ3brKymX1bSoe2y/32milLkW7nFxpj
 q5Z82zTpvPttyrM//kUS6S6vjBoeO7qhSCBvRpaDTGwXBe6m8+jNpQb/Q/W2YlpOVz
 /w0tRON0ru5SGJ2mlOObIDUiYoPmhgkdDduQSbfLSnAx816lOpXXVtOgolbrCE46n7
 KLpQzkf51qrGwsY8YJMOgs5mh0TM41wmZw87u3fLw8XoW5qoMngAQ5hhC0Uj5xWP6+
 W3eBFNiRQMH6zm8tGxiAmVpFb8hXfeqzDdNFQxSunEXwFx52w9EEoBJFLEHvOL8B9P
 UoB0Xs/gV1EEw==
Date: Thu, 30 Oct 2025 11:20:03 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, lee@kernel.org,
 simona.vetter@ffwll.ch, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH] arch: sh: Include <linux/io.h> in dac.h
Message-ID: <aQNJ4xZzMps_OLD8@aspen.lan>
References: <20251028170913.16711-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028170913.16711-1-tzimmermann@suse.de>
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

On Tue, Oct 28, 2025 at 06:07:55PM +0100, Thomas Zimmermann wrote:
> Include <linux/io.h> to avoid depending on <linux/backlight.h> for
> including it. Declares __raw_readb() and __raw_writeb().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@intel.com/
> Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
