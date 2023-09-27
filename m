Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7A7B04D0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AD910E4F9;
	Wed, 27 Sep 2023 12:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1E10E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:58:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 22F57B816F9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D259C433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695819513;
 bh=JmJJ/bGn/So3repNbLoseT8qmNkHQvFlM/x33q6HHBo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=X5+JZAczSDyf+ll4qZ3F4F36psIslsFxczftybsxcyNzhdVWYUVaYNcqG0tHGct/P
 XnAXZzHbsvJ4r9fW+zPDKi2roQ4C1JCqnEEh7U0QypmYPNlm2RtqRl3ikH8QEAUxJ6
 aqAbhciCWXeHQC96+odlBkwLjFcwnzW0O1MXzY+4zmSfulqIkSJgLWNSh0iZT6kZgn
 wADtDi8FrP6z1ccBwBe+/wx5khbEtow3Q7rmGo9DtmuMdM76nmIPJzIMH8Gl9Pz6FW
 RKm6gGFhR4uK5ALz/ywENEWje+7+IsAHr40aLNC1jDhneyAX5mU6qWIjTi/OISBSKh
 /oU2/5cT+lyag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6A9BFC53BD6; Wed, 27 Sep 2023 12:58:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206347] amdgpu.dc=1 breaks power management on RX480 and others
Date: Wed, 27 Sep 2023 12:58:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206347-2300-8AFu0Qs5oG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206347-2300@https.bugzilla.kernel.org/>
References: <bug-206347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206347

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #6 from Artem S. Tashkinov (aros@gmx.com) ---
Is this reproducible with 6.5.5 or 6.1.55?

If it is, please report here: https://gitlab.freedesktop.org/drm/amd/-/issu=
es

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
