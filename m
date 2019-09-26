Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1ABF9E2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 21:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336656EDFE;
	Thu, 26 Sep 2019 19:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0F816EDF9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 19:11:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE2B572162; Thu, 26 Sep 2019 19:11:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111819] When starting Atom, Signal or Steam via Flatpak:
 [gfxhub] retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X
 pid 2148 thread X:cs0 pid 2151) in page starting at address
 0x0000000107720000 from 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031
Date: Thu, 26 Sep 2019 19:11:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: devurandom@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111819-502-pFSwHYK7aG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111819-502@http.bugs.freedesktop.org/>
References: <bug-111819-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1344226137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1344226137==
Content-Type: multipart/alternative; boundary="15695250842.60B1C0e.22843"
Content-Transfer-Encoding: 7bit


--15695250842.60B1C0e.22843
Date: Thu, 26 Sep 2019 19:11:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111819

--- Comment #8 from Dennis Schridde <devurandom@gmx.net> ---
Running /var/lib/flatpak/app/io.atom.Atom/current/active/files/share/atom/a=
tom
(the binary started by .../bin/atom-real) will also lock up the system.

I installed net-im/signal-desktop-bin-1.27.2::gentoo to my system, natively,
using the package manager.  Running /usr/sbin/signal-desktop does not lock =
it
up.

Running
/var/lib/flatpak/app/org.signal.Signal/current/active/files/Signal/signal-d=
esktop
also does not lock it up.

Ignoring io.atom.Atom and concentrating on org.signal.Signal, I assume that
something that Flatpak does to setup its namespaces and cgroups trips OpenG=
L /
Mesa and the Linux kernel's AMDGPU driver...

The last kernel where I did not notice such lock ups was 5.1.4 (on the same
Gentoo system).  I did not use this machine since mid/end May until now, so=
 I
did not run any kernels in between 5.1.4 and 5.3.1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695250842.60B1C0e.22843
Date: Thu, 26 Sep 2019 19:11:24 +0000
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
   title=3D"NEW - When starting Atom, Signal or Steam via Flatpak: [gfxhub]=
 retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X pid 21=
48 thread X:cs0 pid 2151) in page starting at address 0x0000000107720000 fr=
om 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111819#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - When starting Atom, Signal or Steam via Flatpak: [gfxhub]=
 retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X pid 21=
48 thread X:cs0 pid 2151) in page starting at address 0x0000000107720000 fr=
om 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111819">bug 11181=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
devurandom&#64;gmx.net" title=3D"Dennis Schridde &lt;devurandom&#64;gmx.net=
&gt;"> <span class=3D"fn">Dennis Schridde</span></a>
</span></b>
        <pre>Running /var/lib/flatpak/app/io.atom.Atom/current/active/files=
/share/atom/atom
(the binary started by .../bin/atom-real) will also lock up the system.

I installed net-im/signal-desktop-bin-1.27.2::gentoo to my system, natively,
using the package manager.  Running /usr/sbin/signal-desktop does not lock =
it
up.

Running
/var/lib/flatpak/app/org.signal.Signal/current/active/files/Signal/signal-d=
esktop
also does not lock it up.

Ignoring io.atom.Atom and concentrating on org.signal.Signal, I assume that
something that Flatpak does to setup its namespaces and cgroups trips OpenG=
L /
Mesa and the Linux kernel's AMDGPU driver...

The last kernel where I did not notice such lock ups was 5.1.4 (on the same
Gentoo system).  I did not use this machine since mid/end May until now, so=
 I
did not run any kernels in between 5.1.4 and 5.3.1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695250842.60B1C0e.22843--

--===============1344226137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1344226137==--
