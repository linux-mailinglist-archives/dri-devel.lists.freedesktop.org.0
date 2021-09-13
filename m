Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844F408640
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298966E135;
	Mon, 13 Sep 2021 08:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BF66E135
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 08:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0071461029
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 08:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631520902;
 bh=x3/vaXaNQ1f+pSmS1ZBHt2I0SBZEn4eIhcEst2f272Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VFdg8RvArzXHsFrk9sVim/R+IuNiTUPXXNEmZECxvcMgErFwN+N9Xfr9uMzu2+8Op
 LqiAAjFQRDAqQ+tSH4kqyAKGoZs0Qx5lgUxArZwOZotanCyFqZ/r8rS2VRJYFmryLV
 eQhxlSWIwHFJqZlzQeBY3btk7dBCE0tg8SsRaSjNpF0riVIZ+vLNKrNShp5WBRFUuc
 Wq5rpf1Pw8cPmB3Kb3iItVguYTP9FLjdKoFW4KuLVQwUgQTAL03TJAqqZzzF1eXhpd
 o2B35g/LfD7Sn0QBf3Y9BTIVyvqOsGvuCL00qHmOV9rnKdRe3Owsq37ZdlyxI2kmuB
 Z7vFhiQbWYIUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E9EC260F5D; Mon, 13 Sep 2021 08:15:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214375] 5.14 Regression: Null pointer dereference in
 radeon_agp_head_init
Date: Mon, 13 Sep 2021 08:15:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nirmoy.aiemd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-214375-2300-qGpBh0Sjc1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214375-2300@https.bugzilla.kernel.org/>
References: <bug-214375-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214375

Nirmoy (nirmoy.aiemd@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nirmoy.aiemd@gmail.com

--- Comment #1 from Nirmoy (nirmoy.aiemd@gmail.com) ---
Created attachment 298765
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298765&action=3Dedit
Bug Fix

Please let me know if the above patch fixes your issue. I don't have a card=
 to
test but I think the issue is we are passing an uninitialized drm device
pointer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
