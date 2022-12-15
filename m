Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5564E271
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 21:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8D310E558;
	Thu, 15 Dec 2022 20:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85210E558
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 20:40:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B16F61F0D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 20:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF940C43392
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671136809;
 bh=0O3tPIVPc9/EzSaqWjANMyUlr/vloZwWwF9nP4wYKVg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ifaG+wn6gR26tcoh+Z9A+O4PYzwfVlrrZgc4ukgDJ9maTRnX97mgzYDP4O1QlTItR
 4BOb5HrrB1TpcnkS4BNBg4GT/Qh+aqN/lit9ZyyraN5dytxmAxeimi9HPTPv6jctfK
 4QsirzcFUBuH1/+YiitcLZPZoUW69LzHQBoUXLvRJ7V8cxZZwcSVfyx9UUjJcUqEdj
 TlkLAXsRNhv9skw9U0iPkpev4TIKFnZAhAjzH77+oLke5UEO3yguKOqyj0NfNFTJps
 DaSRELraA0zyXZgX8ijBo4/rDkpywz7OwfYZ4GtKTPqeHM4OrdV03vYTnIDKIOBxvl
 KGZSAosaIoDBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D0E31C43143; Thu, 15 Dec 2022 20:40:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 15 Dec 2022 20:40:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-hVRtDlxRGE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #49 from Harald Judt (h.judt@gmx.at) ---
I meant "I am not quite sure about this."

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
