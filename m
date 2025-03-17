Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93519A64012
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 06:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535A610E08B;
	Mon, 17 Mar 2025 05:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fGetVCIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F74810E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:46:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BCF47A43404
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19DEAC4CEEF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742190386;
 bh=g0+J3PZtVy1FpGb2uTg6lbZJYWo3SfxP3iTM+nPOVmw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fGetVCIkXPHqIrZ/mgeRL/YlDZxceBWfrzri5uod8M71rxXmCnm/jNhVFsVZaguVo
 2ZgXyE/YiyomUjN6PJ72p4mUUHrYBawoewyASEp3zf9OIroNg8YgVAbt8Emt5vDhK9
 JiUSdkBrDEQdyJm87CScRPIj67jk5J/xfOaTN8nydDW3jujvVRJZCya+2Lal/giGoH
 1qwhKQUfeQmmyHrk6DvWb6pdSU7enMP5zUnJf030LeUCHAFfr67Jc57bVhNmG6SYSi
 Nhe3qAeCcDgHJm894aUn4aAsfkcBYYtoCmZp3Y49d8SOPtpZBMghFN86OPMuy7C5dr
 e4EsL5dC/GgrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0C2F9C4160E; Mon, 17 Mar 2025 05:46:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Mon, 17 Mar 2025 05:46:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-3NBU1AVsxv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #8 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
For reference, commit e204aab79e01bc8ff750645666993ed8b719de57

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
