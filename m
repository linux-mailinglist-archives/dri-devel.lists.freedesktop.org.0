Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D1431F80
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9D56EA29;
	Mon, 18 Oct 2021 14:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0736EA29
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:27:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26EAF60F93
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634567234;
 bh=U3SNOTGq5lhXEI1ZDUxbnoy0jOhBho6Wv0VZCO2wJow=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WeXRWrL4L5UaG4Fw7IqnyRXswmjHZx2ii4SP3CXz5hlOKOHPGgqIkTFNw10BZvZCa
 buiWL9oWDBmqtxRZMjYqOr3bUW5IJNZcShor5gclj97dP7JjOk1Fo89acE1D2/zDyu
 sPI6sYcAX8NmVKwqcgZjLh0UBymUtB9VrzvBA9Ozil0qYLx119GUDb6LZlIYM33qtl
 X8QlQ9epLTYwZd54k+x5pACWHWQcb8Mc2hkj9+Eow0BsQGWbdXY/JmnNAW17ckX2EP
 nO6EyUWKFpwcYy6campQrHwB1/ghnguiTE+gyM2RQ3MvLmJTNo0CO2tWkSg3Gs6HK7
 ntmeL/UetNd4Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 202B8610CD; Mon, 18 Oct 2021 14:27:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205649] Daisy Chain (MST) Session Crash after Screen Lock
 Resume --> amdgpu
Date: Mon, 18 Oct 2021 14:27:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@rauch.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-205649-2300-pucSjYxeXo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205649-2300@https.bugzilla.kernel.org/>
References: <bug-205649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205649

Michael Rauch (michael@rauch.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Daisy Chain (MST) Session   |Daisy Chain (MST) Session
                   |Crash after Screen Lock     |Crash after Screen Lock
                   |Resume                      |Resume --> amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
