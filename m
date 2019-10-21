Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3864DE50E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 08:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E269D89993;
	Mon, 21 Oct 2019 06:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F82B89993
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 06:58:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 76DE6720E2; Mon, 21 Oct 2019 06:58:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112079] X lockups with HWCursor enabled - Navi 5700 XT
Date: Mon, 21 Oct 2019 06:58:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112079-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1502602033=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1502602033==
Content-Type: multipart/alternative; boundary="15716411010.16B9Fb7.4356"
Content-Transfer-Encoding: 7bit


--15716411010.16B9Fb7.4356
Date: Mon, 21 Oct 2019 06:58:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112079

            Bug ID: 112079
           Summary: X lockups with HWCursor enabled - Navi 5700 XT
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: asheldon55@gmail.com

I get X lockups with a Navi 5700 XT and HWCursor enabled. Only seems to hap=
pen
if TearFree (and VSync) are disabled. I can reliably reproduce this with The
Witcher Enhanced Edition with TearFree off (the game doesn't support VSync
without forcing it), run with D9VK. These are recoverable at least (just ne=
ed
to restart X) and it doesn't cause a GPU hang, just frozen mouse.

If I run with TearFree on, a multi-monitor setup, or with SWCursor forced o=
n,
the issue goes away. I've also never seen the bug with a Vega card, althoug=
h I
can't say if it happens or not with the exact kernel I used. I'll also add I
typically run with Freesync enabled, but it doesn't appear to affect things=
 in
either direction.

The issue also happens seemingly randomly with other games (like Kingdom Co=
me:
Deliverance and the native Steam client).

Reproduction steps:
1. Run "The Witcher: Enhanced Edition" with D9VK with TearFree off and HWCu=
rsor
enabled, in a single monitor configuration
2. Move the mouse around during the main menu
3. X lockups with the following message:

[  314.590442] ------------[ cut here ]------------=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590487] WARNING: CPU: 1 PID: 6061 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20resource.c:2820
dcn20validatebandwidth.cold+0xe/0x18 [amdgpu]=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590487] Modules linked in: iptablefilter iptables afpacket bridge stp
llc ipv6 nfdefragipv6 zram uinput kvmamd sndhdacodecrealtek kvm joydev
sndhdacodecgeneric mousedev amdgpu sndhdaintel sndvirtuoso sndhdacodec
sndoxygenlib sndmpu401uart sndhwdep$
[  314.590498] CPU: 1 PID: 6061 Comm: X Not tainted
5.3.7-kmsfix-5.3.y-ck0-extra1+ #102=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[  314.590498] Hardware name: System manufacturer System Product Name/PRIME
X370-PRO, BIOS 5216 09/02/2019=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
[  314.590524] RIP: 0010:dcn20validatebandwidth.cold+0xe/0x18 [amdgpu]=20=
=20=20=20=20=20=20=20=20=20
[  314.590526] Code: 05 d6 45 14 00 48 8b 74 24 08 0f b7 44 24 2e 80 cc 0c =
66
89 44 24 2c e9 65 ad f5 ff 48 c7 c7 00 f6 45 a0 31 c0 e8 be 8e d3 e0 <0f> 0=
b 44
89 e0 e9 93 b2 f5 ff 48 c7 c7 00 f6 45 a0 31 c0 e8 a6 8e=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590527] RSP: 0018:ffffc90001aa3ab8 EFLAGS: 0 0010246=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590529] RAX: 0000000000000024 RBX: 4079400000000000 RCX:
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590530] RDX: 0000000000000000 RSI: ffff88881e6561f8 RDI:
00000000ffffffff=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590531] RBP: ffff888722170000 R08: 0000000000000001 R09:
0000000000000711=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590531] R10: 0000000000000001 R11: 0000000000000000 R12:
0000000000000001=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590532] R13: ffff8888095a0000 R14: 0000000000000000 R15:
ffff88881a7e6ad8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590533] FS:  00007f61ce2a28c0(0000) GS:ffff88881e640000(0000)
knlGS:0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590535] CR2: 00000000e085f000 CR3: 000000080041f000 CR4:
00000000003406e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590535] Call Trace:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590563]  dcvalidateglobalstate+0x21f/0x290 [amdgpu]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590593]  amdgpudmatomiccheck+0x553/0x7a0 [amdgpu]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590596]  drmatomiccheckonly+0x53e/0x760=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590599]  ? _rawspinunlockirqrestore+0xf/0x30=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590600]  drmatomiccommit+0xe/0x50=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590602]  drmatomicconnectorcommitdpms+0xd1/0xf0=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590603]  drmmodeobjsetpropertyioctl+0x153/0x29b=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590605]  ? drmconnectorsetobjprop+0x80/0x80=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590606]  drmconnectorpropertysetioctl+0x34/0x50=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590608]  drmioctlkernel+0x9f/0xe0=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590609]  drmioctl+0x1ef/0x381=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
[  314.590610]  ? drmconnectorsetobjprop+0x80/0x80=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590612]  ? epreadeventsproc+0xd0/0xd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[  314.590614]  ? preemptcountadd+0x63/0x90=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
[  314.590614]  ? epreadeventsproc+0xd0/0xd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[  314.590635]  amdgpudrmioctl+0x44/0x80 [amdgpu]=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590637]  dovfsioctl+0x3ea/0x640=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590638]  ? _x64sysepollctl+0xf2/0x1050=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590639]  ksysioctl+0x35/0x70=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[  314.590640]  _x64sysioctl+0x11/0x20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590642]  dosyscall64+0x4e/0x1b0=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590643]  ? prepareexittousermode+0x4c/0xc0=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590646]  entrySYSCALL64afterhwframe+0x44/0xa9=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590647] RIP: 0033:0x7f61ceb9da37=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590648] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
5d
d8 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 29 f4 0c 00 f7 d8 64 89 01 48=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590649] RSP: 002b:00007fff2df1d388 EFLAGS: 00000246 ORIGRAX:
0000000000000010=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590650] RAX: ffffffffffffffda RBX: 000000000000000b RCX:
00007f61ceb9da37=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590651] RDX: 00007fff2df1d390 RSI: 00000000c01064ab RDI:
000000000000000b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590652] RBP: 00000000c01064ab R08: 0000000000000001 R09:
000056186e5094d0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590652] R10: 000056186e517970 R11: 0000000000000246 R12:
00007fff2df1d390=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590653] R13: 000056186fa200d0 R14: 000056186e506600 R15:
000056186e506000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590654] ---[ end trace 7784d0b1b9f93521 ]---=20=20=20=20=20=20=20=20=
=20=20=20

