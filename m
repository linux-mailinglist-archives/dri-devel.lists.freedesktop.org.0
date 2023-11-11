Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA067E89CB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338F10E107;
	Sat, 11 Nov 2023 08:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45510E107
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:17:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D653ECE0016
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71879C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699690676;
 bh=E8Qt9sy+qig8deG0UX4hFh3zJWze/MK5Wzdhkf/8v4w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IAZQVxTlgVuFvZ2s7j+VxRMfcQY2+Hx2z6hOKZYAtc7Cx0B7bPVu7JUpDl8UljURs
 ZK8ygKzL7E3x3kIACkxc3Hmcego84/aMS7GMGQpjAb0qR6Nh+bg58QMIDMZUS+QBMA
 bSrMPTHPzuXWs6HCWrED/JggJPGE3aT09xBl372w4Zdx6Qkas7aRNKtEI4x9CHmQ8T
 YTvIW66+wEdLjTM7z7xwDuWR+34Q49kJ9tDuS8G2TBc6vZyy2CO8/30CJCjVjKEcuc
 iq8mYAX+qJkZBIneFLt4L19w48a49XGF5DOWdJRV2r0AL6Rlgj4CZ2LaU4UTKfUY+w
 4Fjoz+E3nmBBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 61CDAC53BC6; Sat, 11 Nov 2023 08:17:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] kernel panic when opening spotify/firefox 6.5.0.10.12
 ubuntu 23.10  vega 64
Date: Sat, 11 Nov 2023 08:17:56 +0000
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
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218133-2300-aTG9SJa8R1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218133-2300@https.bugzilla.kernel.org/>
References: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|Linux version               |6.5.0-10-generic Ubuntu
                   |6.5.0-10-generic            |

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
If you can reproduce the issue in vanilla 6.5.11 or 6.6.1 then report to
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
