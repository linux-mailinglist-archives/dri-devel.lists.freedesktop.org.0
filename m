Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C655F3AB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 04:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B67610E4D9;
	Wed, 29 Jun 2022 02:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FB410E070
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 02:59:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C915161D93
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 02:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFEB5C341D5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656471540;
 bh=ErdyIjjBDajMmFqZ7exCEZ238D+Fgcv+xb6IVSZtNi4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IO6XsTLkkPzb28PctDrruozzoNehj5+3lPam7vVy23UFH44yW5wADLSjE/BkGBuRN
 UbgYLeG+hVrnUU37NyHLuv56DFNm1efDcUT44vVQMTu6Dvj1y6PFIR3GTpXqBWCFnI
 AKLxUlrhvuU/AxhHccUMG3mNrtpetNRQk+unWHu9dJSUAZTpnQJgWmHURUc1IOx+o2
 hJHCsBZO7QXw2lqtX+a0Gc3hDN9w2CUZ+G73wicOu2jvv8PsD1Hxm+W7Od/1Pa3O1v
 53HR7OhSLU+IbDW8qfEaevirVY2rVcKeR3Je17NhqMqpXTaqD0Ivwk/hodp8bwlqsJ
 6th7lTEljbajA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF8E0C05FD5; Wed, 29 Jun 2022 02:59:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 29 Jun 2022 02:58:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jrch2k10@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-FWW2160QcS@https.bugzilla.kernel.org/>
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

rafael castillo (jrch2k10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jrch2k10@gmail.com

--- Comment #80 from rafael castillo (jrch2k10@gmail.com) ---
same issue here with (also LTS kernel as well)

Linux archlinux 5.18.7-262-tkg-pds #1 TKG SMP PREEMPT_DYNAMIC Mon, 27 Jun 2=
022
15:50:06 +0000 x86_64 GNU/Linux

[11090.086287] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.086296] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.086302] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.195133] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.195139] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.195143] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.195150] [drm] Cannot get clockgating state when UVD is powergated.
[11090.195152] [drm] Cannot get clockgating state when VCE is powergated.
[11090.695288] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11090.699331] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11091.194893] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11091.194898] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11091.194901] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11091.194908] [drm] Cannot get clockgating state when UVD is powergated.
[11091.194909] [drm] Cannot get clockgating state when VCE is powergated.
[11091.695473] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11092.194965] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11092.194969] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11092.194973] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11092.194979] [drm] Cannot get clockgating state when UVD is powergated.
[11092.194980] [drm] Cannot get clockgating state when VCE is powergated.
[11092.695749] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11093.195046] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11093.195050] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11093.195053] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11093.195060] [drm] Cannot get clockgating state when UVD is powergated.
[11093.195061] [drm] Cannot get clockgating state when VCE is powergated.
[11093.695004] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11094.195065] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11094.195070] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11094.195074] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11094.195082] [drm] Cannot get clockgating state when UVD is powergated.
[11094.195083] [drm] Cannot get clockgating state when VCE is powergated.
[11094.695286] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11095.131026] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[11095.195055] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11095.195061] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11095.195065] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11095.195071] [drm] Cannot get clockgating state when UVD is powergated.
[11095.195072] [drm] Cannot get clockgating state when VCE is powergated.
[11095.695232] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11096.195132] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11096.195137] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11096.195140] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11096.195146] [drm] Cannot get clockgating state when UVD is powergated.
[11096.195147] [drm] Cannot get clockgating state when VCE is powergated.
[11096.694900] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11097.195057] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11097.195061] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11097.195064] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11097.195070] [drm] Cannot get clockgating state when UVD is powergated.
[11097.195071] [drm] Cannot get clockgating state when VCE is powergated.
[11097.695156] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11098.195054] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11098.195058] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11098.195062] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11098.195068] [drm] Cannot get clockgating state when UVD is powergated.
[11098.195069] [drm] Cannot get clockgating state when VCE is powergated.
[11098.695226] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11099.195056] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11099.195060] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11099.195064] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11099.195070] [drm] Cannot get clockgating state when UVD is powergated.
[11099.195071] [drm] Cannot get clockgating state when VCE is powergated.
[11099.695224] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11100.175702] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2678111, emitted seq=3D2678113
[11100.175937] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process ArcheAge.exe pid 702264 thread ArcheAge.e:cs0 pid 703382
[11100.176120] amdgpu 0000:02:00.0: amdgpu: GPU reset begin!
[11104.176155] amdgpu 0000:02:00.0: amdgpu: failed to suspend display audio
[11104.176290] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176294] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176296] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176298] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176299] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176301] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176303] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176305] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176307] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176309] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176311] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176312] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176314] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176316] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176318] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176320] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176321] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176417] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176420] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176421] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176423] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176425] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11104.176427] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11118.768958] audit: type=3D1100 audit(1656469160.416:402): pid=3D707085 u=
id=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:authentication
grantors=3Dpam_shells,pam_faillock,pam_permit,pam_faillock acct=3D"junior"
exe=3D"/usr/bin/sshd" hostname=3D192.168.10.47 addr=3D192.168.10.47 termina=
l=3Dssh
res=3Dsuccess'
[11118.769433] audit: type=3D1101 audit(1656469160.416:403): pid=3D707085 u=
id=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:accounting
grantors=3Dpam_access,pam_unix,pam_permit,pam_time acct=3D"junior"
exe=3D"/usr/bin/sshd" hostname=3D192.168.10.47 addr=3D192.168.10.47 termina=
l=3Dssh
res=3Dsuccess'
[11118.769972] audit: type=3D1103 audit(1656469160.418:404): pid=3D707085 u=
id=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:setcred
grantors=3Dpam_shells,pam_faillock,pam_permit,pam_faillock acct=3D"junior"
exe=3D"/usr/bin/sshd" hostname=3D192.168.10.47 addr=3D192.168.10.47 termina=
l=3Dssh
res=3Dsuccess'
[11118.770029] audit: type=3D1006 audit(1656469160.418:405): pid=3D707085 u=
id=3D0
old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D5=
 res=3D1
