Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953AD6E1AE7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 05:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906A10E141;
	Fri, 14 Apr 2023 03:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F6E10E141
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:47:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68C9760A0B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F5B6C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681444078;
 bh=AX3yQLTRPoqJQcEoki7vjrxXu0yUQ6uC/j6CmgDO5Ho=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o1cge0qvwEGQ7rDPKyrnqBWTPU9QRtU3lQHCA8xlLaTS7SsVtX6/3fw6Q7yK6EqXG
 RDr/qLDiit0COZ+LKpygciuWsQuePhcOwXEdC/Gan426OrTfTzwb1aer2ELl4eyaSw
 e88v+yS+Gl6ifFOQWwx37U7YIN0myQVmh9jvvPyCOGftdlnJWK2VmAdoJUzMJIboxx
 RGEFj0j6ymYOaYLqnlKjXD9QA6RKsM127x+rFjmoxwJnONJMC5C6hveVxt98YFGGGi
 XSg3jxDBR5nI8GmUWxJFuoCN6fApNwRtsDbkz7Uax02nKGqe91AdmnoDBfZm6y6EUf
 L/NUz52NTHBzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7F303C43143; Fri, 14 Apr 2023 03:47:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Fri, 14 Apr 2023 03:47:58 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217278-2300-Nb9gVBZfm9@https.bugzilla.kernel.org/>
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

--- Comment #9 from wendy.wang@intel.com ---
Thanks Thorsten for your information,
I sent email and got response.
Jammy Huang <jammy_huang@aspeedtech.com> gave me the patch and ast driver r=
pm
package, we confirmed that it can unblock the kernel panic during S4 entry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
