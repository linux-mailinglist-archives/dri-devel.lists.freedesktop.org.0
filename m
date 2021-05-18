Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FE387DD1
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1494D6E9DC;
	Tue, 18 May 2021 16:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B0B6E9DC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:41:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A3A04611B0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621356092;
 bh=0dhmECF9pxUsnUuR56ba+SBJne+to0cF4+IWpMG331k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FtND4BGlSjkoUis7Ntxtdjh1YY6s+bBeI1w9vCa8IwVOn9mpApNcmMKnCpOidEquO
 HSbWP3RyfFuqPflDtGlpbvn8PwI0q+O6LRA8KY3MHBlUGeI/mqlHbdbOj8DWIxeNz7
 zxv14K8KzxjroIAgKptS/Y+Vy63uLyW3lAPVL6S7Xdky9rT4JAPHhsIvbvIVKGonzP
 hqI3Pr7v4MaIlgFOCzdsDn1+OyQHp5v8w9+B2IMVWQrP+GuwstKh4oxu2rHwHva+Rs
 orU9frLrqf/zkcs04CGV/3QtGBeAn1s2vVtlr0FjLk5GSQQ567vI3fjkthNUvb+RVq
 q4Cv/vdzZxmbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 97F1B611C9; Tue, 18 May 2021 16:41:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 16:41:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-xsMzeLQ3kv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #21 from James Zhu (jamesz@amd.com) ---
Hi Jeromec, to isolate the cause, can you help run two experiments separate=
ly?
1. To run suspend/resume without launching Xorg, just on text mode.
2. To disable video acceleration (VCN IP). I  need you share me the whole d=
mesg
log after loading amdgpu driver. I think basically running modprobe with
ip_block_mask=3D0x0ff should disable vcn ip for VCN1.(you can find words in=
 dmesg
to tell you if vcn ip is disabled or not).

Thanks!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
