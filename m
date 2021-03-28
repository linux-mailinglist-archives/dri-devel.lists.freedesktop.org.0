Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570234BD14
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 17:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECC46E057;
	Sun, 28 Mar 2021 15:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499A6E057
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:54:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C6BD6196F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616946853;
 bh=6yANasy0ykj5DNdzgjiPzZhiVVQJPCjiK4ojrguNtbA=;
 h=From:To:Subject:Date:From;
 b=HCZS77zmeBv9oTbckacm4lcc+lkidHv/O/QIjI0G8t/Y81sgx+7H8J4PrX+HsZNiH
 AKytTQZQ2bB1ASTnWXA7QtCw4ONa6PafstUGZMz7A16YMgUHgfD1pYYFkLLugcJ+XK
 E9fBctJXDl5/Hkta/NwEtp2mUhlNM/aXk0CPmkjY2sUdcLGlGk9Do2Y/piK3anhZpw
 yTvk4cyquXPGgKoE9r9qWd3fCWkNExUJwWfU4qbGErS++KGRH+JOhdAMs3e+kG6rMu
 53KJNF51wcokCXXQCBZNi4UTlSGiABqDtAUHlqmQ2fudJodKVAaY1wISPf2StrJKvT
 +NHSTVMvp+QRw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 19D0462AC4; Sun, 28 Mar 2021 15:54:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212467] New: AMDGPU -- amdgpu: Unsupported power profile mode 0
 on RENOIR
Date: Sun, 28 Mar 2021 15:54:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.pylypenko107@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212467-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212467

            Bug ID: 212467
           Summary: AMDGPU -- amdgpu: Unsupported power profile mode 0 on
                    RENOIR
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bogdan.pylypenko107@gmail.com
        Regression: No

Created attachment 296121
  --> https://bugzilla.kernel.org/attachment.cgi?id=296121&action=edit
dmesg with amdgpu errors

I have errors in dmesg:

[   11.850726] UBSAN: shift-out-of-bounds in
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:1140:32
[   11.850728] shift exponent 64 is too large for 64-bit type 'long long
unsigned int'

[   12.876987] amdgpu 0000:05:00.0: amdgpu: Unsupported power profile mode 0 on
RENOIR

[   29.314776] UBSAN: shift-out-of-bounds in
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:288:38
[   29.314782] shift exponent 4294966273 is too large for 32-bit type 'int'

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
