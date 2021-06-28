Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC33B59AD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DDA6E23D;
	Mon, 28 Jun 2021 07:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AE56E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 07:22:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8BD9F61C47
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624864955;
 bh=DSs2VM89cP3y7OFVYWdJhAudWrh4Jdtvt2LRLNQwGwQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IwC9te1pqvI3X8ApYgkB+N4TWtbOxuahvOiE9wYQrAaensyN9b7S1pJwRzLyVYKME
 VRPPJBANmrY16jxhNYmrnAIYsxPKtM+lv0/mLQrCuV2GIulayxeH8jd1vNE9n9m/pv
 TmDhsmDkhL5JgA8/YQiAyIbyDXOkLey9Hr9WQiFI+qsDVqxeILwaWdPhxxx8Ylanr+
 hr3l8UumH7TqTOPz6df7glzvqhqZ6UzpnC2Hws3ccVOuvqFXFeYo6ty+dznjop/w94
 Km4Zx10VrN0bTiRCdletpL9EmhFDVOlX8NQvz2t0q7so4dLZ867MaIaTKYdO3uT2LR
 6Eoa2MNtyJXSw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8840361248; Mon, 28 Jun 2021 07:22:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Mon, 28 Jun 2021 07:22:35 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213561-2300-KE9peSitbI@https.bugzilla.kernel.org/>
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

Marco Scardovi (marco@scardovi.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marco@scardovi.com

--- Comment #11 from Marco Scardovi (marco@scardovi.com) ---
Hi everyone, I'm facing same issue here on kernel 5.12.13 with the AMD 3200=
U in
an HP-15s laptop. Can you confirm these commits will fix for iGPU too?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
