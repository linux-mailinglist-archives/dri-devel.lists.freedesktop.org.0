Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F64C199F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 18:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C304B10F2E5;
	Wed, 23 Feb 2022 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5CB10F2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 17:12:39 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5CD722171F;
 Wed, 23 Feb 2022 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645636357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjV96k+XrNEHF/rs/hUQai3q3Ll+0uP0q9QuZbCH91k=;
 b=No1yFqbgB4W1AcYZmxPuvuIAuRoQFIIrXps00/9J1Z2h/iTM05zdsFZc5ADB+3RBacphAM
 w5U5Kr8Fu5bw7jG8yHp5dH6qpbLtSXyITMuuNQAhl+3jRu+jm5Q7hwTqwZzIKDZ82RP9In
 dCkMU4eA308t/PiSnYcI4az/GXg2jOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645636357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjV96k+XrNEHF/rs/hUQai3q3Ll+0uP0q9QuZbCH91k=;
 b=aExfDoMHgw6vSTmfuWjbwunUBndSklXxQZiXlQ+tdsM5IO4w8Xt7YELS2Y9ZD1DIqGg3bK
 2WtIDqyJkiqm4YCw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 00A5BA3B8D;
 Wed, 23 Feb 2022 17:12:36 +0000 (UTC)
Date: Wed, 23 Feb 2022 18:12:35 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <20220223171235.GF3113@kunlun.suse.cz>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
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

On Wed, Feb 23, 2022 at 05:54:54PM +0100, Javier Martinez Canillas wrote:
> On 2/23/22 17:45, Michal Suchánek wrote:
>
> [snip]
>
> >>>
> >>> To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
> >>
> >> I think you meant "VESA modes with the sysfb driver" ? or something like
> >> that since otherwise it seems that you meant to use it with the simplefb
> >> (drivers/video/fbdev/simplefb.c) fbdev driver, which doesn't support the
> >> "vga=" param as far as I understand (it just uses whatever was setup).
> >
> > And the vga= is whatever was set up by the realmode code. And the config
> > option for realmode code to do that is selected by vesafb and not
> > simplefb so it does not wotk for simplefb/simpledrm/whatewer when efifib
> > is not built into the kernel.
> >
>
> Yes, that's what I tried to say. But your commit message says "To enable
> use of VESA modes with simplefb in legacy BIOS boot mode" and that isn't
> accurate AFAIU (unless you meant sysfb instead).

 config SYSFB_SIMPLEFB
        bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
        depends on SYSFB
+       select BOOT_VESA_SUPPORT if X86

This to me means that it's simplefb specifically that requires it, not sysfb.
More precisely SYSFB_SIMPLEFB which is the simplefb implementation on top of
legacy BIOS.

Thanks

Michal