System configuration:
MSI Evoke 5700 XT
Mesa git
amd-staging-drm-next (also tested with 5.4-rc4)
xf86-video-amdgpu git

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716411010.16B9Fb7.4356
Date: Mon, 21 Oct 2019 06:58:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X lockups with HWCursor enabled - Navi 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112079">112079</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X lockups with HWCursor enabled - Navi 5700 XT
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>asheldon55&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I get X lockups with a Navi 5700 XT and HWCursor enabled. Only=
 seems to happen
if TearFree (and VSync) are disabled. I can reliably reproduce this with The
Witcher Enhanced Edition with TearFree off (the game doesn't support VSync
without forcing it), run with D9VK. These are recoverable at least (just ne=
ed
to restart X) and it doesn't cause a GPU hang, just frozen mouse.

If I run with TearFree on, a multi-monitor setup, or with SWCursor forced o=
n,
the issue goes away. I've also never seen the bug with a Vega card, althoug=
h I
can't say if it happens or not with the exact kernel I used. I'll also add I
typically run with Freesync enabled, but it doesn't appear to affect things=
 in
either direction.

The issue also happens seemingly randomly with other games (like Kingdom Co=
me:
Deliverance and the native Steam client).

Reproduction steps:
1. Run &quot;The Witcher: Enhanced Edition&quot; with D9VK with TearFree of=
f and HWCursor
enabled, in a single monitor configuration
2. Move the mouse around during the main menu
3. X lockups with the following message:

