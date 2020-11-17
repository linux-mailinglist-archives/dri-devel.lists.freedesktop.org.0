Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E912B715F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 23:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FAA6E12C;
	Tue, 17 Nov 2020 22:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542036E12C;
 Tue, 17 Nov 2020 22:19:18 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17315206B6;
 Tue, 17 Nov 2020 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605651557;
 bh=GHrSTxL7y3OT9VIhqMi4Mq1l4vD6ZvPCLHA7AVK0P+Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0gbGqcecJOh+OuHZeLlQZ3w2i+xeQKPcOORZrxJCrb/uEJlakRM+cizA6CGkYf6Hr
 Wji5N+xTP+/p8dUX/3ehUQtUgvOr/0NqFj7YTAjLIkQTaOuH6fljIuYUVsj29DdmRw
 +Vwr/jq1XwjWyrM1HI/eEAvNkAFeEKOXVLBBoVJM=
Date: Tue, 17 Nov 2020 14:19:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 00/27]Fix several bad kernel-doc markups
Message-ID: <20201117141914.73056d1f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <cover.1605521731.git.mchehab+huawei@kernel.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-fbdev@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, Ben Segall <bsegall@google.com>,
 linux-mm@kvack.org, "David S.
 Miller" <davem@davemloft.net>, linux-kselftest@vger.kernel.org,
 Evgeniy Polyakov <zbr@ioremap.net>, netdev@vger.kernel.org,
 Richard Gong <richard.gong@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
 linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, Russell King <linux@armlinux.org.uk>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Matt Porter <mporter@kernel.crashing.org>, linux-ext4@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 Colin Cross <ccross@android.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Will Drewry <wad@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-nfs@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Alexandre Bounine <alex.bou9@gmail.com>,
 target-devel@vger.kernel.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Mike Rapoport <rppt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Nov 2020 11:17:56 +0100 Mauro Carvalho Chehab wrote:
> Kernel-doc has always be limited to a probably bad documented
> rule:
> 
> The kernel-doc markups should appear *imediatelly before* the
> function or data structure that it documents.

Applied 1-3 to net-next, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
