Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43A55B19D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 13:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8DF1135F2;
	Sun, 26 Jun 2022 11:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965D41135E6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:58:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22DAB60F85
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85A2BC341CB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656244723;
 bh=0mmg0q9BkJ6w+2SzgplYO8WZ9LiGCYmGUa5VAlArWqg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F3YEVN7J3u+KQbBANINIDZu85Y/wXTQoi+tOUL8AGKSvsrpay9U3w1f1Oq+ZVXR83
 FFuLOy22OBwzTWLHZ8qCyX9Uy9BRssVk0294sHV+ZV+R2tlyu8MR2M/be1qvXjrOxU
 60pBajKITK5K6aj4jHaIQjT3g+Rqg5HOt/0ZrPLyL57KgLIbSU9BpW8KsnadRPkr7T
 eZoxfW7Ekart01AhJVDI4SEHH/SFoZMJd2A0orE+PQRoIabKsWLwrLIP4Thmk3taiX
 WqW8DvOs8wuPzhDUk90m3+0cNAtYkvIhnPS5c4B6rOw0gG7ycA2ODoT+X2hMANHMwX
 8ktUDWiwYpkAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 734F4CAC6E2; Sun, 26 Jun 2022 11:58:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Sun, 26 Jun 2022 11:58:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216175-2300-WcS9dPu93J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

--- Comment #4 from nobutarounosuke@gmail.com ---
Created attachment 301280
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301280&action=3Dedit
.config for my kernel build.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
