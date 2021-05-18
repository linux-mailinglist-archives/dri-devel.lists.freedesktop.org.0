Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4B387C43
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B486E6EBA5;
	Tue, 18 May 2021 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37D96EBA5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:17:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 00C6C61285
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621351057;
 bh=JePLakjo6KAMKWJaDRPRsoM+Ic3mK29nJK6ABHRUAkI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YZKJsc5P2/8ClxpIFCcyU7xy76KCgM/KK5F1op3UqgIAu7f8YdJI+xzkgUKZxlVXC
 wjhDsCp5kze3roomUi9LNPFznlvl0ngpHAPJRMSx3qURJ5kPut2mYVCTHukiLYP7wI
 IIc+i0iDMkXr4Uk6ilZdSXuhwmLTHmPl50XMKf8A5U426fw5eZ4CDNq+E2WuImnoYC
 jNU3eJSdK2iibitxAR04CgobT3QGc6chYbDKk8NQ19zZDqMlFSXXLODuxOKZGpYmLx
 XKmcbGldnErWvwdKJGDG0q4f9ZU+7DXchFSG+5P7vcPUHn8ODFIHW0Mr4Jv6UIab9+
 vDSj5Wz/mtHcA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EE4F6611F2; Tue, 18 May 2021 15:17:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 15:17:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-211277-2300-3RHxbkPMtp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

jamesz@amd.com (jamesz@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jamesz@amd.com

--- Comment #19 from jamesz@amd.com (jamesz@amd.com) ---
Created attachment 296841
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296841&action=3Dedit
to fix suspend/resume hung issue

Hi @kolAflash and @jeromec, Can you help check if this patch can fix the is=
sue?
Since we can't reproduce at our side. Thanks! James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
