Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24638537AB9
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 14:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8E410E7AD;
	Mon, 30 May 2022 12:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D45210E7AD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 12:39:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCB37B80DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 12:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEC3EC385B8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653914393;
 bh=IlhMhyeRQFp2psF2pxHvhIGXcNMBK+zUIhLTMxocY+I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C9S/R9LW8i1egfRz2IDRs9XM+ScKaam0HC7l40f2SfWgTl/0wBux66PpnYcjPqxaU
 +u7b7xIlD+CpxJAxNX3UtXTOcclp4snSPy9fc0/Whd70qCuGU0GX6UNiff7FICY4Nl
 XjWtCeNtcAkKQPKFT9lTh91PR4+iR+FJXseFOpA5zsCEadCQT+qExj54KvFPPSG4Oh
 Gp8bItppakwJiJeRaWu4rBdbnyVSsoUIa2RJ2tRTkV5RaLapL2IJS2/WWoCcD43C7K
 S4I3nEG8vkVE2CXyqdQYVYy5sMaA5tUwSgF+UlQmXx/TUhaOlNOj7y2foxgfLCEZny
 yzIcUsvvHsxRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BABB0C05FD4; Mon, 30 May 2022 12:39:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 30 May 2022 12:39:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: birbwatcher@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-Sbe4YYnPp3@https.bugzilla.kernel.org/>
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

birbwatcher@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |birbwatcher@protonmail.com

--- Comment #44 from birbwatcher@protonmail.com ---
Is anybody still working on this bug?

Same error, running Ubuntu 22.04 on GNOME with kernel 5.18.0-051800-generic
New computer build - Ryzen 5600G on Asus B550M motherboard with current BIO=
S.
Error happens in both X11 and Wayland. Wayland used by default, logs below =
are
from an X11 session to see if it was any different but they're the same.

I can readily reproduce the error by loading Cities: Skylines in Steam. I c=
an
play for a few minutes before the screen freezes, then goes black momentari=
ly,
then comes back with frozen stuttering. Sound continues, mouse can move fre=
ely,
some clicks even seem responsive (but I can't see what they're doing). Keyb=
oard
commands to close app don't resolve the issue.

Relevant systemlog:
07:17:23 kernel: Sending SIGTERM to remaining processes...
07:17:23 kernel: Syncing filesystems and block devices.
07:17:22 kernel: wlp4s0: deauthenticating from MAC:ADDRESS by local choice
(Reason: 3=3DDEAUTH_LEAVING)
07:17:22 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:17:21 kernel: amdgpu_cs_ioctl: 158 callbacks suppressed
07:17:21 kernel: rfkill: input handler enabled
07:17:00 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:17:00 kernel: amdgpu_cs_ioctl: 1845 callbacks suppressed
07:16:55 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:16:55 kernel: amdgpu_cs_ioctl: 2146 callbacks suppressed
07:16:50 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:16:50 kernel: amdgpu_cs_ioctl: 2073 callbacks suppressed
07:16:45 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:16:45 kernel: amdgpu_cs_ioctl: 2114 callbacks suppressed
07:16:40 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
07:16:40 kernel: [drm] Skip scheduling IBs!
07:16:40 kernel: amdgpu 0000:06:00.0: amdgpu: GPU reset(2) succeeded!
07:16:40 kernel: [drm] Skip scheduling IBs!
07:16:40 kernel: amdgpu 0000:06:00.0: amdgpu: recover vram bo from shadow d=
one
07:16:40 kernel: [drm] JPEG decode initialized successfully.
07:16:40 kernel: amdgpu 0000:06:00.0: amdgpu: SMU is resumed successfully!
07:16:39 kernel: [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
07:16:39 kernel: amdgpu 0000:06:00.0: amdgpu: GPU reset succeeded, trying to
resume
07:16:39 kernel:  </TASK>
07:16:39 kernel: Call Trace:
07:16:39 kernel: Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sc=
hed]
07:16:39 kernel: Hardware name: ASUS System Product Name/TUF GAMING B550M-P=
LUS
(WI-FI), BIOS 2604 02/25/2022
07:16:39 kernel: CPU: 9 PID: 13975 Comm: kworker/u64:2 Not tainted
5.18.0-051800-generic #202205222030
07:16:39 kernel: [drm] free PSP TMR buffer
07:16:39 kernel: amdgpu 0000:06:00.0: amdgpu: GPU reset begin!
07:16:39 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Cities.x64 pid 14460 thread Cities.x64:cs0 pid 14462
07:16:39 kernel: [drm:amdgpu_dm_commit_planes [amdgpu]] *ERROR* Waiting for
fences timed out!
07:13:18 kernel: process 'steamapps/common/Cities_Skylines/Cities.x64' star=
ted
with executable stack


