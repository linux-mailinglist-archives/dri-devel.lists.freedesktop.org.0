Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B438342EBF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 19:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745856EB7A;
	Sat, 20 Mar 2021 18:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBE76EB7A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:14:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C7E261944
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616264074;
 bh=r9/Jxq64rRNdjROcswJNSKQAI0UGpj8IcaV/FGfwlmQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kqHRQ/NHWELCaswFHHEHMSiZy5x5r0oq02iriXMeo/+yAp7daC1e0u8ZtbxK0jZzf
 pWWWu3fS5ftZzkoaZJPyzNOe/Qk603y8532WzKAbeX1p2NXd98hmR4kXCKSycaOQrv
 tZ7ab3JErhP/vjFKk8V6aQk7ujQ7JZh34yT8Na4tJxfpqc8aYOj+DJ9PCuGau6arr6
 G2VNbAHr7Qea5/vOe4/La+d2z70xmkR1rX6Z+dFphRUG0k3acx0hN9HWk36VkvD/fB
 5DrRblHvRb+ois58oEJIwqDP4QuhsZs8okUVwd/AAVcoAmpoDJOzFaxIn2wVn1AvMi
 gCMJqDaLpEbHQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 398E262A60; Sat, 20 Mar 2021 18:14:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212369] AMDGPU: GPU hangs with '*ERROR* Couldn't update BO_VA
 (-12)' on MIPS64
Date: Sat, 20 Mar 2021 18:14:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xry111@mengyan1223.wang
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-212369-2300-UIYYjFp4j9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212369-2300@https.bugzilla.kernel.org/>
References: <bug-212369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212369

Xi Ruoyao (xry111@mengyan1223.wang) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
