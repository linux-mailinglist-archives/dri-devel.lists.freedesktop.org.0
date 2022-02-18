Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC664BB8D5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 13:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0E610E2C5;
	Fri, 18 Feb 2022 12:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152210E6E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 12:05:33 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5149B219A7;
 Fri, 18 Feb 2022 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645185932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m87japvLs6dTotRw4YdigIf21fJ6IZ9mrxbcurYJjpA=;
 b=yL7tUspE1/oIcVnVHmeQkrRPbWmE2koS2I4ZX7YaTv28BQ9FQ3h4Z+X10KoypCXSLVPXiT
 iz1W4EFkaXllnszgnn4lBd+WvjI+b9KXXLXd0vmE6mkZfA/KhWUk+SVrwwaRoSXkXZvczp
 0rjcp5sINF8Tja+PvZLUGpQuytskbss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645185932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m87japvLs6dTotRw4YdigIf21fJ6IZ9mrxbcurYJjpA=;
 b=aiPSgPFlhB4wMyB6cmR5KnM7bVTV5JJnNVZ1Za5wOBLioEeq0a+9nvgx9TSOp5hT7kIZ/P
 m7YANTEYE3fNu/CA==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ECB0AA3B81;
 Fri, 18 Feb 2022 12:05:31 +0000 (UTC)
Date: Fri, 18 Feb 2022 13:05:30 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <20220218120530.GX3113@kunlun.suse.cz>
References: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
 <20220218105138.5384-1-msuchanek@suse.de>
 <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 12:36:10PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.02.22 um 11:51 schrieb Michal Suchanek:
> > Since switch to simplefb/simpledrm VESA graphic modes are no longer
> > available with legacy BIOS.
> > 
> > The x86 realmode boot code enables the VESA graphic modes when option
> > FB_BOOT_VESA_SUPPORT is enabled.
> > 
> > To enable use of VESA modes with simpledrm in legacy BIOS boot mode drop
> > dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix, and
> > select the option when simpledrm is built-in on x86.
> > 
> > Fixes: e3263ab389a7 ("x86: provide platform-devices for boot-framebuffers")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2: Select BOOT_VESA_SUPPORT from simplefb rather than simpledrm. The
> > simpledrm driver uses the firmware provided video modes only indirectly
> > through simplefb, and both can be enabled independently.
> > ---
> >   arch/x86/boot/video-vesa.c  | 4 ++--
> >   drivers/firmware/Kconfig    | 1 +
> >   drivers/video/fbdev/Kconfig | 9 ++++-----
> >   3 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/x86/boot/video-vesa.c b/arch/x86/boot/video-vesa.c
> > index 7e185977a984..c2c6d35e3a43 100644
> > --- a/arch/x86/boot/video-vesa.c
> > +++ b/arch/x86/boot/video-vesa.c
> > @@ -83,7 +83,7 @@ static int vesa_probe(void)
> >   			   (vminfo.memory_layout == 4 ||
> >   			    vminfo.memory_layout == 6) &&
> >   			   vminfo.memory_planes == 1) {
> > -#ifdef CONFIG_FB_BOOT_VESA_SUPPORT
> > +#ifdef CONFIG_BOOT_VESA_SUPPORT
> >   			/* Graphics mode, color, linear frame buffer
> >   			   supported.  Only register the mode if
> >   			   if framebuffer is configured, however,
> > @@ -121,7 +121,7 @@ static int vesa_set_mode(struct mode_info *mode)
> >   	if ((vminfo.mode_attr & 0x15) == 0x05) {
> >   		/* It's a supported text mode */
> >   		is_graphic = 0;
> > -#ifdef CONFIG_FB_BOOT_VESA_SUPPORT
> > +#ifdef CONFIG_BOOT_VESA_SUPPORT
> >   	} else if ((vminfo.mode_attr & 0x99) == 0x99) {
> >   		/* It's a graphics mode with linear frame buffer */
> >   		is_graphic = 1;
> > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > index 75cb91055c17..8053c75b8645 100644
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -224,6 +224,7 @@ config SYSFB
> >   config SYSFB_SIMPLEFB
> >   	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
> >   	depends on SYSFB
> > +	select BOOT_VESA_SUPPORT if X86
> >   	help
> >   	  Firmwares often provide initial graphics framebuffers so the BIOS,
> >   	  bootloader or kernel can show basic video-output during boot for
> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index 6ed5e608dd04..4f3be9b7a520 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -66,9 +66,8 @@ config FB_DDC
> >   	select I2C_ALGOBIT
> >   	select I2C
> > -config FB_BOOT_VESA_SUPPORT
> > +config BOOT_VESA_SUPPORT
> >   	bool
> > -	depends on FB
> >   	help
> >   	  If true, at least one selected framebuffer driver can take advantage
> >   	  of VESA video modes set at an early boot stage via the vga= parameter.
> 
> This isn't an fb option any longer. Should we move this into
> arch/x86/Kconfig ?

I tried moving it just a directory up but then found that it works even
where it is. It's specific to x86 boot code so moving to x86 may make
sense. Then the 'if X86' should not be needed, either.

Thanks

Michal

> 
> Best regards
> Thomas
> 
> > @@ -627,7 +626,7 @@ config FB_VESA
> >   	select FB_CFB_FILLRECT
> >   	select FB_CFB_COPYAREA
> >   	select FB_CFB_IMAGEBLIT
> > -	select FB_BOOT_VESA_SUPPORT
> > +	select BOOT_VESA_SUPPORT
> >   	help
> >   	  This is the frame buffer device driver for generic VESA 2.0
> >   	  compliant graphic cards. The older VESA 1.2 cards are not supported.
> > @@ -1051,7 +1050,7 @@ config FB_INTEL
> >   	select FB_CFB_FILLRECT
> >   	select FB_CFB_COPYAREA
> >   	select FB_CFB_IMAGEBLIT
> > -	select FB_BOOT_VESA_SUPPORT if FB_INTEL = y
> > +	select BOOT_VESA_SUPPORT if FB_INTEL = y
> >   	depends on !DRM_I915
> >   	help
> >   	  This driver supports the on-board graphics built in to the Intel
> > @@ -1378,7 +1377,7 @@ config FB_SIS
> >   	select FB_CFB_FILLRECT
> >   	select FB_CFB_COPYAREA
> >   	select FB_CFB_IMAGEBLIT
> > -	select FB_BOOT_VESA_SUPPORT if FB_SIS = y
> > +	select BOOT_VESA_SUPPORT if FB_SIS = y
> >   	select FB_SIS_300 if !FB_SIS_315
> >   	help
> >   	  This is the frame buffer device driver for the SiS 300, 315, 330
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Ivo Totev



