Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A16F18D7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562E910ED46;
	Fri, 28 Apr 2023 13:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77F10ED46
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=m4sJ+fThLhFeWg7X6kLvwa3/DCsUq6Addkr6Ox/63p0=;
 b=bIWcbnCVTMxSTG2/SQkpkiauTRzdjLlitM8+y6JLCZq45eKjII3dhIT9CX/k6z3u48vGxGMScqx9G
 n5WQVZPQD0rNLUlKVdnlAOEvwqZ1sY8/bjLQ4/AuTeSVglaIYAjpG8D201DeL/wpaoJREkGbHO6fJ4
 alPDaPVFLLrpGalDRW2MOeDlKD92IsU2Fck6fN4uSatZvzNk1k/kA5Hb8QlXIcz94LDN0CPkMu8YEt
 hRyeUJJqTKB7xhgnQfl1I0N/pQWQw22WdPWLnymZNB3FBOSYNYaC/7+XDT/spP+i3I7/VmeYNmjE/i
 PPJfosYGRWa3MwoQwx/hnbJhWvQRNEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=m4sJ+fThLhFeWg7X6kLvwa3/DCsUq6Addkr6Ox/63p0=;
 b=qNBtiTicBN3wXCrqOwcNqd0yQGLKWp9PsyJHm2ixxR+jqNPJfF+zvhggJjKoBx35Pnw1WhT1mEY5q
 gcEohH4AA==
X-HalOne-ID: 904541fb-e5c5-11ed-95bb-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 904541fb-e5c5-11ed-95bb-13111ccb208d;
 Fri, 28 Apr 2023 13:07:04 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:07:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/5] fbdev: Include <linux/io.h> in drivers
Message-ID: <20230428130702.GD3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428092711.406-5-tzimmermann@suse.de>
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

On Fri, Apr 28, 2023 at 11:27:10AM +0200, Thomas Zimmermann wrote:
> Fbdev's main header file, <linux/fb.h>, includes <asm/io.h> to get
> declarations of I/O helper functions. From these declaratons, it later
> defines framebuffer I/O helpers, such as fb_{read,write}[bwlq]() or
> fb_memset().
> 
> The framebuffer I/O helpers pre-date Linux' current I/O code and will
> be replaced by regular I/O helpers. Prepare this change by adding an
> include statement for <linux/io.h> to all source files that use the
> framebuffer I/O helpers. They will still get declarations of the I/O
> functions even after <linux/fb.h> has been cleaned up.
When fb.h uses a symbol from io.h, then it shall include that
file so it is self contained.
So it is wrong to push the io.h include to the users of
fb_{read,write,xxx}. Maybe fb.h only uses macros as is the case here,
but that is no excuse nt to include io.h.

Drop these changes.

> Driver source
> files that already include <asm/io.h> convert to <linux/io.h>.
This is a nice cleanup - we should keep that.

	Sam
