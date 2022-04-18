Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75B504E03
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 10:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367910EE10;
	Mon, 18 Apr 2022 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E710EEDB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:52:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C48761157
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E6BCC385A8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650271941;
 bh=qfH/Qw9C7yuHeWIo3LzfEsD9wmJ5bDMoqQoUEOvMq6Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JAERGS4zRXyFN7u5S2mqEJ0GaOk0zyFbe/6fEtO611zcGCYgZUzNXeciiPcvl4fDH
 nbkWt7bWeuBw0P16jovksvPHW/2Q5qopHPWuHGEMLV36PIeA5lrDBscXd0IFHT8ZVr
 tKl3X+MLMNpPVq0ata9uHGNdcXILwRFi2lpbphszrF1sLgn4+Z29f6li/22FOqrcnb
 OpOo6hFFWPwMR5wPWxxULHUbH7DYb2KEX2YmrZDQulaMXTPBgLr0DMzglGYuuXgC0Q
 t762LqsuW2lGXLegRbwB/uuaprji9h5JQrT/mVdgMQgXK39oIwLfB2IIlwIIT3KWkn
 XGv7xIjIUWyCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DE6EC05FD6; Mon, 18 Apr 2022 08:52:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212499] nouveau locking issue - WARNING: possible circular
 locking dependency detected
Date: Mon, 18 Apr 2022 08:52:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212499-2300-aa9V3Kzeqg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212499-2300@https.bugzilla.kernel.org/>
References: <bug-212499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212499

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Sold the hardware, no longer able to test.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=
