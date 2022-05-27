Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE2535F35
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 13:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF910E147;
	Fri, 27 May 2022 11:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2528C10E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:22:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F8961CD8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4055FC341C6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653650545;
 bh=8bey/fZWGx48EZ1uVzJIlGwtVg7djHRgBxE2nvwWusk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sUFbgsvCj6WGLYeEXUXfL3ojyWiIdh81/GVV7WMwEdnBs/ramNe6QJZkz2Vj7WqJR
 kDuJmueLg9Tn547sibHqPKlyQrBqEA8sBBfe6a8fUezoHsuMNYEhu/2wf54aAVySBx
 6RI3O0F1Nzx/OnMUKritOEgh4ZhsiYTYWiSfjOEh1eZS360SFU7MQ9Me3uNZxjjdzJ
 QHA9xDoyEMqsLNJSfiDdnn6QKiuVSPylw6H5qFYusRrOPFNWm4QS8MVrw/ziu0tWGo
 UeuT/xiY+r6ACFAeQ3kT8aQeZbr/4p+Ia0dic+lgdZmfKj/NuBdCSLpRFFs5tmppF/
 /mvGh01yzz18Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 30631CC13B2; Fri, 27 May 2022 11:22:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 27 May 2022 11:22:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: laguest@archeia.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-Fgg68R5KIX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Luke A. Guest (laguest@archeia.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |laguest@archeia.com

--- Comment #42 from Luke A. Guest (laguest@archeia.com) ---
(In reply to MasterCATZ from comment #38)
> amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize parser -125

I'm getting the same with VLC hanging my machine, R9 390.

# uname -a=20
Linux rogue 5.18.0-gentoo-x86_64 #1 SMP PREEMPT_DYNAMIC Thu May 26 15:51:54=
 BST
2022 x86_64 AMD FX(tm)-8350 Eight-Core Processor AuthenticAMD GNU/Linux

I updated my firmware and there are no binary differences between the old a=
nd
the new, they weren't updated others were; taken from git HEAD.

sys-kernel/linux-firmware
     Available versions:  20210518^bstd 20210629^bstd 20210716^bstd
20210818^bstd 20210919^bstd 20211027^bstd 20211216^bstd 20220209^bstd
20220310^bstd 20220411^bstd 20220509^bstd (**)99999999*l^bstd {initramfs
+redistributable savedconfig unknown-license}
     Installed versions:  99999999*l^bst(12:08:44 27/05/22)(redistributable
-initramfs -savedconfig -unknown-license)
     Homepage:=20=20=20=20=20=20=20=20=20=20=20
https://git.kernel.org/?p=3Dlinux/kernel/git/firmware/linux-firmware.git
     Description:         Linux firmware files

I get this on using vlc:

[  229.233581] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring uvd timeout,
signaled seq=3D3, emitted seq=3D5
[  229.233720] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[  229.233825] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
[  233.233843] amdgpu 0000:01:00.0: amdgpu: failed to suspend display audio
[  234.612017] amdgpu: VI should always have 2 performance levels
[  234.719098] amdgpu 0000:01:00.0: amdgpu: BACO reset
[  235.160372] amdgpu 0000:01:00.0: amdgpu: GPU reset succeeded, trying to
resume
[  235.160416] [drm] PCIE gen 2 link speeds already enabled
[  235.161162] [drm] PCIE GART of 1024M enabled (table at 0x000000F4007E900=
0).
[  235.161207] [drm] VRAM is lost due to GPU reset!
[  235.163312] amdgpu 0000:01:00.0: amdgpu: SRBM_SOFT_RESET=3D0x00100040
[  235.338304] [drm] UVD initialized successfully.
[  235.459249] [drm] VCE initialized successfully.
[  235.461738] amdgpu 0000:01:00.0: amdgpu: recover vram bo from shadow sta=
rt
[  235.461827] amdgpu 0000:01:00.0: amdgpu: recover vram bo from shadow done
[  235.461867] [drm] Skip scheduling IBs!
[  235.461869] [drm] Skip scheduling IBs!
[  235.461890] amdgpu 0000:01:00.0: amdgpu: GPU reset(1) succeeded!
[  235.461926] [drm] Skip scheduling IBs!
[  235.461930] [drm] Skip scheduling IBs!
[  235.461934] [drm] Skip scheduling IBs!
[  235.461937] [drm] Skip scheduling IBs!
[  235.461941] [drm] Skip scheduling IBs!
[  235.461954] [drm] Skip scheduling IBs!
[  235.461958] [drm] Skip scheduling IBs!
[  235.461962] [drm] Skip scheduling IBs!
[  235.461963] [drm] Skip scheduling IBs!
[  235.461965] [drm] Skip scheduling IBs!
[  235.461968] [drm] Skip scheduling IBs!
[  235.461973] [drm] Skip scheduling IBs!
[  235.461975] [drm] Skip scheduling IBs!
[  235.461979] [drm] Skip scheduling IBs!
[  235.461981] [drm] Skip scheduling IBs!
[  235.461983] [drm] Skip scheduling IBs!
[  235.461989] [drm] Skip scheduling IBs!
[  235.461992] [drm] Skip scheduling IBs!
[  235.461994] [drm] Skip scheduling IBs!
[  235.461998] [drm] Skip scheduling IBs!
[  235.462003] [drm] Skip scheduling IBs!
[  235.461983] [drm:amdgpu_uvd_cs_pass2 [amdgpu]] *ERROR* Invalid UVD handle
0xdca40001!
[  235.462198] amdgpu_cs_ioctl: 131 callbacks suppressed
[  235.462201] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.462236] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.462260] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.462545] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.462569] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.462608] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.464578] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.464793] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.466719] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  235.466957] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
( REPEATS )

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
