Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91188ECDD7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 10:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3986E02C;
	Sat,  2 Nov 2019 09:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08FAC6E3B8
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 09:13:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 04F4A720E2; Sat,  2 Nov 2019 09:13:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108521] RX 580 as eGPU amdgpu: gpu post error!
Date: Sat, 02 Nov 2019 09:13:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: werbungspam@outlook.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-108521-502-faEQiTE98A@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108521-502@http.bugs.freedesktop.org/>
References: <bug-108521-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1423815518=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1423815518==
Content-Type: multipart/alternative; boundary="15726860213.F1b5Ff2.31778"
Content-Transfer-Encoding: 7bit


--15726860213.F1b5Ff2.31778
Date: Sat, 2 Nov 2019 09:13:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108521

kumquad <werbungspam@outlook.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|NOTOURBUG                   |---

--- Comment #54 from kumquad <werbungspam@outlook.com> ---
Hello,=20

I think I have the same problem as all the others here.
My setup - working fine under Windows - is:
* HP Spectre x360 - chxx model with the i7-8705 CPU (so also with an vega M
dGPU
* Razer Core X with AMD Vega56
A normal boot with Kernel 5.3.7-2 gives me this in dmesg:

[   11.672442] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop f=
or
more than 5secs aborting
[   11.672469] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing CF4E (len 1030, WS 8, PS 0) @ 0xD2C5
[   11.672492] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing C410 (len 114, WS 0, PS 8) @ 0xC41C
[   11.672495] amdgpu 0000:09:00.0: gpu post error!
[   11.672496] amdgpu 0000:09:00.0: Fatal error during GPU init
[   11.672497] [drm] amdgpu: finishing device.



but I also found some errors like this: Do they have to do something with o=
ur
GPU?
[    2.732913] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D128] at =
bit
offset/length 128/1024 exceeds size of target Buffer (160 bits)
(20190703/dsopcode-198)
[    2.732919] ACPI Error: Aborting method \HWMC due to previous error
(AE_AML_BUFFER_LIMIT) (20190703/psparse-529)
[    2.732927] ACPI Error: Aborting method \_SB.WMID.WMAA due to previous e=
rror
(AE_AML_BUFFER_LIMIT) (20190703/psparse-529)



I also have some of those BAR-errors, but I never have them with the PCI Ad=
ress
of the eGPU only with other adresses:
[    0.779001] pci 0000:02:00.0: BAR 13: assigned [io  0x2000-0x4fff]
[    0.779004] pci 0000:03:02.0: BAR 15: no space for [mem size 0x00200000
64bit pref]
[    0.779005] pci 0000:03:02.0: BAR 15: failed to assign [mem size 0x00200=
000
64bit pref]
[    0.779006] pci 0000:03:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.779006] pci 0000:03:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[    0.779007] pci 0000:03:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.779009] pci 0000:03:02.0: BAR 15: no space for [mem size 0x00200000
64bit pref]
[    0.779010] pci 0000:03:02.0: BAR 15: failed to assign [mem size 0x00200=
000
64bit pref]
[    0.779010] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.779016] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[    0.779025] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[    0.779027] pci 0000:03:01.0:   bridge window [io  0x2000-0x2fff]
[    0.779032] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[    0.779036] pci 0000:03:01.0:   bridge window [mem 0x2f90000000-0x2fafff=
ffff
64bit pref]

Device Adress 03:02.0 Corresponds to my Thunderbolt controller:

03:02.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)


@Robert Strude: You wanted to buy a Vega and make some researches with it. =
As
you can see there is still something wrong here. Perhaps you are interested=
 and
want to help me finding more information.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726860213.F1b5Ff2.31778
Date: Sat, 2 Nov 2019 09:13:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:werbungsp=
am&#64;outlook.com" title=3D"kumquad &lt;werbungspam&#64;outlook.com&gt;"> =
<span class=3D"fn">kumquad</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - RX 580 as eGPU amdgpu: gpu post error!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108521">bug 10852=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>NOTOURBUG
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - RX 580 as eGPU amdgpu: gpu post error!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108521#c54">Comme=
nt # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - RX 580 as eGPU amdgpu: gpu post error!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108521">bug 10852=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
werbungspam&#64;outlook.com" title=3D"kumquad &lt;werbungspam&#64;outlook.c=
om&gt;"> <span class=3D"fn">kumquad</span></a>
</span></b>
        <pre>Hello,=20

I think I have the same problem as all the others here.
My setup - working fine under Windows - is:
* HP Spectre x360 - chxx model with the i7-8705 CPU (so also with an vega M
dGPU
* Razer Core X with AMD Vega56
A normal boot with Kernel 5.3.7-2 gives me this in dmesg:

[   11.672442] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop f=
or
more than 5secs aborting
[   11.672469] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing CF4E (len 1030, WS 8, PS 0) &#64; 0xD2C5
[   11.672492] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atom=
bios
stuck executing C410 (len 114, WS 0, PS 8) &#64; 0xC41C
[   11.672495] amdgpu 0000:09:00.0: gpu post error!
[   11.672496] amdgpu 0000:09:00.0: Fatal error during GPU init
[   11.672497] [drm] amdgpu: finishing device.



but I also found some errors like this: Do they have to do something with o=
ur
GPU?
[    2.732913] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D128] at =
bit
offset/length 128/1024 exceeds size of target Buffer (160 bits)
(20190703/dsopcode-198)
[    2.732919] ACPI Error: Aborting method \HWMC due to previous error
(AE_AML_BUFFER_LIMIT) (20190703/psparse-529)
[    2.732927] ACPI Error: Aborting method \_SB.WMID.WMAA due to previous e=
rror
(AE_AML_BUFFER_LIMIT) (20190703/psparse-529)



I also have some of those BAR-errors, but I never have them with the PCI Ad=
ress
of the eGPU only with other adresses:
[    0.779001] pci 0000:02:00.0: BAR 13: assigned [io  0x2000-0x4fff]
[    0.779004] pci 0000:03:02.0: BAR 15: no space for [mem size 0x00200000
64bit pref]
[    0.779005] pci 0000:03:02.0: BAR 15: failed to assign [mem size 0x00200=
000
64bit pref]
[    0.779006] pci 0000:03:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.779006] pci 0000:03:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[    0.779007] pci 0000:03:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.779009] pci 0000:03:02.0: BAR 15: no space for [mem size 0x00200000
64bit pref]
[    0.779010] pci 0000:03:02.0: BAR 15: failed to assign [mem size 0x00200=
000
64bit pref]
[    0.779010] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.779016] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[    0.779025] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[    0.779027] pci 0000:03:01.0:   bridge window [io  0x2000-0x2fff]
[    0.779032] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[    0.779036] pci 0000:03:01.0:   bridge window [mem 0x2f90000000-0x2fafff=
ffff
64bit pref]

Device Adress 03:02.0 Corresponds to my Thunderbolt controller:

03:02.0 PCI bridge: Intel Corporation JHL6540 Thunderbolt 3 Bridge (C step)
[Alpine Ridge 4C 2016] (rev 02)


&#64;Robert Strude: You wanted to buy a Vega and make some researches with =
it. As
you can see there is still something wrong here. Perhaps you are interested=
 and
want to help me finding more information.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726860213.F1b5Ff2.31778--

--===============1423815518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1423815518==--
