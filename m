Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BC374A00
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 23:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0B6EC61;
	Wed,  5 May 2021 21:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20346EC61
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 21:17:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A5A55613C0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620249445;
 bh=jYi6xFFwQy7NdnS30pbcD19Kn5Lw0f8V2ZVHFZvUfE8=;
 h=From:To:Subject:Date:From;
 b=QOd4Tvm35xJfJ9WxTGJkZJb2LZo9DGJ0Mw0xUmQJog5ID4AJd4FF/WZaDkf+tSRgN
 nOqRfleuRpau4fK9MW0Q63SWsRm4DfbOxNNNckqKvcRTHeKRFD3ZjT4O2XzkZ69489
 0BPdty3yAGufWBsM8qSLTAG44SWxokpUP6YVbOm5J6pqGq5ZGTH3TI8pvpecm/Ikp2
 ztNF0QJvxHUXbUSlxmQlUxwX88ah62Tbm70UWC3Muuu+yHC6ahKlhRG7ut3nuZ+Ndg
 hBfKp+2BqAWJ3fAyh34Y19STt9+0nN9yxFxrMcziOWHaXY5b/3g6zM8TaDX0Drv+j/
 zZPQOyjeMmnFQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9C4C861278; Wed,  5 May 2021 21:17:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] New: [radeon] kernel NULL pointer dereference during
 system boot
Date: Wed, 05 May 2021 21:17:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

            Bug ID: 212957
           Summary: [radeon] kernel NULL pointer dereference during system
                    boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mail@dennisfoster.us
        Regression: No

Created attachment 296657
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296657&action=3Dedit
journalctl

GPU: Radeon RX 470 + ATI FirePro 2270

Cannot boot into graphical session with recent kernel 5.12.1, the system ge=
ts
stuck at black screen.

May 05 16:38:58 homeserver kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000000

Could be possible regression of
https://bugzilla.kernel.org/show_bug.cgi?id=3D212137

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
