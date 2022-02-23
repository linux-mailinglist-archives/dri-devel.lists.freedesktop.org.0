Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB154C1CAE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BD010E65E;
	Wed, 23 Feb 2022 19:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAEC10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:56:01 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6AF651F37E;
 Wed, 23 Feb 2022 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645646159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTfxWTYZmFg/73zI1DT9D/miIhBxVeQM+x5zfDENgA0=;
 b=ycEZJ7JVzVFBA8/FJfvcykUtodmQ29ZiMibU79bVNW0nl9wlbSOdl0ayDuBPr3X3TOc9kv
 aWVfvIs4e8xD/EG77HSMsS3qt+SC97BFa7hMkZq9Rbh8U0mJE18Z8Xfjmp7jYrsba76Hce
 h8RCR+35NEJQ+WtcAppB7GEo/SSO+bw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645646159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTfxWTYZmFg/73zI1DT9D/miIhBxVeQM+x5zfDENgA0=;
 b=uWI8GXldhBNAtfbpzIJX1lnfWzg3k+LcmfGGdcdglWNmYLTf6sbDzVlVRPVLgIyspAsoWT
 jToO008fxzrT/SAw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D3AF4A3B81;
 Wed, 23 Feb 2022 19:55:58 +0000 (UTC)
Date: Wed, 23 Feb 2022 20:55:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <20220223195557.GH3113@kunlun.suse.cz>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
 <20220223171235.GF3113@kunlun.suse.cz>
 <a9df1753-8e3b-55bb-2dab-9e7aeaa52a8d@redhat.com>
 <20220223182341.GG3113@kunlun.suse.cz>
 <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
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

On Wed, Feb 23, 2022 at 07:34:54PM +0100, Javier Martinez Canillas wrote:
> On 2/23/22 19:23, Michal Suchánek wrote:
> 
> [snip]
> 
> >> My point about the subject line remains thought, I would use something like:
> >>
> >> firmware: sysfb: Enable boot time VESA graphic mode selection for simplefb
> > 
> > I see where the confusion comes from.
> >
> 
> Yeah. And just to clarify, the "simplefb" in the subject line I proposed
> was about the sysfb simplefb and not the fbdev simplefb :)
>  
> > The efifb (and probably vesafb) has implicit unstated dependency on
> > sysfb. So the drivers that select BOOT_VESA_SUPPORT should instead
> > depend on SYSFB, and then SYSFB can select BOOT_VESA_SUPPORT, and it
> > will look much saner.
> >
> 
> That indeed would be much nicer. And I agree with you that there's an
> implicit dependency that should be made explicit since SYSFB is what
> registers the "efi-framebuffer" or "vesa-framebuffer" if SYSFB_SIMPLEFB
> is not enabled.
> 
> Should SYSFB should only select BOOT_VESA_SUPPORT if x86 ? I know that
> in practice shouldn't matter because BOOT_VESA_SUPPORT is under x86 but
> I guess is more correct if that's the case.

Part of the reason to move it to x86 is to avoid the conditional.
Technically there is nothing stopping other platforms from running the
VESA BIOS, it's just not very practical.

> And I think that FB_SIMPLE should depend on SYSFB_SIMPLEFB if !OF (since
> a "simple-framebuffer" platform device could be registered by OF if a
> Device Tree node with compatible "simple-framebuffer" exists).

So generally SYSFB_SIMPLEFB || OF. The part that you can enable the
driver and it does not do anything because you are missing
SYSFB_SIMPLEFB is indeed confusing. There is a comment in SIMLEDRM
description but not FB_SIMPLE.

Then there is the part that if neither simplefb nor vesafb nor efifb nor
offb is built then the sysfb code is unused.

Thanks

Michal
