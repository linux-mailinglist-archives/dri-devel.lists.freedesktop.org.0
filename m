Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B056432A98E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDD56E241;
	Tue,  2 Mar 2021 18:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCB26E241
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:42:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C4E0964F2A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614710572;
 bh=KISAyFqXfsbqgDo4RckrF7uk93kHxUZTWB2DulZ/tLA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KocogrzK55+20w7bcCot+SpM/WahbBJC4vEJ8qXNFQUfSAKvPDWnqizTcIVB1p5GS
 X/TRNuRoJREL/vCKvi5FOMYMrPGkBHMoKhk0wilt6NazpPJ7h5K+42QDPHeRlWe7Oz
 zeRreEdSqM1QNA9pm7ZVCtZAk9pV/cNLqnfwgiLt00mzQXCmnTfIaoPBon+nDx74eX
 ctaFMY/eHQcBf17GFtsRt/epdCPg634iWDTwMkqnka8l77Jya6QPVkTV1C5vqtD+Me
 yuXbn8kaobFZwnsYPMfK1A7XCMphSpwQV69NhU7vY+zzqAASu2jZ4tvYwA5C0jOvbt
 a24qr2Vop399Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B4BE76529C; Tue,  2 Mar 2021 18:42:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 02 Mar 2021 18:42:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211875-2300-9s4ZzszBRD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
I don't know. This is a new machine and have seen this since 5.10.x which was
the first kernel I tried on it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