[11118.770038] audit: type=3D1300 audit(1656469160.418:405): arch=3Dc000003e
syscall=3D1 success=3Dyes exit=3D4 a0=3D3 a1=3D7ffd3b3d22d0 a2=3D4 a3=3D7ff=
d3b3d1fe4 items=3D0
ppid=3D759 pid=3D707085 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=
=3D0 egid=3D0 sgid=3D0
fsgid=3D0 tty=3D(none) ses=3D5 comm=3D"sshd" exe=3D"/usr/bin/sshd" key=3D(n=
ull)
[11118.770040] audit: type=3D1327 audit(1656469160.418:405):
proctitle=3D737368643A206A756E696F72205B707269765D
[11118.785798] audit: type=3D1105 audit(1656469160.434:406): pid=3D707085 u=
id=3D0
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:session_open
grantors=3Dpam_loginuid,pam_keyinit,pam_systemd_home,pam_limits,pam_unix,pa=
m_permit,pam_mail,pam_systemd,pam_env
acct=3D"junior" exe=3D"/usr/bin/sshd" hostname=3D192.168.10.47 addr=3D192.1=
68.10.47
terminal=3Dssh res=3Dsuccess'
[11118.786714] audit: type=3D1103 audit(1656469160.434:407): pid=3D707087 u=
id=3D0
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:setcred
grantors=3Dpam_shells,pam_faillock,pam_permit,pam_faillock acct=3D"junior"
exe=3D"/usr/bin/sshd" hostname=3D192.168.10.47 addr=3D192.168.10.47 termina=
l=3Dssh
res=3Dsuccess'
[11124.189733] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop f=
or
more than 20secs aborting
[11124.189930] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing D718 (len 824, WS 0, PS 0) @ 0xD898
[11124.190079] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing D5D2 (len 326, WS 0, PS 0) @ 0xD6C2
[11124.190230] [drm:dce110_link_encoder_disable_output [amdgpu]] *ERROR*
dce110_link_encoder_disable_output: Failed to execute VBIOS command table!
[11126.469943] audit: type=3D1101 audit(1656469168.118:408): pid=3D707219 u=
id=3D1000
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_perm=
it,pam_time
acct=3D"junior" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/0
res=3Dsuccess'
[11126.470552] audit: type=3D1110 audit(1656469168.118:409): pid=3D707219 u=
id=3D1000
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:setcred
grantors=3Dpam_faillock,pam_permit,pam_env,pam_faillock acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuc=
cess'
[11126.472793] audit: type=3D1105 audit(1656469168.120:410): pid=3D707219 u=
id=3D1000
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:session_open
grantors=3Dpam_systemd_home,pam_limits,pam_unix,pam_permit acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuc=
cess'
[11126.492151] audit: type=3D1106 audit(1656469168.139:411): pid=3D707219 u=
id=3D1000
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:session_close
grantors=3Dpam_systemd_home,pam_limits,pam_unix,pam_permit acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuc=
cess'
[11126.492202] audit: type=3D1104 audit(1656469168.139:412): pid=3D707219 u=
id=3D1000
auid=3D1000 ses=3D5 msg=3D'op=3DPAM:setcred
grantors=3Dpam_faillock,pam_permit,pam_env,pam_faillock acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuc=
cess'
[11144.191100] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop f=
or
more than 20secs aborting
[11144.191292] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing C16E (len 62, WS 0, PS 0) @ 0xC18A
[11164.192468] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop f=
or
more than 20secs aborting
[11164.192658] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing B190 (len 1227, WS 8, PS 8) @ 0xB418
[11164.192828] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.192831] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.192833] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.201396] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspe=
nd
of IP block <vce_v3_0> failed -110
[11164.216360] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216364] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216366] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216368] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216370] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216371] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216373] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216375] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216377] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.216378] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436229] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436234] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436236] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436238] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436240] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436241] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436243] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436246] amdgpu 0000:02:00.0: amdgpu:=20
               last message was failed ret is 65535
