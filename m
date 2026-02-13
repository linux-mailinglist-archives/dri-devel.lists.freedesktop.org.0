Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD68JhQ8j2mtNgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:58:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194CE1375B7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B62810E0F8;
	Fri, 13 Feb 2026 14:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KCq07Lq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65C10E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:58:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9548141675
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75213C116C6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770994704;
 bh=E8QdSPznGR27TlCi7U3AXyqrTieireTrDMZgbONtjtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KCq07Lq9x2yzqxn8w0zdcrzhroFOGppO3hoBkg3Jeww5N5xl7l55ubjlyUxwsYhXi
 QgrJ4ivFbJXp3G0Gog8qm/h8wVc/T+RGf7QPZSfZneP/5fbdXn7a/YsDWv9FC7LBnH
 yJoV2SOsL3zq0LhWW/5igXIwnI/AivaE/+cOsnUCPmC7ClydYfUhTnfJXWe8weMCDG
 Yhb1zxSQjiXeyPlNsOpLexMucKcRCxF8e/7n519SqidLNiGAsH0B81IjxjtzSdSp6w
 K9jtJO/vSATU7cspvrh9+MKxrK8kFZxrameydHztbS8t8F6rA5YVGZtpjX6vXLBPap
 pprg8kbOwiCFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6EA3CC41613; Fri, 13 Feb 2026 14:58:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221089] amdgpu: Regression in Linux 7.0 with RX-580: BUG:
 unable to handle page fault for address: fffffffffffffff1
Date: Fri, 13 Feb 2026 14:58:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pinkflames.linux@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221089-2300-XX8fam8VLO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221089-2300@https.bugzilla.kernel.org/>
References: <bug-221089-2300@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 194CE1375B7
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221089

Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs (pinkflames.linux@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|ANSWERED                    |---

--- Comment #4 from Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs (pinkflames.linux@gm=
ail.com) ---
NAK, I'm not welcome over at FDO but a bug should be reported despite who
discovered it, right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
