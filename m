Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D366CAEED7C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 07:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8AC10E140;
	Tue,  1 Jul 2025 05:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d4EphzzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BDD10E140
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 05:14:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9154A41D53;
 Tue,  1 Jul 2025 05:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0798C4CEEB;
 Tue,  1 Jul 2025 05:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751346895;
 bh=DERyJgZKDAwVFBmoHSsrVpgzn5q2agZWzYJC0whttlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4EphzzFzWxbZDrDcNlQczILjHMZesyheqBZ5nFdPg9+v7vlz/KWP1454ly3b6kYw
 spQp7goOnpmFTuqPs4gtvQdjltemnQk+KFcMEE0J7F6XPz9CQfuqP55/5mFv59WnyK
 0Nryg6ul/A8YZzb/J7vExTDp0WYpoMhLPFMWIl4Y=
Date: Tue, 1 Jul 2025 07:14:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <2025070128-amplifier-hyphen-cb09@gregkh>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
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

On Tue, Jul 01, 2025 at 12:47:22AM +0530, Abdun Nihaal wrote:
> Hello Greg,
> 
> On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> > This patch does not apply to my tree, can you rebase and resend?
> 
> I think you have added both the V1 patch and this current V3 patchset to
> your tree, that's why this patch does not apply.
> 
> Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()") 
> on staging-testing is an older version of this patchset, and so it has to be dropped.

I can't "drop" patches as my tree can not be rebased.  Can you send a
fix-up patch instead, OR a revert?

thanks,

greg k-h
