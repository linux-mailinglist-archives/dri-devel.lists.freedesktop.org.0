Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D38374C4E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 02:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BE26EC86;
	Thu,  6 May 2021 00:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FE36EC86
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 00:25:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FD9161076
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 00:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620260716;
 bh=wfH/8a2/uVRbeGC+UlykhXc0tjxbS0msh2mLGF1Alb4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TC6Y+OJbfZDag1ejUqoUWIQYEL8pVsIILKGz7Fx6to9vfaICGY0NjdQybHI7CzAgR
 QVSWVm5Y+w0hRP7TIOvh38nXrOvOBgeKBvi2IFx3y9LeAtHBEp23pvxn1rNOicELp8
 kZg3ih5EmlqnEVzA0jlcG90Ca4ewxWniFuxvykruZboxtvqUYX1JnUnfYCEK1Lvyi3
 ZVxCjnzKzTk7qIvFxT0aWXEXjUwXj5NYKofQG3spsMl7Z8etv6aJO5fdeTW7RH/Lun
 N2PrHE/EvgXQl1cuvOp94x0Syd6790QVo1jBg6hHS3iaFOlXrUC3+qlzQA+0n36lBF
 K93gUIB4vnLtQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 537E16127C; Thu,  6 May 2021 00:25:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
 to find connector for link!
Date: Thu, 06 May 2021 00:25:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tob88570@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212959-2300-5eTmYs4tde@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212959-2300@https.bugzilla.kernel.org/>
References: <bug-212959-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212959

tob88570@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tob88570@gmail.com

--- Comment #1 from tob88570@gmail.com ---
Little correction *as well as Linux Distros with Kernel 5.8 not necessarily
based on Ubuntu 20.04.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
