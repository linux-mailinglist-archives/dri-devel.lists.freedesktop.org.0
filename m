Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82176D6C8F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 02:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7076E2E1;
	Tue, 15 Oct 2019 00:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D55B16E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 00:42:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CCB2F7296E; Tue, 15 Oct 2019 00:42:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111989] Diagnosing issues with Radeon VII
Date: Tue, 15 Oct 2019 00:42:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111989-502-BbbjXv0CT3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111989-502@http.bugs.freedesktop.org/>
References: <bug-111989-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0170684647=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0170684647==
Content-Type: multipart/alternative; boundary="15711001220.aAF4F6.8544"
Content-Transfer-Encoding: 7bit


--15711001220.aAF4F6.8544
Date: Tue, 15 Oct 2019 00:42:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111989

--- Comment #1 from L.S.S. <ragnaros39216@yandex.com> ---
A little update:

Was able to trigger system lockup/hard reset even at low clock speed (at ar=
ound
1000MHz) last night. It happened when I reapplied the clock settings after =
it
entered safe clock again, most likely due to that I was also doing something
else on the system (which caused the card to enter safe clock in the first
place).

I still couldn't find a way to increase the log verbosity, but I've tried t=
he
following:

1. Disabling CUs to match that of a Vega 56
(amdgpu.disable_cu=3D0.0.14,0.0.15,1.0.14,1.0.15,2.0. 14,2.0.15,3.0.14,3.0.=
15,
found in the Phoronix post[1]). This obviously had no effect as I'm yet to =
know
which are the real ones I should disable, or if this problem can really be
worked around or not this way.

2. Disabling DC (amdgpu.dc=3D0): The system won't boot at all.

3. Setting amdgpu.vm_update_mode=3D3: The system freezes a short while after
startup, but it doesn't hard reset. I can just press the reset button and t=
he
card still works after reboot, without having to do a power cycle.

The system is currently at the latest stable kernel (5.3), but the problem =
had
existed for quite a while (on all kernel versions, so it must be due to the
hardware itself).

NOTE: On the other hand, the card seems to intermittently cause stutters to=
 the
system possibly with some related but corrected AERs showing in the system =
log,
but the problem went away after I set the PCIe slot the card is on to GEN2
speed.

[1].
https://www.phoronix.com/forums/forum/linux-graphics-x-org-drivers/open-sou=
rce-amd-linux/1049483-amd-devs-error-ring-gfx-timeout?p=3D1050232#post10502=
32

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711001220.aAF4F6.8544
Date: Tue, 15 Oct 2019 00:42:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Diagnosing issues with Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111989#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Diagnosing issues with Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111989">bug 11198=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ragnaros39216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.=
com&gt;"> <span class=3D"fn">L.S.S.</span></a>
</span></b>
        <pre>A little update:

Was able to trigger system lockup/hard reset even at low clock speed (at ar=
ound
1000MHz) last night. It happened when I reapplied the clock settings after =
it
entered safe clock again, most likely due to that I was also doing something
else on the system (which caused the card to enter safe clock in the first
place).

I still couldn't find a way to increase the log verbosity, but I've tried t=
he
following:

1. Disabling CUs to match that of a Vega 56
(amdgpu.disable_cu=3D0.0.14,0.0.15,1.0.14,1.0.15,2.0. 14,2.0.15,3.0.14,3.0.=
15,
found in the Phoronix post[1]). This obviously had no effect as I'm yet to =
know
which are the real ones I should disable, or if this problem can really be
worked around or not this way.

2. Disabling DC (amdgpu.dc=3D0): The system won't boot at all.

3. Setting amdgpu.vm_update_mode=3D3: The system freezes a short while after
startup, but it doesn't hard reset. I can just press the reset button and t=
he
card still works after reboot, without having to do a power cycle.

The system is currently at the latest stable kernel (5.3), but the problem =
had
existed for quite a while (on all kernel versions, so it must be due to the
hardware itself).

NOTE: On the other hand, the card seems to intermittently cause stutters to=
 the
system possibly with some related but corrected AERs showing in the system =
log,
but the problem went away after I set the PCIe slot the card is on to GEN2
speed.

[1].
<a href=3D"https://www.phoronix.com/forums/forum/linux-graphics-x-org-drive=
rs/open-source-amd-linux/1049483-amd-devs-error-ring-gfx-timeout?p=3D105023=
2#post1050232">https://www.phoronix.com/forums/forum/linux-graphics-x-org-d=
rivers/open-source-amd-linux/1049483-amd-devs-error-ring-gfx-timeout?p=3D10=
50232#post1050232</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711001220.aAF4F6.8544--

--===============0170684647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0170684647==--
