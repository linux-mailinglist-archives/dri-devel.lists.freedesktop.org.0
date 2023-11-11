Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D886C7E8ACE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 13:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493C10E282;
	Sat, 11 Nov 2023 12:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7210E282
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:07:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 882C0B80955
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB585C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699704449;
 bh=T8i4qJAFjDfusd8ZIEjcUtAjvd1yinvnq/8d4ufzN+4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KPGZUj0fQVH6ZLZ/tg8figjky6yoMmPnDL5lSeHwQCL/pfeK8pWGfFDi85bFhtL7o
 OCXNFTxqh1baMZkR45C/k54hpeLbOpJoUJcKJsDl2lha1GYzM1AgyG+PPGLawIHbs1
 DRT744CgTOLttBH3/XfLYOdqGwi+8TwYW/Ywb/z44XfsGbdeLpJYQ5aIQaP6Br4C71
 stJX8oM1S4wb+HoMD4CI6PU7rNn160zmlbeVRiUd1sfJaUXVyj0mjO+pcF/yQ1LrBM
 XrzyjTFjRoWWDhf+rR8J9Zb+3qaxKv1FGEvtSNrZrorJGg1o6tmA+djmfpf4Mn7nTt
 RcQC5r70TV9Iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 968B9C53BD0; Sat, 11 Nov 2023 12:07:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218134] Null pointer when rearranging screen layout in XFCE.
Date: Sat, 11 Nov 2023 12:07:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gmack@innerfire.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218134-2300-uNl5HG2dPo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218134-2300@https.bugzilla.kernel.org/>
References: <bug-218134-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218134

Gerhard Mack (gmack@innerfire.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gmack@innerfire.net

--- Comment #1 from Gerhard Mack (gmack@innerfire.net) ---
CPU is AMD Ryzen 9 5950X 16-Core Processor (32 threads)

GPU is an Rx580
0d:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
