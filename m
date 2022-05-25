Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5A5335F0
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 06:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30811112493;
	Wed, 25 May 2022 04:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F050112493
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:07:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D805B81BB2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2641C34113
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653451625;
 bh=9nkl+hhPFQ/rj3NyjZoJlk+3liFE3qF0NEcvo2EDScQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NbndYW9Hs9Ct0Ccywq7arxEmBBv1wfFYcBNq1rCLME6E9doiau0LLGjNceze24DiB
 i0JAYj9qmdvqQZqCzGKgYqNwIEF3mNlnNnJUxp+4xAoVXNg2JMDjGTRNVyOUUquJIv
 inxqN5Bzi31ar2DGh0qfIlnVnSPaSGH5rMBTnNJ+mYDFcDw+AU+YlEwbY4Zubn0sK9
 hqmjmG2TnFidZyrMby/raHs0y8KHtPBC4U1CU5HdJW0qYUCGUXZWTj/fsmFTN1m2JY
 SSvUnXzGA9qGbnM+8DpT8cdj9iTXQMl1eXysbDwzh8x3eLBoBvIRA564P36ey+sXjd
 MfrgxUX+YWIwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 90DE0C05FD6; Wed, 25 May 2022 04:07:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 25 May 2022 04:07:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugzilla-kernel@z.ewheeler.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-K5QkB7xIOe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #15 from Eric Wheeler (bugzilla-kernel@z.ewheeler.org) ---
I found this bug because our card was hanging the entire system, it didn't =
even
ping and we had to get dmesg output from netconsole.  While it would be (mo=
re)
acceptable for the gpu driver to hang and X to need a restart, it would be =
nice
if the OS remained up.

I'm trying the brand-new 5.18 to see if that helps.

(We were on a vendor-supplied 5.4.x Oracle UEK kernel on OL8 and the 5.13
amdgpu driver from amd's site built by DKMS so maybe something newer will
help.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
