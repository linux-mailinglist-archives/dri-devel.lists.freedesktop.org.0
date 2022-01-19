Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70DE493A20
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE46A10EB2C;
	Wed, 19 Jan 2022 12:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF8C10EC18
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:13:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7154061627
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2EE5C340E8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642594433;
 bh=4V3FXAr0VDbn+wtOvoIOF0ou3o18JBhhVRagxfEf8io=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=q7UT7jsJgqV02OdQlgOz+TBhgCmRHrpWod/3wpUIA2uRV5iItV0TWOwzAkzbLB0L/
 d8HzvYy8/CXSGkRTB0eVksegoafhCXyLXEW1Uvweyo8ZA5uv/WiySRBK06jHNYGz/J
 VuKrNAaS/N8kDJ/c01bpqzRDWRSaXU3jdSvyYbU7sIY2AX0Lg/lZQdg3WELzzsnAbp
 d8zcZ2240+t9ASGLR0eqLN24zUZ0rCtXWcgiTFKYBOMb5FBqY4kbvgHQou7mqJrxn3
 /cyBohwr24VGmCE4Vr4VJCgkQDQ2VOcjCiosBymYycIClKEF1xXx9wh5r4dd4ONHiV
 7tvO32kTDvciw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B376ACC13B2; Wed, 19 Jan 2022 12:13:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215499] AMDGPU: Tahiti flagged as "[drm] Unsupported asic. 
 Remove me when IP discovery init is in place."
Date: Wed, 19 Jan 2022 12:13:53 +0000
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
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215499-2300-wu6sTkqIQH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215499-2300@https.bugzilla.kernel.org/>
References: <bug-215499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215499

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
https://gitlab.freedesktop.org/drm/amd/-/issues/1860

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
