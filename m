Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F296C7006A3
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F0A10E684;
	Fri, 12 May 2023 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D310E684
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92ACD654E7;
 Fri, 12 May 2023 11:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A0C433A8;
 Fri, 12 May 2023 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683890623;
 bh=LCee8NPgW5Z48oHs2X+4LDjkaisXA9d7iMkzZ/oL7EE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qawc5t5fo15Uxf3XH5wX4ydaoUgTaiH5Gxx8rNDVp/biF33zfq8hDHrcqmf5PcCRx
 h5D6KyvrhmHBnN7SoDNKMu4CspgF+DSO0P+kgN08ypYVZZ3jPJDU6Ka94a2pzGDJPb
 tn6BzE9cqryGUhjbkdQqBbBwgFOFgT0RJq0Y7/jo=
Date: Fri, 12 May 2023 20:23:37 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2 00/10] Treewide GPL SPDX conversion and cleanup (in
 response to Didi's GPL full name fixes)
Message-ID: <2023051243-bunch-goliath-7380@gregkh>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 05:06:11PM +0700, Bagas Sanjaya wrote:
> I trigger this patch series as a response to Didi's GPL full name fix
> patches [1], for which all of them had been NAKed. In many cases, the
> appropriate correction is to use SPDX license identifier instead.
> 
> Often, when replacing license notice boilerplates with their equivalent
> SPDX identifier, the notice doesn't mention explicit GPL version. Greg
> [2] replied this question by falling back to GPL 1.0 (more precisely
> GPL 1.0+ in order to be compatible with GPL 2.0 used by Linux kernel),
> although there are exceptions (mostly resolved by inferring from
> older patches covering similar situation).
> 
> The series covers the same directories touched as Didi's ones, minus
> Documentation/ (as should have been inferred by SPDX tags on respective
> docs).
>

I'm glad to take these types of changes through the SPDX tree, but
please break them up into smaller changes that show the justification
for each type of change in each subsystem, so that we can evaluate them
on an individual basis.  As you did here, you are lumping things
together only by the existance of the file in the tree, not by the
logical type of change happening, which isn't ok.

Also, you can send them as subsystem-specific series, so as to not have
to cross-post all of the changes all over the place.  I doubt the drm
developers care about ethernet driver license issues :)

thanks,

greg k-h
