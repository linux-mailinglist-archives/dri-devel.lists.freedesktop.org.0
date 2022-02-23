Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E04C18F2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBC210EFCC;
	Wed, 23 Feb 2022 16:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD810EFCC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:45:32 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0A1B42112A;
 Wed, 23 Feb 2022 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645634730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPPWVGtnil4K6Tjn5q/0MYJifKz3OsctSeTvcUnXcQg=;
 b=KGSjCcLpqs56NloxYQBnFF4buJfplFV7HLG3wgJg2os9R0mmgwlJT3aith27h3HTYlMnmW
 MjgRpbbZS8x7/RECI8QJ4Ca4dVECRB7ykK5Uj0s0PcPZ3r6KEDMfHPSHQgdQMm/duYFDii
 HlNBpz0BHg2PKAKYKi8yLRq1YvuBV3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645634730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPPWVGtnil4K6Tjn5q/0MYJifKz3OsctSeTvcUnXcQg=;
 b=ucZBTGhjOU6YvUy75e7MOpjlgoxMJXIwlbRs08mSF4RoxNUFoMK7X7a5fZF5cZUzA+djL4
 G10dC+QfGhWIHTDw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4B95AA3B8D;
 Wed, 23 Feb 2022 16:45:29 +0000 (UTC)
Date: Wed, 23 Feb 2022 17:45:28 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <20220223164528.GE3113@kunlun.suse.cz>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 05:34:50PM +0100, Javier Martinez Canillas wrote:
> Hello Michal,
> 
> On 2/18/22 17:04, Michal Suchanek wrote:
> > Since switch to simplefb/simpledrm VESA graphic modes are no longer
> > available with legacy BIOS.
> 
> Maybe you can mention that is the "vga=" kernel command line parameter
> since that may be more evident to people reading the commit message ?

Yes, I suppose that could be added.

> > The x86 realmode boot code enables the VESA graphic modes when option
> > FB_BOOT_VESA_SUPPORT is enabled.
> > 
> > To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
> 
> I think you meant "VESA modes with the sysfb driver" ? or something like
> that since otherwise it seems that you meant to use it with the simplefb
> (drivers/video/fbdev/simplefb.c) fbdev driver, which doesn't support the
> "vga=" param as far as I understand (it just uses whatever was setup).

And the vga= is whatever was set up by the realmode code. And the config
option for realmode code to do that is selected by vesafb and not
simplefb so it does not wotk for simplefb/simpledrm/whatewer when efifib
is not built into the kernel.

> The name sysfb_simplefb is really horrible, because it is too confusing
> and probably we should change it at some point...
> 
> Patch itself looks good to me though.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks

Michal
