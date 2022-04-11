Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BD4FB0ED
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA26910E266;
	Mon, 11 Apr 2022 00:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDAF10E266
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:06:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5D8C60E8D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C83EBC385AC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649635578;
 bh=wO43+tfYpyvv7kGS/BuqXT4nokVS/4QBzhOQzz0VSz8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qoZjvipibZvMCbKEhGfkmPG9WmzMKIUnR5gs3ve1Ex+AVzY4/HfamaDo6zRgt6zbQ
 Qn10HqapqSGfbu0S7Yxk3BEcvkjdRNaQKHhkaTFcnYt2CKklPJ7NOtAP4tHJQYQolB
 3D6xWHq20lNnOjP4ZpdnoRW1RyYfvRZ7fSWhiKsGfJR2yx3yYM0NsaOgmOhZ1PyS7n
 cDNOtJh0oPMy4Ean4eC5aedSW9s2nqjI6p56flx58TLL81s7+vP1HrHsu6hp284Pk+
 yjK/vPg0WQxnBkXB3YC/2sBtN9QDrgF+nFJS4sqJmMvOujty8KFOaZx8i87GpkHSbT
 E/7Ywiot2EljA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B81D1C05F98; Mon, 11 Apr 2022 00:06:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Mon, 11 Apr 2022 00:06:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: barnoid@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211425-2300-w23VhEDc8b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

barnoid@gmx.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |barnoid@gmx.net

--- Comment #25 from barnoid@gmx.net ---
I have observed this as well on a 5.15.32 kernel. The system is equipped wi=
th
an AMD Threadripper 3970X and 2 x LG HDMI displays connected via DP (4K@60H=
z).
The error happens when powering-up the monitors after a long power-down per=
iod.


>[122427.564568] amdgpu 0000:03:00.0: [drm] Cannot find any crtc or sizes
>[122427.603599] amdgpu 0000:03:00.0: [drm] Cannot find any crtc or sizes
>[122427.954560] [drm] fb mappable at 0xC0E00000
>[122427.954563] [drm] vram apper at 0xC0000000
>[122427.954563] [drm] size 33177600
>[122427.954564] [drm] fb depth is 24
>[122427.954564] [drm]    pitch is 15360
>[122427.954625] fbcon: amdgpudrmfb (fb0) is primary device
>[122427.954759] Console: switching to colour frame buffer device 480x135
>[122427.954763] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer
>device
>[122482.729791] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop=
 for
>>more than 20secs aborting
>[122482.729839] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR*
>atombios stuck executing C220 (len 62, WS 0, PS 0) @ 0xC23C


Ctrl-Alt-F1 and restarting X (i.e., the login manager) is sufficient to bri=
ng
the system back into a useable state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
