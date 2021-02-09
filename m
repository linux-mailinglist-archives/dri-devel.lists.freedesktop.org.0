Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51913147A0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 05:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BDF6EA8B;
	Tue,  9 Feb 2021 04:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBA06EA8B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 04:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3344664E85
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 04:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612845607;
 bh=wGtSfzA9TOOMLKPoAaLc2AK+QSMDEbFOHjtZX9thLvw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EI/Rg85K3RntEDt8cZmXnohkjNAhlXUbEchj+lNvSV6DQ3qQnqQGf56otc3hLrL9J
 M8z4opqj4I1DmBnQ0HfmKLdByhnCJulxUJBPXvDuM9LulE73mFPkzBeSozHRznXzbV
 D1jqV8iyNjN8UciwD71tI4zVig50R+lFBK8sVY3x5dmVYUhSmB7CTfbVQJBL89nu3+
 P5uD88qNxu6W4F41Kwmk9DeGduSLb7ROLTvbl/fBLGvXG9zPHXfwr1ezQ1EbUAuaIo
 cnCFOWfUVNXyblYvF14x97wqVOjHpk4MIlYMS8TKc/e+5ub7EVfflojsomot2aDIbk
 f7j3HuFkD+4Zw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 264D665369; Tue,  9 Feb 2021 04:40:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Tue, 09 Feb 2021 04:40:06 +0000
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
Message-ID: <bug-210849-2300-ySJFD5exCQ@https.bugzilla.kernel.org/>
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

--- Comment #16 from JerryD (jvdelisle@charter.net) ---
  kernel-5.8.1-301.fc33  amdgpu_dm_backlight_update_status+0xb4/0xc0 [amdgpu]
  kernel-5.8.0-1.fc33  amdgpu_dm_backlight_update_status+0xb4/0xc0 [amdgpu]
  ***** breakage somewhere between these two *********
  kernel-5.7.17-200.fc32 clean
  kernel-5.7.15-200.fc32 clean
  kernel-5.7.10-201.fc32 clean 
  kernel-5.7.0-301.fc33  clean

See also https://bugzilla.redhat.com/show_bug.cgi?id=1881889.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
