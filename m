Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LWENsqXjmnXDAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:17:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781C41329D7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74A310E2D2;
	Fri, 13 Feb 2026 03:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qBD2Asa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285F10E2D2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 03:17:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C8676132B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 03:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5894C19422
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 03:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770952645;
 bh=4USRmL1UAt4uYV4R0iMT+Ydg59yFEBO/GE4KdWolHBE=;
 h=From:To:Subject:Date:From;
 b=qBD2Asa6P53wuxEsjPmb/IB+fRlxOyUsMFGP2grIDEgcTsD5+Rdft4YqC0H/aLSiM
 bVULBf3P0bVAXHwT40cTSvbkwzehEX0gFNxrUysCQe0ieAj7ZGIlX04UU9U0NK3RIk
 k9Z4BEmR0lLAnIbsn7dEXxT8V8gdsW2DhZh7/nVfGvYPY3gnRai47FdMhZ1CPqUwrv
 CSZMFy0KE/Q7S0/hJjYNQ9K17ilUy86mn7F6sJPA/qFSQSmt4KpO8rMgslF0xqfxww
 fhO04ukKMTb+LjV7U2J9I20TdeAytb9CIpYU6T/ug5XiuXTOEF/X5fAzd4/Pa+sZZT
 cRPFkuk6rTtRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9E979C41616; Fri, 13 Feb 2026 03:17:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221089] New: amdgpu: Regression in Linux 7.0 with RX-580: BUG:
 unable to handle page fault for address: fffffffffffffff1
Date: Fri, 13 Feb 2026 03:17:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pinkflames.linux@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression cf_bisect_commit
Message-ID: <bug-221089-2300@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 781C41329D7
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221089

            Bug ID: 221089
           Summary: amdgpu: Regression in Linux 7.0 with RX-580: BUG:
                    unable to handle page fault for address:
                    fffffffffffffff1
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pinkflames.linux@gmail.com
        Regression: Yes
           Bisected ba448f9ed62cf5a89603a738e6de91fc6c42ab35
         commit-id:

With my particular setup commit ba448f9ed62cf5a89603a738e6de91fc6c42ab35 ca=
uses
the plasma-login-manager 6.6 Beta 2 (a.k.a. version 6.5.91) to only show a
black screen with mouse cursor stuck in the middle of the screen (default
position).

After booting into a known working kernel, the journald of the failed boot
indicates that the amdgpu driver segfaulted after the login manager started.
I'll append a kernel stack trace to this bug report in a moment.

As part of bisecting and then digging into this I also tried a non-RT kerne=
l as
well as manually setting `gpu_sched.sched_policy=3D1` which should correspo=
nd to
the deadline GPU scheduler instead of the `gpu_sched.sched_policy=3D0` that=
 I
usually set (and which, I believe, set the RR scheduler). However the only =
fix
I found was to revert the commit, which is what I'm now running on top of
current git master (commit 7449f86bafcdb588422bb14a4babfd285e723670).

All crashes seem very similar with the only difference being that the one
non-RT build I tested lacked the `? dc_stream_get_scanoutpos+0x116/0x140
[amdgpu]` line but otherwise they all look the same to my pleb eyes.

I tried CC'ing the relevant people but seems their AMD addresses are not kn=
own
to the kernel infrastructure

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
