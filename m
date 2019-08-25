Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780359C4C0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 17:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512B6E10E;
	Sun, 25 Aug 2019 15:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BEDB36E10E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 15:48:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BAFBD72161; Sun, 25 Aug 2019 15:48:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Sun, 25 Aug 2019 15:48:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-iyxpLMddAP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0722888430=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0722888430==
Content-Type: multipart/alternative; boundary="15667480852.2534DeF.22536"
Content-Transfer-Encoding: 7bit


--15667480852.2534DeF.22536
Date: Sun, 25 Aug 2019 15:48:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #47 from tempel.julian@gmail.com ---
I got a new 1440p 144 Hz FreeSync display, and as expected, the issue is
unchanged with it.

With it, I've created a new debug dmesg log for render stutter in Oblivion,
this time with your patch applied to drm-next kernel.

Perhaps this could be interesting?


[  529.556752] [drm:drm_mode_addfb2 [drm]] [FB:79]
[  529.557106] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet updat=
e:
crtc=3D47 enabled=3D1 state=3D3
[  529.557164] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full upda=
te
issued
[  529.564401] [drm:drm_mode_addfb2 [drm]] [FB:86]
[  531.420971] [drm:drm_mode_addfb2 [drm]] [FB:95]
[  531.459067] [drm:drm_mode_addfb2 [drm]] [FB:96]
[  544.144771] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet updat=
e:
crtc=3D47 enabled=3D0 state=3D2
[  544.145961] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full upda=
te
issued
[  544.169447] [drm:drm_mode_addfb2 [drm]] [FB:79]
[  544.172953] [drm:drm_mode_addfb2 [drm]] [FB:94]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667480852.2534DeF.22536
Date: Sun, 25 Aug 2019 15:48:05 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c47">Comme=
nt # 47</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>I got a new 1440p 144 Hz FreeSync display, and as expected, th=
e issue is
unchanged with it.

With it, I've created a new debug dmesg log for render stutter in Oblivion,
this time with your patch applied to drm-next kernel.

Perhaps this could be interesting?


[  529.556752] [drm:drm_mode_addfb2 [drm]] [FB:79]
[  529.557106] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet updat=
e:
crtc=3D47 enabled=3D1 state=3D3
[  529.557164] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full upda=
te
issued
[  529.564401] [drm:drm_mode_addfb2 [drm]] [FB:86]
[  531.420971] [drm:drm_mode_addfb2 [drm]] [FB:95]
[  531.459067] [drm:drm_mode_addfb2 [drm]] [FB:96]
[  544.144771] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet updat=
e:
crtc=3D47 enabled=3D0 state=3D2
[  544.145961] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full upda=
te
issued
[  544.169447] [drm:drm_mode_addfb2 [drm]] [FB:79]
[  544.172953] [drm:drm_mode_addfb2 [drm]] [FB:94]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667480852.2534DeF.22536--

--===============0722888430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0722888430==--
