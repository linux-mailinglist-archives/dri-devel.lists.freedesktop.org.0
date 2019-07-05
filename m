Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721465FF9C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 04:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9B6E3F9;
	Fri,  5 Jul 2019 02:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1DA26E3F9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 02:57:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BCBB972167; Fri,  5 Jul 2019 02:57:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111061] Most shaders in no mans sky fail to compile.
Date: Fri, 05 Jul 2019 02:57:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTABUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111061-502-gW0TA2WU7X@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111061-502@http.bugs.freedesktop.org/>
References: <bug-111061-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0375443217=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0375443217==
Content-Type: multipart/alternative; boundary="15622954581.945e.13958"
Content-Transfer-Encoding: 7bit


--15622954581.945e.13958
Date: Fri, 5 Jul 2019 02:57:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111061

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #2 from Timothy Arceri <t_arceri@yahoo.com.au> ---
(In reply to Haxk20 from comment #0)
> I installed No mans sky and used those enviroment variables:
> MESA_GL_VERSION_OVERRIDE=3D4.5COMPAT
> force_glsl_extensions_warn=3Dtrue
> and the game still fails to render multiple shaders. Well most of them.
> Clouds are rendered properly. Other then that its not there.

You shouldn't need these environment variables any longer. radeonsi now
supports compat profile in GL 4.5 by default and the other overrides needed=
 to
run the game are set in 00-mesa-defaults.conf.

I just tested No Mans Sky and it runs perfectly. I suspect you either need =
to
update your systems Mesa package or you have a local copy in you home direc=
tory
that is overriding the system copy of 00-mesa-defaults.conf, if so you shou=
ld
delete it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622954581.945e.13958
Date: Fri, 5 Jul 2019 02:57:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTABUG - Most shaders in no mans sky fail to compile."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111061">bug 11106=
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
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTABUG - Most shaders in no mans sky fail to compile."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111061#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTABUG - Most shaders in no mans sky fail to compile."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111061">bug 11106=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>(In reply to Haxk20 from <a href=3D"show_bug.cgi?id=3D111061#c=
0">comment #0</a>)
<span class=3D"quote">&gt; I installed No mans sky and used those enviromen=
t variables:
&gt; MESA_GL_VERSION_OVERRIDE=3D4.5COMPAT
&gt; force_glsl_extensions_warn=3Dtrue
&gt; and the game still fails to render multiple shaders. Well most of them.
&gt; Clouds are rendered properly. Other then that its not there.</span >

You shouldn't need these environment variables any longer. radeonsi now
supports compat profile in GL 4.5 by default and the other overrides needed=
 to
run the game are set in 00-mesa-defaults.conf.

I just tested No Mans Sky and it runs perfectly. I suspect you either need =
to
update your systems Mesa package or you have a local copy in you home direc=
tory
that is overriding the system copy of 00-mesa-defaults.conf, if so you shou=
ld
delete it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622954581.945e.13958--

--===============0375443217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0375443217==--