[  314.590442] ------------[ cut here ]------------=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590487] WARNING: CPU: 1 PID: 6061 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20resource.c:2820
dcn20validatebandwidth.cold+0xe/0x18 [amdgpu]=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590487] Modules linked in: iptablefilter iptables afpacket bridge stp
llc ipv6 nfdefragipv6 zram uinput kvmamd sndhdacodecrealtek kvm joydev
sndhdacodecgeneric mousedev amdgpu sndhdaintel sndvirtuoso sndhdacodec
sndoxygenlib sndmpu401uart sndhwdep$
[  314.590498] CPU: 1 PID: 6061 Comm: X Not tainted
5.3.7-kmsfix-5.3.y-ck0-extra1+ #102=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[  314.590498] Hardware name: System manufacturer System Product Name/PRIME
X370-PRO, BIOS 5216 09/02/2019=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
[  314.590524] RIP: 0010:dcn20validatebandwidth.cold+0xe/0x18 [amdgpu]=20=
=20=20=20=20=20=20=20=20=20
[  314.590526] Code: 05 d6 45 14 00 48 8b 74 24 08 0f b7 44 24 2e 80 cc 0c =
66
89 44 24 2c e9 65 ad f5 ff 48 c7 c7 00 f6 45 a0 31 c0 e8 be 8e d3 e0 &lt;0f=
&gt; 0b 44
89 e0 e9 93 b2 f5 ff 48 c7 c7 00 f6 45 a0 31 c0 e8 a6 8e=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590527] RSP: 0018:ffffc90001aa3ab8 EFLAGS: 0 0010246=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590529] RAX: 0000000000000024 RBX: 4079400000000000 RCX:
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590530] RDX: 0000000000000000 RSI: ffff88881e6561f8 RDI:
00000000ffffffff=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590531] RBP: ffff888722170000 R08: 0000000000000001 R09:
0000000000000711=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590531] R10: 0000000000000001 R11: 0000000000000000 R12:
0000000000000001=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590532] R13: ffff8888095a0000 R14: 0000000000000000 R15:
ffff88881a7e6ad8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590533] FS:  00007f61ce2a28c0(0000) GS:ffff88881e640000(0000)
knlGS:0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590535] CR2: 00000000e085f000 CR3: 000000080041f000 CR4:
00000000003406e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590535] Call Trace:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590563]  dcvalidateglobalstate+0x21f/0x290 [amdgpu]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590593]  amdgpudmatomiccheck+0x553/0x7a0 [amdgpu]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590596]  drmatomiccheckonly+0x53e/0x760=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590599]  ? _rawspinunlockirqrestore+0xf/0x30=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590600]  drmatomiccommit+0xe/0x50=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590602]  drmatomicconnectorcommitdpms+0xd1/0xf0=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590603]  drmmodeobjsetpropertyioctl+0x153/0x29b=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590605]  ? drmconnectorsetobjprop+0x80/0x80=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590606]  drmconnectorpropertysetioctl+0x34/0x50=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590608]  drmioctlkernel+0x9f/0xe0=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590609]  drmioctl+0x1ef/0x381=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
[  314.590610]  ? drmconnectorsetobjprop+0x80/0x80=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590612]  ? epreadeventsproc+0xd0/0xd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[  314.590614]  ? preemptcountadd+0x63/0x90=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
[  314.590614]  ? epreadeventsproc+0xd0/0xd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[  314.590635]  amdgpudrmioctl+0x44/0x80 [amdgpu]=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590637]  dovfsioctl+0x3ea/0x640=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590638]  ? _x64sysepollctl+0xf2/0x1050=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590639]  ksysioctl+0x35/0x70=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
[  314.590640]  _x64sysioctl+0x11/0x20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590642]  dosyscall64+0x4e/0x1b0=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
[  314.590643]  ? prepareexittousermode+0x4c/0xc0=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590646]  entrySYSCALL64afterhwframe+0x44/0xa9=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590647] RIP: 0033:0x7f61ceb9da37=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[  314.590648] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
5d
d8 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 29 f4 0c 00 f7 d8 64 89 01 48=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590649] RSP: 002b:00007fff2df1d388 EFLAGS: 00000246 ORIGRAX:
0000000000000010=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590650] RAX: ffffffffffffffda RBX: 000000000000000b RCX:
00007f61ceb9da37=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590651] RDX: 00007fff2df1d390 RSI: 00000000c01064ab RDI:
000000000000000b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590652] RBP: 00000000c01064ab R08: 0000000000000001 R09:
000056186e5094d0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590652] R10: 000056186e517970 R11: 0000000000000246 R12:
00007fff2df1d390=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590653] R13: 000056186fa200d0 R14: 000056186e506600 R15:
000056186e506000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[  314.590654] ---[ end trace 7784d0b1b9f93521 ]---=20=20=20=20=20=20=20=20=
=20=20=20

System configuration:
MSI Evoke 5700 XT
Mesa git
amd-staging-drm-next (also tested with 5.4-rc4)
xf86-video-amdgpu git</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716411010.16B9Fb7.4356--

--===============1502602033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1502602033==--
