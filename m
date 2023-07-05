Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8F74854C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6CE10E365;
	Wed,  5 Jul 2023 13:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302510E365
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:44:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E31F6155C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96B0DC433C9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688564697;
 bh=NhRY4m4gsmT4XTdQXSqpRkE5Wbtsgl8gxYMS1zRVmNs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lwSeQfeXo8+nKJ6aBZnk4UzZ3WIvIgRXdJHW4QZxBxyfWEqWsdXGO+eJ5yaRq08kz
 kFvZZcYSmu+b7AUix2h2egnf3N654ux7gAgpvLioBNTDciqzxAv0/xOyxtc4iXQZlt
 RKaSXf/E0EudhDITnBtOEmFhanBcmQ3j83GJzi6IifaO+hiPl+XrM2ezRIsJGEuhGg
 AFfxq8vocnqAI0RJ3PqOqVo/Nd98NoZCM9CcZSj8yudVd1ejwB5HxclzvR2mNHXdru
 WjuiKjoi+MvXk2Fbm7cDLe7Qq+xpPF1Uns3MJR0HGVg0qHD96RQpwu/Xwx9+/I7WfG
 YGzo0j7+sbIFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AA63C53BC6; Wed,  5 Jul 2023 13:44:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] AMDGPU - Internal 4K display used with 1920x1080 leads
 to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Wed, 05 Jul 2023 13:44:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217621-2300-S5rZrAj9DM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217621-2300@https.bugzilla.kernel.org/>
References: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
The revert of that patch is already on it's way to Linus.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
