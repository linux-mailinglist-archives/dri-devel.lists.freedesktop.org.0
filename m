Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2B4C1AE2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA410E2C5;
	Wed, 23 Feb 2022 18:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3910E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:23:44 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 04B96210E8;
 Wed, 23 Feb 2022 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645640623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmlkY1kbQBsVLQ5pzhianT7TxQAbIfNHni1vWGh3+gY=;
 b=VVE8gYSE5/Ck83Y3lTFe/dA93oYo0UMb/ioj0RNe4jLzkY/KOtGASIdez99JVpVBINYujY
 RFgAhQ1l3lj2WjAgaG95Ztz9WeBXmrWG4pU8/GA3kKXwHQBJxCaMeIcPJYPz2j0kA+Qe0B
 L4OYJv0udIo7Ay8F+HD9+YD9LL9s+x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645640623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmlkY1kbQBsVLQ5pzhianT7TxQAbIfNHni1vWGh3+gY=;
 b=BCY/dF2RqwnUb3uAmNBW8HCt/Xr7osfuXnlFCon4nsKbfpVrvMJTJNYbiGrrgyeuHGNSrZ
 Hr35WiMILBCljgDw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A3E5CA3B83;
 Wed, 23 Feb 2022 18:23:42 +0000 (UTC)
Date: Wed, 23 Feb 2022 19:23:41 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <20220223182341.GG3113@kunlun.suse.cz>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
 <20220223171235.GF3113@kunlun.suse.cz>
 <a9df1753-8e3b-55bb-2dab-9e7aeaa52a8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9df1753-8e3b-55bb-2dab-9e7aeaa52a8d@redhat.com>
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

On Wed, Feb 23, 2022 at 07:13:07PM +0100, Javier Martinez Canillas wrote:
> On 2/23/22 18:12, Michal Suchánek wrote:
> > On Wed, Feb 23, 2022 at 05:54:54PM +0100, Javier Martinez Canillas wrote:
> 
> [snip]
> 
> >>
> >> Yes, that's what I tried to say. But your commit message says "To enable
> >> use of VESA modes with simplefb in legacy BIOS boot mode" and that isn't
> >> accurate AFAIU (unless you meant sysfb instead).
> > 
> >  config SYSFB_SIMPLEFB
> >         bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
> >         depends on SYSFB
> > +       select BOOT_VESA_SUPPORT if X86
> > 
> > This to me means that it's simplefb specifically that requires it, not sysfb.
> > More precisely SYSFB_SIMPLEFB which is the simplefb implementation on top of
> > legacy BIOS.
> > 
> 
> Ok, I see what you meant. The fact that simplefb is what's named to the part
> of the sysfb driver that register the "simple-framebuffer" platform device
> and also the name of the fbdev driver that matches the "simple-framebuffer"
> is too confusing.
> 
> My point about the subject line remains thought, I would use something like:
> 
> firmware: sysfb: Enable boot time VESA graphic mode selection for simplefb

I see where the confusion comes from.

The efifb (and probably vesafb) has implicit unstated dependency on
sysfb. So the drivers that select BOOT_VESA_SUPPORT should instead
depend on SYSFB, and then SYSFB can select BOOT_VESA_SUPPORT, and it
will look much saner.

Thanks

Michal
