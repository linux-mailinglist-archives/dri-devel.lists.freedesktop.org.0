Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96CFBB12
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 22:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6556E0D7;
	Wed, 13 Nov 2019 21:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12B2D6E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:48:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 09FB7720E2; Wed, 13 Nov 2019 21:48:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112265] Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no
 graphics
Date: Wed, 13 Nov 2019 21:48:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: John.p.donnelly@oracle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112265-502-nlbwRomxSL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112265-502@http.bugs.freedesktop.org/>
References: <bug-112265-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1546141339=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1546141339==
Content-Type: multipart/alternative; boundary="15736817280.1750f.21380"
Content-Transfer-Encoding: 7bit


--15736817280.1750f.21380
Date: Wed, 13 Nov 2019 21:48:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112265

--- Comment #2 from John.p.donnelly@oracle.com ---
debugfs content :


With gnome running=20


 # for f in `find . -type f ` ; do=20
> echo "$f :  `cat $f` "=20
> done
./VGA-1/edid_override :=20=20=20
./VGA-1/force :  unspecified=20
./internal_clients :=20=20=20
./framebuffer :  framebuffer[35]:
        allocated by =3D Xorg
        refcount=3D2
        format=3DXR24 little-endian (0x34325258)
        modifier=3D0x0
        size=3D1024x768
        layers:
                size[0]=3D1024x768
                pitch[0]=3D4096
                offset[0]=3D0
                obj[0]:(null)
framebuffer[34]:
        allocated by =3D [fbcon]
        refcount=3D1
        format=3DXR24 little-endian (0x34325258)
        modifier=3D0xb7e2c74500000010
        size=3D1024x768
        layers:
                size[0]=3D1024x768
                pitch[0]=3D4096
                offset[0]=3D4294967295
                obj[0]:(null)=20
./gem_names :    name     size handles refcount=20
./clients :               command   pid dev master a   uid      magic
      systemd-logind  1563   0   y    y     0          0=20
./name :  mgag200 dev=3D0000:3d:00.0 unique=3D0000:3d:00.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15736817280.1750f.21380
Date: Wed, 13 Nov 2019 21:48:48 +0000
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
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265">bug 11226=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
John.p.donnelly&#64;oracle.com" title=3D"John.p.donnelly&#64;oracle.com">Jo=
hn.p.donnelly&#64;oracle.com</a>
</span></b>
        <pre>debugfs content :


With gnome running=20


 # for f in `find . -type f ` ; do=20
<span class=3D"quote">&gt; echo &quot;$f :  `cat $f` &quot;=20
&gt; done</span >
./VGA-1/edid_override :=20=20=20
./VGA-1/force :  unspecified=20
./internal_clients :=20=20=20
./framebuffer :  framebuffer[35]:
        allocated by =3D Xorg
        refcount=3D2
        format=3DXR24 little-endian (0x34325258)
        modifier=3D0x0
        size=3D1024x768
        layers:
                size[0]=3D1024x768
                pitch[0]=3D4096
                offset[0]=3D0
                obj[0]:(null)
framebuffer[34]:
        allocated by =3D [fbcon]
        refcount=3D1
        format=3DXR24 little-endian (0x34325258)
        modifier=3D0xb7e2c74500000010
        size=3D1024x768
        layers:
                size[0]=3D1024x768
                pitch[0]=3D4096
                offset[0]=3D4294967295
                obj[0]:(null)=20
./gem_names :    name     size handles refcount=20
./clients :               command   pid dev master a   uid      magic
      systemd-logind  1563   0   y    y     0          0=20
./name :  mgag200 dev=3D0000:3d:00.0 unique=3D0000:3d:00.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15736817280.1750f.21380--

--===============1546141339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1546141339==--
