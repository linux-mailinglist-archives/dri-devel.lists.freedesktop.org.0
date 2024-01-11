Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE282B63D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 21:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131E910E03D;
	Thu, 11 Jan 2024 20:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B8B10E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 20:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 80240CE1697
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 20:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8FF2C433F1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705006322;
 bh=H26PH0bOA1GHDSql6Eyr6n0sqYeqPemA+5Rbt4f1upE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NrVrf/BoV5L0DVGdifzeT/YjMnFniXSSxc61HLbD1Ma3WGT6QXATRzgCuzDksnr3p
 X5wwoNPBJrZrN0eGa4wFYZVBZUWKYJk1UBgR0SMPBKd207A/K2IJSOTbwudmJt5jrF
 EfnezMG/1M6QkiQyJSHIX9qt2tRJDidvYB8/ue99S32m8r+soSDIx2aeq8KItFQP5t
 o9ajg9BO/KI1zbuZoKZ1dTpO3VKlyFtlB5Y6k7vgQlxomZ3FnqGWvWSTnT6LNMSKp5
 /gcpj0QMj8eWsd9NDjAqf/TkGKl+osciTBs+5nxfqz4MkVTWZEVsrXdbw1S/WnlFfB
 7oJKeMYYrvZwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A4A78C53BCD; Thu, 11 Jan 2024 20:52:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218368] amdgpu crashes on loading on both kernel-6.6.9 and
 kernel-6.1.69 at cold boot
Date: Thu, 11 Jan 2024 20:52:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218368-2300-XBHTez4Q9G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218368-2300@https.bugzilla.kernel.org/>
References: <bug-218368-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218368

--- Comment #3 from nvaert1986 (nvaert1986@hotmail.com) ---
P.S.: The GPU is a Sapphire (AMD) Radeon 7900 XTX, I figured that might be
useful information. If any other information is required, then please let me
know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
