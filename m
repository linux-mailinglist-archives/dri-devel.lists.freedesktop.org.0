Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434C72C7E7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41D810E27A;
	Mon, 12 Jun 2023 14:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D50710E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:16:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D139629BB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F01C5C433D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686579360;
 bh=hZ3K3Lq7DWyoGYuor2eE8JkVxVSThQ24Wh24Eo03q5o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iLyOOSRfzR4WowF8jSogCc3HHlDehQxj0rOgSa9PqRz2dL3Xb8RFIhEMtp6xJ6YYN
 s4VY3Bf9UJjCWD4ArzeWHOiShmKaSC+DnQU80oeR/opu11fzVnpwmLblRnluUkPTyl
 EEm2p+fwq3I9VO/Quwv9cLj5ESBYtQqHtJMewvdQX9BcLdqUVPOfuGNZkPtuhZIGRw
 vw1QQBnVS43k5hEq5ONXDdscSTt81S/Sno3eEOeWFSFPl6LffqFwTYVk24HNitzHAe
 ViODLZEpY4aYPvdOXEZl0Yix6nu3wRYOH074bBGPhMNxlaNWWy0FjSUqqATdUB9odV
 O0ShV31++ggzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D25D1C43143; Mon, 12 Jun 2023 14:15:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217545] Serious regression on amdgpu
 (drm_display_helper/drm_dp_atomic_find_time_slots) with two DisplayPort
 connected via a HP G5 docking station
Date: Mon, 12 Jun 2023 14:15:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.bpeb@manchmal.in-ulm.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217545-2300-RfH2tA4iTK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217545-2300@https.bugzilla.kernel.org/>
References: <bug-217545-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217545

--- Comment #2 from Christoph Biedl (bugzilla.kernel.bpeb@manchmal.in-ulm.d=
e) ---
Created attachment 304406
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304406&action=3Dedit
kernel.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
