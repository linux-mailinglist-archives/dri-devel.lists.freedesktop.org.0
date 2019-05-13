Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D339A1B47D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 13:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081789BD4;
	Mon, 13 May 2019 11:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CA5C89BD4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 11:04:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 393C5721CD; Mon, 13 May 2019 11:04:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110671] Regression: DP outputs out of sync on dual-DP tiled 5k
 screen
Date: Mon, 13 May 2019 11:04:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs@bzatek.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110671-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1235012260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1235012260==
Content-Type: multipart/alternative; boundary="15577454591.801E2de9.28223"
Content-Transfer-Encoding: 7bit


--15577454591.801E2de9.28223
Date: Mon, 13 May 2019 11:04:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110671

            Bug ID: 110671
           Summary: Regression: DP outputs out of sync on dual-DP tiled 5k
                    screen
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: bugs@bzatek.net

With kernel 5.1.1 I get corrupted image on my Dell UP2715K screen (again). =
The
symptomps are similar to the ones in bug 98461 (see also attachment 127570)=
. In
my theory this is caused by the two DisplayPort outputs not being in sync -=
 the
screen needs both tiles to be in sync (i.e. scanlines to match) to make a
composite final image.

The Dell UP2715K monitor has two DP 1.2 inputs, two tiles expecting
2560x2880@60Hz modes (as exposed in EDID/DisplayInfo data). Connected to Ra=
deon
Pro WX2100 (Polaris 12).

This used to be actually working reliably in kernel 4.20.0, yesterday I fir=
ed
up kernel 5.1.1 and only got garbage on my screen. Also tested drm-tip kern=
el
that includes drm-next-5.2 branch from the agd5f repo
(https://patchwork.freedesktop.org/patch/304430/) - same issue.

I haven't got time to bisect the change yet, I was hoping you could point m=
e to
a possible commit that broke this. By any chance, do you AMD guys have a 5k
tiled screen inhouse for testing?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15577454591.801E2de9.28223
Date: Mon, 13 May 2019 11:04:19 +0000
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
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671">110671</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Regression: DP outputs out of sync on dual-DP tiled 5k screen
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>bugs&#64;bzatek.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With kernel 5.1.1 I get corrupted image on my Dell UP2715K scr=
een (again). The
symptomps are similar to the ones in <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon and 5k resolution 5120x2880 =3D corrupted image"
   href=3D"show_bug.cgi?id=3D98461">bug 98461</a> (see also <span class=3D"=
"><a href=3D"attachment.cgi?id=3D127570" name=3D"attach_127570" title=3D"Ph=
oto of display">attachment 127570</a> <a href=3D"attachment.cgi?id=3D127570=
&amp;action=3Dedit" title=3D"Photo of display">[details]</a></span>). In
my theory this is caused by the two DisplayPort outputs not being in sync -=
 the
screen needs both tiles to be in sync (i.e. scanlines to match) to make a
composite final image.

The Dell UP2715K monitor has two DP 1.2 inputs, two tiles expecting
2560x2880&#64;60Hz modes (as exposed in EDID/DisplayInfo data). Connected t=
o Radeon
Pro WX2100 (Polaris 12).

This used to be actually working reliably in kernel 4.20.0, yesterday I fir=
ed
up kernel 5.1.1 and only got garbage on my screen. Also tested drm-tip kern=
el
that includes drm-next-5.2 branch from the agd5f repo
(<a href=3D"https://patchwork.freedesktop.org/patch/304430/">https://patchw=
ork.freedesktop.org/patch/304430/</a>) - same issue.

I haven't got time to bisect the change yet, I was hoping you could point m=
e to
a possible commit that broke this. By any chance, do you AMD guys have a 5k
tiled screen inhouse for testing?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577454591.801E2de9.28223--

--===============1235012260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1235012260==--
