Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE8762FF5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC2210E17E;
	Wed, 26 Jul 2023 08:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0210E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=r4dvvFPG61dpi+m5wXOqVQJNPQ8+eRHy9QX8yy71vx8=;
 b=Jps4sk8eHMcL2LM6qEVk5txAIrGoJels8jZ2yVCw1HiHp3bxlnFEr+C6Av0VxQacs41hOX/ejaJSP
 5Vq+QvNHKzE1hy/Y34nCAE0HMQqR7CQzaMMxVn9DZCXl4liYWX/34D+mSiEXvnVTqJcf4Qq9s+jYd2
 Ror35/ej4d8OxXFWHbJ0g6GxPMSrdMMwUdJnnxATyCWczsPS2CYpUdf0wmsnQ36my+B4QkGbojjySh
 CebDGH9h/HS2a/n0mvW5Uq4FzTuDd7DMVbuJZeBj+KBOP0EDB+YuDcc6+XAGpEKKs/v2r/MyyFcrh3
 R41QRYlmQG8sZbYA9i48IaO/BGmf3Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=r4dvvFPG61dpi+m5wXOqVQJNPQ8+eRHy9QX8yy71vx8=;
 b=Vm5WByldnd82gz8eTojY7srg8mddzQU9H1uSw04x5Fv1MYfeNKpZTR1mOgxTd3U4oswlVraqAYURY
 eam16l/Cw==
X-HalOne-ID: 70ef6e65-2b8f-11ee-a266-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 70ef6e65-2b8f-11ee-a266-b90637070a9d;
 Wed, 26 Jul 2023 08:35:58 +0000 (UTC)
Date: Wed, 26 Jul 2023 10:35:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
Message-ID: <20230726083557.GA921641@ravnborg.org>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
 <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
 <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 09:53:16PM +0200, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> > Hi
> >
> 
> [...]
> 
> >> 
> >> Yes. I meant to move drivers/video/logo/ to drivers/fbdev/core/logo and to
> >> source its Kconfig from drivers/fbdev/core/Kconfig, since it now depends
> >> on FB_CORE.
> >
> > No, please rather leave it where it is. There's no code dependencies to 
> > the fbdev core; it merely depends on the Kconfig token.
> >
> 
> Sure, fine by me. But I disagree that there's merely a Kconfig dependency.
> The include/linux/linux_logo.h header declares both fb_find_logo() and
> fb_append_extra_logo().
> 
> The fb_find_logo() function is defined in drivers/video/logo.c while the
> fb_append_extra_logo() is in drivers/video/fbdev/core/fbmem.c, even though
> only arch/powerpc/platforms/cell/spu_base.c uses fb_append_extra_logo().
> 
> So there's a relationship already between logo and fbdev/core, that's why
> I wondered if would make sense to also move drivers/video/logo.c to have
> both functions in there.
Or as I also suggested on irc - to pull out all the logo stuff from
fbmem and put it in video/logo/
With a bit of refactoring to make it obvious this is logo stuff and
maybe avoid some of the ifdeffery in the code of the users.

	Sam
