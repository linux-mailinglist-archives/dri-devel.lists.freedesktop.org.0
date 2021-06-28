Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B83B6665
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 18:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBDD6E4C4;
	Mon, 28 Jun 2021 16:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4566E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 16:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9ED7061C7D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624896341;
 bh=J/fvCZD/v7DhVMwuhmZV+IZsWcMa6pqnhuI/J04r51w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RSBpgK0/U0+afNM2B+mCTr1Z7/VFQMpEK7xdUe6KCo4Y2pMZ8hO3x58MtD4ZddAgh
 CjUX8dJlvQTrs/1lS8kKTwL8lOfOotEDmfoWmy4F9uFRIRFczTTQKx3SMSM5lJDBYr
 CtKgGrgaAWm2Xn07827QU6DqyUMSobUd3cwJiS1SDokKf4U1An32JuJhdlBns9nn12
 eXEnrs8QGjHF108622Q5UTANZoQfXfpVK3rymm5GsbLdDMr51vbGwOMei0oACkYFsv
 k/gin2S2+H8qRLw5xvqk9xde3wGvhRCO7jobShw12QubtBJTgwd/3N5act3X9Je+pC
 xYb/FFjNPk/eQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 99F0C61242; Mon, 28 Jun 2021 16:05:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Mon, 28 Jun 2021 16:05:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marco@scardovi.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213561-2300-9qL9dd8M26@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

--- Comment #14 from Marco Scardovi (marco@scardovi.com) ---
Can confirm on kernel 5.13-final is fixed. 44=C2=B0C instead of 73=C2=B0C o=
n idle

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
