Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A54CAEDA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 20:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987810EA77;
	Wed,  2 Mar 2022 19:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928A010EA77
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 19:38:49 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 099132199B;
 Wed,  2 Mar 2022 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646249928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqbJsc1TBGvxQcYVNa9lPWZfK+TLadggigkpbeRkDR8=;
 b=Cs8G4w0HowThm3kITe3nH4J1b3Dp2Zri0J/tFIt6wGn/jMJcxg2Z0Ar5XGIrgKDzvstgnl
 3c7E+QhR2O4dP+y7txv4Jf4gzKhrF/ukQdhHLZEPkNbPozFy8cT9IwgyugJlT8o33cuBLx
 hzMlTYIGBITkxAg1VO9W8/2jNqporbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646249928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqbJsc1TBGvxQcYVNa9lPWZfK+TLadggigkpbeRkDR8=;
 b=okr0zA+HwG4MIR5vKGAb9kJUBDMgJPDjTd5F2qQEYxw96PsgzQ8ayWJNTt6Dld/jyPitGA
 Wxom2jaza1u584Bg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5C202A3B84;
 Wed,  2 Mar 2022 19:38:47 +0000 (UTC)
Date: Wed, 2 Mar 2022 20:38:46 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Message-ID: <20220302193846.GT3113@kunlun.suse.cz>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-video@atrey.karlin.mff.cuni.cz,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Mar 02, 2022 at 08:31:25PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> is this ready to be merged?

The objections raised so far have been addressed in v4.

I think this is good to merge.

Thanks

Michal

> 
> Best regards
> Thomas
> 
> Am 18.02.22 um 10:33 schrieb Michal Suchanek:
> > Since switch to simpledrm VESA graphic modes are no longer available
> > with legacy BIOS.
> > 
> > The x86 realmode boot code enables the VESA graphic modes when option
> > FB_BOOT_VESA_SUPPORT is enabled.
> > 
> > To enable use of VESA modes with simpledrm in legacy BIOS boot mode drop
> > dependency of BOOT_VESA_SUPPORT on FB, also drop the FB_ prefix, and
> > select the option when simpledrm is built-in on x86.
> > 
> > Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >   arch/x86/boot/video-vesa.c   | 4 ++--
> >   drivers/gpu/drm/tiny/Kconfig | 1 +
> >   drivers/video/fbdev/Kconfig  | 9 ++++-----
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
> > diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> > index 712e0004e96e..1bc30c64ed15 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -54,6 +54,7 @@ config DRM_GM12U320
> >   config DRM_SIMPLEDRM
> >   	tristate "Simple framebuffer driver"
> >   	depends on DRM && MMU
> > +	select BOOT_VESA_SUPPORT if X86 && DRM_SIMPLEDRM = y
> >   	select DRM_GEM_SHMEM_HELPER
> >   	select DRM_KMS_HELPER
> >   	help
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
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev



