Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D17BF99C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 20:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB1A6EDE8;
	Thu, 26 Sep 2019 18:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DAE16EDDD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 18:51:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6A2BF72162; Thu, 26 Sep 2019 18:51:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111819] When starting Atom, Signal or Steam via Flatpak:
 [gfxhub] retry page fault (src_id:0 ring:0 vmid:1 pasid:32770, for process X
 pid 2148 thread X:cs0 pid 2151) in page starting at address
 0x0000000107720000 from 27, VM_L2_PROTECTION_FAULT_STATUS:0x00101031
Date: Thu, 26 Sep 2019 18:51:18 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111819-502-0G7xuIvxqu@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0991421260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0991421260==
Content-Type: multipart/alternative; boundary="15695238780.97cc98657.18513"
Content-Transfer-Encoding: 7bit


--15695238780.97cc98657.18513
Date: Thu, 26 Sep 2019 18:51:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111819

--- Comment #7 from Dennis Schridde <devurandom@gmx.net> ---
Created attachment 145535
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145535&action=3Dedit
flatpak info (-M) $app

I attached the output of:
```
for app in com.skype.Client com.valvesoftware.Steam io.atom.Atom
org.signal.Signal org.zulip.Zulip
  flatpak info $app
  echo Permissions:
  flatpak info -M $app
end
```

What sticks out is that the applications crashing all have `devices=3Dall` =
or
`devices=3Ddri` permissions -- i.e. they can access the GPU directly.

Running /var/lib/flatpak/app/io.atom.Atom/current/active/files/bin/atom-real
directly, without Flatpak, locks up the entire system hard -- ctrl+alt+f2,
ctrl+alt+del, SysReq+REISUB all do not help and I have to hard reset the
machine.  No logs are available from this run.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695238780.97cc98657.18513
Date: Thu, 26 Sep 2019 18:51:18 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111819#c7">Commen=
t # 7</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145535=
" name=3D"attach_145535" title=3D"flatpak info (-M) $app">attachment 145535=
</a> <a href=3D"attachment.cgi?id=3D145535&amp;action=3Dedit" title=3D"flat=
pak info (-M) $app">[details]</a></span>
flatpak info (-M) $app

I attached the output of:
```
for app in com.skype.Client com.valvesoftware.Steam io.atom.Atom
org.signal.Signal org.zulip.Zulip
  flatpak info $app
  echo Permissions:
  flatpak info -M $app
end
```

What sticks out is that the applications crashing all have `devices=3Dall` =
or
`devices=3Ddri` permissions -- i.e. they can access the GPU directly.

Running /var/lib/flatpak/app/io.atom.Atom/current/active/files/bin/atom-real
directly, without Flatpak, locks up the entire system hard -- ctrl+alt+f2,
ctrl+alt+del, SysReq+REISUB all do not help and I have to hard reset the
machine.  No logs are available from this run.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695238780.97cc98657.18513--

--===============0991421260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0991421260==--
