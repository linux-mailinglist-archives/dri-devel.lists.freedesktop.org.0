Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9533B40D9B7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6836ED74;
	Thu, 16 Sep 2021 12:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B68A6ED74
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:19:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DA09260EE4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631794764;
 bh=0SMe/87AegwFyt9kEMMYewIFUeaEGz0+K0e0WbpQ3L0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ivfmIcxjToXh7moUooabur+Ja3CAASGR+pvYfgmfC7ol21mrTUf1VQkb9rCLw5wLE
 oaRGDAxGrfY7/qIGHi4v+NI6mR6Wr5HlqUo4emYkIsEyaJ+zJcxDyXfRVeXVXUKEEK
 sZCz9S4/sd9O3DsZTQ3ARVHF3E2mU23oek4n6Lf85DOhC6XNWkHnusLXbjZjDveAyQ
 6A7+VKaRq3EOWYaogv7pVUZPb1w+8ol4NA6xeVDgd/OnA3sJmoAL2pgkmSzcQSY+UH
 xZ3jt5XRtMFRuE+eWDFP/hOUaAWGCNSmNOD1UPW3tz8K3Jeg2barjucSj1xhjl7Es3
 lnddW8sGPD4bQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D1A1C610CA; Thu, 16 Sep 2021 12:19:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214431] [AMDGPU] Graphic lockups and various ECC errors on
 Radeon VII
Date: Thu, 16 Sep 2021 12:19:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-214431-2300-J5QBnPSUGv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214431-2300@https.bugzilla.kernel.org/>
References: <bug-214431-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214431

Anthony Rabbito (ted437@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|high                        |normal

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
