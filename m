Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018EA10E26
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 22:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D63892E7;
	Wed,  1 May 2019 20:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 652F3892C5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 20:38:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5BC857215A; Wed,  1 May 2019 20:38:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110575] [R9 380X] Artifacts in CSGO
Date: Wed, 01 May 2019 20:38:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danylo.piliaiev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110575-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0527264475=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0527264475==
Content-Type: multipart/alternative; boundary="15567431350.eEf2.10944"
Content-Transfer-Encoding: 7bit


--15567431350.eEf2.10944
Date: Wed, 1 May 2019 20:38:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110575

            Bug ID: 110575
           Summary: [R9 380X] Artifacts in CSGO
           Product: Mesa
           Version: git
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: danylo.piliaiev@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144123
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144123&action=3Dedit
example of artifacts

Distro: Manjaro
Kernel: 5.0.5
GPU: R9 380X

Reproducible with:
  Mesa: git (07745f94948)
  LLVM: 9 (359393)

Isn't reproducible with:
  Mesa: 19.0.3
  LLVM: 8

Parts of the screen randomly become corrupted for 1 or 2 frames. It's not a
rare event.
Doesn't happen when capturing and/or replaying with apitrace.
Doesn't happen when running OBS.

Happens on new Sirocco map, didn't test on other.

Sorry for the image quality - it was taken from video recorded with old pho=
ne,
the grey squares on a tree branch are the artifacts in question but they co=
uld
be completely different.

I'm using https://pkgbuild.com/~lcarlier/mesa-git/x86_64/ for mesa and llvm
builds.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567431350.eEf2.10944
Date: Wed, 1 May 2019 20:38:55 +0000
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
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575">110575</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[R9 380X] Artifacts in CSGO
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>danylo.piliaiev&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144123=
" name=3D"attach_144123" title=3D"example of artifacts">attachment 144123</=
a> <a href=3D"attachment.cgi?id=3D144123&amp;action=3Dedit" title=3D"exampl=
e of artifacts">[details]</a></span>
example of artifacts

Distro: Manjaro
Kernel: 5.0.5
GPU: R9 380X

Reproducible with:
  Mesa: git (07745f94948)
  LLVM: 9 (359393)

Isn't reproducible with:
  Mesa: 19.0.3
  LLVM: 8

Parts of the screen randomly become corrupted for 1 or 2 frames. It's not a
rare event.
Doesn't happen when capturing and/or replaying with apitrace.
Doesn't happen when running OBS.

Happens on new Sirocco map, didn't test on other.

Sorry for the image quality - it was taken from video recorded with old pho=
ne,
the grey squares on a tree branch are the artifacts in question but they co=
uld
be completely different.

I'm using <a href=3D"https://pkgbuild.com/~lcarlier/mesa-git/x86_64/">https=
://pkgbuild.com/~lcarlier/mesa-git/x86_64/</a> for mesa and llvm
builds.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567431350.eEf2.10944--

--===============0527264475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0527264475==--
