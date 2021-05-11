Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DA379AFF
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 02:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A1F6E97A;
	Tue, 11 May 2021 00:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2576E97A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:01:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CDB46143B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620691260;
 bh=iI+isUErnd+WoYc/scSYGjs9EjrvmsEIoLlmlsLlheg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZYyF8FYlzsyxBpbpiuKdxmWJie1Lli15I36vkpvzwuT+B8KAuOcOZgDFqNXTN08Je
 np3X0Lxsz/2NJpVONIXpkz2jgDxcyIhSY4EI74O9V+ziElCepHeNO/+qxs6qazRoSx
 phnfOuAHqPycJYfwHuDPDHDybt+UhtJjtedIGyKhrny/YNqATE5dmKCtDt9FrdMf46
 lOxpdICJ5gL5ysLmli9uvL1DIaaAt40k3ayxXUsV3Ru5Wy4p6JQm5i56ISA6+U4W2o
 KsUeiMAVbjSgFudwPih16K22EtFynAgco9m1BC1L/A6tReZ6/FrnWxg543/IX5bFuO
 Y+z4XzqmZ1JhA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 916FD6120C; Tue, 11 May 2021 00:01:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
 to find connector for link!
Date: Tue, 11 May 2021 00:01:00 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212959-2300-aGdFTlGjz8@https.bugzilla.kernel.org/>
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

--- Comment #4 from tob88570@gmail.com ---
(In reply to Alex Deucher from comment #2)
> Please attach the dmesg output for your system.  Other than the error, is
> the GPU otherwise working correctly?

The GPU otherwise is working correctly. On other Operating Systems.

Also this issue is exclusive to attempting to boot the live systems or
installations from a mounted version of the respective downloaded ISO file.

If you flash it to USB, the installation works fine, despite somewhat the s=
ame
errors. I am writing this currently from a working PopOS installation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
