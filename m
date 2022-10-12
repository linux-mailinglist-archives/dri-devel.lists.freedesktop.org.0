Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD225FC3F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 12:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AAF10E3C7;
	Wed, 12 Oct 2022 10:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707010E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 10:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C4DE6149F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 10:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D50BC43141
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665571904;
 bh=J8GYhkRxp61rEscDhFaTOr02vC6s3yGTPisNChv9++U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nq6vCoQpD9UX27WYz4fom3CxIa+MytvV3azAN0hjLGHYTQX4RUDyLJVJxIC7Y5Pga
 ly+uKylcV2AjJ6GJcpSr9EFFY9ip9OHe0/TF3AeA9Cp3WYKCfzyuK23hI/Wqi+um1i
 rFdarfCRG9mDKyYdF71XZzKS1HDfr7E8N5XNvdvA/FGenWGkABqYDnfpKrh08rugHH
 BjSfbGqfGqvX2y/txAulnFli7nymsrL/zdXLSEjbdGf0mK8agMDrU2SpNPU1x3xNvL
 m9UGLhU9JuOhU47m+Yzya7iuIQNRybPyqgydBJY1XT+fZLdTiORfk4QUoZP1g6Ed++
 0G2eC+JSuVqQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 61680C433E6; Wed, 12 Oct 2022 10:51:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 12 Oct 2022 10:51:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chewi@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-xTWgsRbmSn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #25 from James Le Cuirot (chewi@gentoo.org) ---
I do, yes, under Wayland. I did a system update recently but if the problem
reoccurs, I'll try that next. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
