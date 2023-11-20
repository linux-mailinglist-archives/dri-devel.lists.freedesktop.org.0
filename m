Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5F7F1D8F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 20:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A2E10E0BE;
	Mon, 20 Nov 2023 19:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1710E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 19:50:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9007BCE1322
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D171DC433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700509844;
 bh=grvV04XT4Iz6CoI7Ient+AE4p/7/MnJgaA+nhpUqAbU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lfFAeXBvH/Kbu+766u7nksy3hrHDv9V4kiZgpT1DKN32yAEuwV+++hKi1k4HtH2KP
 dbhveBQNqgRhwGSGwAT39wa6eyt4TdSuhOHiABP+SlPQLqTC5TsJSClmx0E3ETDGEz
 T2wpU69jO5hu9v1s3PGoXwhQhx00S1vC/8Mem+spHSFqiQLkAlMV/MULYNF8OkTbtI
 tFdJWmwbvPi7SWWErhHMj+39a5zNcxemmOXifwhreA79cKeB0hS5iAHSO+R6B1Hszk
 YqkRo4cmdLV3A9WeXIQ8zuMSlOsfbR3bKMskE9aJhBA1uM0DaKWmEyOKy+nwG8Bdt2
 gZQx6nyXT+Uhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BEA9EC53BCD; Mon, 20 Nov 2023 19:50:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218168] amdgpu: kfd_topology.c warning: the frame size of 1408
 bytes is larger than 1024 bytes
Date: Mon, 20 Nov 2023 19:50:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scall-ebr@prosemail.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218168-2300-Txywye1m9P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218168-2300@https.bugzilla.kernel.org/>
References: <bug-218168-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218168

--- Comment #3 from Scall (scall-ebr@prosemail.net) ---
Done. For reference: https://gitlab.freedesktop.org/drm/amd/-/issues/3000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
