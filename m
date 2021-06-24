Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107A3B329F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEE06EC26;
	Thu, 24 Jun 2021 15:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA526EC26
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:32:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BFCF613EC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624548764;
 bh=FoO/yeB0ZUsHTOaZlcvShkQJpRfcw42Af5f9nKp83Q8=;
 h=From:To:Subject:Date:From;
 b=Zg1HoqgA9ADcKhM+OWGjnLV6NjPtCDwLtMoaZF7vXVEd2Y4sfYtiwFIob709XMquZ
 11D1/iTz2Jjm9Wb+p1ibsMnTG/NEPD7ppvX706tv3hvcahsNrhXCeE1/F2D4+u+xXg
 Vyv80kOa4T752wLG4ejw4AAb5bPU7aU5NSoHPBaHajwc0kasC22i1KLhmfT4ETvFX4
 8mFTPzXQp0O/u9P1mp4/aNoEy3cINCRro6ddythwf7+e0hvytUFky6naZho1JZwl67
 djAAPGGn7SjC78d7J9z9mqKq8Z4pory1hRHdoPmBkm0xDRS5IQS73bNBSRXywblzQo
 DoVfCLy1mrBVg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 041BD6113A; Thu, 24 Jun 2021 15:32:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] New: Amdgpu temperature reaching dangerous levels
Date: Thu, 24 Jun 2021 15:32:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

            Bug ID: 213569
           Summary: Amdgpu temperature reaching dangerous levels
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12, 5.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: martin.tk@gmx.com
        Regression: No

Ever since going to 5.11 version and later 5.12 the fan speed on my Radeon
RX550 is erratic causing the temperature to reach dangerous level.

sensors output:

amdgpu-pci-0100
Adapter: PCI adapter
vddgfx:      825.00 mV=20
fan1:         200 RPM  (min =3D    0 RPM, max =3D 3500 RPM)
edge:         +69.0=C2=B0C  (crit =3D +97.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:        7.03 W  (cap =3D  36.00 W)


I'm afraid it'll eventually kill my gpu.

I've already reported another bug for 5.11:=20
https://bugzilla.kernel.org/show_bug.cgi?id=3D212107

From what I gather there were changes in fan control in 5.11. Is it possibl=
e to
disable those changes?
There were no issues on 5.10. Fan went to roughly 1000rpm, it was cool and
quiet.

The behaviour from 5.11 onward is dangerous, can cause hardware destruction.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
