Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA969A236
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8EA10E19E;
	Thu, 16 Feb 2023 23:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915110E091
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 23:21:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3018B61018
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 23:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 145CEC433A4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 23:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676589707;
 bh=4C4ZfEds0/gAGsfBvWCiRLB48tEX9or5ZTIzWs+YuPI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lMsMBPCFiSg1HlzJIxDCYCvYLotEANPhFJKdN4exzvDBkDzu/ViBQ6foabpJ1HJlU
 zzCY0gAjX2L+n5EG4MjlzA0ub4SHFlmMzhTrDNuR1mn806vzKsgouhXGhagvnaem9a
 d1dbg6xdD1Nt4UWnLU8fvC3ZuZpAGMPtoYZHGrAJYPRdCGPxFytwk7Mgu7xlFoNSor
 LxZTxWZhwXLuMN1qIT+UxodQtPqJ7TMDgZIq3GfiAaccrfJiAjQ8FYAmTCvQ2n5WKu
 v/Fn9kqtQYRi0saQXe16RiUX3OjJBiAViZoLNBeFDsWV0VY+hKPNsPRPJLBq54XYoc
 FTHArcNdb0F4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F2B51C43144; Thu, 16 Feb 2023 23:21:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Thu, 16 Feb 2023 23:21:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216143-2300-gpDZFYCGKx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #18 from Erhard F. (erhard_f@mailbox.org) ---
I can confirm the bug is gone now on all my affected systems.

Kernels 6.1.x build & boot fine with GCC 12.2.1 and CLANG 15.0.7, no graphi=
cal
corruption or dmesg errors to be seen.

Closing here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
