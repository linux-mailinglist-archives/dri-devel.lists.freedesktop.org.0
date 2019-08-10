Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AE88CD5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 21:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6F6E079;
	Sat, 10 Aug 2019 19:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 832626E46C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2019 19:00:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7FAF972167; Sat, 10 Aug 2019 19:00:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 10 Aug 2019 19:00:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-StWaP4pArY@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0548888994=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0548888994==
Content-Type: multipart/alternative; boundary="15654636175.9eFFCA9.25912"
Content-Transfer-Encoding: 7bit


--15654636175.9eFFCA9.25912
Date: Sat, 10 Aug 2019 19:00:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #68 from Tom B <tom@r.je> ---
Apologies for the multiple replies/emails. I think I must just have got luc=
ky.
It worked several boots (in a row) and now only works very occasionally. I
think it was just coincidence that it worked a few times after I installed =
that
kernel, sorry guys.

During my tests with 5.2.7 I have noticed some interesting findings with the
wattage though. It will indeed get stuck on a specific wattage, I've had 33,
24, 45, 133, 134 and on several wattages there is some fluctuation.  e.g.
33-34.

Higher wattages are significantly more stable, 133w lasts quite a while bef=
ore
it crashes, 33w crashes instantly. I'm assuming this is because the card ju=
st
doesn't have enough power to do what's required.

When the wattage gets stuck, if you force the performance mode:

# echo high > /sys/class/drm/card0/device/power_dpm_force_performance_level

it confuses the driver and sensors then shows

ERROR: Can't get value of subfeature power1_average: I/O error

Despite working until manually setting the power state. There doesn't seem =
to
be a way to get it back to a state where sensors shows the wattage after it
reaches this state, other than rebooting.


The inconsistent nature of this bug and the fact that it sometimes doesn't
appear suggests a race condition. I'd assume something else on the system
happens before or after amdgpu is expecting.

Is there any way to delay loading the amdgpu driver and manually loading it
after everything else?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15654636175.9eFFCA9.25912
Date: Sat, 10 Aug 2019 19:00:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c68">Comme=
nt # 68</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Apologies for the multiple replies/emails. I think I must just=
 have got lucky.
It worked several boots (in a row) and now only works very occasionally. I
think it was just coincidence that it worked a few times after I installed =
that
kernel, sorry guys.

During my tests with 5.2.7 I have noticed some interesting findings with the
wattage though. It will indeed get stuck on a specific wattage, I've had 33,
24, 45, 133, 134 and on several wattages there is some fluctuation.  e.g.
33-34.

Higher wattages are significantly more stable, 133w lasts quite a while bef=
ore
it crashes, 33w crashes instantly. I'm assuming this is because the card ju=
st
doesn't have enough power to do what's required.

When the wattage gets stuck, if you force the performance mode:

# echo high &gt; /sys/class/drm/card0/device/power_dpm_force_performance_le=
vel

it confuses the driver and sensors then shows

ERROR: Can't get value of subfeature power1_average: I/O error

Despite working until manually setting the power state. There doesn't seem =
to
be a way to get it back to a state where sensors shows the wattage after it
reaches this state, other than rebooting.


The inconsistent nature of this bug and the fact that it sometimes doesn't
appear suggests a race condition. I'd assume something else on the system
happens before or after amdgpu is expecting.

Is there any way to delay loading the amdgpu driver and manually loading it
after everything else?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15654636175.9eFFCA9.25912--

--===============0548888994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0548888994==--
