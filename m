Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47386A74202
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 02:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E612910E95A;
	Fri, 28 Mar 2025 01:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Owmkjo8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F010E95A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 97780443D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D92D1C4CEED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743124875;
 bh=om2GPRLsjfCmU/u2Yb2ik9EtrJ+huS1AlNKfPa/dNjw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Owmkjo8+ObwhMUaBFd8HkI/EU7HC5zszZx8w+htB4Y0EI2wRuqAFRRU2QlNwmRVNQ
 ClVM8tY2CaOgMY+mU/6xX3re0pQOOKAS7My8s/cwdy598lrPXMZ6kvzuxIjcGII6lh
 //37rsyaXmQzgrbajsVMMW2h9fyF7J1gdO4TmTwH33nVJZhZoEaf6Dhqee57Dtx07b
 k4DOIIlL+Wl/BRFscBK0Kgq2Y04z1eJnHlonCS0HVuApZPBRsPXYwkMNc0q7DeqsFy
 U9UtGN5cbRktHO/v37NiJG1uVMhgMmahuP0kJFiPyr3JbqmQmeKgS1V2iXCZr1005R
 D64rd1a2U5I8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CB673C53BC5; Fri, 28 Mar 2025 01:21:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219929] Direct firmware load for amdgpu/isp_4_1_0.bin failed
 with error -2
Date: Fri, 28 Mar 2025 01:21:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219929-2300-vCRNaknInr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219929-2300@https.bugzilla.kernel.org/>
References: <bug-219929-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219929

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It's an optional firmware. Only needed for some hardware.

Please see this commit:

https://github.com/torvalds/linux/commit/ea5d49349894a7a74ce8dba242e3a487d2=
4b6c0e

You can include that to make the message quieter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
