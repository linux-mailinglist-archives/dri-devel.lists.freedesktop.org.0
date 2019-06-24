Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1C5104B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760B89C84;
	Mon, 24 Jun 2019 15:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 501CB89C84
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:28:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 477EB72167; Mon, 24 Jun 2019 15:28:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110981] Glitches with amdgpu driver and QtWebEngine
Date: Mon, 24 Jun 2019 15:28:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@trummer.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110981-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2103319277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2103319277==
Content-Type: multipart/alternative; boundary="15613901150.6437a27.21172"
Content-Transfer-Encoding: 7bit


--15613901150.6437a27.21172
Date: Mon, 24 Jun 2019 15:28:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110981

            Bug ID: 110981
           Summary: Glitches with amdgpu driver and QtWebEngine
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@trummer.xyz

(
original bug at openSUSE bugzilla
https://bugzilla.suse.com/show_bug.cgi?id=3D1139011
)

Web contents rendered with QtWebEngine and the amdgpu driver have heavy
glitches since a recent update. Some examples:

- Scrollbars have glitches until a mouse over happens
- embedded videos have glitches until mouseover
- YouTube videos will lag heavily when the playback controls are displayed

The problem appears in programs that use QtWebEngine (libqt5-qtwebengine) l=
ike
KMail and Falkon.
It does not appear in Firefox which uses its own rendering engine.
It does also not appear on another machine that has an Intel iGPU when using
programs that use QtWebEngine.

Therefore I believe the problem is related to the amdgpu kernel driver and =
it
manifests only when using QtWebEngine, so I filed it as a kernel bug.

I'll attach some example screenshots to illustrate the issue.



System info:

Operating System: openSUSE Tumbleweed 20190621
KDE Plasma Version: 5.16.0
KDE Frameworks Version: 5.58.0
Qt Version: 5.12.3
Kernel Version: 5.1.7-1-default
OS Type: 64-bit
Processors: 12 =C3=97 AMD Ryzen 5 2600X Six-Core Processor
Memory: 31,4 GiB

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15613901150.6437a27.21172
Date: Mon, 24 Jun 2019 15:28:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Glitches with amdgpu driver and QtWebEngine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110981">110981</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Glitches with amdgpu driver and QtWebEngine
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>freedesktop&#64;trummer.xyz
          </td>
        </tr></table>
      <p>
        <div>
        <pre>(
original bug at openSUSE bugzilla
<a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1139011">https://bug=
zilla.suse.com/show_bug.cgi?id=3D1139011</a>
)

Web contents rendered with QtWebEngine and the amdgpu driver have heavy
glitches since a recent update. Some examples:

- Scrollbars have glitches until a mouse over happens
- embedded videos have glitches until mouseover
- YouTube videos will lag heavily when the playback controls are displayed

The problem appears in programs that use QtWebEngine (libqt5-qtwebengine) l=
ike
KMail and Falkon.
It does not appear in Firefox which uses its own rendering engine.
It does also not appear on another machine that has an Intel iGPU when using
programs that use QtWebEngine.

Therefore I believe the problem is related to the amdgpu kernel driver and =
it
manifests only when using QtWebEngine, so I filed it as a kernel bug.

I'll attach some example screenshots to illustrate the issue.



System info:

Operating System: openSUSE Tumbleweed 20190621
KDE Plasma Version: 5.16.0
KDE Frameworks Version: 5.58.0
Qt Version: 5.12.3
Kernel Version: 5.1.7-1-default
OS Type: 64-bit
Processors: 12 =C3=97 AMD Ryzen 5 2600X Six-Core Processor
Memory: 31,4 GiB</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15613901150.6437a27.21172--

--===============2103319277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2103319277==--
