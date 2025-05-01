Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CFAA5C10
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 10:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7DB10E075;
	Thu,  1 May 2025 08:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="Fevewx2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4B10E030;
 Thu,  1 May 2025 03:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1746071499; x=1777607499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieN6Uufg5eN4Yl9eD7qnOlPh9TDKaa21BdQlQv6AVLs=;
 b=Fevewx2Si8MFLW7JPE0YvmcFL353mwnCxH7slV6Tjm6KigBx0qwDInFC
 3ZZD3balJFKCYm+0k+fzS42SD+1u+rGhpFURfIUEPNpR6k3DOHdHf5oaP
 4hTMO+3aoQX0elMZuN0X/Ec9txV4jsmrc8DL6AwbQW1s30N5Dt+rCA1q9 k=;
X-IronPort-AV: E=Sophos;i="6.15,253,1739836800"; d="scan'208";a="45594019"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 03:51:30 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:42164]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.114:2525]
 with esmtp (Farcaster)
 id 7bc7e118-2ba3-4338-9316-07c9580be08c; Thu, 1 May 2025 03:51:29 +0000 (UTC)
X-Farcaster-Flow-ID: 7bc7e118-2ba3-4338-9316-07c9580be08c
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 1 May 2025 03:51:28 +0000
Received: from 6c7e67bfbae3.amazon.com (10.187.171.60) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 1 May 2025 03:51:23 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <jlayton@kernel.org>
CC: <airlied@gmail.com>, <akpm@linux-foundation.org>, <andrew@lunn.ch>,
 <davem@davemloft.net>, <dri-devel@lists.freedesktop.org>,
 <edumazet@google.com>, <horms@kernel.org>, <intel-gfx@lists.freedesktop.org>, 
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <kuba@kernel.org>, <kuniyu@amazon.com>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <nathan@kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <qasdev00@gmail.com>, <rodrigo.vivi@intel.com>, <simona@ffwll.ch>,
 <tursulin@ursulin.net>, <tzimmermann@suse.de>
Subject: Re: [PATCH v6 08/10] net: add symlinks to ref_tracker_dir for netns
Date: Wed, 30 Apr 2025 20:50:49 -0700
Message-ID: <20250501035115.76182-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cf11e228dfa247476a498a37f88a96d8e0e2585c.camel@kernel.org>
References: <cf11e228dfa247476a498a37f88a96d8e0e2585c.camel@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.60]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Mailman-Approved-At: Thu, 01 May 2025 08:23:48 +0000
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

From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 30 Apr 2025 20:42:40 -0700
> On Wed, 2025-04-30 at 20:07 -0700, Kuniyuki Iwashima wrote:
> > From: Jeff Layton <jlayton@kernel.org>
> > Date: Wed, 30 Apr 2025 19:59:23 -0700
> > > On Wed, 2025-04-30 at 14:29 -0700, Kuniyuki Iwashima wrote:
> > > > From: Jeff Layton <jlayton@kernel.org>
> > > > Date: Wed, 30 Apr 2025 08:06:54 -0700
> > > > > After assigning the inode number to the namespace, use it to create a
> > > > > unique name for each netns refcount tracker with the ns.inum value in
> > > > > it, and register a symlink to the debugfs file for it.
> > > > > 
> > > > > init_net is registered before the ref_tracker dir is created, so add a
> > > > > late_initcall() to register its files and symlinks.
> > > > > 
> > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > > ---
> > > > >  net/core/net_namespace.c | 28 +++++++++++++++++++++++++++-
> > > > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> > > > > index 008de9675ea98fa8c18628b2f1c3aee7f3ebc9c6..6cbc8eabb8e56c847fc34fa8ec9994e8b275b0af 100644
> > > > > --- a/net/core/net_namespace.c
> > > > > +++ b/net/core/net_namespace.c
> > > > > @@ -763,12 +763,38 @@ struct net *get_net_ns_by_pid(pid_t pid)
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
> > > > >  
> > > > > +#ifdef CONFIG_NET_NS_REFCNT_TRACKER
> > > > > +static void net_ns_net_debugfs(struct net *net)
> > > > > +{
> > > > > +	ref_tracker_dir_symlink(&net->refcnt_tracker, "netns-%u-refcnt", net->ns.inum);
> > > > > +	ref_tracker_dir_symlink(&net->notrefcnt_tracker, "netns-%u-notrefcnt", net->ns.inum);
> > > > 
> > > > Could you use net->net_cookie ?
> > > > 
> > > > net->ns.inum is always 1 when CONFIG_PROC_FS=n.
> > > 
> > > My main use-case for this is to be able to match the inode number in
> > > the /proc/<pid>/ns/net symlink with the correct ref_tracker debugfs
> > > file. Is there a way to use the net_cookie to make that association?
> > 
> > It's roundabout, but  net_cookie can be retrieved by creating a
> > random socket in the netns and calling setsockopt(SO_NETNS_COOKIE).
> > 
> > Ido proposed a handy ip-netns subcommand here, and I guess it will
> > be implemented soon(?)
> > https://lore.kernel.org/netdev/1d99d7ccfc3a7a18840948ab6ba1c0b5fad90901.camel@fejes.dev/
> 
> For the cases where I was looking at netns leaks, there were no more
> processes in the container, so there was no way to enter the container
> and spawn a socket at that point.

Then how do you get net->ns.inum ?


> 
> The point of the symlinks is to have a way to easily identify what
> you're tracking. NAME_MAX is 255. We could do something like this
> instead:
> 
>    snprintf(..., "netns-%u-%llx-refcnt", net->ns.inum, net->net_cookie);
> 
> Obviously the inums would all be 1 when PROC_FS=n, but the cookies
> would be unique. Would that work?

This works, but depending on the question above, there's no point in
using inum ?
