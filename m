Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7EF58FC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 22:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A417D6FA74;
	Fri,  8 Nov 2019 21:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D06FA7E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 21:00:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 98C5C720E2; Fri,  8 Nov 2019 21:00:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111762] RX 5700 XT Navi - amdgpu.ppfeaturemask=0xffffffff
 causes stuttering and does not unlock clock/voltage/power controls
Date: Fri, 08 Nov 2019 21:00:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111762-502-ArZCc0fDs2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111762-502@http.bugs.freedesktop.org/>
References: <bug-111762-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1845605137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1845605137==
Content-Type: multipart/alternative; boundary="15732468413.3b25FFf.1756"
Content-Transfer-Encoding: 7bit


--15732468413.3b25FFf.1756
Date: Fri, 8 Nov 2019 21:00:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111762

--- Comment #14 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to tempel.julian from comment #13)
> It might be that, just not in hex. E.g. VddcLookupTable entry 1 returns a
> Vdd of 65282.

Correct.  65282 is 0xff02 which is a virtual voltage id.  The driver uses t=
hat
id to look up the real voltage based on the leakage for the board.  Take a =
look
at smu7_get_evv_voltages() or smu7_get_elb_voltages() in smu7_hwmgr.c.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732468413.3b25FFf.1756
Date: Fri, 8 Nov 2019 21:00:41 +0000
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
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762">bug 11176=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
11762#c13">comment #13</a>)
<span class=3D"quote">&gt; It might be that, just not in hex. E.g. VddcLook=
upTable entry 1 returns a
&gt; Vdd of 65282.</span >

Correct.  65282 is 0xff02 which is a virtual voltage id.  The driver uses t=
hat
id to look up the real voltage based on the leakage for the board.  Take a =
look
at smu7_get_evv_voltages() or smu7_get_elb_voltages() in smu7_hwmgr.c.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732468413.3b25FFf.1756--

--===============1845605137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1845605137==--
