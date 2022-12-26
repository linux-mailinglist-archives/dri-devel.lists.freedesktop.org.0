Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417165645F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 18:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E3010E129;
	Mon, 26 Dec 2022 17:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCE310E129
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 17:48:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A73F4B8069F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 17:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B301C433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672076933;
 bh=yH8+tR8+vnqnX0Qe0IvRnIGAwwFlTkpISK0gags/12Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GLmmBQXjZv7aZ0bVVtZqXq09q50CWGNk8bgXzNQwMFIk6qyq0YkMIF7Zmb1wuOC0r
 Jr17Ekub9tWnoRT7ZyKlu+TMZ02xCYZR9XzuExGgXQ2aJYBieNxxaCCziaWQAJoVoV
 mcKA/yT/v9+jHMlXId9L20SZskcIJd1TOiE+lRNUJmobH65j8QKYdmEuvhDMdZ36Gq
 0/zxbPC6uVlbBsL7m7z1eBuGY0br8q//NIsqSl5ZCk2z+zZZEJ/+nJuhX5k0XuO9Lc
 4lqsiugEyPczIn7rxAyLT1TYsclQZRZblPVJvYITNvXusiGspZDl0XQtP3lE5uDA9L
 8vcMwFOH8gkCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4B0A7C43143; Mon, 26 Dec 2022 17:48:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Mon, 26 Dec 2022 17:48:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216780-2300-pNxaLpoLQB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #7 from Elmar Stellnberger (estellnb@elstel.org) ---
Did not re-test the acpi_sleep modes from above with kernel 6.1.0-desktop58=
6,
where the screen content was preserved directly after resume. kernel 6.1.1 =
no
more exposes this feature.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
