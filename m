Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39756CC6D26
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA3310EBF2;
	Wed, 17 Dec 2025 09:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E955cPQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2110EBD0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:35:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14D7E43B46;
 Wed, 17 Dec 2025 09:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778B2C4CEF5;
 Wed, 17 Dec 2025 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1765964101;
 bh=dMeTDFXTFnhr5jxwEwAS48XtiMRS5TijhF2JZ0IReUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E955cPQSHga6P7Wq+Nr48mQX0Enu6gej/dmpPsCfQ4pLLEFvuBzn2zHV19fLlNqCi
 s/IqBO+dHMCpLmmlteFiUCfxgy/HJvPQMfxNaCDAq7zFkebt5KcaXk1njijDrT7IkI
 Nf1oZ+mOBA97UY18cxxwIvfeSHnGUev9uvdt/EtY=
Date: Wed, 17 Dec 2025 10:34:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>
Subject: Re: [PATCH v2,stable/linux-6.6.y] fbdev: Fix out-of-bounds issue in
 sys_fillrect()
Message-ID: <2025121715-vindicate-valium-1118@gregkh>
References: <20251217094530.1685998-1-gubowen5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217094530.1685998-1-gubowen5@huawei.com>
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

On Wed, Dec 17, 2025 at 05:45:30PM +0800, Gu Bowen wrote:
> This issue has already been fixed by commit eabb03293087 ("fbdev:
> Refactoring the fbcon packed pixel drawing routines") on v6.15-rc1, but it
> still exists in the stable version.

Why not take the refactoring changes instead?  That is almost always the
proper thing to do, one-off changes are almost always wrong and cause
extra work in the long-term.

Please try backporting those changes instead please.

thanks,

greg k-h
