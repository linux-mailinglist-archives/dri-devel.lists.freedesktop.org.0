Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884B49BB1C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FB910E3D5;
	Tue, 25 Jan 2022 18:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4710E3D5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:19:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2792C615E5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61EB5C340F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643134794;
 bh=0qVq6ngNroqYmGJJkggmGvKpIOVAJz2aCviLKpzewMk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lGL7TtDWDiN97w8rGSJhg2rVGynDsscBYgZiAngvVWh0ZrjmTil0diwBKelq2WX5J
 HxD4gMy24ZcUvZpp2JyFx4yJksKGV9YSfGqTtdMQo1ByWyxjXbbfcgBGsFJ1Zpf2PH
 aTsmgdHLoATa6aHFH/Lbz/lI/JIhwrtnEJZ5KR0IW7QaMcO7F3TNIzHBc9rZyHg1vW
 bHtk8pq5xwpqeJMBNbqzNJxiad/NLkkIBQBwTnNXC6lI4y4qGxvTesAj5sjXjJWuw9
 aITZhVq0fYsprBHmvTh3uUn/nHQLlEs5b0jumiJyhCQ0QWm4jfLw/WS2qsIDRgjJx6
 mDOwye1CEoaew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5250CCC13AF; Tue, 25 Jan 2022 18:19:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 25 Jan 2022 18:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: smp@nandre.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-agPZ0DLHRA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #59 from Spencer (smp@nandre.com) ---
>Is this a custom built kernel? Is amdgpu built into the kernel or enabled =
as a
>module? In the former case, is all required firmware also built into the
>kernel? In the later case, is all required firmware available on the initr=
amfs
>(if amdgpu is incorporated in the initramfs)? The required firmware files =
are
>listed here:=20

It's a custom, but I have them all builtin.
>grep navi10 .config && echo
>amdgpu/navi10_{asd,ce,gpu_info,me,mec2,mec,pfp,rlc,sdma1,sdma,smc,sos,ta,v=
cn}.bin
amdgpu/navi10_asd.bin amdgpu/navi10_ce.bin amdgpu/navi10_gpu_info.bin
amdgpu/navi10_me.bin amdgpu/navi10_mec2.bin amdgpu/navi10_mec.bin
amdgpu/navi10_pfp.bin amdgpu/navi10_rlc.bin amdgpu/navi10_sdma1.bin
amdgpu/navi10_sdma.bin amdgpu/navi10_smc.bin amdgpu/navi10_sos.bin
amdgpu/navi10_ta.bin amdgpu/navi10_vcn.bin

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
