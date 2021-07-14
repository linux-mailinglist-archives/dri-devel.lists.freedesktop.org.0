Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD33C8A42
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39B6E45E;
	Wed, 14 Jul 2021 17:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4196E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 17:56:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C68BE613D1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626285369;
 bh=ZDrZVqdbiqv5nfg6rbaY4vPLlld3BJS6MlFZRoMrc1Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=le+GVJ9N8bN98ANdButPEFWEVvPyiePoiE+OXrkhFIq2sxHTZ08pHKe1EU7JTW91I
 uMMmvx6+D7JM2ODpjW/fQXxZRz0NQmtAkvIDCQ6mn0znM+MLmDCzKOy3QJ99rDQHrT
 eZamuz8Tq/+oLFLDWARxmVuWlKIX1pG2fXG6340htpRT0eGwZJIfp71T1ISFZtsJKH
 y9zauYpghBghiNeMzwbUonupuQZsAEKYGs9CUvfkRFqQjI8F0wc+uaAnNmP3ZSdft8
 nThTBGw4FmBGTyxsdhyS/hdZlk0qWDpJemzHLBly52i64ZhCkdr+pTWLYe7JTpEoJb
 Gn2He82twT/5g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C2AFF61287; Wed, 14 Jul 2021 17:56:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 14 Jul 2021 17:56:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-qpyORPkx8b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #37 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Alex Deucher from comment #32)
As you asked about the firmware version details, I upgraded my linux-firmwa=
re
package to see if the problem would come back and it came back. So, this ti=
me,
I could attatch the kernel log for the amdgpu driver and the amdgpu firmware
versions details as of the crash event to narrow down the issue. By now, I'=
ll
return to the older version to make my system stable again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
