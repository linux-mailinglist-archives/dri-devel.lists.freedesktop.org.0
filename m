Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E59CFB5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 14:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EF889BFF;
	Mon, 26 Aug 2019 12:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78F0C89C05
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 12:39:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 75A3372161; Mon, 26 Aug 2019 12:39:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Mon, 26 Aug 2019 12:39:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-vmUsKHTPax@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1675038146=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1675038146==
Content-Type: multipart/alternative; boundary="15668231771.2424dc3.7391"
Content-Transfer-Encoding: 7bit


--15668231771.2424dc3.7391
Date: Mon, 26 Aug 2019 12:39:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #48 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to tempel.julian from comment #47)
> I got a new 1440p 144 Hz FreeSync display, and as expected, the issue is
> unchanged with it.
>=20
> With it, I've created a new debug dmesg log for render stutter in Oblivio=
n,
> this time with your patch applied to drm-next kernel.
>=20
> Perhaps this could be interesting?
>=20
>=20
> [  529.556752] [drm:drm_mode_addfb2 [drm]] [FB:79]
> [  529.557106] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet
> update: crtc=3D47 enabled=3D1 state=3D3
> [  529.557164] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full
> update issued
> [  529.564401] [drm:drm_mode_addfb2 [drm]] [FB:86]
> [  531.420971] [drm:drm_mode_addfb2 [drm]] [FB:95]
> [  531.459067] [drm:drm_mode_addfb2 [drm]] [FB:96]
> [  544.144771] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet
> update: crtc=3D47 enabled=3D0 state=3D2
> [  544.145961] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full
> update issued
> [  544.169447] [drm:drm_mode_addfb2 [drm]] [FB:79]
> [  544.172953] [drm:drm_mode_addfb2 [drm]] [FB:94]

This is normal behavior for toggling into and out of VRR. I was expecting to
see was a log with hundreds of full updates issued, but since this isn't the
case I think it's something more fundamental with vblank timing though I'm
still not quite sure why it I can't reproduce it in my testing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668231771.2424dc3.7391
Date: Mon, 26 Aug 2019 12:39:37 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c48">Comme=
nt # 48</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
10659#c47">comment #47</a>)
<span class=3D"quote">&gt; I got a new 1440p 144 Hz FreeSync display, and a=
s expected, the issue is
&gt; unchanged with it.
&gt;=20
&gt; With it, I've created a new debug dmesg log for render stutter in Obli=
vion,
&gt; this time with your patch applied to drm-next kernel.
&gt;=20
&gt; Perhaps this could be interesting?
&gt;=20
&gt;=20
&gt; [  529.556752] [drm:drm_mode_addfb2 [drm]] [FB:79]
&gt; [  529.557106] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet
&gt; update: crtc=3D47 enabled=3D1 state=3D3
&gt; [  529.557164] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full
&gt; update issued
&gt; [  529.564401] [drm:drm_mode_addfb2 [drm]] [FB:86]
&gt; [  531.420971] [drm:drm_mode_addfb2 [drm]] [FB:95]
&gt; [  531.459067] [drm:drm_mode_addfb2 [drm]] [FB:96]
&gt; [  544.144771] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] VRR packet
&gt; update: crtc=3D47 enabled=3D0 state=3D2
&gt; [  544.145961] [drm:dc_commit_updates_for_stream [amdgpu]] debug: full
&gt; update issued
&gt; [  544.169447] [drm:drm_mode_addfb2 [drm]] [FB:79]
&gt; [  544.172953] [drm:drm_mode_addfb2 [drm]] [FB:94]</span >

This is normal behavior for toggling into and out of VRR. I was expecting to
see was a log with hundreds of full updates issued, but since this isn't the
case I think it's something more fundamental with vblank timing though I'm
still not quite sure why it I can't reproduce it in my testing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668231771.2424dc3.7391--

--===============1675038146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1675038146==--
