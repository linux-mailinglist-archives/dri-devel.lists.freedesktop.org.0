Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972997EA1D6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFE410E174;
	Mon, 13 Nov 2023 17:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01410E174
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:29:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BD358B80EC7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A1FCC433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699896596;
 bh=DCdFkIFHZWPpujMAeZMTQLwaqO9kHIA4Yr5akPOd1Nk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Csl1f5vVY9eM4uBCoyZf4y+SOCFMXYbgU+P/+qyEMY3tUWeKhgS8ZhakwSC2WBByJ
 /hPjFvc37n22/oV7/ZqMQQ15nKCw1nkB6rn4lo0pg+zfn+tw3y+phWGIWl7aEFazgN
 R0c1yLjkNrhdOjphi+KEKcu8UGi2guf3njcwp52ivg/41HKXDcnSq4mQA+8nrZyya2
 A6WXOC1SjHPaLU9et0TTJpkJSBJrngI3mNa5CDZWJJTUIAFj9z89PpJtJUOAbFer7p
 d9lazsYqeNr+YXq7sS8WTypLOrr3kteGO5Y1Ty9byqHl1DlTXzbWjyHQ6ojXysyjhm
 oIweaRqWr8CVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 009B7C53BD0; Mon, 13 Nov 2023 17:29:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218141] fb: trapped write at 0000006000 on channel -1 [3fed0000
 unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 00 [FB]
 reason 00000002 [PAGE_NOT_PRESENT]
Date: Mon, 13 Nov 2023 17:29:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218141-2300-p7ApzxeXh1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218141-2300@https.bugzilla.kernel.org/>
References: <bug-218141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218141

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
Created attachment 305402
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305402&action=3Dedit
dmesg nouveau

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
