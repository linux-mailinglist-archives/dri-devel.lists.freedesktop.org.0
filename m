Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBBB8FA8F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 07:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08FA6EAC9;
	Fri, 16 Aug 2019 05:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4379C6EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 05:58:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 406A27215A; Fri, 16 Aug 2019 05:58:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 16 Aug 2019 05:58:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-8FjrNueKCf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0398052737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398052737==
Content-Type: multipart/alternative; boundary="15659351313.16dE9fdc.6834"
Content-Transfer-Encoding: 7bit


--15659351313.16dE9fdc.6834
Date: Fri, 16 Aug 2019 05:58:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #101 from ReddestDream <reddestdream@gmail.com> ---
Grasping at straws a bit here, but it occurred to me that maybe Linux kernel
testing on Radeon VII was done on an early VBIOS that didn't have full UEFI
support yet. We know that AMD had to issue a VBIOS update for Radeon VII to=
 fix
UEFI support shortly after the launch. So maybe enabling the CSM/Legacy Sup=
port
in the BIOS, which does impact early GPU initialization, might have some ef=
fect
on the multimonitor problem? Something I plan to test, but I wanted to share
the idea in case someone else has a chance first.

>This might not mean anything, but it could be another clue that initilizat=
ion is happening before the card is really ready.

Also, I considered that both of my monitors have audio out support. I wonde=
r if
audio initialization might be the missing piece to the puzzle, the thing th=
at
interrupts/changes the state of the card and prevents
smu_send_smc_msg_with_param from working where it did before. I know that in
the past with previous AMD cards, display audio has been buggy . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659351313.16dE9fdc.6834
Date: Fri, 16 Aug 2019 05:58:51 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c101">Comm=
ent # 101</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>Grasping at straws a bit here, but it occurred to me that mayb=
e Linux kernel
testing on Radeon VII was done on an early VBIOS that didn't have full UEFI
support yet. We know that AMD had to issue a VBIOS update for Radeon VII to=
 fix
UEFI support shortly after the launch. So maybe enabling the CSM/Legacy Sup=
port
in the BIOS, which does impact early GPU initialization, might have some ef=
fect
on the multimonitor problem? Something I plan to test, but I wanted to share
the idea in case someone else has a chance first.

<span class=3D"quote">&gt;This might not mean anything, but it could be ano=
ther clue that initilization is happening before the card is really ready.<=
/span >

Also, I considered that both of my monitors have audio out support. I wonde=
r if
audio initialization might be the missing piece to the puzzle, the thing th=
at
interrupts/changes the state of the card and prevents
smu_send_smc_msg_with_param from working where it did before. I know that in
the past with previous AMD cards, display audio has been buggy . . .</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659351313.16dE9fdc.6834--

--===============0398052737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0398052737==--
