Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B21662F49
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931E10E4FA;
	Mon,  9 Jan 2023 18:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED26B10E4FA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:36:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 529B961226
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A688C433F1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673289402;
 bh=P8EvQfBj7sRzapSAuj6KDpluLvgVjEMrhQwur/rSwsM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IocJaFPx1YF+JLFn3NehIKRsl99bCWRBSB2TGgouRTM1O98HUp+iIyILBcL/91H3G
 neuWcuMIOMdkAsYETaIKSpAvpFkYEl7kTKWS8twu8EX20rXtN8VIi2Pq0gP+IlHjWv
 mcfAHTtwxWd4ai/OFDoZ3fHawFzW/i1ZHmxm2eigrxAkTclBD/bXSaQhRPiJ11mkXe
 dY0jHyfbY26yTh3T2JcH81RiDGpZlw3pBW0tYYHMHZed5rZkgpZTDyefZL/Arl0E0r
 R6pjG8Jmy2T7Et8UcYTeoJ5z1iVsvuS2udYZAHI2rv5lCB8xK0aUs6JN9RvrEFSCm+
 WOZuw1azDk+iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5FF71C43142; Mon,  9 Jan 2023 18:36:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Mon, 09 Jan 2023 18:36:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edurayasmedina@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211189-2300-RLzaEFBcJA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

--- Comment #8 from Eduardo Medina (edurayasmedina@outlook.com) ---
Well, I'm a stupid person.

When I boot the computer, the splash screen always looks like if it's broke=
n.
But I put the HDMI output on the motherboard and now the cards are well
identified.

Now the color looks a ugly, but switcherooctl list shows the GPUs in order.

Sorry to waste your time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
