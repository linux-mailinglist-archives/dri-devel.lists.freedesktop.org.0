Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498B78749B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E056510E58D;
	Thu, 24 Aug 2023 15:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7913210E58D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:52:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBB8A65D76
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACACBC433CC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692892373;
 bh=iEHrDrWTIldIwcHIejNDW1fFJ/Mxmj26uyj0zuXyxao=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rxOfG+kwDnJi9nOPxjT5dODACNdHWipj33H83ShaLRmfh8BJkZmHdjMvZOjp9HDIM
 lVO2p7hVeQiobSwuMsMuZNsGTueLpI4Z2icQYbhatoGKwYjsG1NyoUXyFwLo2NLUeo
 kXiWYI13k5kNiPDsa1qtG3BM4yw+FQzE/HAYUVXWvnaFZPYE2kkxqkG8AFkgmyXYC5
 tXP+OgcKJdkzpEN7/BJuhwIEnr2Rvbr2u/u2CudfMiMeVDtDv3fFk8kW3ILCSkG/1n
 nah5GPsFe/Z+EMA/Cjbu+eoudlSC+P0WUAFBErs7KdyPOKDrFovpvLFeqOFremBo4z
 W4j90Ft/yaMOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9C33BC53BCD; Thu, 24 Aug 2023 15:52:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 24 Aug 2023 15:52:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: priit@ww.ee
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-LrpCAFBk7p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Priit O. (priit@ww.ee) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |priit@ww.ee

--- Comment #89 from Priit O. (priit@ww.ee) ---
AMD Vega 64 (vega10 chip)
kernel: 6.4.9

linux-firmware: 20230724

# graphical session died and had to log in again, computer didn't boot
though...
aug   20 02:11:06 Zen kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng
gfx_low timeout, signaled seq=3D368426139, emitted seq=3D368426141
aug   20 02:11:06 Zen kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process firefox pid 414636 thread firefox:cs0 pid 4147=
12

linux-firmware: 20230810 (upgraded it... although there was no "vega10" cha=
nges
inbetween)

# just freeze for like 30s and then it got unstuck again.
aug   23 23:09:24 Zen kernel: [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR*
[CRTC:60:crtc-0] hw_done or flip_done timed out
aug   23 23:09:34 Zen kernel: [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR*
[CRTC:63:crtc-1] hw_done or flip_done timed out
aug   23 23:09:44 Zen kernel: [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR*
[CRTC:66:crtc-2] hw_done or flip_done timed out

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
