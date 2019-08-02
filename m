Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5587EFE0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92736ED6E;
	Fri,  2 Aug 2019 09:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BC8F6ED6B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:08:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 88B6372167; Fri,  2 Aug 2019 09:08:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111272] [DRI_PRIME] Error on multi GPU with only one enabled
Date: Fri, 02 Aug 2019 09:08:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: GLX
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: mesa-dev@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to component version product qa_contact
Message-ID: <bug-111272-502-roNl5xWuF6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111272-502@http.bugs.freedesktop.org/>
References: <bug-111272-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1039863476=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1039863476==
Content-Type: multipart/alternative; boundary="15647368862.2eDF1e.9898"
Content-Transfer-Encoding: 7bit


--15647368862.2eDF1e.9898
Date: Fri, 2 Aug 2019 09:08:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111272

Michel D=C3=A4nzer <michel@daenzer.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|dri-devel@lists.freedesktop |mesa-dev@lists.freedesktop.
                   |.org                        |org
          Component|DRM/AMDgpu                  |GLX
            Version|XOrg git                    |unspecified
            Product|DRI                         |Mesa
         QA Contact|                            |mesa-dev@lists.freedesktop.
                   |                            |org

--- Comment #7 from Michel D=C3=A4nzer <michel@daenzer.net> ---
Due to DRI_PRIME=3D1, libGL tries to initialize the i965 driver with DRI3, =
which
fails:

 libGL error: Different GPU, but blitImage not implemented for this driver
 libGL error: failed to load driver: i965

So it falls back to DRI2, which uses the AMD GPU, because the Intel one was=
n't
initialized in Xorg. DRI2 doesn't support sync-to-vblank via PRIME.

Reassigning to Mesa for now, but DRI_PRIME=3D1 really isn't intended to be =
used
with a single GPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647368862.2eDF1e.9898
Date: Fri, 2 Aug 2019 09:08:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272">bug 11127=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/AMDgpu
           </td>
           <td>GLX
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>XOrg git
           </td>
           <td>unspecified
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Product</td>
           <td>DRI
           </td>
           <td>Mesa
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272">bug 11127=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>Due to DRI_PRIME=3D1, libGL tries to initialize the i965 drive=
r with DRI3, which
fails:

 libGL error: Different GPU, but blitImage not implemented for this driver
 libGL error: failed to load driver: i965

So it falls back to DRI2, which uses the AMD GPU, because the Intel one was=
n't
initialized in Xorg. DRI2 doesn't support sync-to-vblank via PRIME.

Reassigning to Mesa for now, but DRI_PRIME=3D1 really isn't intended to be =
used
with a single GPU.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15647368862.2eDF1e.9898--

--===============1039863476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1039863476==--
