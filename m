Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA0F5D1B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 03:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48AB6E117;
	Sat,  9 Nov 2019 02:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC93E6FAD0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 02:54:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C9189720E2; Sat,  9 Nov 2019 02:54:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sat, 09 Nov 2019 02:54:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: robobenklein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111763-502-i1H5Qjmeee@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1100325571=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1100325571==
Content-Type: multipart/alternative; boundary="15732680938.0BC910.21222"
Content-Transfer-Encoding: 7bit


--15732680938.0BC910.21222
Date: Sat, 9 Nov 2019 02:54:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #25 from Ben Klein <robobenklein@gmail.com> ---
Created attachment 145918
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145918&action=3Dedit
Journal excerpt vega56 ring gfx timeout, then gpu reset

I think I'm having this problem on a Vega 56, I didn't see anyone else ment=
ion
that card here.

I attached the relevant log, I think it's this same issue, but someone corr=
ect
me if I'm wrong.

OpenGL renderer string: Radeon RX Vega (VEGA10, DRM 3.33.0, 5.3.0-20-generi=
c,
LLVM 9.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.1

Running Pop!_OS:
Linux robo-triangulum 5.3.0-20-generic
#21+system76~1572304854~19.10~8caa3e6-Ubuntu SMP Tue Oct 29 00:4 x86_64 x86=
_64
x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732680938.0BC910.21222
Date: Sat, 9 Nov 2019 02:54:53 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
robobenklein&#64;gmail.com" title=3D"Ben Klein &lt;robobenklein&#64;gmail.c=
om&gt;"> <span class=3D"fn">Ben Klein</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145918=
" name=3D"attach_145918" title=3D"Journal excerpt vega56 ring gfx timeout, =
then gpu reset">attachment 145918</a> <a href=3D"attachment.cgi?id=3D145918=
&amp;action=3Dedit" title=3D"Journal excerpt vega56 ring gfx timeout, then =
gpu reset">[details]</a></span>
Journal excerpt vega56 ring gfx timeout, then gpu reset

I think I'm having this problem on a Vega 56, I didn't see anyone else ment=
ion
that card here.

I attached the relevant log, I think it's this same issue, but someone corr=
ect
me if I'm wrong.

OpenGL renderer string: Radeon RX Vega (VEGA10, DRM 3.33.0, 5.3.0-20-generi=
c,
LLVM 9.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.1

Running Pop!_OS:
Linux robo-triangulum 5.3.0-20-generic
#21+system76~1572304854~19.10~8caa3e6-Ubuntu SMP Tue Oct 29 00:4 x86_64 x86=
_64
x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732680938.0BC910.21222--

--===============1100325571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1100325571==--
