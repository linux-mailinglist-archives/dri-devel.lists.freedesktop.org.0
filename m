Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB715387F79
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271466EC6C;
	Tue, 18 May 2021 18:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708E6EC6E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:21:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 984D4611EE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621362066;
 bh=eWHJp8WsOwtWaC0kVCbmpk/qT+cyEXJdrKsItOR6cMY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aS7POtMWKP0O07LlP7wGhrxHBw/wQuVqPhWMks8eHf7tkqvO8ySoHTGjLk+Cy23Np
 0eSipMlWPl8kZ/h3XUlhwmvHQ39ySWJiUaWiYj4gXRrNuz95cZZKczuLTpRQ3fHkUS
 OOjnO24zJNSjqitEbJSYEKHXwq7mtwKkg8TB/l/S7aWIFSgQwel0VDKUM34UJ789gQ
 QOTfGUMfzLOm2dHD+HurL8tXBkQAmg4thfexU69YilbZPEB47bvHeAVEao00YkZV5o
 qGzJ9lV49HtqNZwjcxl3f4XIlKHnZICChugCxXeJg3p1aorG1WVtlilCth4nnU9zaj
 hH1yaZdgsYS+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 89A5D6124C; Tue, 18 May 2021 18:21:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 18:21:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-RaOHVI00dd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #24 from Jerome C (me@jeromec.com) ---
(In reply to James Zhu from comment #21)
> Hi Jeromec, to isolate the cause, can you help run two experiments
> separately?
> 1. To run suspend/resume without launching Xorg, just on text mode.
> 2. To disable video acceleration (VCN IP). I  need you share me the whole
> dmesg log after loading amdgpu driver. I think basically running modprobe
> with ip_block_mask=3D0x0ff should disable vcn ip for VCN1.(you can find w=
ords
> in dmesg to tell you if vcn ip is disabled or not).
>=20
> Thanks!
> James

1) In text mode, VCN enabled, suspensions issues are still there
2) I see the message confirming that VCN is disabled, In text mode, VCN
disabled, suspensions issues are gone, After starting Xorg, VCN disabled,
suspensions issues are gone

I'll gather the logs those soon ( tomorrow sometime )

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