[11164.436248] amdgpu: Failed to force to switch arbf0!
[11164.436249] amdgpu: [disable_dpm_tasks] Failed to disable DPM!
[11164.436250] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspe=
nd
of IP block <powerplay> failed -22
[11164.546720] amdgpu 0000:02:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[11164.546864] [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[11164.767164] amdgpu: cp is busy, skip halt cp
[11164.877251] amdgpu: rlc is busy, skip halt rlc
[11164.988549] CPU: 2 PID: 705317 Comm: kworker/u48:4 Tainted: G           =
OE=20=20
  5.18.7-262-tkg-pds #1 ab3a1701b6bb2d2603e5fe14656a947bbae77de2
[11164.988553] Hardware name: ATERMITER ZX-99EV3/ZX-99EV3, BIOS X99AT011
10/15/2020
[11164.988554] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sche=
d]
[11164.988561] Call Trace:
[11164.988562]  <TASK>
[11164.988563]  dump_stack_lvl+0x48/0x5d
[11164.988570]  amdgpu_do_asic_reset+0x2a/0x470 [amdgpu
d2028a110b701082c428a38d2a7699ba96e2f894]
[11164.988790]  amdgpu_device_gpu_recover_imp.cold+0x537/0x8cc [amdgpu
d2028a110b701082c428a38d2a7699ba96e2f894]
[11164.989002]  amdgpu_job_timedout+0x18c/0x1c0 [amdgpu
d2028a110b701082c428a38d2a7699ba96e2f894]
[11164.989183]  drm_sched_job_timedout+0x76/0x100 [gpu_sched
ca892a3eb32539b04f830de75b342015ecf19774]
[11164.989188]  process_one_work+0x1c7/0x380
[11164.989192]  worker_thread+0x51/0x380
[11164.989195]  ? rescuer_thread+0x3a0/0x3a0
[11164.989197]  kthread+0xde/0x110
[11164.989200]  ? kthread_complete_and_exit+0x20/0x20
[11164.989203]  ret_from_fork+0x22/0x30
[11164.989208]  </TASK>
[11164.989212] amdgpu 0000:02:00.0: amdgpu: BACO reset
[drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:53:crtc-0] hw_done or
flip_done timed out
[11187.893035] radeon-profile[54935]: segfault at 0 ip 00007fe553eee6ef sp
00007ffc8035f9e0 error 4 in libQt5Core.so.5.15.5[7fe553e9f000+2d6000]
[11187.893049] Code: 38 64 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 e8 =
d5
98 ff ff 48 85 c0 0f 84 f2 3c fb ff 48 89 c3 4c 8d 68 50 48 8b 40 50 <49> 6=
3 2c
24 3b 68 04 7d 78 8b 10 83 fa 01 76 26 8b 70 08 81 e6 ff

[drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 20=
secs
aborting
[11206.839405] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing C16E (len 62, WS 0, PS 0) @ 0xC18A
[11206.839546] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing AB18 (len 142, WS 0, PS 8) @ 0xAB33
[11206.839688] amdgpu 0000:02:00.0: amdgpu: asic atom init failed!
[11206.839725] amdgpu 0000:02:00.0: amdgpu: GPU reset(2) failed
[11206.839746] amdgpu 0000:02:00.0: amdgpu: GPU reset end with ret =3D -22
[11206.839748] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* GPU Recovery Fail=
ed:
-22

[11216.913239] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2678113, emitted seq=3D2678113
[11216.913503] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process ArcheAge.exe pid 702264 thread ArcheAge.e:cs0 pid 703382
[11216.913700] amdgpu 0000:02:00.0: amdgpu: GPU reset begin!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
