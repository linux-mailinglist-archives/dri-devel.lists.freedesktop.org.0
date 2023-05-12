Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71336700866
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 14:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D710E15B;
	Fri, 12 May 2023 12:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F8E10E15B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 12:49:23 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aaf706768cso76155785ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683895762; x=1686487762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=T4Bwu1/m+mf+/AYH3YMI2am9lWYECxCgwTG6fxXqnDM=;
 b=Mu6B2Vvx/likXVwX5YSuCzcOyDhO3nyIbg5DJAFv4Fh6jqbdmg/ukbC0//k395sBq/
 zVK+X/GG2r5Zm6ZyZ2JxbaCx/rUZaCr7KVsSsrT6KC5jSfYNuZuxfCHeG35Vhvc4Do2e
 HPsmgPNlHgGU+b1IHVepxDytxTHrhHw+ik87sxTJtVk4E0v08GlUHENGtbK6TvDnAiTr
 yLbe6CXu1c0z8pJq0TrNYPohEzWnU0+YTl8XG8FOsVsM2KV7G+Ooyrj1KM+ReEmsVoDZ
 p2y7O1CDheFOJkuoQN8OZPPJmSCJdpdz5Hy07XkF0K0C7bCoeMpZXxj/4VryZjvx3ol4
 rNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895762; x=1686487762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4Bwu1/m+mf+/AYH3YMI2am9lWYECxCgwTG6fxXqnDM=;
 b=fn6aTdbkB+mur4dTYXUuWmGJiGQfarHcJsehRb6oSFmnIjPiYjkrFCW8JKJCZSwLzl
 gdUjf3Yi49RWyHDOM6KIUkd0RtRC/kguGRz6qpvi+hDIaAs/eF31BTDoSq87wjZe+9rH
 AvPO4dRqnkGh5MOSQZrXYMWQQ1poKZDL+puodsZnuyiw++OX8h1UMY/k2R4vmcqP5R0A
 jg1YSKyndzdccXrcJZQJ/xzrSLBJlRymYIZNYAfKTNhBBGeMeloKR6Kv1RnOezBOzneF
 Y9IFMbJgUfm5BdVOCNwKI1Au9baUnoViVGPh5kZM3ebFQx7BXKp1qefh/5dRKdQJmwqf
 wtMg==
X-Gm-Message-State: AC+VfDxKN8cQfwT32ijhVyWR1de7yaD0nh28vazXq/UierBjSb1dFrpR
 77pkwCyT3QhTR2Gme2l+aS8=
X-Google-Smtp-Source: ACHHUZ4QC7nOkGyG6InsWHZK7DO6lQ0Qk5Iwug1SSjWnugCY3MVofbA1+NsVDZnCTOxusMijiERaQg==
X-Received: by 2002:a17:902:d34b:b0:1a6:386f:39a3 with SMTP id
 l11-20020a170902d34b00b001a6386f39a3mr26966779plk.31.1683895762478; 
 Fri, 12 May 2023 05:49:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b001ac741db80csm7882876plh.88.2023.05.12.05.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:49:22 -0700 (PDT)
Date: Fri, 12 May 2023 05:49:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Message-ID: <08b5be32-0da5-4614-9c3c-b3a821492397@roeck-us.net>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512100620.36807-9-bagasdotme@gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 05:06:19PM +0700, Bagas Sanjaya wrote:
> Many watchdog drivers's source files has already SPDX license
> identifier, while some remaining doesn't.
> 
> Convert notices on remaining files to SPDX identifier. While at it,
> also move SPDX identifier for drivers/watchdog/rtd119x_wdt.c to the
> top of file (as in other files).
> 
> Cc: Ray Lehtiniemi <rayl@mail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Andrey Panin <pazke@donpac.ru>
> Cc: Oleg Drokin <green@crimea.edu>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Jonas Jensen <jonas.jensen@gmail.com>
> Cc: Sylver Bruneau <sylver.bruneau@googlemail.com>
> Cc: Andrew Sharp <andy.sharp@lsi.com>
> Cc: Denis Turischev <denis@compulab.co.il>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/watchdog/ep93xx_wdt.c     | 5 +----
>  drivers/watchdog/ibmasr.c         | 3 +--
>  drivers/watchdog/m54xx_wdt.c      | 4 +---
>  drivers/watchdog/max63xx_wdt.c    | 5 +----
>  drivers/watchdog/moxart_wdt.c     | 4 +---
>  drivers/watchdog/octeon-wdt-nmi.S | 5 +----
>  drivers/watchdog/orion_wdt.c      | 4 +---
>  drivers/watchdog/rtd119x_wdt.c    | 2 +-
>  drivers/watchdog/sb_wdog.c        | 5 +----
>  drivers/watchdog/sbc_fitpc2_wdt.c | 4 +---
>  drivers/watchdog/ts4800_wdt.c     | 4 +---
>  drivers/watchdog/ts72xx_wdt.c     | 4 +---
>  12 files changed, 12 insertions(+), 37 deletions(-)
> 
[ ... ]

> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> index 504be461f992a9..822bf8905bf3ce 100644
> --- a/drivers/watchdog/sb_wdog.c
> +++ b/drivers/watchdog/sb_wdog.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+

This would include GPL 3, but the text below explicitly excludes that.
No idea how to handle that.

Guenter

>  /*
>   * Watchdog driver for SiByte SB1 SoCs
>   *
> @@ -38,10 +39,6 @@
>   *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
>   *						All Rights Reserved.
>   *
> - *	This program is free software; you can redistribute it and/or
> - *	modify it under the terms of the GNU General Public License
> - *	version 1 or 2 as published by the Free Software Foundation.
> - *
>   */
