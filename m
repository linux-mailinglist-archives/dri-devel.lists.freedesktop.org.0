Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91657CA112
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19D210E12B;
	Mon, 16 Oct 2023 07:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF42710E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:56:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 52827B8111A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAFDAC433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697442971;
 bh=bXL5cT3WavoLhL+r/1nMQ2vzCRJXNtEP5yfF5TwAoww=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=suW9Q6468iE9ls6BVujQl3dHhTOY1jjah1kDbPloBFPF0D5qMEPTuHrJQddBSyI20
 dt089CgvUrtbet29Dsd72bUK1+LXhSmMOvJ+8j4/zKWqWr7wRXT5sdNlxZlKOP+fgt
 Bbyxu6vaec/b9KlnPPrYqOfqJtWJBil5Io6yKXKSRl8vbtAL2Ok1G1m32KFK0FSS4b
 6BeO7THH4+2LpNTG+fQN9XRQwk1WYF415Yh5fi8KbJqKin+B6qUSuffStWmvZ7F8Tq
 jSj9XKu5MAm57bYET1G5IEo/D/NrpA02os7aMy3RUJ2fKc8KEbUr5IxU0Bkjxn/vIe
 12ZwunPovSSvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 95E4CC53BD3; Mon, 16 Oct 2023 07:56:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Mon, 16 Oct 2023 07:56:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.zilka@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218015-2300-moTtsIE7ai@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

--- Comment #1 from Roman =C5=BDilka (roman.zilka@gmail.com) ---
Created attachment 305225
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305225&action=3Dedit
config-6.1.57

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
