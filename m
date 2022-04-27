Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB27510F02
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA00F10F19E;
	Wed, 27 Apr 2022 02:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847A10F19E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:52:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C1B6B823A1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE85EC385A4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651027925;
 bh=iLSj+OEnql/VF2LDUelAYRJpaxyZ1dUS+28EXMrsx9U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hK0MLFfCz4ULpvhVuLJVNxakzFPpEN+uPFPjg3afdZlN7U51CFACbWNmfVrrkTYvP
 IIT9wI+UTWYym73JbVeYwbAzYE/ib6NLZFOEuoZRdx1RoBnlHhwGkQ6JozjqLC9wnT
 XDtFTL7bAxYs1fZ9dyBV3QizBWp2zp/E2ewzICet9z8xiHm2r05z/nf9PA7ZZt0uZ3
 J90Amxc92AEQ3TAYPr+Md0bXucHidpD+CxjjPObs3mDatgyaSUA8SmR+l67tEC6SRx
 7JOvI7UdWms8Py0CBd1r7sHEu4hvcXZFDEeK3tUiBcjxVzWWUM611j3nRtkkpAKBuf
 WjVyJtzQo6DlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C83B3C05FD5; Wed, 27 Apr 2022 02:52:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215892] 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
 *ERROR* Failed to register vline0 irq 30!
Date: Wed, 27 Apr 2022 02:52:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ulatec@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215892-2300-X45PlJNfQR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215892-2300@https.bugzilla.kernel.org/>
References: <bug-215892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215892

--- Comment #4 from Mark Johnston (ulatec@gmail.com) ---
Created attachment 300815
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300815&action=3Dedit
acpidump summary

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
