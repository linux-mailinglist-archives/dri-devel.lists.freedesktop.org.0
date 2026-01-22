Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML4HI7RKcmnpfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:05:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EBD697B8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFDB10E9E5;
	Thu, 22 Jan 2026 16:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F3DZHfsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F3810E9E5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:05:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F086A43677
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFA00C19422
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769097902;
 bh=Mzb8UpNayWi8WSDbYqRNOPsgBpdFmBNBUHCYSVhOgo4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F3DZHfsuR6TH35KPqDn70lO5LG9QUMkqe1vCcrFvWp+DGoIr2aq8U73v5E8Bn1X7j
 Su4A7rxkxAwJoKApx0I0gf6IKylhxilcnwkO7InuJZcbwLRlUJOBDgYnwNRzpN/R70
 BFvOGTNJgWCm0QSxe5TCuvk3pAl9MwshCPUQmwnQCjW/Mbnj/mwxwR/XT/agXH0iOp
 rcyetI9w86rtw/HqrY2nE6G1CNoWIwHuA6U7qbimAMps5JYkxvF0pXwHxwgOwX4I6N
 /M3ljYKMe5WZQ+AEm4IS1hHRUQe6QUdQpaeaqYhPbevsM8w4ivXHB8qU2LpQkzfEAJ
 UYayNy6QvUpvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C0E31C53BBF; Thu, 22 Jan 2026 16:05:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220428] UBSAN array-index-out-of-bounds warning in
 radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD 6250
Date: Thu, 22 Jan 2026 16:05:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dutra.astro@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220428-2300-yKByxGxVQ3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220428-2300@https.bugzilla.kernel.org/>
References: <bug-220428-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E0EBD697B8
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220428

--- Comment #6 from Lucas (dutra.astro@gmail.com) ---
No, this other error never appeared to me. My old Laptop from 2011 is an Ac=
er
Aspire 5250 with an old GPU AMD Radeon HD 6250, and a C-50 processor. Using
radeon firmware on Linux.

I uninstalled Linux, since it will never be equal or better Windows 10 Lite=
 in
this case. I do not pretend to reinstall linux on it, since it cannot even =
play
a YouTube video or play SuperTuxKart without lagging. Different from Windows
with Catalyst Radeon drivers which works fines, for both cases. Seems like
original radeon firmware from AMD was not open source neither well document=
ed
back in the time, so I think it is literally impossible a equal or better
driver for Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
