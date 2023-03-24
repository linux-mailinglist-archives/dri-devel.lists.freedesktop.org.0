Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2746C83C4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 18:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDCC10E177;
	Fri, 24 Mar 2023 17:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D42E10E177
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:52:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9011962C12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3E36C4339E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679680342;
 bh=Mx18RqQcUDkZpfR0LwReqhDYl+zbg1shYb0K19xlVxQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y3UWOZ3mpzRBHimk/6FYYInczBNIfxnoEdCnFi5oUbWjdif71on2ZIAdVHXKtqiWp
 lzoR/d5FC4VhZcAe6GNh0+Xlf2JqqAHl3PIhgkUGGBnjrdLxIMdvtyc5W3GQVJVrrT
 9wgXacBWVCfH5GGWgXkHKprEJNmMcUfB0TfEI36BeDNWCS9Ub0enIU3aS4Uo2gzsbs
 rLgstjBnbbTMOYzdNBMdKzTaO//wFeB9H1mi8hosXTTiweGqe2zJenNuvxrtblEJLh
 ZQCfKHhyWr2akIgttMQP1YxaNc37ScpsLJ7ClihkFihDHmGOtcu69/cI9ypVGOO8oJ
 sW0/zqJjvBbFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D8F78C43144; Fri, 24 Mar 2023 17:52:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Fri, 24 Mar 2023 17:52:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-1jmQ7fTr1h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #11 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
(In reply to Pierre Ossman from comment #9)
>=20
> It now hangs more arbitrarily, not just when trying to play a video. Havi=
ng
> done a suspend/resume cycle is still a requirement though.
>=20

I tried disabling video acceleration, and the hangs are now gone. So it does
seem to be the culprit after all.

Could this help you pinpoint things somehow?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
