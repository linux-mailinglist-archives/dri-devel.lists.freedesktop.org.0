Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KG6N6AtqGk+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B7200045
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3B10E9EF;
	Wed,  4 Mar 2026 13:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IOffS5g7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC410E9EF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6AC25600AD;
 Wed,  4 Mar 2026 13:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29C4C2BC87;
 Wed,  4 Mar 2026 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772629404;
 bh=as/+AFDxUQJJH9EQ7+j52oWVIpgXyF9JEaGwrMSUpWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IOffS5g7+hhMm74zWhFLTABJyW9rGFMQ2Sp2AI+HJGM1rnjhdUI9tsNnW58SHX0wR
 PUNJNohuW8tSNFDVvunJaOXvH0VrmSgsbl/9f7iWOnZewE82rHuT9A8LawpzBBaY/x
 mTUfps13Cj0X9ctvsxFKOlbDJySzcmnhy2lRCXoTvKNW/+VDP0XlAJnT1XjiQF0wIa
 8kCLaiNv+6g7C9kJWoNpgFg/GNYlAPCjQC1f/pRtYdCrMjVkR8CwBLNHsSgWK31+HC
 nWl0UYe1BNnR1Vehvgo97Tkic5VUB4vsrr4LgcuTOgKImZXbPoNNOKGcGfo/0VzBTd
 NHJ1bnXVqpPiw==
Date: Wed, 4 Mar 2026 14:03:20 +0100
From: Christian Brauner <brauner@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
Subject: Re: Possible newline injection into fdinfo
Message-ID: <20260304-wertigkeit-rockkonzert-ac7270334804@brauner>
References: <08f230b4-8c01-45b8-9956-7cfb9f82eeff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08f230b4-8c01-45b8-9956-7cfb9f82eeff@gmail.com>
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
X-Rspamd-Queue-Id: 825B7200045
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
	NEURAL_HAM(-0.00)[-1.000];
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

On Wed, Mar 04, 2026 at 01:53:42AM -0500, Demi Marie Obenour wrote:
> I noticed potentially missing input sanitization in dma_buf_set_name(),
> which is reachable from DMA_BUF_SET_NAME.  This allows inserting a name
> containing a newline, which is then used to construct the contents of
> /proc/PID/task/TID/fdinfo/FD.  This could confuse userspace programs
> that access this data, possibly tricking them into thinking a file
> descriptor is of a different type than it actually is.
> 
> Other code might have similar bugs.  For instance, there is code that
> uses a sysfs path, a driver name, or a device name from /dev.  It is
> possible to sanitize the first, and the second and third should come
> from trusted sources within the kernel itself.  The last area where
> I found a potential problem is BPF.  I don't know if this can happen.
> 
> I think this should be fixed by either sanitizing data on write
> (by limiting the allowed characters in dma_buf_set_name()), on read
> (by using one of the formats that escapes special characters), or both.
> 
> Is there a better way to identify that a file descriptor is of
> a particular type, such as an eventfd?  fdinfo is subject to

The problem is that most of the anonymous inodes share a single
anonymous inode so any uapi that returns information based inode->i_op
is not going to be usable.

> bugs of this type, which might happen again.  readlink() reports
> "anon_inode:[eventfd]" and S_IFMT reports a mode of 0, but but my

That is definitely uapi by now. We've tried to change S_IFMT and it
breaks lsfd and other tools so we can't reasonably change it. In fact,
pidfds pretend to be anon_inode even though they're not simply because
some tools parse that out.

> reading of the kernel source code is that neither is intended to be
> stable uAPI.  Is there a better interface that can be used?
