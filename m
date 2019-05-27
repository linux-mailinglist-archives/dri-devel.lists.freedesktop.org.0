Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C62AD10
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 04:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A050C89316;
	Mon, 27 May 2019 02:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C56889316
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 02:49:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5382A72167; Mon, 27 May 2019 02:49:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110472] Graphical Fault (Desktop Freeze) on Specific OpenGL
 Application
Date: Mon, 27 May 2019 02:49:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110472-502-xKZafEj602@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110472-502@http.bugs.freedesktop.org/>
References: <bug-110472-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0704191090=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704191090==
Content-Type: multipart/alternative; boundary="15589253870.3817c1d.9684"
Content-Transfer-Encoding: 7bit


--15589253870.3817c1d.9684
Date: Mon, 27 May 2019 02:49:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110472

--- Comment #5 from Timothy Arceri <t_arceri@yahoo.com.au> ---
There is a bug in one of their generated shaders.

 error: #extension directive is not allowed in the middle of a shader

Some other drivers allow extension to be defined mid shader but this is inv=
alid
according to the OpenGL spec. You can see the problemn shader below:

#define EMULATION_UBO_BINDING 4
#define CBUF_BINDING_1 5
#define CBUF_BINDING_4 6
#define CBUF_BINDING_12 7
layout (lines) in;           <--- This needs to be after #extension
#define MAX_VERTEX_INPUT 2
#extension GL_ARB_separate_shader_objects : enable


This should be reported to the yuzu devs. For now you can try work around i=
t by
setting the below environment variable when running yuzu. Let me know if th=
is
fixes the issue for you.

allow_glsl_extension_directive_midshader=3Dtrue

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589253870.3817c1d.9684
Date: Mon, 27 May 2019 02:49:47 +0000
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
   title=3D"NEW - Graphical Fault (Desktop Freeze) on Specific OpenGL Appli=
cation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110472#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphical Fault (Desktop Freeze) on Specific OpenGL Appli=
cation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110472">bug 11047=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>There is a bug in one of their generated shaders.

 error: #extension directive is not allowed in the middle of a shader

Some other drivers allow extension to be defined mid shader but this is inv=
alid
according to the OpenGL spec. You can see the problemn shader below:

#define EMULATION_UBO_BINDING 4
#define CBUF_BINDING_1 5
#define CBUF_BINDING_4 6
#define CBUF_BINDING_12 7
layout (lines) in;           &lt;--- This needs to be after #extension
#define MAX_VERTEX_INPUT 2
#extension GL_ARB_separate_shader_objects : enable


This should be reported to the yuzu devs. For now you can try work around i=
t by
setting the below environment variable when running yuzu. Let me know if th=
is
fixes the issue for you.

allow_glsl_extension_directive_midshader=3Dtrue</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589253870.3817c1d.9684--

--===============0704191090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0704191090==--
