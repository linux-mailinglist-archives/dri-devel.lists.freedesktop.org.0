Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D52A8C9E0E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 15:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB27710E722;
	Mon, 20 May 2024 13:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4E52x2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED1810E6E9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:22:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97B90CE0B1C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34952C4AF0C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716211342;
 bh=uX43+hA8Tj+kq3Z/9/1kdmm+pNnc+fv5FoR3MBrhUZ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P4E52x2v786pzdsWG1DGnq4PlU/0SXdsN4dbkBlaRVCP6BSFKOJSxbrqfen+Lzp2h
 kfmIkWh2GbIHdHixRApEXhyB7xwskWdrGDkpdpUCaoGVXvug8ey5XcTz7FFXvQcPUA
 aTcIOxBBs7oykaF74ru6X5pDCrwq7n/VlowMqTtWBw6GqF18bx24zatfknJ7jVh3CH
 cZrMMCilMBC/PC0OBDVEmzRM8mZ6zHoyViiFP5eJaM6CRecHHWizYdhOLcDp4Y4vkX
 oSgGBpmxZUbxk1/k3sAe1ULYiV0sNAe+Kl56ujyaTPuxk6X6u3cN+HOW279yY6Nr/k
 KT+xNPhR8qYxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2E53AC53BB8; Mon, 20 May 2024 13:22:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218864] HP Envy x360: Graphical corruption over time without
 amdgpu.sg_display=0 kernel option
Date: Mon, 20 May 2024 13:22:21 +0000
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
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-218864-2300-xJWlIQo8z0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218864-2300@https.bugzilla.kernel.org/>
References: <bug-218864-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218864

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|BIOS                        |Video(DRI - non Intel)
           Assignee|acpi_bios@kernel-bugs.osdl. |drivers_video-dri@kernel-bu
                   |org                         |gs.osdl.org
            Product|ACPI                        |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
