Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F047E8948
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 05:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85910E24E;
	Sat, 11 Nov 2023 04:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A0D10E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:59:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A743CE17B3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED7DFC433C8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699678782;
 bh=XKglwbaxam/Q8TfNhBAHO+VEUDk/PJxt1xXwRN4WIeA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dkcOgRC5ay9jqd36syebbL2ee2LLip83WrsFUpMGcFaID7QsCL3A0i8Fjx5c4R+oH
 L/qiFZdGC0NTpRqRniEQP5m9wTXtcazeuvVgos4TOY8gyzQO6smTyLsfJ5eoUInQGM
 O7m8anZqcbA15pjTe9hcLbxYLMJuMMbkO01Y0pei2yXJIoJ7D7N/JaC55vcsCTdtXu
 BVNC/ge/EyfLkOhNqnK5yaHL8CgCPphScOEHPYWvl3K9IXXewkjHiKc/211fyjQ10B
 inQ5uDL/Xn0FWc7fQU+b71aF5P0uAMTuxv9lQ9N9nJ1miqPcnNgycFzEuzzCndsiXH
 rNPMcmRWiZ2Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DDB4BC53BC6; Sat, 11 Nov 2023 04:59:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] kernel panic when opening spotify/firefox 6.5.0.10.12
 ubuntu 23.10  vega 64
Date: Sat, 11 Nov 2023 04:59:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpollind@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218133-2300-qFD2cNZrE9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218133-2300@https.bugzilla.kernel.org/>
References: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

Michael Pollind (mpollind@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |Linux version
                   |                            |6.5.0-10-generic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
