Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B872844DA2A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3996E934;
	Thu, 11 Nov 2021 16:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0D6E934
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:15:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 532476162E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636647332;
 bh=lqJccHoIpQbw7+IdT2NXd9i8M2cJaQsryBf1v0SwVM8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Iw2RrKCy1Gav30R3d9q0IL6pIjKVIDb19PjUT1fkFXozKm0qszTq4vJQp9fPlf8Eb
 QKbnTO5Tj4MQAcBauVbCr+8cpvJCvrjy8YgRnigYPTnkVFplWYN1tSVV7EIkDruQrW
 ul9up9kIe7G4xhTHN878GsXm9CfU/jqE5yY77eJFZLUV6ODgjkK2weGhFtUZNR89jX
 0dgkf3LsyfZMem2je7CZS9lQE69BYIOETCyGWLp+Go396fU9DO7dpRfkNMqQkxt9Vm
 YUqew2yRowtfzEuQOyg3EldTvrbB9C4rNGzud3NNzwt1mM+4k+1VgxseO/LugLqRRg
 1vbqRnoxK1xLg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5024060FED; Thu, 11 Nov 2021 16:15:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Thu, 11 Nov 2021 16:15:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jlouis.espinosa@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-MPgWpCkXhF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #22 from Joey Espinosa (jlouis.espinosa@gmail.com) ---
Kernel version would help too probably :-/

5.14.16-301.fc35.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
