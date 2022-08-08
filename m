Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1058CC66
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C03110E0C7;
	Mon,  8 Aug 2022 16:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB1010E0C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:53:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B84166115D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BC49C433D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659977627;
 bh=+IolhOUwjnTiIdMX74RIoSTrunV5auYZu3ijNGyR9hU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E3MRtt+Hxilju1l+jibDt4irQpdXcedr9rS7Xf7w84xxp6ogRDzrwuL3phiLQ9vTN
 hk5m0DWBqLIQ9j93xchvhDj6465PVVG8mjRCMo2ZF+3u/W2aIITGbgBofWtfq3xwu1
 YTM1V6MVdEx/MKNZZnL2AmZIS7H3vTWh+asDugCd+CYBdvcQt8SpJYr4RsFhPPCjCD
 rlLfwY9V/eeJM8C2Ufdzae6YC4cLufyeDTTZhjV4mm2ylV+4u61+WOQrjNixBwinX1
 aZnQCDAQPBVaH8SiC4sHuozJ83D6xnnG+uyUB0SJauTRqgsYPTNSkD0Z1E78G2TbJn
 haCocvyznpuSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EE1A2C433E9; Mon,  8 Aug 2022 16:53:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Mon, 08 Aug 2022 16:53:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216092-2300-z13EIqtIlg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
See also:
https://gitlab.freedesktop.org/drm/amd/-/issues/2110

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
