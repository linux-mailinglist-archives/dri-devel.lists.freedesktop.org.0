Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9749D36E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D5289D8D;
	Mon, 26 Aug 2019 15:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 701CE6E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:53:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6CE4672161; Mon, 26 Aug 2019 15:53:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Mon, 26 Aug 2019 15:53:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreaskem@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-jiW56TAWsU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1019233834=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1019233834==
Content-Type: multipart/alternative; boundary="15668348043.F8b8F3.7755"
Content-Transfer-Encoding: 7bit


--15668348043.F8b8F3.7755
Date: Mon, 26 Aug 2019 15:53:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #25 from andreaskem@web.de ---
Apparently, Lenovo released a new BIOS update for my laptop (Thinkpad E485)
today. The changelog mentions, "Sync IOAPICID in IVRS and APIC ACPI tables
(Linux)." I installed the update and removed both the ivrs_ioapic[32]=3D00:=
14.0
flag, as well as the iommu=3Dpt flag from my kernel command line for testin=
g. To
my surprise, the laptop booted just fine and from what I can tell, the
graphical corruption seems to be gone. In the meantime, the kernel and mesa
were updated a few times and I cannot pinpoint what, exactly, fixed my issu=
es.

-> mesa 19.1.5
-> kernel 5.2.10.arch1-1
-> llvm-libs 8.0.1-3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668348043.F8b8F3.7755
Date: Mon, 26 Aug 2019 15:53:24 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andreaskem&#64;web.de" title=3D"andreaskem&#64;web.de">andreaskem&#64;web.d=
e</a>
</span></b>
        <pre>Apparently, Lenovo released a new BIOS update for my laptop (T=
hinkpad E485)
today. The changelog mentions, &quot;Sync IOAPICID in IVRS and APIC ACPI ta=
bles
(Linux).&quot; I installed the update and removed both the ivrs_ioapic[32]=
=3D00:14.0
flag, as well as the iommu=3Dpt flag from my kernel command line for testin=
g. To
my surprise, the laptop booted just fine and from what I can tell, the
graphical corruption seems to be gone. In the meantime, the kernel and mesa
were updated a few times and I cannot pinpoint what, exactly, fixed my issu=
es.

-&gt; mesa 19.1.5
-&gt; kernel 5.2.10.arch1-1
-&gt; llvm-libs 8.0.1-3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668348043.F8b8F3.7755--

--===============1019233834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1019233834==--
