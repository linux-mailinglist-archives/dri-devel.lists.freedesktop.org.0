Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD04F83FE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992310EAE8;
	Thu,  7 Apr 2022 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0710EAE8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:48:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9893C61E8B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6DD7C385AF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649346500;
 bh=ilRJgfx9RKv4OuE76zM9FtqS3eEQt7GGPKthvxZbh/Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uVC+OlpUIOpFCf0gu/IGoY3YkksDcGWdis0V9ZIMsE6MlSVPuCtYH9aWUTHAK/ZoO
 RF4USXb8ALS2+NYZ2WDvt6oH1rKd9+Lptzt26ClhT7JG+VaDZdHDE5cgDqxJalz+zi
 LmlCU9J7M35GnY+dTr9lkO+s7Oojrgg4/srWnNL3xs8uOpiD2ZVxZnAe5KFq3iKVq8
 ibhequgE0DAmw3r40X4YLuYryTTFa8laNtnva7a7gVZhoo2EKexLSA71GH/X7cHxSP
 X1I5EXU9Cvvq79Wcnu6UMH3WqPgzbjraxM92EL8mkOCya0btlgmONTkvhkoihxYdpy
 S9MOe1JUOihkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C50C4C05FF5; Thu,  7 Apr 2022 15:48:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Thu, 07 Apr 2022 15:48:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: pheonix991@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-jaenWaDKHw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Fiona Buckner (pheonix991@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pheonix991@gmail.com

--- Comment #21 from Fiona Buckner (pheonix991@gmail.com) ---
Seeing this on Ubuntu 22.04 pre-release. Ubuntu Kernel 5.15.0-23-generic.

> # dmesg | grep i915
> [    1.776895] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [    1.776899] fb0: switching to i915 from EFI VGA
> [    1.776936] i915 0000:00:02.0: vgaarb: deactivate vga console
> [    1.780003] i915 0000:00:02.0: vgaarb: changed VGA decodes:
> olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
> [    1.780279] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> i915/kbl_dmc_ver1_04.bin (v1.4)
> [    2.675796] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is
> disabled/in DSI mode with an ungated DDI clock, gate it
> [    2.681117] i915 0000:00:02.0: [drm] [ENCODER:120:DDI D/PHY D] is
> disabled/in DSI mode with an ungated DDI clock, gate it
> [    3.015399] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
> minor 0
> [    3.068397] fbcon: i915drmfb (fb0) is primary device
> [    3.427857] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> [   25.814835] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
> i915_audio_component_bind_ops [i915])
> [   26.218387] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04:
> bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
> [   52.090727] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04:
> bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
> [   84.800055] i915 0000:00:02.0: [drm] *ERROR* mstb 000000000a940675 por=
t 2:
> DPCD read on addr 0x4b0 for 1 bytes NAKed
> [   84.811156] i915 0000:00:02.0: [drm] *ERROR* mstb 000000000a940675 por=
t 3:
> DPCD read on addr 0x4b0 for 1 bytes NAKed
> [ 4814.933704] audit: type=3D1400 audit(1649342645.891:72): apparmor=3D"D=
ENIED"
> operation=3D"open" profile=3D"snap.chromium.chromium"
> name=3D"/proc/sys/dev/i915/perf_stream_paranoid" pid=3D44648 comm=3D"chro=
me"
> requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
> [ 7139.378349] i915 0000:00:02.0: [drm] *ERROR* mstb 000000000a940675 por=
t 2:
> DPCD read on addr 0x4b0 for 1 bytes NAKed
> [ 7139.388678] i915 0000:00:02.0: [drm] *ERROR* mstb 000000000a940675 por=
t 3:
> DPCD read on addr 0x4b0 for 1 bytes NAKed

Dell=20
CPU: Intel=C2=AE Core=E2=84=A2 i7-9750H CPU @ 2.60GHz =C3=97 12=20
GPU: Quadro T1000/PCIe/SSE2 / Quadro T1000/PCIe/SSE2
(forcing the Nvidia gpu through Nvidia Optimus because the Intel igpu isn't
enough for dual 4k monitors)
Dell WD19TB dock connected to the USBC Thunderbolt port.
2x HP z27 monitors. One connected to the USBC port on the dock, the other to
the Display Port.

Researching this error, I found this thread:
https://lists.freedesktop.org/archives/dri-devel/2022-February/342776.html

> This is normal (although not great TBH, I'm not sure we should be printin=
g an
> error message for that), it's the result of fwupd trying to probe the MST=
 hub
> to see if it's a specific Dell dock that can receive updates over DP aux,=
 but
> it's not smart enough to know it doesn't need to poke the DP aux ranges of
> downstream branches or non-MST ports in general.
> Would definitely accept patches to make this a non-error, or at least make
> this a non-error when the read/writes come from userspace
- Lyude Paul

It might be good to speak with Lyude about it as she might be the expert on=
 it.
 I hope this helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
