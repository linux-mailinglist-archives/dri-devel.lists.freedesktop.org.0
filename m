Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D784BA804
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51E310E623;
	Thu, 17 Feb 2022 18:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134CA10E623
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79F4261A6A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD9B5C340EC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645121978;
 bh=WOoA4FUCWnkbYZApDGrqF5zmdGQ+iqNxJat4UTjRP4w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BVCZUE7cY6RK5wjwlL+Xhans8IKKl8CkPfps2XNtwUF7pCylTypkyPXiUleISPjv3
 gAhByf+2Nx+uaR2ISunO/+iUENa/vSnVTbhVzD8wFbo1hSc2EfGSD5yVckAlci10n6
 7RbroJ8gskNRFOMO1eVqIhH1u3yq3kSOXqb4nnJc1yt9mc9kaDP7wjkUbQW6Lq7JSx
 eT/y6nNpzohwXQdNzPjH5uQYStM/Gb2Q2AKVd8WtXpyK546GxpkzDeoCj5lpKLTBWl
 SvusV2hztzVzarGxY7+pcXb0qZPHAQ/sE3ZbytE3PdNM0mz6agV+GlFMf3NNrP8yv6
 mNbtL9BJTI45g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CC9D6CC13AF; Thu, 17 Feb 2022 18:19:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 36522] Caught 16-bit read from uninitialized memory in
 drm_fb_helper_setcmap
Date: Thu, 17 Feb 2022 18:19:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: casteyde.christian@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-36522-2300-oyuX6gmQ4f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-36522-2300@https.bugzilla.kernel.org/>
References: <bug-36522-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D36522

Christian Casteyde (casteyde.christian@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #19 from Christian Casteyde (casteyde.christian@free.fr) ---
Closing as too old and I do not have the hardware anymore to reproduce.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
