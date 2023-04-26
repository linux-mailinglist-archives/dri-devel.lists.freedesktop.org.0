Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA26EFB38
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 21:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE010EA24;
	Wed, 26 Apr 2023 19:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Wed, 26 Apr 2023 19:37:21 UTC
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F010EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eVeo2+G0wfE7Th9mpMzqAlZwNjPXsqF5qhbG8BjXhfs=;
 b=cAOCLgpYeIgd+SmmPnle/bw2nmkoV/Wcu/JfousxXCWTrIQvRkzjoJkXzUu5C1+v5pjh9PiCe2CkM
 Qhz+tS62TbtvfjoewZNnQsVIohf5Lh6j3eeLb8oGMplSAWtWY4RmGoC8NWdegN1XZLMnR9ogqNkoQQ
 uXc2S1EUvclv9hfY33OezLtHys0IF70fCqjzu+pHztUy/Iv8rfBGvFIDt/l34oUk1uqmoZp0TRedDb
 n3a+nAhUaclrLH2tNkgZu49/49pwlw+NVupLOTPMnq2rs+LzYaCkGqNPvf12SGaHEpL638nDRGgYoM
 zGAQT7MBPP3QhvGMAQLLL8egMyK3MZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eVeo2+G0wfE7Th9mpMzqAlZwNjPXsqF5qhbG8BjXhfs=;
 b=do/hY8c+tmgFEa4FnPVB0BzaGeCw1ybrSgm/bAII+A4jObIR152O0J//1DGI4vY4Rp4c904oVYBoa
 GD/PMttDA==
X-HalOne-ID: 7fc0ec5f-e467-11ed-9e8c-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 7fc0ec5f-e467-11ed-9e8c-6f01c1d0a443;
 Wed, 26 Apr 2023 19:21:11 +0000 (UTC)
Date: Wed, 26 Apr 2023 21:21:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Message-ID: <20230426192110.GA3791243@ravnborg.org>
References: <20230426130420.19942-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426130420.19942-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Wed, Apr 26, 2023 at 03:04:15PM +0200, Thomas Zimmermann wrote:
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture. It's still all located in fbdev's main
> header file <linux/fb.h>. Move all of it into each archtecture's
> <asm/fb.h>, with shared code in <asm-generic/fb.h>.

For once I think this cleanup is moving things in the wrong direction.

The fb_* helpers predates the generic io.h support and try to
add a generic layer for read read / write operations.

The right fix would be to migrate fb_* to use the io helpers
we have today - so we use the existing way to handle the architecture
specific details.

From a quick look there seems to be some challenges but the current
helpers that re-do part of io.h is not the way forward and hiding them
in arch/include/asm/fb.h seems counter productive.

	Sam
