Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A956F80BC3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 19:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC389BFE;
	Sun,  4 Aug 2019 17:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69D2789BFE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 17:06:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6213B72167; Sun,  4 Aug 2019 17:06:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108641] Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks
Date: Sun, 04 Aug 2019 17:06:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steelwinged@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108641-502-1oR8OxrUJ5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108641-502@http.bugs.freedesktop.org/>
References: <bug-108641-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0666595591=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0666595591==
Content-Type: multipart/alternative; boundary="15649383890.dfa660ab7.32615"
Content-Transfer-Encoding: 7bit


--15649383890.dfa660ab7.32615
Date: Sun, 4 Aug 2019 17:06:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108641

--- Comment #3 from steelwinged@gmail.com ---
Situation still occurs on Mesa 19.1.3, refreshed RenderDoc capture at
https://www47.zippyshare.com/v/fL6gXv7u/file.html

I might be conflating things, but there's also a shader scheduling error:

##post_scheduler: unscheduled pending instructions :MOV     R27.x.5@R1.w,=
=20=20=20
R17.x.1@R1.x
MOV     R27.x.3@R1.y,    R17.w.1@R0.z
MOV     R17.x.1@R1.x,    A9.y[R16.x.1@R0.w]_73F@R1.y
                                            rels: A9.y[R16.x.1@R0.w]_73F@R1=
.y :
 <=3D R9.y.1F, R10.y.1F, R11.y.1F, R12.y.1F, R13.y.1F, R14.y.1F
MOV     R17.w.1@R0.z,    A9.x[R16.x.1@R0.w]_62F@R1.x
                                            rels: A9.x[R16.x.1@R0.w]_62F@R1=
.x :
 <=3D R9.x.1F, R10.x.1F, R11.x.1F, R12.x.1F, R13.x.1F, R14.x.1F
MOV     R14.y.1F,    4.2039e-45|00000003
MOV     R13.y.1F,    4.2039e-45|00000003
MOV     R12.y.1F,    7.00649e-45|00000005
MOV     R11.y.1F,    5.60519e-45|00000004
MOV     R10.y.1F,    4.2039e-45|00000003
MOV     R9.y.1F,    4.2039e-45|00000003
FLT_TO_UINT     R16.x.1@R0.w,    C4102.x
MOV     R14.x.1F,    1.4013e-45|00000001
MOV     R13.x.1F,    0|00000000
MOV     R12.x.1F,    0|00000000
MOV     R11.x.1F,    0|00000000
MOV     R10.x.1F,    5.60519e-45|00000004
MOV     R9.x.1F,    7.00649e-45|00000005

I don't read mnemonics, but I'm guessing that could be "Shader 9120" from t=
he
capture, which also causes the interlacing lines. I'm attaching it shortly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649383890.dfa660ab7.32615
Date: Sun, 4 Aug 2019 17:06:29 +0000
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
   title=3D"NEW - Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108641#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108641">bug 10864=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
steelwinged&#64;gmail.com" title=3D"steelwinged&#64;gmail.com">steelwinged&=
#64;gmail.com</a>
</span></b>
        <pre>Situation still occurs on Mesa 19.1.3, refreshed RenderDoc cap=
ture at
<a href=3D"https://www47.zippyshare.com/v/fL6gXv7u/file.html">https://www47=
.zippyshare.com/v/fL6gXv7u/file.html</a>

I might be conflating things, but there's also a shader scheduling error:

##post_scheduler: unscheduled pending instructions :MOV     <a href=3D"mail=
to:R27.x.5&#64;R1.w">R27.x.5&#64;R1.w</a>,=20=20=20
<a href=3D"mailto:R17.x.1&#64;R1.x">R17.x.1&#64;R1.x</a>
MOV     <a href=3D"mailto:R27.x.3&#64;R1.y">R27.x.3&#64;R1.y</a>,    <a hre=
f=3D"mailto:R17.w.1&#64;R0.z">R17.w.1&#64;R0.z</a>
MOV     <a href=3D"mailto:R17.x.1&#64;R1.x">R17.x.1&#64;R1.x</a>,    A9.y[<=
a href=3D"mailto:R16.x.1&#64;R0.w">R16.x.1&#64;R0.w</a>]<a href=3D"mailto:_=
73F&#64;R1.y">_73F&#64;R1.y</a>
                                            rels: A9.y[<a href=3D"mailto:R1=
6.x.1&#64;R0.w">R16.x.1&#64;R0.w</a>]<a href=3D"mailto:_73F&#64;R1.y">_73F&=
#64;R1.y</a> :
 &lt;=3D R9.y.1F, R10.y.1F, R11.y.1F, R12.y.1F, R13.y.1F, R14.y.1F
MOV     <a href=3D"mailto:R17.w.1&#64;R0.z">R17.w.1&#64;R0.z</a>,    A9.x[<=
a href=3D"mailto:R16.x.1&#64;R0.w">R16.x.1&#64;R0.w</a>]<a href=3D"mailto:_=
62F&#64;R1.x">_62F&#64;R1.x</a>
                                            rels: A9.x[<a href=3D"mailto:R1=
6.x.1&#64;R0.w">R16.x.1&#64;R0.w</a>]<a href=3D"mailto:_62F&#64;R1.x">_62F&=
#64;R1.x</a> :
 &lt;=3D R9.x.1F, R10.x.1F, R11.x.1F, R12.x.1F, R13.x.1F, R14.x.1F
MOV     R14.y.1F,    4.2039e-45|00000003
MOV     R13.y.1F,    4.2039e-45|00000003
MOV     R12.y.1F,    7.00649e-45|00000005
MOV     R11.y.1F,    5.60519e-45|00000004
MOV     R10.y.1F,    4.2039e-45|00000003
MOV     R9.y.1F,    4.2039e-45|00000003
FLT_TO_UINT     <a href=3D"mailto:R16.x.1&#64;R0.w">R16.x.1&#64;R0.w</a>,  =
  C4102.x
MOV     R14.x.1F,    1.4013e-45|00000001
MOV     R13.x.1F,    0|00000000
MOV     R12.x.1F,    0|00000000
MOV     R11.x.1F,    0|00000000
MOV     R10.x.1F,    5.60519e-45|00000004
MOV     R9.x.1F,    7.00649e-45|00000005

I don't read mnemonics, but I'm guessing that could be &quot;Shader 9120&qu=
ot; from the
capture, which also causes the interlacing lines. I'm attaching it shortly.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649383890.dfa660ab7.32615--

--===============0666595591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0666595591==--
