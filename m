Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016AF744926
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 15:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8A10E0A2;
	Sat,  1 Jul 2023 13:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1C310E0A2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:12:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C49EF60B61
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37161C433C9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688217128;
 bh=DG7sLT9rTYbgPQsQUx2Hhjw8GqrfrpGSyjSHT+UmOT0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=REMgP4WqZ/0b6ryhLIfi6xzhBsTT0q/rhD0IibrKzfgDH4WRWaCuqofhV3vW/KQqD
 zU6YYTSszFWgNp+k0mi5aZOuXKx6nifW65huEqulfTtOR2zeTlbVOUb2xDQrK8Mbfo
 /aAj3Gfxue4wMkBOKanmXPZnZ6u6Vlwxm6lUzkZimD38683wBxRNoIzBS/SBS4ue/R
 0JMDTNQeMxiIzgZdpRSlbZjzaKw5KiVctTn8sVQ0KDjFCm0rHyrDI6CREo62iYIxZA
 BDR1+Th37hTCR/N3BrYSjR+srqrulzTXezgCrFJ3lchQtOY9iymZw4J1NeFK7obq9i
 P3X8coaFoaMiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 21C04C53BC6; Sat,  1 Jul 2023 13:12:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] AMDGPU - Internal 4K display used with 1920x1080 leads
 to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Sat, 01 Jul 2023 13:12:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: der.timosch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217621-2300-Fcpos4UJfG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217621-2300@https.bugzilla.kernel.org/>
References: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

--- Comment #3 from Timo Schr=C3=B6der (der.timosch@gmail.com) ---
Created attachment 304517
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304517&action=3Dedit
Patch to revert edcfed8671ee57bb599184f2e12a1b3e11b32306

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
