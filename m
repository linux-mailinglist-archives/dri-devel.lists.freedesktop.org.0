Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61804AA5C15
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 10:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349CA10E29B;
	Thu,  1 May 2025 08:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="S+YA9Ttr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862DF10E0E6;
 Wed, 30 Apr 2025 21:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1746048582; x=1777584582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yyT2mE4AxoVDIQ/9ei0bjwOO32J4Gut3ZMT5pI4UU7E=;
 b=S+YA9TtrnrPDpelLTsV3jO+UPRwXy/ZBS2QY73DjL3XYSFHjCeYeLr+L
 /vzw4ftSbHGbg7aeQlDhmMWU9l5lQQzBJB067jMomhIbUihAxPUAsb3eO
 Eu11zkhWxfoPRQXNRI1jbP/5AazmX65eoPiG5hlxisVNCp2tTkJ0XrJaW 8=;
X-IronPort-AV: E=Sophos;i="6.15,252,1739836800"; d="scan'208";a="718487481"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 21:29:27 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:32139]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.121:2525]
 with esmtp (Farcaster)
 id 62e930e0-868d-4088-b8d6-eaf92158a546; Wed, 30 Apr 2025 21:29:26 +0000 (UTC)
X-Farcaster-Flow-ID: 62e930e0-868d-4088-b8d6-eaf92158a546
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 30 Apr 2025 21:29:26 +0000
Received: from 6c7e67bfbae3.amazon.com (10.187.171.60) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 30 Apr 2025 21:29:21 +0000
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
Date: Wed, 30 Apr 2025 14:29:07 -0700
Message-ID: <20250430212913.27147-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430-reftrack-dbgfs-v6-8-867c29aff03a@kernel.org>
References: <20250430-reftrack-dbgfs-v6-8-867c29aff03a@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.60]
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
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
Date: Wed, 30 Apr 2025 08:06:54 -0700
> After assigning the inode number to the namespace, use it to create a
> unique name for each netns refcount tracker with the ns.inum value in
> it, and register a symlink to the debugfs file for it.
> 
> init_net is registered before the ref_tracker dir is created, so add a
> late_initcall() to register its files and symlinks.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  net/core/net_namespace.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index 008de9675ea98fa8c18628b2f1c3aee7f3ebc9c6..6cbc8eabb8e56c847fc34fa8ec9994e8b275b0af 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -763,12 +763,38 @@ struct net *get_net_ns_by_pid(pid_t pid)
>  }
>  EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
>  
> +#ifdef CONFIG_NET_NS_REFCNT_TRACKER
> +static void net_ns_net_debugfs(struct net *net)
> +{
> +	ref_tracker_dir_symlink(&net->refcnt_tracker, "netns-%u-refcnt", net->ns.inum);
> +	ref_tracker_dir_symlink(&net->notrefcnt_tracker, "netns-%u-notrefcnt", net->ns.inum);

Could you use net->net_cookie ?

net->ns.inum is always 1 when CONFIG_PROC_FS=n.
