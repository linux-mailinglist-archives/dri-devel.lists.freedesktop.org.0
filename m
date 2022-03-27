Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB014E8671
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 09:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6C10E00D;
	Sun, 27 Mar 2022 07:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DBE10E00D
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 07:11:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD66F60F57;
 Sun, 27 Mar 2022 07:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EFAC340EC;
 Sun, 27 Mar 2022 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648365070;
 bh=tw+Ir2j7lkjAaBlt0Rkh8PQ47RW2WFXIID2C0BI4imE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GcJcWqenkhCDPq1SRaMqvG94+0j3guAjJZq3NPJq430JTeqdoCL+BLa01BC6btXvP
 f6PS5PQ3obk5X3uT3Y4whF9Oba8k8olD+yXVcxC+GjHM+jF8xVTgnZ2Zy5AoJFWsKx
 U9mb6AEiqcrFBCZ9RtdVweYCMrd3GZ94u1SNP5vs=
Date: Sun, 27 Mar 2022 09:11:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kushagra765@outlook.com
Subject: Re: [ PATCH ] Documentation: fixed doc-build warnings
Message-ID: <YkAOCrbbrMaYkiSb@kroah.com>
References: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, arnd@arndb.de, corbet@lwn.net,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, mcgrof@kernel.org,
 linux-cachefs@redhat.com, viro@zeniv.linux.org.uk, tzimmermann@suse.de,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 26, 2022 at 05:22:55PM +0530, kushagra765@outlook.com wrote:
> >From 9a9918b051d5709b5e14ca8afa29f3ef644b8688 Mon Sep 17 00:00:00 2001
> From: Kushagra Verma <kushagra765@outlook.com>
> Date: Sat, 26 Mar 2022 16:43:15 +0530
> Subject: [PATCH] Documentation: fixed doc-build warnings

This should not be in the body of the email, please fix :(

> 
>    This patch fixes the following (and 2 other) doc-build warnings:
>       1. ./include/linux/dcache.h:308: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead
> 
>       2. ./include/linux/fscache.h:268: warning: Excess function parameter 'object' description in 'fscache_use_cookie'
> 
>       3 ./include/linux/fscache.h:285: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'
> 
>       4. ./drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'

This needs to be split up into one-patch-per-subsystem and can not be
taken as-is.

thanks,

greg k-h
