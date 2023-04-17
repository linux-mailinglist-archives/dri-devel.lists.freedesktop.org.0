Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21A6E4C97
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F17510E273;
	Mon, 17 Apr 2023 15:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59610E273
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:18:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B58D619EC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AE4AC433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681744688;
 bh=dFR4IUsDj94Uif0yT6y3bjm617GiFea3Rcxr/3u9iSk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cmk42Od6W9JSKZxzNP3cbPCy2gN8g/HMsBDMMO6caz+tKEsk7fk40/eQ1phuXIt49
 eXuds3++2mVqRJUz9QhECP3Zhe08PAeicKwVso7ViKnI6O+SM9sIome6fn4ypYjU4P
 79/XL6xThmbGLAEx7LB8Jlks3SLhr1TT5iMowh9txkavunk4RY8jshxV2aKvEo282t
 qpR9/lBQlWo1dLl9jrYUCQ4Z7NBcYHBrSJ/BnwYwuuPxlgmx6xylpYZft1E0YdSGz8
 q98ujZ2ur/8HpYJ3kXKrMD9BRUy+YPpI8U1fdlQM5NpMQmIW4jcPqQIBoJnpJIPOpi
 w2uRdJrU8QxRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C9CFC43142; Mon, 17 Apr 2023 15:18:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217348] Regression nvidia dkms driver installation
Date: Mon, 17 Apr 2023 15:18:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217348-2300-8xXHoJmJDq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217348-2300@https.bugzilla.kernel.org/>
References: <bug-217348-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217348

--- Comment #1 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Yeah, that's a known issue and no this won't be added back because of an ou=
t of
tree driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
