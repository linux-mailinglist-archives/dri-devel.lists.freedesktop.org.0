Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AAACEAB3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241E10E7B2;
	Thu,  5 Jun 2025 07:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g8hqscHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7CA10E7B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2AF143990
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3A6BC4CEF1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749107476;
 bh=2cX9NskswVu1f/90OQwSIu6Z4mRkqtYTl6CtrqVhch4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g8hqscHoGGkPaeuNhXbFKWzMzZretX52CA3OAQfjofkXkVIL3kuQN5QHg0EvlW6YG
 RVQGU6CeAjZKbc9ds9YcB5Yz4th6wAN57FBovqBcUdsiZbhWLj6vMsYEqAGHctXpoF
 AH7NvzuubuqlZLn0gF0zGEALGLM73ft33os4xhHgarzLObWy70HQu6IRTcUCKJAFUs
 OLfwJMi3T5rlHVMltGC6vy27+FI8Z3ucA/sQTbucVO9vDlaqRqKtwcDuOXL5l+mAt9
 73tS5yXe0PHDAVGlTzfHvwiCDUhPFx5VJo79biLw21sFf2vqRZJLsSjfqtq7Y4eu1v
 b//y3jyvDXFTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A670BC41616; Thu,  5 Jun 2025 07:11:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219492] amdgpu: failed to write reg 28b4 wait reg 28c6 and
 amdgpu: failed to write reg 1a6f4 wait reg 1a706
Date: Thu, 05 Jun 2025 07:11:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: email2shubhra@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219492-2300-bVPG84g9Ub@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219492-2300@https.bugzilla.kernel.org/>
References: <bug-219492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219492

--- Comment #3 from Shubhra Prakash Nandi (email2shubhra@gmail.com) ---
Issue reported here - https://gitlab.freedesktop.org/drm/amd/-/issues/2347

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
