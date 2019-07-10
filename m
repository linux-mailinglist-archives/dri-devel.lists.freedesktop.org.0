Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E064481
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 11:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8114289A74;
	Wed, 10 Jul 2019 09:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5087389EB1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:41:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4DCCB72167; Wed, 10 Jul 2019 09:41:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 10 Jul 2019 09:41:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samueldgv@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-fp1vaPJ8Fn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1124032961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1124032961==
Content-Type: multipart/alternative; boundary="15627516824.0aFeCF08b.22009"
Content-Transfer-Encoding: 7bit


--15627516824.0aFeCF08b.22009
Date: Wed, 10 Jul 2019 09:41:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #47 from Sam <samueldgv@mailbox.org> ---
The relevant issue and bug report here (the system freezing completely or if
lucky just killing the X session, NOT games crashing) seems to be related
exclusively to AMDGPU, and not to mesa. Whereas I got the same issues over =
and
over after trying out several versions of mesa, switching to older versions=
 of
the kernel "fixes" it for me (the latest version I tried out which didn't h=
ave
these issues is Kernel 4.20.13, in my case from
https://download.opensuse.org/repositories/home:/tiwai:/kernel:/4.20/standa=
rd/x86_64/)

There is also a report from another user which temporarily fixed it by forc=
ing
the gpu to run at the maximum power setting
(https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293):

# echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_lev=
el
# echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk

and then to reset back to normal:

# echo auto > /sys/class/drm/card0/device/power_dpm_force_performance_level

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627516824.0aFeCF08b.22009
Date: Wed, 10 Jul 2019 09:41:22 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c47">Comme=
nt # 47</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samueldgv&#64;mailbox.org" title=3D"Sam &lt;samueldgv&#64;mailbox.org&gt;">=
 <span class=3D"fn">Sam</span></a>
</span></b>
        <pre>The relevant issue and bug report here (the system freezing co=
mpletely or if
lucky just killing the X session, NOT games crashing) seems to be related
exclusively to AMDGPU, and not to mesa. Whereas I got the same issues over =
and
over after trying out several versions of mesa, switching to older versions=
 of
the kernel &quot;fixes&quot; it for me (the latest version I tried out whic=
h didn't have
these issues is Kernel 4.20.13, in my case from
<a href=3D"https://download.opensuse.org/repositories/home:/tiwai:/kernel:/=
4.20/standard/x86_64/">https://download.opensuse.org/repositories/home:/tiw=
ai:/kernel:/4.20/standard/x86_64/</a>)

There is also a report from another user which temporarily fixed it by forc=
ing
the gpu to run at the maximum power setting
(<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293">https:=
//bugzilla.opensuse.org/show_bug.cgi?id=3D1136293</a>):

# echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_performance_=
level
# echo 7 &gt; /sys/class/drm/card0/device/pp_dpm_sclk

and then to reset back to normal:

# echo auto &gt; /sys/class/drm/card0/device/power_dpm_force_performance_le=
vel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627516824.0aFeCF08b.22009--

--===============1124032961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1124032961==--
