Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28055B18D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 13:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E8B10F5F9;
	Sun, 26 Jun 2022 11:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9F610FBD5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EEBC60F85
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 747B0C341CA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656244511;
 bh=HUXTV2Kwc5fEZKwYgDFGL42Shu03A9/Js9btNx2cGqE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sa4Epc6OcTql3HDpLiQ0FcA3vlWFtkT62bkiK4PsLjF+DjHvkxfXu2YRvGUG5wgTZ
 /cjA86hOV6mfVW7/TPN/SRMDue2WFH1/mm14/XWMTRBKP5V+QVfspeBVVOiWLf96aN
 DTf7WEcOkCHx0LmulAfN6Rf6r1RxIGSCDri5xqbBfU5PhBrjwXvxNhj3YMxYEMQMs3
 zROeykNfI4R0zaaFUQrsjf2aDihDYISh1JdZFZHTkvsA4l1DVWEHJ000xesorXLo3j
 XTWeC8RwyAx2hORiJdiL8Lc+9E4DMM99zY9IXElLThkkuUlJgbHWLEUtiCWaijm2Yt
 dZ2PJPwUZfkIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 626DACAC6E2; Sun, 26 Jun 2022 11:55:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Sun, 26 Jun 2022 11:55:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-216175-2300-qQqmX9facT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

nobutarounosuke@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301278|Attachment-B                |Journal: Attachment-B
        description|                            |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
