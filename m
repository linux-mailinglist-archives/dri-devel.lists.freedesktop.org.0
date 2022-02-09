Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6D4AF368
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EDD10E54D;
	Wed,  9 Feb 2022 13:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FB710E54D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644415000; x=1675951000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xBjttyyMrZXC5nplVL/cvGF1ir/hZw4ovvvgsddLC8c=;
 b=TWzrxNwBItv0MOyW/dxUEuuRpMn79gtnEChEWXoHl17ooT6vlzZTfUT7
 L+todNecLU6lpnPXpGBLnjeGhysODDdtO93e+JrWjE/u2U6ga6iiVl8No
 e0y1c3Dw7SmTpIQEF5UQ+yOItVjKDZZrZAcrXBgTZ+NsIuy/fnqwqoLqq
 ItbyVqwiIPOIZpsKRuGQJTduI3u39CO2T5iKfSg9aXwtJmVc1iWtNu04z
 m28qQBEjVJ0Km+XJ3T/mdJby+r/hhKTzCKP8lb4Xfopd0e2gVg5dqWRYT
 pFJ1I1evpph+mDxRR+sAzC9lZcHnZqASgA7kmzdT4dfx3e56YcNs4FKrm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249414394"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="249414394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 05:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="678596354"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 09 Feb 2022 05:56:36 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 15:56:36 +0200
Date: Wed, 9 Feb 2022 15:56:36 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [syzbot] WARNING in component_del
Message-ID: <YgPIFEJydBdOh/U5@kuha.fi.intel.com>
References: <00000000000016f4ae05d5cec832@google.com>
 <000000000000a17f2305d77f4cb7@google.com>
 <YgPEtCGDlSrqa1fK@kuha.fi.intel.com>
 <250ce1c2-95bf-3067-7bd6-5655038c5e69@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <250ce1c2-95bf-3067-7bd6-5655038c5e69@gmail.com>
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
Cc: syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>,
 rafael@kernel.org, gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andriy.shevchenko@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 04:51:44PM +0300, Pavel Skripkin wrote:
> Hi Heikki,
> 
> On 2/9/22 16:42, Heikki Krogerus wrote:
> > On Tue, Feb 08, 2022 at 02:37:10AM -0800, syzbot wrote:
> > > syzbot has bisected this issue to:
> > > 
> > > commit 8c67d06f3fd9639c44d8147483fb1c132d71388f
> > > Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Date:   Thu Dec 23 08:23:49 2021 +0000
> > > 
> > >     usb: Link the ports to the connectors they are attached to
> > > 
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14063168700000
> > > start commit:   555f3d7be91a Merge tag '5.17-rc3-ksmbd-server-fixes' of gi..
> > > git tree:       upstream
> > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=16063168700000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=12063168700000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15880d84700000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14de0c77b00000
> > > 
> > > Reported-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com
> > > Fixes: 8c67d06f3fd9 ("usb: Link the ports to the connectors they are attached to")
> > > 
> > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > 
> > I'm guessing the component_add() is failing in this case. So I guess
> > we need to consider the component_add() failures fatal in
> > drivers/usb/core/port.c, which is a bit of a bummer. I'll send the
> > fix.
> > 
> 
> Seems something similar to your approach is already posted
> 
> https://lore.kernel.org/linux-usb/20220208170048.24718-1-fmdefrancesco@gmail.com/

Ah, thanks! That one seems to leave the peer links, so it's broken...

Br,

-- 
heikki
