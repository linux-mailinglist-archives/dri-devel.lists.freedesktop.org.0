Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66144A5A6E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11E110E75A;
	Tue,  1 Feb 2022 10:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4386F10E75A;
 Tue,  1 Feb 2022 10:45:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA16614B0;
 Tue,  1 Feb 2022 10:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97346C340EB;
 Tue,  1 Feb 2022 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643712317;
 bh=5Dywqqhvly/4y4o+KsBPpEDImiEUvdk7lfmcjfKc3+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUtU1BFx1ngOhR1sm/yeKSKNt8mPzGczhsZkROAFtOzR1apGTkCU9q43ppWClX++f
 TmacYajJQ+3M2fkfLKOnBw/Pw70mOAPM1jBT3dlbbeUP2rphFzdkqitg2A9/41t15f
 Ms+L0pDQvgRttXCujjQ4Xar8IMXFZc1jWz8vsM9o=
Date: Tue, 1 Feb 2022 11:45:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
Message-ID: <YfkPOrQJ9c/DxNcX@kroah.com>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
 <648ac929-8de9-4ec4-f73d-d1048a419eb9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <648ac929-8de9-4ec4-f73d-d1048a419eb9@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 11:19:54AM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 31.01.22 um 22:05 schrieb Daniel Vetter:
> > Ever since Tomi extracted the core code in 2014 it's been defacto me
> > maintaining this, with help from others from dri-devel and sometimes
> > Linus (but those are mostly merge conflicts):
> > 
> > $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
> >      35  Daniel Vetter
> >      23  Linus Torvalds
> >      10  Hans de Goede
> >       9  Dave Airlie
> >       6  Peter Rosin
> > 
> > I think ideally we'd also record that the various firmware fb drivers
> > (efifb, vesafb, ...) are also maintained in drm-misc because for the
> > past few years the patches have either been to fix handover issues
> > with drm drivers, or caused handover issues with drm drivers. So any
> > other tree just doesn't make sense. But also, there's plenty of
> > outdated MAINTAINER entries for these with people and git trees that
> > haven't been active in years, so maybe let's just leave them alone.
> > And furthermore distros are now adopting simpledrm as the firmware fb
> > driver, so hopefully the need to care about the fbdev firmware drivers
> > will go down going forward.
> > 
> > Note that drm-misc is group maintained, I expect that to continue like
> > we've done before, so no new expectations that patches all go through
> > my hands. That would be silly. This also means I'm happy to put any
> > other volunteer's name in the M: line, but otherwise git log says I'm
> > the one who's stuck with this.
> > 
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: DRI Development <dri-devel@lists.freedesktop.org>
> > Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sven Schnelle <svens@stackframe.org>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
