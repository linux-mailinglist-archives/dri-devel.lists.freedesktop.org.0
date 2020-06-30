Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A716720EF8A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982A489D8D;
	Tue, 30 Jun 2020 07:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.al2klimov.de (smtp.al2klimov.de
 [IPv6:2a01:4f8:c0c:1465::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692589C16
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 06:31:53 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 4EA0BBC078;
 Tue, 30 Jun 2020 06:31:41 +0000 (UTC)
Subject: Re: [PATCH] Remove handhelds.org links and email addresses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200629203121.7892-1-grandmaster@al2klimov.de>
 <20200629211027.GA1481@kunai>
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <09c27ac7-f5bc-064b-6751-9edc04de1679@al2klimov.de>
Date: Tue, 30 Jun 2020 08:31:40 +0200
MIME-Version: 1.0
In-Reply-To: <20200629211027.GA1481@kunai>
Content-Language: en-US
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: ulf.hansson@linaro.org, gustavo@embeddedor.com, tony@atomide.com,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mchehab+samsung@kernel.org,
 lee.jones@linaro.org, corbet@lwn.net, linux-samsung-soc@vger.kernel.org,
 aaro.koskinen@iki.fi, robert.jarzmik@free.fr, rafael.j.wysocki@intel.com,
 yuehaibing@huawei.com, linux@armlinux.org.uk, krzk@kernel.org,
 kgene@kernel.org, viresh.kumar@linaro.org, kuba@kernel.org, arnd@arndb.de,
 b.zolnierkie@samsung.com, jani.nikula@intel.com, linux-mmc@vger.kernel.org,
 linux-input@vger.kernel.org, j.neuschaefer@gmx.net, haojian.zhuang@gmail.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, yanaijie@huawei.com, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, netdev@vger.kernel.org,
 davem@davemloft.net, daniel@zonque.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.06.20 um 23:10 schrieb Wolfram Sang:
> Hi Alexander,
> 
> thanks for trying to fix this, yet I have some doubts.
> 
> On Mon, Jun 29, 2020 at 10:31:21PM +0200, Alexander A. Klimov wrote:
>> Rationale:
>> https://lore.kernel.org/linux-doc/20200626110706.7b5d4a38@lwn.net/
> 
> I think we need some text here. Clicking on a link to understand what a
> patch is about is not comfortable. You can add the link with a Link: tag
> for additional information.
Fine. I can easily make a v2 patch, but first...

> 
> Removing stale email addresses may have some value, but removing...
> 
>>   Compaq's Bootldr + John Dorsey's patch for Assabet support
>> -(http://www.handhelds.org/Compaq/bootldr.html)
> 
> ... information like this is not good. 'Wayback machine' still has
> copies in case someone wants to look at where the infos came from.
If we shall not remove *this link*, maybe we shall not remove *all links*?

@Jon You've kinda initiated the patch, what's your opinion? Bad 
squatters or good Wayback machine?

> 
>> - * Copyright 2004-2005  Phil Blundell <pb@handhelds.org>
>> + * Copyright 2004-2005  Phil Blundell
> 
> This is an OK case in my book...
> 
> 
>> -MODULE_AUTHOR("Phil Blundell <pb@handhelds.org>");
>> +MODULE_AUTHOR("Phil Blundell");
> 
> ... same here ...
> 
>> @@ -435,7 +435,6 @@
>>                              case a PCI bridge (DEC chip 21152). The value of
>>                              'pb' is now only initialized if a de4x5 chip is
>>                              present.
>> -                           <france@handhelds.org>
> 
> This is kind of a signature and should be kept IMO.
What for? An email address is for someone who'd like to send an email to 
it. At the moment handhelds.org doesn't even have an MX record.

> 
>>    * 2001/07/23: <rmk@arm.linux.org.uk>
>> - *	- Hand merge version from handhelds.org CVS tree.  See patch
>> + *	- Hand merge version from CVS tree.  See patch
> 
> That information may be useful.
Again: What for? For visiting it and thinking like damn, it's gone?

> 
> 
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /* -*- linux-c -*-
>> - *
>> - * (C) 2003 zecke@handhelds.org
> 
> Removing copyright is a bad idea.
IMAO the CREDITS file is for (c) headers.
If you didn't submit a patch for that - your problem.

If you disagree, I can look up git blame.

> 
> Probably some comment blocks are cruft meanwhile and can be removed as a
> whole. That can be discussed. But removing only the handhelds.org part
> makes most parts worse IMHO.
> 
> Thanks and happy hacking,
> 
>     Wolfram
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
