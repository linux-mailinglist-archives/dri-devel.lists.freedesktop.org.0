Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921148D088
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 03:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578DC10E22D;
	Thu, 13 Jan 2022 02:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B7E10E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 02:50:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7397C618A2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 02:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4F31C36AF2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 02:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642042228;
 bh=mjvFbU2lIbaML2oIe7bu/yd+CosgFgKhcd8px2moDko=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZyVJOtRXGyBpClYQ1C9N8q7njoH+D1vSQ149PXUuhS5aP3ps3aRHR5Clun5QJ1PkQ
 TefSA/aX2R8D3kk7iL9FqwsM8ViacuJmQ3z2xFTTIvP7OAhdjcGh/6sjOrX3jiiK0p
 jgz+4kFxdcef1w68AdOfqd8VCXJrewSfipi8CpkYUZiSIf/X3ygY9s0DI2xrLV2P1K
 RzwOzTZgfVjeIro5KTn63CitoSdcP5yBZbToeLD6epTu+ypZhXdMonD+Slki3iQ8a/
 o2s4nf1vOj7+siKdY9DT18ADLDmuyF+kon6jRIhKxFr+7Y5GLuns3T8FfhDIp6XTcM
 cFvKq/4DueMCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BD402CC13B0; Thu, 13 Jan 2022 02:50:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Thu, 13 Jan 2022 02:50:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: talktome7468@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215445-2300-sBn2aFChV1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

--- Comment #8 from hock (talktome7468@gmail.com) ---
The bug is due to the use of uninitialized variable, which UBSAN detected.

See the patch https://patchwork.freedesktop.org/patch/468484 for the fix.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
