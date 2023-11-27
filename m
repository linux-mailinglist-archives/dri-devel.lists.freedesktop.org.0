Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97837FA17F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717A10E2A3;
	Mon, 27 Nov 2023 13:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157AF10E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BA5DBB835E8;
 Mon, 27 Nov 2023 13:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5ECC433C7;
 Mon, 27 Nov 2023 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701093253;
 bh=3+9Ueuma8TxHWXhIh18cI3XqRceeHiPhdxjt04xqfAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVydtS9gZm84o8VAEMNb8GBXKlgSAvD7mZIM21b+cTF+CRDORd3CbHdp83N4+w+8m
 v8kqcaUWwLS2NgdFbDcuM032o+oKv62Mhqxz62pHUm/AGaLEnHBKVpFPnutcwHfF0i
 u3y2gZtrpzGlFCbERyml8074Usts0mI9oJZ+niHI=
Date: Mon, 27 Nov 2023 13:30:07 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 26/32] staging/sm750fb: Initialize fb_ops with fbdev
 macros
Message-ID: <2023112700-pulp-framing-806e@gregkh>
References: <20231127131655.4020-1-tzimmermann@suse.de>
 <20231127131655.4020-27-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127131655.4020-27-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 02:15:55PM +0100, Thomas Zimmermann wrote:
> Initialize all instances of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
> 
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
