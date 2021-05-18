Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB80387FE4
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6E66E0E4;
	Tue, 18 May 2021 18:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF91B6E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:48:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 713CB61285
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621363734;
 bh=/zbUDBna4q/LrawYJE548XYuxZ9alLsVq5UpUbShbZI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rDhBXINwTIex77kliFt0Q0jJGtiF+/vqxWfn0j7MTucgS3T6LyoYXWRe0NimYLmKa
 Xtlqeszyu9ozEn/IGR5zl1yq/Ibg/ZaizsYduqVPMJcz176l9hzfsGx+1alaKNlC1U
 SRZHDICDnYfb8oKsHryOuFKUByG2wonDwlJS8bF1LUtt3YRMyivgxPTYMpH/DldTzF
 ifkWciteTb+V0qn6ycxUZrrzb3qhddbivlJpBg2cEt8GIQkF7m5qF/ISHNiFdmvjou
 rpwbt97bGJdeKicAOirwD1XX4tfbQuSKFxaVR8p5oadJjnvTx9yWJyvYMyVGGbqNAq
 HwryaT/e21Jmg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6DC0561249; Tue, 18 May 2021 18:48:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 18:48:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-N6Aa2mLFWh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #26 from Jerome C (me@jeromec.com) ---
(In reply to Jerome C from comment #25)
> I forgot to mention... I'm on kernel 5.13.4

5.12.4 I mean

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
