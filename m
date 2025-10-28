Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903CC15F4D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBF310E60D;
	Tue, 28 Oct 2025 16:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ip0BS9gM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97A710E60A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:52:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B041544A90
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E9D5C4CEE7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761670358;
 bh=BuDKDRRq2AYJtuJuIk7t3GPDdGCSrMKzvJBBQEHSdi0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ip0BS9gMgkDnXbfr0RDtyUEsn0DMeSOoNdXXBxiatHtCooPIDqL3jdZDeUYYqPgoD
 6xG0UH2Llev82XiYyDNN9cdoT4gPxSJltv81H8WRmPe3MEgYW3y8vji0ueDJtUCaHU
 qQpM5R827NWtIi8JXutTLxp5cKjVSBozg8L1BWAZCoNyGpEMIGi/ZBgksqg+JJIEd8
 5FwykTmf/W5i+VBFYB21JhRoMokKRqmaUed1K5gTvVJPWyl2qvtl0gq64o10K6fR9X
 T37uPvHv8QsuuCPiEzU50M/OuzgNpzQ6yX8L/G0Ej18asO7HzATHjUTtJIOlZ9FFe2
 jqzPUdZT2MZMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 883E9C41613; Tue, 28 Oct 2025 16:52:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Tue, 28 Oct 2025 16:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-211189-2300-lwSkcLxqwA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|CODE_FIX                    |UNREPRODUCIBLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
