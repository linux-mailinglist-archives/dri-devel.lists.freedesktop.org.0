Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB96E7173
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 05:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2310E15A;
	Wed, 19 Apr 2023 03:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EA110E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:11:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01789610A2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69011C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681873879;
 bh=XoSmY6aVZaxxpYlw9iniuHdt2k3y/vI2aKOetYx9KG4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OMSZlcIdPhSXyVmT6ISeYHDgDPMnb2kryiAdzBjg0IqKBgCkIaHa1hIDN0qwOZgKt
 993iqgZ+BjIoYET5yHn+q5CYhpr7id4UL8QaY8cdmB03h/k4H/DyIVNzPVkWPk5V+5
 olrtBO4PJFkF1Jklo2QZ2xSMV6+ebbstGLPp5gzw+5jVV2g4PYjvJruff0Ots9sbXn
 JQSQXLllMtSvKCnvJaRQqQ2MhbV804RX2FiJGnJ77CwdEZPE+aaoY8JR4JH+YIDZuV
 ZXUuCMlU2dUCb2yYQo+RDmrVyaspqDHvSxaHyhBaOaIIanTIzBvGb7E08OFdvRHa4z
 vEEOiKwP6bACg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4DFC5C43143; Wed, 19 Apr 2023 03:11:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Wed, 19 Apr 2023 03:11:19 +0000
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
Message-ID: <bug-217278-2300-6h6pHgV2Oz@https.bugzilla.kernel.org/>
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

--- Comment #10 from wendy.wang@intel.com ---
https://lore.kernel.org/lkml/20230414074204.5787-1-jammy_huang@aspeedtech.c=
om/T/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
