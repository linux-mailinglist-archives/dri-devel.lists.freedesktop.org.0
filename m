Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C13E8ADF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BFC6E0BA;
	Wed, 11 Aug 2021 07:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8FA6E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 07:14:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BCCF160FC3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628666044;
 bh=U4wXu4xkJJrxIEOlvGsYSXBVDJWLo9Q+Gf5HAICdk+M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rzApFRGpo444S5SvzEoIcip3AZFYSU9NydyuMUUu5C3yt1hNvw9zXUQlHsg0Gr6wo
 p59VX3JJpFfzhek/X5euMxP1wD6PlDC0jDJh9e1UgOEDk5jJ6mUe7CnXLkjiGh0v0b
 1Tn5b6c/Q9GBLTw21AAhvvHIsWHyqlbhmSxOT31b5XfVZkkxvEeyF1hePf7LL1m5Ei
 hvAE5p7LIJ3Rq7VwCrC3LlVjDDgPIFOCsVL18ylzjmF/vhviiyFYwwIF9k7O4AGb7i
 3Pu0Uo3jwPJ6VgB6UJ5bFaEMjZ3IwzqKdma2LRV/0XaQmmd7Rq0nI9Ecz/EledWYZp
 YmnjA/eBrZs+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AF19560EE2; Wed, 11 Aug 2021 07:14:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213935] AMDGPU Renoir crash/freeze while using vaapi with some
 video types in some apps - drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
 Waiting for fences timed out!
Date: Wed, 11 Aug 2021 07:14:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabiscafe@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213935-2300-a7hklT0KYw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213935-2300@https.bugzilla.kernel.org/>
References: <bug-213935-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213935

Fabian (fabiscafe@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Fabian (fabiscafe@mailbox.org) ---
You're right. I was able to test with a more up-2-date version and it wont
happen anymore. (21.1.6). Sadly this doesn't fix my system freeze when using
vaapi in firefox. But that seems to be another bug.

Thank you for your help :) This one is resolved

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
