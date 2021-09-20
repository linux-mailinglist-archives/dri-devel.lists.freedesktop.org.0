Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8E411259
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 11:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7A88249;
	Mon, 20 Sep 2021 09:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA29C6E455
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:56:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7602C60F6C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632131788;
 bh=f3zo4HeNRdTdNOsy2cAs1c9UIIfNyg9cAEm/LeZF4R8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ERM6dTE1N+tgvazuPsCTqLEw33LK7VNnri5Qe9FQAyBU0W3zCYOmadplY7SwVZ1El
 Eaq/LeMIPSSzGjgKIza8N9rANpOTyTQ2jVKG+RMve0kAPqfQ1tlFTU408aK8r4Cn8E
 q2roMWXDcD82oJM8G18KdMbu6/DWtfkn1pXC+ewQn/nOqrBHvjleVys2/5Ibmy7hKA
 curgZt6nGi021vUI7CVHk6Cc0ZtTLyt3EjNieP6tjBQZtydfwGG+hULi+7DPlUeQ5a
 TXakjOj1e7oDhBG83mADxSUw5FhM+Y2EaCVG1v4iDlTBPq/uiCpaxpAALQy/faBPSu
 R15WFr3sCHXNg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7285060F41; Mon, 20 Sep 2021 09:56:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Mon, 20 Sep 2021 09:56:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpiazza@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214413-2300-lc30bklf8f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

--- Comment #4 from Marco Piazza (mpiazza@gmail.com) ---
I confirm that using the above patch make the oops disappear.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
