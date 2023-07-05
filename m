Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82104748FC4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 23:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733210E187;
	Wed,  5 Jul 2023 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAE110E187
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 21:31:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E76B6141C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 21:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 924BAC433C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 21:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688592683;
 bh=J6BI1DmyYhjFwAxkg1uigEM3QLqouhXdd664iL92AVg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gv6btBAYL94ZiuINxoGdJP6gbf2TC+Wpn814Ndiqa/zMSbNFqxfldCvLb/z3NQKMa
 XTkfmBBxWDe3GI6cXyJMowH2/4JXchxLvWMtOOCfPGLgdoyn9VMMMTdiaVDfrZZ3Zz
 JcCDHpIJTvJbK7T5bDOtZfkOiR0A0ufPdeJ+gPdMxED2RnMOq1Aa8qsehMtB5qOXZ3
 /JZQonbHHNaEVVyqGTFhavdZMkMrjQpG/+pIApGlKy/s3YxoZDIh2xSXls0PhFAGDs
 pW+9j8Nk2FR0f6iBIa90vDMpCsNcWqusc8XlRhGb2xey1Y6p66MxAsmQHuLYtBtn9X
 9PXrE/eH187uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 787E6C53BC6; Wed,  5 Jul 2023 21:31:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217636] Commit edcfed8671 disables previously supported video
 resolutions (on AMD Rembrandt)
Date: Wed, 05 Jul 2023 21:31:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217636-2300-rmoNGNmY0C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217636-2300@https.bugzilla.kernel.org/>
References: <bug-217636-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217636

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
The revert of that patch is already on it's way to Linus.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
