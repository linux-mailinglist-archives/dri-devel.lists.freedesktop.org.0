Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGWxOGZ8eGkFqQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:50:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0209148B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6677610E00B;
	Tue, 27 Jan 2026 08:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Loc4B3AW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E510E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BAE643939
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0900C2BC86
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769503838;
 bh=oEZEOmh2ZeAKrB7Y9gk4lwSP/R+PedmARpXevH1Zpw8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Loc4B3AWuGjSfVjHFyCwN64IGjl5SFiophH47H0WafeKhPM/Zr4f/T8xflBlugX0X
 VJFwzzg3V06c9Zb1AASh9QbZcA0iJshXIcq/AKYgKprH71u+qo/jjFp6owdjYVu476
 BuytixwwWO2dw9ou9C43N+OEztGFRjaN8FrH2MnTeZAyVT3RT5jlqQi+Hvn7Knumex
 2Pmsjcwoy/NpksI2wSACmEJrOdzJS2TIeFBQ2zIiEsh6rHwcAtLMKVxbO51375Bq4Q
 xA2YslEkWDdPTznzcE6uuEdB4acJ9Ydy4NmDI+e+ZQCQZvELRCEAvssVjVj74c3xjt
 UMQyDB2yZKrGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E6AC6C433E1; Tue, 27 Jan 2026 08:50:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221012] GPU page fault on AMD RX 7600 XT after commit
 bf2084a7b1d75d093b6a79df4c10142d49fbaa0e
Date: Tue, 27 Jan 2026 08:50:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221012-2300-p8PhAwYMUo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221012-2300@https.bugzilla.kernel.org/>
References: <bug-221012-2300@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gmx.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 4E0209148B
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221012

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Report here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
