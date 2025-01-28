Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B4A2098C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 12:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B9B10E0AA;
	Tue, 28 Jan 2025 11:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="foTouGKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9AD10E0AA;
 Tue, 28 Jan 2025 11:22:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3179E5C5D79;
 Tue, 28 Jan 2025 11:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98109C4CEDF;
 Tue, 28 Jan 2025 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738063362;
 bh=AJfDJn9pFkPItjs+l9CjDlC33TdlTCE01Kr4mfJIOJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=foTouGKI5Xpt6DiifiySGU1Px4B0JlxynZkL/A+4GJ+F1wUAFkM/N4G83a9sI8N06
 lsMHA2F0I+BGkV1h4oylhwmSeJznMzbN+UJy9qwbYRK5QlpfqNfv8Msq/ndA/iDm4I
 JYp3P2GR22dNEIcBnZOOATJGYPU+gMIFK9XfLLma3B24+UKToDLZL/ZLBF6bwp16qy
 HMKr9svtYad8MrCuOMMF5t2I0WLB8bGS9HGYMu9w94+SD6sanYCztaTmP2cubx4D+F
 lhSPEntAtoYhJR/j92VqRwE5MifEf7tNzvj9NQnTwv0sbHofELHMou005/QzH1lonP
 yczCENnq4hKEA==
Date: Tue, 28 Jan 2025 12:22:37 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-crypto@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org, 
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, 
 netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 fsverity@lists.linux.dev, 
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 "Darrick J. Wong" <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
Message-ID: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5epb86xkHQ3BLhp@casper.infradead.org>
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

On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > You could have static const within functions too. You get the rodata
> > protection and function local scope, best of both worlds?
> 
> timer_active is on the stack, so it can't be static const.
> 
> Does this really need to be cc'd to such a wide distribution list?
That is a very good question. I removed 160 people from the original
e-mail and left the ones that where previously involved with this patch
and left all the lists for good measure. But it seems I can reduce it
even more.

How about this: For these treewide efforts I just leave the people that
are/were involved in the series and add two lists: linux-kernel and
linux-hardening.

Unless someone screams, I'll try this out on my next treewide.

Thx for the feedback

Best

-- 

Joel Granados
