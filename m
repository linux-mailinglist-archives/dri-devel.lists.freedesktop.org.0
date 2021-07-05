Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA853BC1D8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 18:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774B489A14;
	Mon,  5 Jul 2021 16:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A54889A14
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 16:55:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D9B961968
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625504155;
 bh=Gd+p/qN1cN6yk6xA7Ej6g93xcSQeBRnQC9iZ3agYZdg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hOb7zdCIwFzt38BfO4i0KJZaTqb7OjG+ztKlEV+oHooeweALMnVJcDakNXtm2B0dq
 rnS/tz1ziOBI+wcCor1r7gsY1dlS12GqwKpO6EsqsncsiYy0/zWaPskModV19ENiaM
 NWTG2ntqibvbYaWFftHxi/vIBVan2LMlgflWVK10c+makX2LheGJtbU2mQiMcJvBbI
 EfBiLLFWKqrHzgoRmdFXJ9mgwEi8s/2ErPg8nrnJ+Nel4CWPMe8au6I8pQ2Y1KTIlk
 iu0LySUn9x83XSHnMNZ1dw0V1EdGmAB2TacmAWEijesItBdWE9/pjXcfo09+NJl5bU
 i31q3r5hCacsA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0AE0C6120C; Mon,  5 Jul 2021 16:55:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Mon, 05 Jul 2021 16:55:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-ZutpnV9abP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #29 from Leandro Jacques (lsrzj@yahoo.com) ---
How to file a bug to the linux-firmware project for the amdgpu driver? After
the downgrade I haven't experienced any issues anymore.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
