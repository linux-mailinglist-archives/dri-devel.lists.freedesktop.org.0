Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1859F512
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 23:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0765C89A1A;
	Tue, 27 Aug 2019 21:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A07928997A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 21:28:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9760272161; Tue, 27 Aug 2019 21:28:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Tue, 27 Aug 2019 21:28:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111414-502-C24pwt6hbV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111414-502@http.bugs.freedesktop.org/>
References: <bug-111414-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1525319677=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1525319677==
Content-Type: multipart/alternative; boundary="15669412990.aC2ad.23620"
Content-Transfer-Encoding: 7bit


--15669412990.aC2ad.23620
Date: Tue, 27 Aug 2019 21:28:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

--- Comment #6 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(gdb) bt full
#0  0x00007f2ec9e5ddd1 in raise () from /lib64/libc.so.6
No symbol table info available.
#1  0x00007f2ec9e47549 in abort () from /lib64/libc.so.6
No symbol table info available.
#2  0x00007f2ec9e47421 in __assert_fail_base.cold () from /lib64/libc.so.6
No symbol table info available.
#3  0x00007f2ec9e56322 in __assert_fail () from /lib64/libc.so.6
No symbol table info available.
#4  0x00007f2e66d99c16 in FormatYCBCRToPipe (vdpau_format=3D7)
    at ../src/gallium/state_trackers/vdpau/vdpau_private.h:138
        __PRETTY_FUNCTION__ =3D "FormatYCBCRToPipe"
#5  0x00007f2e66d9a00e in vlVdpVideoSurfaceQueryGetPutBitsYCbCrCapabilities
(device=3D1,=20
    surface_chroma_type=3D2, bits_ycbcr_format=3D7, is_supported=3D0x7f2eba=
775630)
    at ../src/gallium/state_trackers/vdpau/query.c:157
        dev =3D 0x7f2ea802fbf0
        pscreen =3D 0x7f2ea8571b20
#6  0x00007f2ec7e4aa95 in ?? () from /usr/lib64/libavutil.so.56
No symbol table info available.
#7  0x00007f2ec7e4593e in av_hwdevice_ctx_init () from
/usr/lib64/libavutil.so.56
No symbol table info available.
#8  0x000055e6b254ca9d in mp_vdpau_create_device_x11 ()

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669412990.aC2ad.23620
Date: Tue, 27 Aug 2019 21:28:19 +0000
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
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">bug 11141=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(gdb) bt full
#0  0x00007f2ec9e5ddd1 in raise () from /lib64/libc.so.6
No symbol table info available.
#1  0x00007f2ec9e47549 in abort () from /lib64/libc.so.6
No symbol table info available.
#2  0x00007f2ec9e47421 in __assert_fail_base.cold () from /lib64/libc.so.6
No symbol table info available.
#3  0x00007f2ec9e56322 in __assert_fail () from /lib64/libc.so.6
No symbol table info available.
#4  0x00007f2e66d99c16 in FormatYCBCRToPipe (vdpau_format=3D7)
    at ../src/gallium/state_trackers/vdpau/vdpau_private.h:138
        __PRETTY_FUNCTION__ =3D &quot;FormatYCBCRToPipe&quot;
#5  0x00007f2e66d9a00e in vlVdpVideoSurfaceQueryGetPutBitsYCbCrCapabilities
(device=3D1,=20
    surface_chroma_type=3D2, bits_ycbcr_format=3D7, is_supported=3D0x7f2eba=
775630)
    at ../src/gallium/state_trackers/vdpau/query.c:157
        dev =3D 0x7f2ea802fbf0
        pscreen =3D 0x7f2ea8571b20
#6  0x00007f2ec7e4aa95 in ?? () from /usr/lib64/libavutil.so.56
No symbol table info available.
#7  0x00007f2ec7e4593e in av_hwdevice_ctx_init () from
/usr/lib64/libavutil.so.56
No symbol table info available.
#8  0x000055e6b254ca9d in mp_vdpau_create_device_x11 ()</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669412990.aC2ad.23620--

--===============1525319677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1525319677==--
