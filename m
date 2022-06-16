Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7786654ED62
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 00:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5D11A5A3;
	Thu, 16 Jun 2022 22:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C3511A5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 22:36:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0684BB8261F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 22:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3AE3C341C4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655418963;
 bh=271/GoPxjNqlMorSL+iDNuPNC4EzcIWV8dJlb7xe0as=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MgAdfEudsbtYxpSxbX0MLASasMpsCCJ026HgMIfrCQlayJgnSh0ZdAKRdyqcEInZq
 4VoHgqIQPjCBESbopth1K5IrTrbMsoaNRoK/Yy3PaP/QJGqJwVZIS7ScrG26TFrOZ/
 j+yfWVJlMI32XSWyhAAHCfa0nRH9nV+1bqOVskGhCIbUP49ycW5D8MtYQafQ3xBqyV
 YDTD20BmbIZJBBY0DpknhYQ0cj41EJY9jN6drKCkeHjsgISsklUxW5BpYhe0pl2peJ
 3oZSan73m8S5snBSoY2ourzFAXJE50d192GvvVP8VLe0uIHf6OUb/1JO2E+c19xLsZ
 bbuh8P3Jh8uIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB6BACC13B3; Thu, 16 Jun 2022 22:36:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 22:36:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-yp0oQWGLuA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #12 from Harald Judt (h.judt@gmx.at) ---
Yes, changing this single line indeed solves the issue! Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
