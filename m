Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0DA54436
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3718110E8DB;
	Thu,  6 Mar 2025 08:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 20:37:40 UTC
Received: from mail.muc.de (mail.muc.de [193.149.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0841F10E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:37:39 +0000 (UTC)
Received: (qmail 5327 invoked by uid 3782); 4 Mar 2025 21:30:57 +0100
Received: from muc.de (pd953a22b.dip0.t-ipconnect.de [217.83.162.43]) (using
 STARTTLS) by colin.muc.de (tmda-ofmipd) with ESMTP;
 Tue, 04 Mar 2025 21:30:56 +0100
Received: (qmail 12384 invoked by uid 1000); 4 Mar 2025 20:30:56 -0000
Date: Tue, 4 Mar 2025 20:30:56 +0000
To: dri-devel@lists.freedesktop.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: More than 256/512 glyphs on the Liinux console
Message-ID: <Z8djAD5WgpyPTnpa@MAC.fritz.box>
References: <Z7idXzMcDhe_E5oN@MAC.fritz.box>
 <2025022243-street-joylessly-6dfa@gregkh>
 <Z7nu7HqKn4o2rMd5@MAC.fritz.box>
 <2025022355-peroxide-defacing-4fa4@gregkh>
 <Z7y4yHT0fNYYiPI8@MAC.fritz.box>
 <d5e05c61-d796-4e5c-9538-a1e068631bba@kernel.org>
 <Z73sqvjlbJ54FCtH@MAC.fritz.box>
 <2025022652-uptown-cheating-5df8@gregkh>
 <Z8BjC_TzuDVaFC_3@MAC.fritz.box>
 <2025022802-monitor-moneyless-0f84@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022802-monitor-moneyless-0f84@gregkh>
X-Submission-Agent: TMDA/1.3.x (Ph3nix)
From: Alan Mackenzie <acm@muc.de>
X-Primary-Address: acm@muc.de
X-Mailman-Approved-At: Thu, 06 Mar 2025 08:07:52 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, dri-devel.

The context of the following post is a thread on Linux kernel lists where
I am proposing to extend the Linux console to handle more than 256/512
distinct glyphs.

On Fri, Feb 28, 2025 at 20:24:33 -0800, Greg Kroah-Hartman wrote:
> On Thu, Feb 27, 2025 at 01:05:15PM +0000, Alan Mackenzie wrote:
> > Hello, Greg.

> > On Wed, Feb 26, 2025 at 11:09:57 +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Feb 25, 2025 at 04:15:38PM +0000, Alan Mackenzie wrote:
> > > > On Mon, Feb 24, 2025 at 21:08:50 +0100, Jiri Slaby wrote:

> > > > > I didn't read the thread, but are you looking e.g. for kmscon?

> > > > No, I wasn't.  I was looking for a drm replacement for the
> > > > drivers/tty/vt code inside the kernel.  I may have misunderstood
> > > > Greg when he referred to a replacement which uses drm.

> > > No, this is what I was referring to.  Also maybe we should be
> > > asking on the drm list?  The developers there were working to get
> > > rid of CONFIG_VT so I know they have plans for what they see
> > > replacing it.

Is this (still) the case?  Have people on dri-devel developed a Linux
console which supersedes the code in drivers/tty/vt, or are they in the
midst of doing so?

Where can I best inform myself about this, and (possibly) install this
replacement console on my system for my own use?

Thanks for any information!

[ .... ]

> dri-devel@lists.freedesktop.org is the list.

> thanks,

> greg k-h

-- 
Alan Mackenzie (Nuremberg, Germany).
