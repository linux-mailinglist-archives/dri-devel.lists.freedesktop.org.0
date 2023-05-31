Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B211571877B
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8A10E4F6;
	Wed, 31 May 2023 16:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8B210E263
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:35:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B176D62FDF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20F98C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685550926;
 bh=GGACWPzoSkwrgfdt5jG3WC7d6LJzGxGJJjWuZ0RQtKg=;
 h=From:To:Subject:Date:From;
 b=g9upo7C8RlL3V1g6fhFDXvGBbNk3zRb3rC3jjSfwPoxZKaYYIYGKEATJRfS6ipP/H
 awsqIBicIaS6BCWS6UNSGwi6QmBBR8qMroUl2WTOy+s9jH4ewfs54IusX4ZYVIzuxi
 3cDxUajDSJ6fGlYJRzruSnUcp9wkWpga6Sy4rhdhugvYtTh+JlUkanU/DW6iaPOiAK
 6BOpCQNisah58cesCUMMuPIEsIHj1YNmEfXbhXAXzEgffNhe2K+viC3Oe46X+i3GP0
 VDOQ9EnBK6uoNjrRdx0Y8WX8Ubz9SX0r/cV1xkhK+dlU3SQ5mTROLxw01xdnyJ0iQs
 LIMkPX40NC3LQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 10D5DC43143; Wed, 31 May 2023 16:35:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217514] New: [amdgpu] system doesn't boot after linux-firmware
 2023-05-23 ffe1a41e
Date: Wed, 31 May 2023 16:35:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rly@hotmail.hu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217514-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217514

            Bug ID: 217514
           Summary: [amdgpu] system doesn't boot after linux-firmware
                    2023-05-23 ffe1a41e
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rly@hotmail.hu
        Regression: No

Created attachment 304361
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304361&action=3Dedit
softlockup

Updating linux-firmware to the latest git version causes my pc to lock up
during boot. I have a 3900x paired with a 7900xtx running arch linux with 6=
.3.4
xanmod kernel (but this happens with kernel from the core repo as well) and
mesa 23.1.1 if that matters.
During boot time I see the following error printed and the system is comple=
tely
locked up, only hard reset helps:
`May 31 07:20:40 valhalla kernel: watchdog: BUG: soft lockup - CPU#5 stuck =
for
26s! [swapper/5:0]`

accompanied with a lots of amdgpu errors in the journal (followed by stack
trace after both):
```
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: [gfxhub] page
fault (src_id:0 ring:24 vmid:9 pasid:32768, for process  pid 0 thread  pid =
0)
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:   in page
starting at address 0x0000ffff0021a000 from client 10
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00900831
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:          Faul=
ty
UTCL2 client ID: CPF (0x4)
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MORE_FAULTS: 0x1
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
WALKER_ERROR: 0x0
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
PERMISSION_FAULTS: 0x3
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:=20=20=20=20=
=20=20=20=20=20
MAPPING_ERROR: 0x0
May 31 07:20:44 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:          RW: =
0x0

```

full journal log in "softlockup".

The issues start to happen after [this commit,
ffe1a41e](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware.git/commit/?id=3Dffe1a41e2ddbc39109b12d95dcac282d90eba8fc)

but not the above mentioned soft lock, instead after initramfs loads I get =
the
bios splash screen back and it's stuck there.
There are different amdgpu errors(followed by stack trace) during this:
```
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: SMU: I'm not =
done
with your previous command: SMN_C2PMSG_66:0x00000006 SMN_C2PMSG_82:0x000000=
00
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to ena=
ble
requested dpm features!
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to set=
up
smc hw!
May 31 09:18:37 valhalla kernel: [drm:amdgpu_device_init [amdgpu]] *ERROR*
hw_init of IP block <smu> failed -62
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu:
amdgpu_device_ip_init failed
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: Fatal error
during GPU init
May 31 09:18:37 valhalla kernel: amdgpu 0000:0c:00.0: amdgpu: amdgpu: finis=
hing
device.
```
Logs during this in "amdgpu_error"

Note that at the end it seems like the system is running but as I only saw =
the
bios splash screen rebooted via sysrq/reisub.

The commit after ffe1a41
([56832557](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-=
firmware.git/commit/?id=3D568325574a3b6148f3296984aa24fcd1fb4b912c)
or might be the one after that
[39dafcc](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware.git/commit/?id=3D39d6fcc73100ae4aeeec0194bbf102c672673edd),
not sure at the moment) gets past the splash screen but that's where the so=
ft
lockup starts to happen.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
