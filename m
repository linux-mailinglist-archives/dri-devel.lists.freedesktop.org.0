Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0B3798BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C836E8EA;
	Mon, 10 May 2021 21:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB46C6E8EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:04:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 89FE661554
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620680699;
 bh=mQ9TaBrfOPWzYYG66Yaffqj5O9x5S9bECeAwQQ6CCcA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AyxC5RIqBWFu69TS84/YZ1+GFALhf/T3wZawOrJ+hAsN0+bt/ufkJEpV1/ehFv95o
 EoYnQUpUny5Z4d/eFw6/AvTjRCtJH8MFtsQDr/wgb8ZnBR7VoBo0Tb4anlHQ1QoMQb
 eZwj6n+0kQ4odDFn+ynmdfZtVpse+coAH/FDyz/PgrphhvahD7lkHI0lQj5GanerRp
 DM3HsmSczZ31FZkOoOT35CEVl6LsXh5HZtVHlMtBCKR8u6vXsUBgwP+cakweT6e8qa
 NFhnuesueJkCkTSThGix7mY0anLRre3haelVanDYb273wRu60tjE4E6ZqWfYrbrhlj
 0neI0XK0Lr1jQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 74DF961209; Mon, 10 May 2021 21:04:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213007] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
 IBs (-22)
Date: Mon, 10 May 2021 21:04:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213007-2300-kEXM8XKbeI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213007-2300@https.bugzilla.kernel.org/>
References: <bug-213007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213007

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Something hung the GPU and it was not able to successfully reset.  Was there
some specific application that caused this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
