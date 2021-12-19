Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38947A10F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398BE12B537;
	Sun, 19 Dec 2021 14:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FA412B539
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:58:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A49060DD4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF04C36AE5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639925883;
 bh=WMD5T6e0f4I+x0gB7pMVfLdtt6v5Y9Y4ZvaUj00JrR8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WSoJ0ruBEMcKeuySz4dzrHv0Xi/Fj2xDJNFSVPyUNLSVy2SQmRcEe0wzKHj/RXzfh
 pIZNFKjoAD2VA+m680svxAUcboStTK53TL5hMxhizBfEKuKv8ziunRZMeYL8wHviqf
 a73OxdPqjS4Sx0/UanV5o4uV//g9hLVWGSYMuy9z9JB+n/sRzdA2l77JKhIsJ2xTM+
 l7XPFSeD6mzegTLwa0WBGd3r8WDpOs89zUzLHYk8xdh/yGDhh/yP1rcICcd/fxaWav
 tvfkiRFavM9Y4JaWaj1MuD6rfhFeW5NuDzV/jPWC+xip7x6zsI0JW5gQfzZ3UU/0sJ
 Y2MdLfAP7IfgQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DFD28610E5; Sun, 19 Dec 2021 14:58:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] AMDGPU Driver with Radeon RX 6700 sometimes can not
 find display
Date: Sun, 19 Dec 2021 14:58:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215223-2300-DGoreBNf1r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215223-2300@https.bugzilla.kernel.org/>
References: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

--- Comment #5 from reznov90210@gmail.com ---
Created attachment 300077
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300077&action=3Dedit
journalctl -b - 1..4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
