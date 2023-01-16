Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444B66C635
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27F10E2AF;
	Mon, 16 Jan 2023 16:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A6710E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:16:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1764BB81063
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84FC7C4339C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673885777;
 bh=ywCtijm5yMlgSVYNPeFOYY8eAScr8lBT69dWUFovpms=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WOHER/MsVWkr5koKwjB2KzvhgS5Bs3tCaZNayV0WHzPuO/AWoQKTX3looau+imTOU
 N5vGvC1YX+Dzpp7fG0s5snqls+ie/GEqz/rYOVvUiO8v8Zzyp2YQ5Lj+rd0onz5h0k
 tQ2xaGUrQRye0ePwWT3KJE2NrszTgFAWHYk1oa4Hoz+DW0nCTI/+1I+fU+cFpp7Ra3
 v1FU98/JyJhcq6Tcs2hAroV45OKoqXQq3E2Gv3M6bT0oryY5dktfLiu7ZIN+4sGXr6
 Sfj53t3tvfFjY440LTzxTrJm15jNhtobeFDM/al2Rwmf++H5ODm3uQeVQB5gB3+DuJ
 tF86+TtVMt1KQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 71659C05FD6; Mon, 16 Jan 2023 16:16:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 16:16:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216917-2300-eLcS5CpuIG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WILL_NOT_FIX                |---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
