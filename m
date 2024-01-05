Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB001825299
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34C10E5AF;
	Fri,  5 Jan 2024 11:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051C510E5AF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E44A6B81B05
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4700AC433C8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704453254;
 bh=0SAyUmXbrGhsG08qXLMeCI70DCrYys4sluw4BWfJ0I8=;
 h=From:To:Subject:Date:From;
 b=JG445wsMa7oIM/QDIN+Qo086GbvColYnFHkjM4UZYXDOyToA5pIGCSonIR3QEVUcK
 tBpYo3fuC5e96ZnX0ZpAVUYFI/pUgTP7B6ZArs5zB2GrVHl/efUagNaJRgrLBNynx2
 ogCa8qzAuSujzy8YprxhOr2ZgKvQwOfYI/0Mqf/T+5h6xYINMDKJ2vKj1xkIaRR0m/
 75UP6qjqatbRHT69qDDJB2OH0yLkkQKm49Qy7G5qBa/FRjWgwVxFKR/yvnwe2vZyHd
 6Nqx4AoSz88AuWoBAyCyf9Za+4UWFkPwFz80znfHx5TKtaG1ZP3m/kObteSX2m+XAR
 OsZXFShF44d7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2FC4CC53BCD; Fri,  5 Jan 2024 11:14:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] New: Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Fri, 05 Jan 2024 11:14:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: riksoft@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218347

            Bug ID: 218347
           Summary: Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
                    initialize parser -125
           Product: Drivers
           Version: 2.5
          Hardware: i386
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: riksoft@gmail.com
        Regression: No

Created attachment 305677
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305677&action=3Dedit
dmesg

Yesterday I've apt update Debian 12 and with the update I got kernel 6.1.0.=
-16
--> 6.1.0.-17.
This morning while I was scrolling rapidly a long page of code inside Netbe=
ans
20, I foud myself at login.
I DOUBT IT'S MERE COINCIDENCE: I've been working ok for months with the same
exact hw/sw config and after a couple of hour such incident.

I can see the culprit in log:
after
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
a cascade of errors brough me to the crash-->login losing everything that w=
as
not yet saved.


Graphics:
  Device-1: AMD Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
    driver: amdgpu v: kernel
  Display: x11 server: X.Org v: 1.21.1.7 driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,vesa dri: radeonsi gpu: amdgpu resolution:
    1: 1440x2560~60Hz 2: 1440x2560~60Hz
  API: OpenGL v: 4.6 Mesa 22.3.6 renderer: AMD Radeon RX 570 Series
    (polaris10 LLVM 15.0.6 DRM 3.49 6.1.0-17-amd64)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
