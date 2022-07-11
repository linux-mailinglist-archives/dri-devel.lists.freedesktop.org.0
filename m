Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2456FA17
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AFD10F740;
	Mon, 11 Jul 2022 09:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E27E10FB2A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=f6AwxXcU7KZ2ZFztEJq0GqcoNxoKfO83tkLfZGsyscY=;
 b=L3OH2tT6bYzKyTGPRe/w4pndW/HB8la94SNlC5QOyO3fY/bu+2Py+tLWfxsrEh3m9XV+fvX08AVsU
 pMHjuUmZRcQNnTcjx8Wnm5ogIYRFb+QMJtiyrGoXPUhuUtP4pQ4ieSuI1YFqeWmWRWiPkVIsBzpLPu
 cxBYJsb59MgFyjXLqcyKIP+lWzN2GhFY3qK25YvFJldwNQdwcafAPjnoFg1QMGzA+6t726HsF5G2fP
 Dxeia/AZYWxVfXfYBuwi/j95I0bi33u79FOacbp1hXFvMmdbV7xbatSjV7r6L7D3dDbUO2okjdQBN7
 sm2rz5uGuQLO26qa7rHhEnW8hxT03DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=f6AwxXcU7KZ2ZFztEJq0GqcoNxoKfO83tkLfZGsyscY=;
 b=xlst8vfqPMpyAQ0qQK3asUPcpYaLxYW2L70+BUhavZpWrLJ93dqJmv52ChMd0RCpRn/u5usymCLtH
 OGrgKb8BQ==
X-HalOne-Cookie: 591724b09f00c8e44a00df13aa95246b0d36be5d
X-HalOne-ID: a4b26c09-00f9-11ed-823e-d0431ea8bb10
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a4b26c09-00f9-11ed-823e-d0431ea8bb10;
 Mon, 11 Jul 2022 09:12:53 +0000 (UTC)
Date: Mon, 11 Jul 2022 11:12:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/10] drm: Add support for low-color frame buffer
 formats
Message-ID: <Ysvpk4fzef6caO5y@ravnborg.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <YsmE1D8lGp4XKs99@ravnborg.org>
 <d6e5204e-5bbb-fe51-fd29-5452198bf368@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e5204e-5bbb-fe51-fd29-5452198bf368@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 11, 2022 at 10:50:00AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.07.22 um 15:38 schrieb Sam Ravnborg:
> > Hi Geert,
> > 
> > On Fri, Jul 08, 2022 at 08:20:45PM +0200, Geert Uytterhoeven wrote:
> > > 	Hi all,
> > > 
> > > A long outstanding issue with the DRM subsystem has been the lack of
> > > support for low-color displays, as used typically on older desktop
> > > systems, and on small embedded displays.
> 
> For the patchset
> 
> Acked-by: Thomas Zimemrmann <tzimmermann@suse.de>
> 
> > 
> > IT is super to have this addressed - thanks!
> > 
> > > 
> > > This patch series adds support for color-indexed frame buffer formats
> > > with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
> > > work-in-progress Atari DRM driver supporting 2, 4, 16, 256, and 65536
> > > colors, with text console operation, fbtest, and modetest.
> > > 
> > > Overview:
> > >    - Patch 1 introduces a helper, to be used by later patches in the
> > >      series,
> > >    - Patch 2 introduces a flag to indicate color-indexed formats,
> > >    - Patches 3 and 4 correct calculations of bits per pixel for sub-byte
> > >      pixel formats,
> > >    - Patches 5 and 6 introduce the new C[124] formats,
> > >    - Patch 7 fixes an untested code path,
> > >    - Patch 8 documents the use of "red" for light-on-dark displays,
> > >    - Patches 9 and 10 add more fourcc codes for light-on-dark and
> > >      dark-on-light frame buffer formats, which may be useful for e.g. the
> > >      ssd130x and repaper drivers.
> > 
> > Applied all patches to drm-misc (drm-misc-next), including the last two
> > RFC patches as we then have the formats ready when a user pops up.
> 
> I know it's v3 already, but give people at least a workday for reviewing
> before merging patches of this size and impact. Friday-evening patches are
> not supposed to be merged on Saturday afternoons.

Sorry for being too enthusiastic on this one.
Will wait a bit more in the future for these kind of patches.

	Sam
