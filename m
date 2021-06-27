Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02DA3B5248
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 08:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28A26E067;
	Sun, 27 Jun 2021 06:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC66E067
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 06:09:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D7B3761C34
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 06:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624774143;
 bh=jpHB8StJo30SiY2Yu1HgoHSEGkfI6+MCh17T7okmNEU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fyVx7AX9CgKq0XXRUcbrAEFKFArUFyNW1oEbvVtSTo6R039qxuI4QUjcG9I1/iKzW
 yfBmHA/uX5GCs2Inpk9VJLjaSonXh3AxxapHMwaWYtaeQR9vCpu4RJnA6U0A93HaYL
 sWp2OqkwypzCO0YSABCisIy9N513K8F/Un4936zAQ8yjBWVEy9oVH8D+R20Nc+RhUH
 IhrkBOcLbp8cQ2YtKSBFzeNJOjo7Ayi9VN7fS6AnycPjauyTlxwM1eWjjM/u8JY58m
 LTl1p5fLmzQ0fzzXj3m+1keMRHfR06SeyQISfNvY6wQRTIHggoKIh2SX5YeYw+l9Ko
 jvMP9vbIgHDbQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C7AEC61222; Sun, 27 Jun 2021 06:09:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Sun, 27 Jun 2021 06:09:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mrjameshennig@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213569-2300-LEBrGRxYBT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

James (mrjameshennig@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mrjameshennig@gmail.com

--- Comment #3 from James (mrjameshennig@gmail.com) ---
This is a legitimate bug which is present starting 5.12.13 and the issue was
said to have been fixed starting 5.13-rc8. I wanted to comment out of
reassurance that 70=C2=B0C edge temperature for that GPU cannot damage it. =
Notice
"crit =3D +97.0=C2=B0C" which is the throttle temperature.

The computer should shut down at the "emerg" temperature which is not prese=
nt
in your sensors output, but should be +5.0=C2=B0C over "crit" for your GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
