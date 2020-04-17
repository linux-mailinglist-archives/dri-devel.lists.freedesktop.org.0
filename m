Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B871AEB3A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5326EC66;
	Sat, 18 Apr 2020 09:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B493E6E524
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:08:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b62so3605913qkf.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZQhy489OjssnVOvD6kvurmA3AIks5bQMEPnQ8xp2xFg=;
 b=pV+43fstjAtSTBJujlpMRb3PnaAdhK49JGeZx0mtsPWi0i5zyh/GIe07lQH636PX1h
 RIWPKiapAktc0jQ13zOFSG5h5Vu5T812FdS46BdspmXMV3vumTY7mMzYQrGq/QGjJHaj
 8I3kGiLdXDNidC3ZcSfGE4o+dTcl1qSgRhReF0w9RPtYx3SOyRj689V2lKNcpG164NFG
 YObWePcqJSeXel5QsVuD2l+dRSLbjvMjJj9eDGBIJ4J5ZHwCtOAtWEgOVdjfrzn0hdSN
 3ndnpfaaIt4YYrWhrybrpcRqKPWqDuR20RBEuyJZYSRcD/2I7Q607h7BQ21xVKN0uXCO
 wB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZQhy489OjssnVOvD6kvurmA3AIks5bQMEPnQ8xp2xFg=;
 b=OOOPUvh/6sWeZ94sphJ6zmhxVMLTGrIbcvt2Q5LgFWNczhUsrFeJefJ8EPi2n7Kwjq
 PUT2dCj53hfyiujQaVzDVFRL7nbQW7ajDS21hh+AYxhOPXqiX6hJfQk/UoHKYt8vC1AL
 rL9eum2vFLhxm2PPE/y1KQldH7lzwtsaissBZKeRQ2wVJhvGH8m0eIrETf5ooXsNHrqO
 vyhnpYRz4nTDutrcuIGfw+18SZwH/Q8tc0/zHnMxrEZrV1de4se2jfEbHBQNZKrKkYnx
 2cJ8yJ5NzW8r3SO0TN/3thX/KE3J2k7lUQNvnsAl46yOWbj4dDukLpq7S6Q5nZDGe9T4
 ha1A==
X-Gm-Message-State: AGi0PuYQNZM/cyTzwskl3OZl4LdpSIOCTxWPcXHTk2JZER8o9S98YFUb
 GsbAzHMDZGjcsovCvQRKrKgJGw==
X-Google-Smtp-Source: APiQypKA07MEDcxRiPNxIYGcNyFxt8xoAoygqSmYVhzwxCcBpIf9Uy0CgboqxeZKDdhDPJ7gd+xFoQ==
X-Received: by 2002:a37:44a:: with SMTP id 71mr4857241qke.114.1587150535689;
 Fri, 17 Apr 2020 12:08:55 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id j9sm766287qkk.99.2020.04.17.12.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 12:08:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jPWMA-0004ar-El; Fri, 17 Apr 2020 16:08:54 -0300
Date: Fri, 17 Apr 2020 16:08:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
Message-ID: <20200417190854.GI26002@ziepe.ca>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417171453.GS3456981@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent.pinchart@ideasonboard.com, robert.jarzmik@free.fr, marex@denx.de,
 thellstrom@vmware.com, dsd@laptop.org, jfrederich@gmail.com,
 masahiroy@kernel.org, Saeed Mahameed <saeedm@mellanox.com>,
 geert@linux-m68k.org, linux-graphics-maintainer@vmware.com,
 Arnd Bergmann <arnd@arndb.de>, haojian.zhuang@gmail.com,
 Nicolas Pitre <nico@fluxnic.net>, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> > I tried to fix up some dependencies after the sii8620 "imply EXTCON"
> > statementn broke, trying a few things but in the backing out a
> > change that would completely reverse the LEDS_CLASS selects into
> > a 'depends on'. 
> > 
> > However, what I got now are multiple changes that remove gratious
> > "selects" that lead to circular dependencies for sii8620 and others:
> > 
> > - Anything doing "select FB" is now gone, or becomes "depends on FB",
> > 
> > - DDC support depends on I2C instead of selecting it
> > 
> > - backlight class device support is never selected by framebuffer
> >   drivers but has proper dependencies
> > 
> > I have done thousands of randconfig build tests on this, but no
> > runtime tests.
> > 
> > Some of the 'depends on FOO || !FOO' statements could be simplified
> > into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
> > but I would for the moment treat that as a cleanup that can be done
> > later.
> > 
> > If we can agree on these changes, maybe someone can merge them
> > through the drm-misc tree.
> > 
> > Please review
> 
> Biggest concern I have is that usability of make menuconfig is horrible,
> and it's very hard to find options that are hidden by depends on. You can
> use the search interface, if you happen to know the option.
> 
> Once you've surmounted that bar, the next one is trying to find what
> exactly you need to enable. Which again means endless of recursive
> screaming at Kconfig files, since make menuconfig doesn't help you at all.

+1 on this. But this is a general kconfig problem, and not unique to
DRM, I've done this screaming for many different things now.. eg to
turn on every single RDMA driver.

I hackily delt with it by creating this rather insane script based on
the python kconfiglib to try and sort things out mostly automatically:

https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_kconfig.py

It would be great if menuconfig had a key to say 'hey, really, turn
this on and everything it depends on, recursively'

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
