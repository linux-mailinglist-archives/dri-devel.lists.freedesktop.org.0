Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E502A85106B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3D10E11E;
	Mon, 12 Feb 2024 10:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k/nUGdf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D34210E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 319A660D3D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDE56C433F1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707732970;
 bh=ZZARSVHr8Ne5Lk129G51X+Mz3C/cVNY+Y1iMeCGYhjc=;
 h=From:To:Subject:Date:From;
 b=k/nUGdf5Rx3y3EAwDIBVu0+ADNHqTBspx2swocuj/hzMP5+CBMJvUr8sy6cimvPCV
 Sa+Coeva7dybDQVv32WxUrsSKdrBHUoC9dYf6z+kVf6zUnBH3om/ofnu8RdS8Bawnu
 GglT5UGizB27rdJQOgYEgFHWTTy7IObo2UojzvzUCGvACX/vu9ocLYJrUG+GhDV2bN
 U4aRU4hQ6I2LuTrL6kvKVUeDXDaP5ESN+CzlFNd6/G3jD4JrG7e9kX5WmSIvzQBR6E
 rcGSkhHrwUAJdBz+aGwIipZMS/DKxdTvCvyMTjHlYDwOdaw9K7wd60PfD+h8lwOdMh
 GAfMQrNQ99qxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B1DADC53BCD; Mon, 12 Feb 2024 10:16:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218483] New: Blank screen on Cezanne/Barcelo APU with
 amdgpu.seamless=1
Date: Mon, 12 Feb 2024 10:16:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218483-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218483

            Bug ID: 218483
           Summary: Blank screen on Cezanne/Barcelo APU with
                    amdgpu.seamless=3D1
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: luya@fedoraproject.org
        Regression: No

Created attachment 305856
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305856&action=3Dedit
Boot report

The screen goes blank when enabling "amdgpu.seamless=3D1" for a seamless bo=
ot as
tested on Cezanne/Barcelo APU as found on laptops like Dell Inspiron 14 7425
with the following error:
"Feb 11 13:43:37 kernel: amdgpu 0000:04:00.0: [drm] *ERROR* [CRTC:73:crtc-0]
flip_done timed out"

Tested on kernel 6.7.4-200

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
