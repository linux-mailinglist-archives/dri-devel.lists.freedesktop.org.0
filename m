Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1475712833
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 16:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A876B10E0C6;
	Fri, 26 May 2023 14:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AA110E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:27:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4243764D79
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB1A0C433A0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685111251;
 bh=75NoWERCJOIl4/N1jQWaUOCV0e2WhSMOzotpLKTMXnM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eZyCLMKdOxIoGxAqGrB0XLElmZwvd0ZWDJI+vKbKhsjpTY0+1/gIQjn/t+BumklQM
 BHKcgQNS/4novsV+S9rovOZ7CxRJZyJxE3OJNe4bk6AaVtOOUjEM56ENjg0FXJciAP
 NndnU+frwIN7ejMYx+hxf6ruNXxQZCDh33QHcebOUc80LeUU2ecljQh8Hj21045UQI
 KzaDtEqTle+ehvxSjUmbCwn7TT4r/+j9VAnssr8TDCTl3vwtk4UwhLSze6YlY9t4Cr
 eCcppxa1SWRXUQ02RfFCUXxDPgNkbqiVBGTzbv9Z9hbR3nwaUwKzem/YSzayVQl+5d
 QuDDL+paaI2FQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 98283C43142; Fri, 26 May 2023 14:27:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 198907] Backlight control missing with /sys/class/backlight/
 empty
Date: Fri, 26 May 2023 14:27:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-198907-2300-gCx9BIRmG5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198907-2300@https.bugzilla.kernel.org/>
References: <bug-198907-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D198907

Jani Nikula (jani.nikula@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #7 from Jani Nikula (jani.nikula@intel.com) ---
Closing this ancient bug. Please file a new bug at
https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs if sti=
ll
relevant.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