Relevant application log
07:17:22 systemd: Reached target Exit the Session.
07:17:22 gnome-session-c: Couldn't connect to session bus: Error receiving
data: Connection reset by peer
07:17:22 systemd: Closed D-Bus User Message Bus Socket.
07:17:22 dbus-update-act: dbus-update-activation-environment: error: unable=
 to
connect to D-Bus: Did not receive a reply. Possible causes include: the rem=
ote
application did not send a reply, the message bus security policy blocked t=
he
reply, the reply timeout expired, or the network connection was broken.
07:17:22 systemd: Stopped target Shutdown running GNOME Session.
07:17:22 gnome-session-c: Couldn't connect to session bus: Error sending
credentials: Error sending message: Broken pipe
07:17:22 systemd: session.slice: Consumed 17.619s CPU time.
07:17:22 tracker-miner-f: OK
07:17:22 gnome-session-f: Cannot open display:=20
07:17:22 systemd: Stopped Application launched by gnome-session-binary.
07:17:22 kernel: Error releasing name org.freedesktop.portal.Documents: The
connection is closed
07:17:22 systemd: gvfs-daemon.service: Killing process 7772 (gdbus) with si=
gnal
SIGKILL.
07:17:22 gnome-session-b: gnome-session-binary[4326]: WARNING: Lost name on
bus: org.gnome.SessionManager
07:17:22 systemd: Stopped target Main User Target.
07:17:22 gnome-session-b: gnome-session-binary[4326]: WARNING: Could not get
session class: No such device or address
07:17:22 systemd: app-org.gnome.Terminal.slice: Consumed 2.641s CPU time.
07:17:22 gvfsd: A connection to the bus can't be made
07:17:22 systemd: Removed slice Slice /app/org.gnome.Terminal.
07:17:22 Xorg: (II) Server terminated successfully (0). Closing log file.
07:17:21 Xorg: (II) systemd-logind: releasing fd for 13:72
07:17:21 systemd: pulseaudio.service: Consumed 7.577s CPU time.
07:17:21 pulseaudio: After module unload, module 'module-null-sink' was sti=
ll
loaded!
07:17:21 steamerrorrepor: Uploading dump (out-of-process)
/tmp/dumps/assert_20220530071721_10.dmp
07:17:21 gameoverlayui: Installing breakpad exception handler for
appid(gameoverlayui)/version(1.0)
07:17:21 steamerrorrepor: Uploading dump (out-of-process)
/tmp/dumps/assert_20220530071721_7.dmp
07:17:21 gameoverlayui: Installing breakpad exception handler for
appid(gameoverlayui)/version(1.0)
07:17:21 gnome-session-b: GnomeDesktop-WARNING: Failed to acquire idle moni=
tor
proxy: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient
disconnected from message bus without replying
07:17:21 systemd: Stopped target GNOME file sharing target.
07:17:21 kernel: [31mFATA[0m[May 30 07:17:21.369] Failed to launch=20=20=20=
=20=20=20=20=20=20=20=20
                  [31merror[0m=3D"exit status 1"
07:17:21 kernel: Exiting due to channel error.
07:17:21 at-spi2-registr: X connection to :0 broken (explicit kill or server
shutdown).
07:17:21 systemd: Stopped target GNOME Session.
07:17:21 steam: Fatal IO error 11 (Resource temporarily unavailable) on X
server :0.
07:17:21 Xorg: (II) systemd-logind: releasing fd for 13:66
07:17:21 gnome-session-b: gnome-session-binary[4326]: GnomeDesktop-WARNING:
Failed to acquire idle monitor proxy:
GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient disconnec=
ted
from message bus without replying
07:17:21 systemd: Stopped target GNOME X11 Session (session: ubuntu).
07:17:21 Xorg: amdgpu: The CS has been cancelled because the context is los=
t.
07:17:01 gnome-shell: amdgpu: The CS has been cancelled because the context=
 is
lost.
07:17:00 gnome-shell: amdgpu: The CS has been cancelled because the context=
 is
lost.
07:16:33 Xorg: (EE) event4  - Nordic 2.4G Wireless Receiver Mouse: client b=
ug:
event processing lagging behind by 33ms, your system is too slow
07:13:55 systemd: app-gnome-telegramdesktop-4541.scope: Consumed 12.705s CPU
time.
07:13:37 steam: src/steamexe/main.cpp (253) : Assertion Failed: reaping pid:
14431 -- gameoverlayui
07:13:28 steamerrorrepor: file ''/tmp/dumps/assert_20220530071327_50.dmp'',
upload yes: ''CrashID=3Dbp-bce47298-6cd4-49aa-b884-774e02220530''
07:13:27 steam: Installing breakpad exception handler for
appid(steam)/version(1653101165)
07:13:24 gameoverlayui: g_object_unref: assertion 'G_IS_OBJECT (object)' fa=
iled
07:13:19 gnome-shell: Can't update stage views actor
<unnamed>[<MetaSurfaceActorX11>:0x561bb25806c0] is on because it needs an
allocation.
07:13:19 steam: Game process updated : AppID 255710
"/home/username/.steam/debian-installation/ubuntu12_32/reaper SteamLaunch
AppId=3D255710 --
'/home/username/.steam/debian-installation/steamapps/common/Cities_Skylines=
/dowser'",
ProcID 14460, IP 0.0.0.0:0
07:13:18 Xorg: (--) AMDGPU(0): HDMI max TMDS frequency 170000KHz
07:13:17 gameoverlayui: Installing breakpad exception handler for
appid(gameoverlayui)/version(1.0)
07:13:12 steam: Game process updated : AppID 255710
"/home/username/.steam/debian-installation/ubuntu12_32/reaper SteamLaunch
AppId=3D255710 --
'/home/username/.steam/debian-installation/steamapps/common/Cities_Skylines=
/dowser'",
ProcID 14282, IP 0.0.0.0:0
07:13:12 gameoverlayui: Installing breakpad exception handler for
appid(gameoverlayui)/version(1.0)
07:13:11 steam: Trying to remove a child that doesn't believe we're it's
parent.
07:13:11 dowser: ERROR: ld.so: object
'/home/username/.steam/debian-installation/ubuntu12_32/gameoverlayrenderer.=
so'
from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS32): ignored.
07:13:11 steam: GameAction [AppID 255710, ActionID 1] : LaunchApp changed t=
ask
to Completed with ""
07:13:11 reaper: ERROR: ld.so: object
'/home/username/.steam/debian-installation/ubuntu12_64/gameoverlayrenderer.=
so'
from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS64): ignored.
07:13:11 steam: GameAction [AppID 255710, ActionID 1] : LaunchApp changed t=
ask
to WaitingGameWindow with ""
07:13:11 sh: ERROR: ld.so: object
'/home/username/.steam/debian-installation/ubuntu12_32/gameoverlayrenderer.=
so'
from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS32): ignored.
07:13:11 steam: Game process added : AppID 255710
"/home/username/.steam/debian-installation/ubuntu12_32/reaper SteamLaunch
AppId=3D255710 --
'/home/username/.steam/debian-installation/steamapps/common/Cities_Skylines=
/dowser'",
ProcID 14256, IP 0.0.0.0:0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
