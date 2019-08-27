Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD299EA99
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4F789BF4;
	Tue, 27 Aug 2019 14:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82B5889BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:14:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7916172161; Tue, 27 Aug 2019 14:14:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111502] Dell XPS15 (HD530 & GeForce 950) external screen via
 dock/HDMI no text display & gdm freeze
Date: Tue, 27 Aug 2019 14:14:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Intel
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: intel-gfx-bugs@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact component cc assigned_to
Message-ID: <bug-111502-502-SJCOUwIzxy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111502-502@http.bugs.freedesktop.org/>
References: <bug-111502-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1544994413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1544994413==
Content-Type: multipart/alternative; boundary="15669152480.9c991a.8837"
Content-Transfer-Encoding: 7bit


--15669152480.9c991a.8837
Date: Tue, 27 Aug 2019 14:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111502

Ilia Mirkin <imirkin@alum.mit.edu> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
          Component|General                     |DRM/Intel
                 CC|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
           Assignee|dri-devel@lists.freedesktop |intel-gfx-bugs@lists.freede
                   |.org                        |sktop.org

--- Comment #1 from Ilia Mirkin <imirkin@alum.mit.edu> ---
The ultimate issue is a modeset failure:

[   107.379] (EE) modeset(0): failed to set mode: No space left on device

Pretty sure that nouveau's not involved since there are, it seems, no
connectors hanging off the NVIDIA device. Try booting one of the failing
kernels with

drm.debug=3D0x1e

which should hopefully reveal more information about what's going wrong.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669152480.9c991a.8837
Date: Tue, 27 Aug 2019 14:14:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dell XPS15 (HD530 &amp; GeForce 950) external screen via =
dock/HDMI no text display &amp; gdm freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111502">bug 11150=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>General
           </td>
           <td>DRM/Intel
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dell XPS15 (HD530 &amp; GeForce 950) external screen via =
dock/HDMI no text display &amp; gdm freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111502#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dell XPS15 (HD530 &amp; GeForce 950) external screen via =
dock/HDMI no text display &amp; gdm freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111502">bug 11150=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The ultimate issue is a modeset failure:

[   107.379] (EE) modeset(0): failed to set mode: No space left on device

Pretty sure that nouveau's not involved since there are, it seems, no
connectors hanging off the NVIDIA device. Try booting one of the failing
kernels with

drm.debug=3D0x1e

which should hopefully reveal more information about what's going wrong.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669152480.9c991a.8837--

--===============1544994413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1544994413==--
