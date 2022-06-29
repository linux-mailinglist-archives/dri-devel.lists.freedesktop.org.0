Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3A560146
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01DF10E810;
	Wed, 29 Jun 2022 13:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830C810E810
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:30:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C21061E53
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 721A2C341CC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656509436;
 bh=RWTD799Tu9BKTVtzaD3uTAZeoueQx76Oe5v3nbWOUUY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OiC8ugZ36Hu3g+LHeKZR2nlU5i8FVIeRWRn5Ss6Iz1flJuzossfqVONyIpFLrcd7h
 +iBem6zKw5PRX/lCrzZlo5VHmz6MGa+10thKhKVygAl9z5Xugc6kfcVSLHDs68XmVl
 iM59xhpe4W5cCSR+hcrBsDRjcibzIvmWPmQCczXsuM+366ZD0rDPv/alC7ZJQg1l5/
 k8jFoZtu/JdjfRg+aHke5hEMam2yEFIObWX/MavNlpVQUxTZv646mQqmVxq0HZKbqh
 8uMcP9iI4I6BtOQVKLoaToNULWOW0aaZindyZ+N/KvdYieHHOTwV60SiX4TSllsM41
 JJVuE6fB4vVWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5F1DBCC13B6; Wed, 29 Jun 2022 13:30:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Wed, 29 Jun 2022 13:30:36 +0000
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
Message-ID: <bug-216119-2300-1uC6PAQ5fj@https.bugzilla.kernel.org/>
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

--- Comment #30 from Harald Judt (h.judt@gmx.at) ---
I will have to test this. I have not known this option exists and what it d=
oes
nor what will happen if I disable it and if that is good or bad, so I have
never used it before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
