Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434C4A62D3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93189A5C;
	Tue,  1 Feb 2022 17:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCF710E19A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:46:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0033BB82F41
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15A0C340EB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643737567;
 bh=OGfe5Admw8N8GVpOSfqsyScCbR3Blxjqg885dRGBQT0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HOxcKIYIYR5jWacH180XeM/cQwYX23OJJPu//ZFdUubM2rZ1j2UDdeYzvkB8iHS47
 eWyUOOK28RE3MYElp+jzeDa25JO3SGft93S5bfceF8gj/Tp6ACXLsduf2QDc7WoSRL
 yjd9/hMOTVvBPSGggrAv2JtyHpvZbU5hbbrU7R48jbhG+TcUZ8bjVN+VoJn46FjzRM
 LEYIMBk7jj9akO+QnRKm/e8UUR9TrA/2eH15BqhsFBmR04aRcsosZsI9BotuAaNKI3
 cmi0jRtjoPRBNxE+LrVawOwObEfGvUIv5UrKdCbre/lUfmufZGeQwWiMw/vhzQYhWy
 rRWmkwQxyTo9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A9EE5C05FD4; Tue,  1 Feb 2022 17:46:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214801] polaris11 (rx560) regression
Date: Tue, 01 Feb 2022 17:46:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214801-2300-cg6xKYnXrD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214801-2300@https.bugzilla.kernel.org/>
References: <bug-214801-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214801

Roman Elshin (roxmail@list.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Roman Elshin (roxmail@list.ru) ---
Looks like this bug report are incorrect and the reason are using old amdgpu
firmware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
