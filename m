Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC22702F75
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C9110E1F2;
	Mon, 15 May 2023 14:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB30910E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:20:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79026612EA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDDE9C4339B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684160424;
 bh=xgm+s9cVWrq2OLVKbhF6rD1ZiAGRIoZ/0tNmTNvf60g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Rn8JFU0wgzwWOBME/8sbF3Ex7F87SEeb8FA/8JTF2KkEU4HNN/E0cwqr+ohXRVYa+
 ahlndQjTaQQ1GQg3rPwikI0j2I8zZAR6isaHCtyQ1XtemWjTjUigZcymFWb0lWDwLw
 1ukeb3pX5aJgLWzvi7vsUb5Pnm58I2eDokWVoLX/Xt1qbQ2Z05X00rIeaQQcEOXPhK
 5DTdUxiSKR78TB3JzbgEk/IYHyxjw34vHVcsUzqVUdvTVLRCBczMxGnpyahELTADnA
 X3N9ck1XwufCnuxNBy5MODiERRrwpv8qKUbKfQP3OJJeAvm92R2Qe2M0kL2sqi9GKF
 LeKCK/VEj6epQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C4C84C43141; Mon, 15 May 2023 14:20:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217432] AMDGPU crash on shutdown
Date: Mon, 15 May 2023 14:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217432-2300-2GsA3BLPp4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217432-2300@https.bugzilla.kernel.org/>
References: <bug-217432-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217432

--- Comment #5 from Jonny Mako (jhnmlkvch9@gmail.com) ---
FYI, this is still happening in 6.3.2-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 11
May 2023 16:40:42 +0000 x86_64 GNU/Linux.

I'll see if the next update has the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
