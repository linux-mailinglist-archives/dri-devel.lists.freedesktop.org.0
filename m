Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1239FCA9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 18:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E676E060;
	Tue,  8 Jun 2021 16:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90A76E060
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 16:38:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A38846128E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623170322;
 bh=5vUlkUHtrPzDk9cZp8EknUz2efvno5EwKAvulRNmWug=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JZUMZ7zVdrQ9Jj7iVNr2Rx/dNTNCkO6F7837OT2VT8nfOd1gc4QPL/nIgzNs1AmWx
 MKgMf/nvNu/6bGSVJt5CsnXx1uZhKzRQodxjHlkbUPXa7rO6XS5dkc/JXT51wdg4FE
 sXFCnMyP4n5BphdS/3CpEbdx/RrcWyuetufjIXXxbCaa6kvhkGi2/skDBkjRZJq6FQ
 pIec9X81ea9v+4Zwd1mRT1Y7BgURkiY9n6/JN8i5LC4lKm8rnXxbT9N9jYmiyAfipo
 dcX7BIF1Bva9RseJmHkLWzgMLgvVDsNtm2LUDJk5OL5g9+LY3b5fYqaExisXJCxblc
 jFQ7QgK5+Oftw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 96C10610D2; Tue,  8 Jun 2021 16:38:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 08 Jun 2021 16:38:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: meep@binary-kitchen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-Ga0S77lyq9@https.bugzilla.kernel.org/>
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

--- Comment #8 from meep@binary-kitchen.de ---
how about reading any comments ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
