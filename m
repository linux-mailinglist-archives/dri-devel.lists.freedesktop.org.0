Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF041780A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4686E1DE;
	Fri, 24 Sep 2021 15:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BCA6E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 15:53:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E536A6124F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632498815;
 bh=TbPdrWlKDCWp8NwydLHQ/TETvUJI0W4HQrKvg4DXRBA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hgjqlvnie7q6t40TC9ymZeWkWHS+mR+53UNcfuGjPVT07bqrz5BNHtfS/VWxdrhnb
 n9Bgdphb2gb0ej/ew6jVMQZbMkrw0AkDODSidQw+KjBCaYEoIMscgh7OltZAK/dYL2
 FCUIlJ0GM8ljtSetQyPNim0lzMOSFH8n8E8V05DSc+6rJelL/P9ErksN6NiTbSEk92
 Snc0njk2A+ivR0aMoEl1SAaeqKELzQVkqdMumdzUUm3il+3Ez4GFHClw6zVgD3rvh+
 IV169lDYdcDOTwy+ZoBXY2ltkAfH0tToOANjfKLSKfsmR6UEvl+21NXTFefN4O0CVL
 KZoshRttdpyiA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E289E60FF3; Fri, 24 Sep 2021 15:53:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Fri, 24 Sep 2021 15:53:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danielroschka+kernel@phoenitydawn.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211425-2300-R1O2EJFwYy@https.bugzilla.kernel.org/>
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

Daniel Roschka (danielroschka+kernel@phoenitydawn.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |danielroschka+kernel@phoeni
                   |                            |tydawn.de

--- Comment #21 from Daniel Roschka (danielroschka+kernel@phoenitydawn.de) =
---
I got the same problem, although the symptoms differ slightly, probably bec=
ause
of the monitor in use.

I use an AMD Ryzen 5 PRO 4650G with a DELL UltraSharp U2713H as display.

As I started to use this APU with Linux 5.10 I had the problems from the
beginning. Here is how it looks in my logs:

> Sep 24 10:13:02 localhost kernel: [ 1200.673943] [drm]
> perform_link_training_with_retries: Link training attempt 1 of 4 failed
> Sep 24 10:13:22 localhost kernel: [ 1221.274959] [drm:atom_op_jump [amdgp=
u]]
> *ERROR* atombios stuck in loop for more than 20secs aborting
> Sep 24 10:13:22 localhost kernel: [ 1221.275078]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B228 (len 3608, WS 8, PS 0) @ 0xB376
> Sep 24 10:13:22 localhost kernel: [ 1221.275171]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B11C (len 268, WS 4, PS 0) @ 0xB16F
> Sep 24 10:13:22 localhost kernel: [ 1221.275264]
> [drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
> dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command tabl=
e!
> Sep 24 10:13:22 localhost kernel: [ 1221.311894] [drm]
> perform_link_training_with_retries: Link training attempt 2 of 4 failed
> Sep 24 10:13:24 localhost kernel: [ 1222.528157] [drm]
> perform_link_training_with_retries: Link training attempt 3 of 4 failed
> Sep 24 10:13:44 localhost kernel: [ 1243.230246] [drm:atom_op_jump [amdgp=
u]]
> *ERROR* atombios stuck in loop for more than 20secs aborting
> Sep 24 10:13:44 localhost kernel: [ 1243.230360]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B228 (len 3608, WS 8, PS 0) @ 0xB712
> Sep 24 10:13:44 localhost kernel: [ 1243.230453]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B11C (len 268, WS 4, PS 0) @ 0xB16F
> Sep 24 10:13:44 localhost kernel: [ 1243.230553]
> [drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
> dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command tabl=
e!
> Sep 24 10:13:44 localhost kernel: [ 1243.265681] [drm] enabling link 1
> failed: 15
> Sep 24 10:14:06 localhost kernel: [ 1265.165859] [drm:atom_op_jump [amdgp=
u]]
> *ERROR* atombios stuck in loop for more than 20secs aborting
> Sep 24 10:14:06 localhost kernel: [ 1265.165971]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B228 (len 3608, WS 8, PS 0) @ 0xB712
> Sep 24 10:14:06 localhost kernel: [ 1265.166064]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B11C (len 268, WS 4, PS 0) @ 0xB16F
> Sep 24 10:14:06 localhost kernel: [ 1265.166157]
> [drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
> dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command tabl=
e!
> Sep 24 10:14:30 localhost kernel: [ 1288.496778] [drm:atom_op_jump [amdgp=
u]]
> *ERROR* atombios stuck in loop for more than 20secs aborting
> Sep 24 10:14:30 localhost kernel: [ 1288.496903]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B228 (len 3608, WS 8, PS 0) @ 0xB712
> Sep 24 10:14:30 localhost kernel: [ 1288.496996]
> [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck
> executing B11C (len 268, WS 4, PS 0) @ 0xB16F
> Sep 24 10:14:30 localhost kernel: [ 1288.497101]
> [drm:dcn10_link_encoder_enable_dp_output [amdgpu]] *ERROR*
> dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command tabl=
e!

The behavior I see is the same black screen after the display gets switched=
 of
using DPMS, however it doesn't recover on its own. I have to manually push a
button on the monitor to re-trigger input detection or even completely power
cycle the monitor. That also doesn't work in all cases. Having the monitor
configured to use DisplayPort 1.1a it works most of the time with the menti=
oned
manual intervention (however the success ratio got worse when I switched fr=
om
Linux 5.10 to 5.14), with DisplayPort 1.2 it's completely unusable, as it's
like a one in a hundred chance to get the monitor to display something agai=
n.

I'd be happy to provide more information to further debug this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
