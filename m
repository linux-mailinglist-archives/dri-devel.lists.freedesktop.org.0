Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E23896ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92B6EE77;
	Wed, 19 May 2021 19:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340D6EE77
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 19:44:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23871611BD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 19:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621453472;
 bh=hppE3aJ+SjGoRiSvwuWCXu7R0osxPBY5bjeKfbsD9lA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j8XEJEViQjTaD6U7LfHyRzXaxlns5F57HcgLUKzwvNE5jX2CWMo3cvzdz12H/7ui5
 JJ+FCKwExmtzjKbQ5nQDY7gagdv09wvQ8c57who272QRQy9ba5sFooR/G5sRA0SkMQ
 OJfNPtxDiQ/ukWggotqkc1/w7FkBZVk/HMUVCJGArLxaN49XDZrkHYeQJ/0MU8Vqq9
 3KhIg+wso7RC4i1lIMuwkCy3IyCg7NljUy/VbOK9S9J7eW0f80WUUu28T0odwgp8nU
 fAfDYugFnFzC+4U26uy+j/u8eC373IWgYGNjgTRzC4L6sYD+ofIQmH838SHtpko9bW
 dWI5w3qsUW47w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1AE3B61262; Wed, 19 May 2021 19:44:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 19 May 2021 19:44:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-P0u5xSmDHV@https.bugzilla.kernel.org/>
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

--- Comment #28 from Jerome C (me@jeromec.com) ---
Created attachment 296877
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296877&action=3Dedit
AMDGPU fence info

(In reply to James Zhu from comment #27)
> Hi Jeromec, thanks for your feedback, can you also add drm.debug=3D0x1ff
> modprobe? I need log: case 1 dmesg and
> /sys/kernel/debug/dri/0/amdgpu_fence_info (if you can). James.

I've tested text mode and gui/drm mode with "drm.debug=3D0x1ff" set and fou=
nd no
crashes... when "drm.debug=3D0x1ff" is unset... the crashes/timeouts are ba=
ck...
I think this is why your unable to reproduce the problem...

I've never known debug option(s) to remove issue(s)... oh well

I've added the contents of the file
"/sys/kernel/debug/dri/0/amdgpu_fence_info".

The file contains 4 different boot states ( vcn on/off, drm debug on/off )
clearly marked/seperated in the attached file

I'm using 5.12.5 now but I also tried this on 5.12.4. Usually the crashes
happen within 50 suspensions/resumes but today I left it to do over 2000
suspensions/resumes just to make sure...

I know you asked for a log but I spent so much time on this ( other things =
too
), it wasn't on my mind so I'll get that by Friday, if you still need it
ofcourse

thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
