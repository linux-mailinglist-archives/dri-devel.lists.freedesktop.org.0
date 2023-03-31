Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C96D16D2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 07:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC610E0D0;
	Fri, 31 Mar 2023 05:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6899110E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 05:33:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D07DB82AFE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 05:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8481C433D2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 05:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680240799;
 bh=S/fWWVM+vM1IMfZseXSlD2VKxjylMgfnq62c8B9FOYY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bcyr8okI4Okn3I5cZVOFha3R+8NThLUcW3psQxKUO0sHxSSB4ih5w1QFGOzpWqSKi
 dLu2n5m2t5Hjs6eL/Zm4Pc2tDyygfFNgiRFE2tOFFFIDJBOYfVHrT/3LJlSPo1yUUf
 /cmDmS25nlrxQwxkgiynu4yHYSmbALBqh1145cDKTBTs47Sy2BVIyVcEur+BL3ufHc
 EREghshcOp7jcfWRJ+RjMiyI695mfKtrPT9rrUZzMMBUcxnMSPnmG+8Mpa73PCmGHP
 JdN5i/H3FUh3VmUnQTJ5e+nsJVgz0yvtOke/gHP+R2QYpvV7z+C0fenLKP6I0VT0Pu
 BRQyRQemgu/Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CCFDEC43141; Fri, 31 Mar 2023 05:33:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Fri, 31 Mar 2023 05:33:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217278-2300-zMKxbjmkdY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Did this work fine or earlier kernels? Which one?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
