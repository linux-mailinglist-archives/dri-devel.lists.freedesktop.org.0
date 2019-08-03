Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4378061D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 14:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C856E4A1;
	Sat,  3 Aug 2019 12:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52F126E4B3
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 12:10:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4DEB172167; Sat,  3 Aug 2019 12:10:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 03 Aug 2019 12:10:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: phercek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-KPfgS6xFkN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0365902920=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0365902920==
Content-Type: multipart/alternative; boundary="15648342113.CEd271.15390"
Content-Transfer-Encoding: 7bit


--15648342113.CEd271.15390
Date: Sat, 3 Aug 2019 12:10:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #58 from Peter Hercek <phercek@gmail.com> ---
It is probably not related to changes from 5.0 to 5.1.
I have got the hang up with 5.0.13 as well as with 4.20.11.
It may be only less common with older kernels.

In my case, it is triggered mostly by playing a video stream in parallel wi=
th
some other activity. My logs with 5.1 and 5.2 kernels look just like Chris'
log. First amdgpu_job_timedout, then an attempt to reset gpu followed by
endless stream of parser initialization failures.

I did not check the logs with older kernels but it all looked the same at t=
he
user level. The video subsystem is hung up. The rest of the machine (e.g. an
ssh session) work ok.

My /sys/class/hwmon/hwmon1/power1_average reported normal values around 25W
after hang up. I'm not seeing unusually high power values like Tom B.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648342113.CEd271.15390
Date: Sat, 3 Aug 2019 12:10:11 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c58">Comme=
nt # 58</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
phercek&#64;gmail.com" title=3D"Peter Hercek &lt;phercek&#64;gmail.com&gt;"=
> <span class=3D"fn">Peter Hercek</span></a>
</span></b>
        <pre>It is probably not related to changes from 5.0 to 5.1.
I have got the hang up with 5.0.13 as well as with 4.20.11.
It may be only less common with older kernels.

In my case, it is triggered mostly by playing a video stream in parallel wi=
th
some other activity. My logs with 5.1 and 5.2 kernels look just like Chris'
log. First amdgpu_job_timedout, then an attempt to reset gpu followed by
endless stream of parser initialization failures.

I did not check the logs with older kernels but it all looked the same at t=
he
user level. The video subsystem is hung up. The rest of the machine (e.g. an
ssh session) work ok.

My /sys/class/hwmon/hwmon1/power1_average reported normal values around 25W
after hang up. I'm not seeing unusually high power values like Tom B.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648342113.CEd271.15390--

--===============0365902920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0365902920==--
