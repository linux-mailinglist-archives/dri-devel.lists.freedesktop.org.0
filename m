Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C2A310F09
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 18:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427036F49A;
	Fri,  5 Feb 2021 17:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD46D6F49A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 17:46:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5BE7C64DDE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612547215;
 bh=Iku/FCgXcqH/ckJcGXFjeowdb+fqpInB6P5Qxstuxt8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aK+x6PK8mbHNjYDprT7T56ycG9YfQufYDconQ85aiHsN9gEsLxqMfvPOh2Y0jFiGw
 RcTcl5YheALC4q8UnYPN22bAAHcGDrpWAyWMFMu6WBt4CAHlIbYjXPLex+Gh84Zf6S
 tKpg+mBfm1/PF1GVHdO2UjNuz0ezOeBrbkwszBsr5O7mkhU53Vf+9JuoKLF7fipWLr
 aJwAPSHubHBqZBF5sPb/Cb6uiayUPUFYqxJR3G4YzyZWyc0TwGoTC9KSVBgvgK2IrW
 J9BTFTkDJeQXLcrzBIEi4HE0QAE+KBE3cV05N2qf++xYF0iYqG/TFBLj7M/56XMZiM
 PfNc8lIhCZIPg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 472046533F; Fri,  5 Feb 2021 17:46:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Fri, 05 Feb 2021 17:46:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jvdelisle@charter.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210849-2300-WeJaHzgeTp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=210849

--- Comment #12 from JerryD (jvdelisle@charter.net) ---
I have done some bisection with the kernel by uninstalling packages and rolling
back. I tried this with my best guess of which packages to roll back using
package manager (dnf here).  In the recent past I have seen issues with the
amdgpu firmware and was able to disable the bug by hiding the suspect file
removing the kernel and reinstalling the kernel.  This was needed because the
firmware is folded into the boot image when the kernel is installed.

I was not successful with this bug here yet.

Firmware vs mesa/dri code? If someone could point me to the correct source
repository, I would be happy to attempt a raw build and install to see if
latest development branches have fixed and then if not I could try starting a
bisection on it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
