Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679234A380E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 19:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF8B112FC8;
	Sun, 30 Jan 2022 18:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FECE112FC1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:32:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C86DDB82994
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80798C340E4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643567520;
 bh=revjrQdpsMYUHWefg578sD810csb9/IxiE9tGGGpv9c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TRXBzscftP/VQu1qczIEBAfkKapN3S5lS6mq/GWzE/vGnT4S3a/we3Zq4BLl3nAXK
 AQFGovR3AZqoGp/vFg05sKQYeloSs+FasikqM9DWversslxux1eb2AZpuKGXgpYEBg
 apJraXJ5jEjBdjiWnCZkDR7RJwyl80cGdEFALTgb78Yr0nvTpLXQlzbOj4L8DrkpI4
 BZB3kAoovx+Lggy+n/PAdtVt0Sd8noQrPznHsOTA7meQRPzRi8LqaSLuZlir+FAkDo
 YLuZmWkXfn6oNQrJ6JuXfvrxKxX+Yuq4461AesQSs97K1GFObbdYt6B7uGLrxNR8Fo
 itOxQeBwVU+Sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 71136C05FD2; Sun, 30 Jan 2022 18:32:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215549] My 6900XT can't recover while it's idle (but not
 asleep), and sometimes doesn't show at boot
Date: Sun, 30 Jan 2022 18:32:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: techxgames@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215549-2300-b4LZukJgSb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215549-2300@https.bugzilla.kernel.org/>
References: <bug-215549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215549

--- Comment #1 from techxgames@outlook.com ---
Created attachment 300353
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300353&action=3Dedit
Xorg log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
