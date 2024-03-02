Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC786EF0D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 08:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122C710E597;
	Sat,  2 Mar 2024 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ff22uMm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074D410E597
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:13:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAAE661219
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79607C433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709363615;
 bh=CC9mHQZg4VFe8vBYyWRkcmd8YSq6GgShjcEsOXFawrc=;
 h=From:To:Subject:Date:From;
 b=ff22uMm/HoTLMJNbnTV9oTV73SbVAW/Ya/G3JVf1Jc80WXXq/HEZqIbkHzcjGDVzv
 1lfaGiwJjNjwf8cdXkK8PVHV4+dD2UxM2hOdh7LlTMo5lzvgEOnE/UVfTP4VaWWvFK
 VksUIbq3Iz2OSNY9l9TMkhf6S7VtBXftpwMtBzI2FdPgzM9J1gayHztjyoeFWxwc1/
 YnT6w8fYS7F1GUj1jL53CEiw87kQ1/NOKwfDBsbSeFYmVCZD0oggEHllWgUn4AoSJe
 3f8MUER/YblCyTqaK7obQhr4+2xvvxk7SZkfAyAU4usSPYJo8eZ5rDpVBj4Pwp1gPP
 vGWp3CWT88lSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 66A41C53BCD; Sat,  2 Mar 2024 07:13:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218549] New: [REGRESSION] in 6.7.5, amdgpu:
 amdgpu_device_ip_resume failed (-62).
Date: Sat, 02 Mar 2024 07:13:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emerg.reanimator@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218549

            Bug ID: 218549
           Summary: [REGRESSION] in 6.7.5, amdgpu: amdgpu_device_ip_resume
                    failed (-62).
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: emerg.reanimator@gmail.com
        Regression: No

Created attachment 305944
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305944&action=3Dedit
dmesg 6.7.5, failure

AMDGPU initialisation fails at boot time.
---

This is a regression in 6.7.5 and 6.7.6 comparing to 6.7.3;
---

# dmesg 6.7.3
[  176.620376] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[  176.626377] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[  176.626379] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[  176.626381] amdgpu 0000:06:00.0: amdgpu: SMU is resuming...
[  176.629079] amdgpu 0000:06:00.0: amdgpu: SMU is resumed successfully!


# demsg 6.7.5
[  100.704263] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[  100.716580] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[  100.716584] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[  100.716589] amdgpu 0000:06:00.0: amdgpu: SMU is resuming...
[  104.056259] amdgpu 0000:06:00.0: amdgpu: SMU: I'm not done with your
previous command: SMN_C2PMSG_66:0x00000006 SMN_C2PMSG_82:0x00000000
[  104.056263] amdgpu 0000:06:00.0: amdgpu: Failed to enable requested dpm
features!
[  104.056264] amdgpu 0000:06:00.0: amdgpu: Failed to setup smc hw!
[  104.056265] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <smu> failed -62
[  104.056623] amdgpu 0000:06:00.0: amdgpu: amdgpu_device_ip_resume failed
(-62).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
