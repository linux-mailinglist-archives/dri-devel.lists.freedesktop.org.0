Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0A3B2DAB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4456EAB9;
	Thu, 24 Jun 2021 11:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34EF6EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:19:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9ACCE613C5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624533558;
 bh=D1Db5WO63djY3iVy1eBI2FCmZ4n1Gy9/smXZUMEIsKk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o+4pPO9Fx1l7OFX5Vs6RBsyI0NfIMI3Gq1erZvKRhcq7rojZ3lw8Ti6GuVmAqjkl/
 +fKkO+LcfIJgAc+Mb0qKFyLDiKkU1wsvp+JQRlCI7vY00D0Gpq9IkUAt6VsrKdaAuK
 oHMSUJAmjSE5nBijvkRYonweXOj9eccmW/BqClDYA8LhvjT8I3kjcVdUblNkSRNRa1
 JpSuD5hdAeNCCGQ6ZTypfy3R/0SQKn7352I+o2/UJvfU74YulGQTmNmjsLvros4pgO
 6wBkLbidBGO53KC5DRCM1nxN0li26RFsIk8WE3zr4SaRIPF5B0M2DKtjjMJZFwE+Vr
 phhIqCA214+Ig==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 94A19610A2; Thu, 24 Jun 2021 11:19:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Thu, 24 Jun 2021 11:19:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hagar-dunor@wanadoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213561-2300-rKCWPZZewn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

hagar-dunor@wanadoo.fr changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hagar-dunor@wanadoo.fr

--- Comment #3 from hagar-dunor@wanadoo.fr ---
Same on vega 64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
