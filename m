Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF843772B3
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 17:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7005E6E0AA;
	Sat,  8 May 2021 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A456E0AA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 15:45:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 619386128B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620488715;
 bh=kIxnlhOH+2tRsae0qZPeecvQRScvYtzDeLzs5PlkZH8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ztxisb3ID+fUGCaG1wZILpfWTOYUc4Xx/ySz46eDvFyAD5vFA9r7HghriWyOLjmH/
 a0u43NmkHaMw6g9KJKYIUowvOn5OEOZIE+gyt4rW/xZjsTskmT0mW8WXyCwPpYJBJf
 kzwj9FOIR+QoXVtk/husXBThL7soCF+Md8U7BER5UiUrCmOcXIJR5FRu3z9c3jbceR
 IO7dpNF+je6cA7UooO+qe2Q51fMdvstmiOEhLFfEZpUl71OgnIJQCO5UTiWkwfW3Vj
 jR7+Fd5m/pSS7Dl8B8x46uyM08/TDp3RTHlyTeaAT5Xdh+iWgYoiRdhAgNnlxyEXrm
 zZJOT+JVGbGAg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 58E3F611BD; Sat,  8 May 2021 15:45:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] [radeon] kernel NULL pointer dereference during system
 boot
Date: Sat, 08 May 2021 15:45:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: arvin.kebob@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212957-2300-M7syWylYuJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212957-2300@https.bugzilla.kernel.org/>
References: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

Arvin (arvin.kebob@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |arvin.kebob@gmail.com

--- Comment #2 from Arvin (arvin.kebob@gmail.com) ---
I can confirm I have a similar issue on a laptop with AMD dual GPU (6520G +=
 HD
6750M). The system boots to a graphical desktop (MATE + LightDM) and works =
fine
until I open a program with the discrete graphics (DRI_PRIME=3D1).

Going to bisect once I get the laptop later in the day.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
