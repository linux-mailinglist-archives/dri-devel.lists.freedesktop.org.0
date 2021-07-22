Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435693D1EDC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9866EE18;
	Thu, 22 Jul 2021 07:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733B6EE18
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52DF561279
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626938508;
 bh=hGg136RKekT38fHTDPQK/dqupJtW7WVa8wtYtVKorEk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gDaNPwz4YT2jg6wFkwunxwJ/2fd5txbu7sMaPVyDBKLcOnGi1U6j6rxI/g+M82G51
 eDcDOz8Y7OkGBrnM5XgBTUt6bVQoKZMk6VouQSJ5HzHuKz8CC9ShmDfWOSgkDqI/R1
 qEk1IOOitM2J6LuyKyn3ktBN9BP0n5zeghEthAJjvG2Al0ux8vOKQSpMpEHal4VAIk
 WVYTOPuwELGrXkGgXf4WVOWYwzgR1vfdaEQ+TikAFONd5TjytGhA0uFGhfxsyDIcIu
 O27U0O0EMP4QiBqr9XNnv4L7uOFF1ZZ8ouaqh842vbglMt6mvVj56Jl2Tr4k3qvMJE
 bhPFiOQXT0eoQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4F42461283; Thu, 22 Jul 2021 07:21:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213053] WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
 Radeon 6700XT
Date: Thu, 22 Jul 2021 07:21:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heuborger@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213053-2300-neQ0W2JqVx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213053-2300@https.bugzilla.kernel.org/>
References: <bug-213053-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213053

heuborger@gmx.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |heuborger@gmx.de

--- Comment #4 from heuborger@gmx.de ---
For me, this issue disappeared after updating the kernelto 5.13.=20
I believe, this commit reverts the change that introduced this issue:=20
https://github.com/torvalds/linux/commit/0b7421f0a6a41a8ce60c4dadf6f9e7c62f=
bd2f1f#diff-80cc88d298a712966f02c4cd7f9eb372b675720a337d0cbe85385ccdfb9c5618

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
