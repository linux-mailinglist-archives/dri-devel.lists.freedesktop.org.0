Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAwcMnq/rmlEIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:39:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCA238FA6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587A510E136;
	Mon,  9 Mar 2026 12:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DYLnhx5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96C710E136
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:39:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46FDD43896;
 Mon,  9 Mar 2026 12:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086CFC4CEF7;
 Mon,  9 Mar 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773059957;
 bh=fEl4baRpKnJ2nFfANZeesOCBX6U6bvjEkJDi+RYvOr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYLnhx5I72IJrLNHQJUVx4UbQs2eFALwvjPO7MhCySOrfhD6vnCsz91aW3UYnpVXJ
 wHFNvZxAwANQK+Kw/Eofc5iLP9RexcsZjp+Txm/YZr5ZM4CTIkFSng0ZLDk6lTd9TU
 RFk5fLChRXwYcOt0pTGu0NNwv28OlFVm1wrIICkxphiElXItgd74J71xKXC+OUFxnV
 ymjTK0oqy4NhT2BvoL21EPDa1Odzse6bhZB2aJNjuBWnou7/caJFWfqG2nJwQnfu/s
 Bye+grl2S6ESjn00WPUddq+cRvKZv1fTKMlBTManpRykjnkt58/ukEhbx8gm0oQdxU
 jewUA3dfemX5A==
Date: Mon, 9 Mar 2026 13:39:13 +0100
From: Christian Brauner <brauner@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
Subject: Re: Possible newline injection into fdinfo
Message-ID: <20260309-zentimeter-abklatsch-990a9ae26ace@brauner>
References: <08f230b4-8c01-45b8-9956-7cfb9f82eeff@gmail.com>
 <20260304-wertigkeit-rockkonzert-ac7270334804@brauner>
 <bc3c1712-a747-42f5-b175-43757fb83ac9@gmail.com>
 <20260305-gespeichert-athletisch-a25f907e6d2a@brauner>
 <a28e153e-1ad5-4d5e-b030-9b44158533d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a28e153e-1ad5-4d5e-b030-9b44158533d7@gmail.com>
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
X-Rspamd-Queue-Id: 23DCA238FA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brauner@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.609];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 05:24:29AM -0500, Demi Marie Obenour wrote:
> On 3/5/26 03:34, Christian Brauner wrote:
> > On Wed, Mar 04, 2026 at 01:57:31PM -0500, Demi Marie Obenour wrote:
> >> On 3/4/26 08:03, Christian Brauner wrote:
> >>> On Wed, Mar 04, 2026 at 01:53:42AM -0500, Demi Marie Obenour wrote:
> >>>> I noticed potentially missing input sanitization in dma_buf_set_name(),
> >>>> which is reachable from DMA_BUF_SET_NAME.  This allows inserting a name
> >>>> containing a newline, which is then used to construct the contents of
> >>>> /proc/PID/task/TID/fdinfo/FD.  This could confuse userspace programs
> >>>> that access this data, possibly tricking them into thinking a file
> >>>> descriptor is of a different type than it actually is.
> >>>>
> >>>> Other code might have similar bugs.  For instance, there is code that
> >>>> uses a sysfs path, a driver name, or a device name from /dev.  It is
> >>>> possible to sanitize the first, and the second and third should come
> >>>> from trusted sources within the kernel itself.  The last area where
> >>>> I found a potential problem is BPF.  I don't know if this can happen.
> >>>>
> >>>> I think this should be fixed by either sanitizing data on write
> >>>> (by limiting the allowed characters in dma_buf_set_name()), on read
> >>>> (by using one of the formats that escapes special characters), or both.
> >>>>
> >>>> Is there a better way to identify that a file descriptor is of
> >>>> a particular type, such as an eventfd?  fdinfo is subject to
> >>>
> >>> The problem is that most of the anonymous inodes share a single
> >>> anonymous inode so any uapi that returns information based inode->i_op
> >>> is not going to be usable.
> >>>
> >>>> bugs of this type, which might happen again.  readlink() reports
> >>>> "anon_inode:[eventfd]" and S_IFMT reports a mode of 0, but but my
> >>>
> >>> That is definitely uapi by now. We've tried to change S_IFMT and it
> >>> breaks lsfd and other tools so we can't reasonably change it. In fact,
> >>> pidfds pretend to be anon_inode even though they're not simply because
> >>> some tools parse that out.
> >>
> >> Does Linux guarantee that anything that is not an anonymous inode
> >> will have (st_mode & S_IFMT) != 0?
> > 
> > Ignoring bugs or disk corruption anonymous inodes should be the only
> > inode type that has a zero type. Everything else should have a non-zero
> > type and the I made the VFS splat in may_open():
> > 
> >           switch (inode->i_mode & S_IFMT) {
> >           case S_IFLNK:
> >                   return -ELOOP;
> >           case S_IFDIR:
> >                   if (acc_mode & MAY_WRITE)
> >                           return -EISDIR;
> >                   if (acc_mode & MAY_EXEC)
> >                           return -EACCES;
> >                   break;
> >           case S_IFBLK:
> >           case S_IFCHR:
> >                   if (!may_open_dev(path))
> >                           return -EACCES;
> >                   fallthrough;
> >           case S_IFIFO:
> >           case S_IFSOCK:
> >                   if (acc_mode & MAY_EXEC)
> >                           return -EACCES;
> >                   flag &= ~O_TRUNC;
> >                   break;
> >           case S_IFREG:
> >                   if ((acc_mode & MAY_EXEC) && path_noexec(path))
> >                           return -EACCES;
> >                   break;
> >           default:
> >                   VFS_BUG_ON_INODE(!IS_ANON_FILE(inode), inode);
> >           }
> > 
> >> Maybe it is time for a prctl that disables this legacy behavior?
> > 
> > I've switched anonymous inodes internally to S_IFREG a while ago in [1]
> > and then masked it off for userspace. Even just the internal conversion
> > caused various subsystems like io_uring to lose it which is why we
> > reverted it in [2].
> > 
> > So any next attempt needs to ensure that there are no internal and no
> > external regressions. And no prctl()s please. It's a strong contender
> > for Linux' main landfill next to procfs.
> > Ideally we'd just look at lsfd and lsof and move them away from any type
> > assertions. I have asked them to do that for pidfds a while ago and they
> > have merged a patch to that effect.> > [1]: cfd86ef7e8e7 ("anon_inode: use a proper mode internally")
> > [2]: 1e7ab6f67824 ("anon_inode: rework assertions")
> 
> What should programs like that be doing instead, given the fdinfo
> newline injection bug?  Even if the current drivers are fixed,
> the interface makes it very easy to mess up new ones.  It's like
> preventing XSS when one has to manually HTML-escape everything.
> 
> Ideally, this would be fixed at the seq_file level, with any space
> (including LF) introduced via %s being automatically escaped.

I'm not familiar enough with that particular wrinkle of the seqfile
implementation my guess is that just doing this unconditional in seqfile
will cause regressions. And the bug is with the ability to pass
unsanitized input in so the caller should be fixed imho.

So for now you might want to fix dma_buf_set_name() and the two other
possible offenders provided you can show the maintainers how this is
possible.
