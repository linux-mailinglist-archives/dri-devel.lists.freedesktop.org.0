Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9ABE78F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 23:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65D57AC74;
	Wed, 25 Sep 2019 21:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B145D7AC68
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 21:37:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AC11E72162; Wed, 25 Sep 2019 21:37:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Wed, 25 Sep 2019 21:37:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@jeroenimo.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-TTvEHGmGpN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0078018959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0078018959==
Content-Type: multipart/alternative; boundary="15694474322.95D76FD.18131"
Content-Transfer-Encoding: 7bit


--15694474322.95D76FD.18131
Date: Wed, 25 Sep 2019 21:37:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #88 from jeroenimo <freedesktop@jeroenimo.nl> ---
Found this thread while googling the error from the log.

AMD Ryzen 3600
Asrock B350 motherboard
ASrock RX560 Radeon GPU


Ubuntu and Xubuntu  18.04 and 19.04 both lockups so not useable, after login
almost imminent black screen, ssh access still possible. Seems a newer kern=
el
and mesa drivers. sometimes 5 min , sometimes after 2 secomds

Linux mint 19.2
Seems a lot more stable but so far only  1 lockup with black screen

uname -a
Linux jeroenimo-amd 4.15.0-64-generic #73-Ubuntu SMP Thu Sep 12 13:16:13 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux


Last log from mint:

Sep 25 23:01:57 jeroenimo-amd kernel: [ 4980.207322]
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:43:crtc-0] flip_done timed out
Sep 25 23:01:57 jeroenimo-amd kernel: [ 4980.207331]
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:45:crtc-1] flip_done timed out
Sep 25 23:02:07 jeroenimo-amd kernel: [ 4990.451366]
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:43:crtc-0] flip_done timed out

 I suspect I'm in the same trouble as most.

Win 10 flawless so it's really software..

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694474322.95D76FD.18131
Date: Wed, 25 Sep 2019 21:37:12 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c88">Comme=
nt # 88</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;jeroenimo.nl" title=3D"jeroenimo &lt;freedesktop&#64;jeroen=
imo.nl&gt;"> <span class=3D"fn">jeroenimo</span></a>
</span></b>
        <pre>Found this thread while googling the error from the log.

AMD Ryzen 3600
Asrock B350 motherboard
ASrock RX560 Radeon GPU


Ubuntu and Xubuntu  18.04 and 19.04 both lockups so not useable, after login
almost imminent black screen, ssh access still possible. Seems a newer kern=
el
and mesa drivers. sometimes 5 min , sometimes after 2 secomds

Linux mint 19.2
Seems a lot more stable but so far only  1 lockup with black screen

uname -a
Linux jeroenimo-amd 4.15.0-64-generic #73-Ubuntu SMP Thu Sep 12 13:16:13 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux


Last log from mint:

Sep 25 23:01:57 jeroenimo-amd kernel: [ 4980.207322]
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:43:crtc-0] flip_done timed out
Sep 25 23:01:57 jeroenimo-amd kernel: [ 4980.207331]
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:45:crtc-1] flip_done timed out
Sep 25 23:02:07 jeroenimo-amd kernel: [ 4990.451366]
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:43:crtc-0] flip_done timed out

 I suspect I'm in the same trouble as most.

Win 10 flawless so it's really software..</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694474322.95D76FD.18131--

--===============0078018959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0078018959==--
