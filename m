Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5006D354F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 04:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712410E1D1;
	Sun,  2 Apr 2023 02:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6471510E1D1
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:54:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82D64B80DC8
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38D0AC4339B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680404091;
 bh=jIaANMhLzx7Yzu4LQsd3oJYX3646x7iUcZYSJOCgUzY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UQR5WSUa1Wy6dWroAXqmjAjewWNAXYJe08PBn08AsB8av9CBRfZIYYP5qZHSCo1WY
 8ngubBqtuuNbUzioMqnBEO+2QFrnYnJ/NqmVxFTDteJpT5XvQWQVRZwLGM8xbCdET/
 mvdfNy5T0ulXl1SS8ETPTAOVaAFEsGrqu+R3H2wpoL35iJmdgO3ZF9nU/6iVij6qUo
 eGkTUV9ugrG7PxFIvFgbMXY3JoyJAz0l+UU4qlGGqH4gGfSYvBWJOIGHRnvzwDtdVl
 398TQvIfMtJ9poWPziGYoduf4sNxr1V7uk6ndPLfnA56zGC/nuQEEmXu0Hs27dvzqe
 0rG7D8ZjBAl+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2798CC43143; Sun,  2 Apr 2023 02:54:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Sun, 02 Apr 2023 02:54:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217278-2300-JdwNd8hGTH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

--- Comment #5 from wendy.wang@intel.com ---
Created attachment 304076
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304076&action=3Dedit
Failure log in mainline v6.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
