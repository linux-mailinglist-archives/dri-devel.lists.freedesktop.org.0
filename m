Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245E070068F
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06BF10E011;
	Fri, 12 May 2023 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2306410E011
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:21:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB618654DA;
 Fri, 12 May 2023 11:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAFDC4339C;
 Fri, 12 May 2023 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683890482;
 bh=iWf2+ctagbyxUJDf+uXJKZH3IsmKptDDA43LqE8XhlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLJYR024ZODCYOIVYMBlBnFZwAYsInhdb5q77puh/dedefB3jaUxD0n1Gw6Jo19NR
 2+bM4PZ/7XPv0DYBdM5jPr1oBUSWlbM/b9uyM/hCEHLvQnb7PCPqjPfYEJw3p7R23G
 OCQAKnTy0UL9jyZo9VQ3GjmrD6X5nKQYbL3vCGn8=
Date: Fri, 12 May 2023 20:21:15 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2 05/10] net: ethernet: i825xx: Replace GPL boilerplate
 with SPDX identifier
Message-ID: <2023051205-shrouded-cymbal-7b9c@gregkh>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-6-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512100620.36807-6-bagasdotme@gmail.com>
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
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Donald Becker <becker@scyld.com>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Michael Hipp <hippm@informatik.uni-tuebingen.de>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 Richard Hirst <richard@sleepie.demon.co.uk>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 05:06:16PM +0700, Bagas Sanjaya wrote:
> Replace unversioned GPL boilerplate notice on remaining i825xx files
> with appropriate SPDX identifier. For files that contains "extension to
> Linux kernel", use GPL 2.0, otherwise GPL 1.0+.
> 
> Cc: Donald Becker <becker@scyld.com>
> Cc: Michael Hipp <hippm@informatik.uni-tuebingen.de>
> Cc: Richard Hirst <richard@sleepie.demon.co.uk>
> Cc: Sam Creasey <sammy@sammy.net>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/net/ethernet/i825xx/82596.c      | 5 ++---
>  drivers/net/ethernet/i825xx/lasi_82596.c | 5 ++---
>  drivers/net/ethernet/i825xx/lib82596.c   | 5 ++---
>  drivers/net/ethernet/i825xx/sun3_82586.c | 4 +---
>  drivers/net/ethernet/i825xx/sun3_82586.h | 4 +---
>  5 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
> index 3ee89ae496d0ca..773d7aa29ef5fc 100644
> --- a/drivers/net/ethernet/i825xx/82596.c
> +++ b/drivers/net/ethernet/i825xx/82596.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* 82596.c: A generic 82596 ethernet driver for linux. */
>  /*
>     Based on Apricot.c
> @@ -31,9 +32,7 @@
>     Driver skeleton
>     Written 1993 by Donald Becker.
>     Copyright 1993 United States Government as represented by the Director,
> -   National Security Agency. This software may only be used and distributed
> -   according to the terms of the GNU General Public License as modified by SRC,
> -   incorporated herein by reference.
> +   National Security Agency.
>  
>     The author may be reached as becker@scyld.com, or C/O
>     Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
> diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethernet/i825xx/lasi_82596.c
> index 0af70094aba341..3e53e0c243ba04 100644
> --- a/drivers/net/ethernet/i825xx/lasi_82596.c
> +++ b/drivers/net/ethernet/i825xx/lasi_82596.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* lasi_82596.c -- driver for the intel 82596 ethernet controller, as
>     munged into HPPA boxen .
>  
> @@ -59,9 +60,7 @@
>     Driver skeleton
>     Written 1993 by Donald Becker.
>     Copyright 1993 United States Government as represented by the Director,
> -   National Security Agency. This software may only be used and distributed
> -   according to the terms of the GNU General Public License as modified by SRC,
> -   incorporated herein by reference.
> +   National Security Agency.
>  
>     The author may be reached as becker@scyld.com, or C/O
>     Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
> diff --git a/drivers/net/ethernet/i825xx/lib82596.c b/drivers/net/ethernet/i825xx/lib82596.c
> index ca2fb303fcc6f6..67d248a7a6f49e 100644
> --- a/drivers/net/ethernet/i825xx/lib82596.c
> +++ b/drivers/net/ethernet/i825xx/lib82596.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* lasi_82596.c -- driver for the intel 82596 ethernet controller, as
>     munged into HPPA boxen .
>  
> @@ -59,9 +60,7 @@
>     Driver skeleton
>     Written 1993 by Donald Becker.
>     Copyright 1993 United States Government as represented by the Director,
> -   National Security Agency. This software may only be used and distributed
> -   according to the terms of the GNU General Public License as modified by SRC,
> -   incorporated herein by reference.
> +   National Security Agency.
>  
>     The author may be reached as becker@scyld.com, or C/O
>     Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
> diff --git a/drivers/net/ethernet/i825xx/sun3_82586.c b/drivers/net/ethernet/i825xx/sun3_82586.c
> index 3909c6a0af89f9..f05f016cb3b0ea 100644
> --- a/drivers/net/ethernet/i825xx/sun3_82586.c
> +++ b/drivers/net/ethernet/i825xx/sun3_82586.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only

As you are mixing GPL-1.0 and GPL-2.0 conversions in the same patch, you
need to break this up and provide the justification for why you choose
the specific license for each one, as you can't just lump them all
together and expect us to understand the reasoning when you didn't
provide any.

thanks,

greg k-h
