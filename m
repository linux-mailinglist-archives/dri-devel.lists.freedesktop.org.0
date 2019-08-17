Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3790C2F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 04:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929B46E9D5;
	Sat, 17 Aug 2019 02:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02BA76E9D1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 02:37:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C9B697215A; Sat, 17 Aug 2019 02:37:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 17 Aug 2019 02:37:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-tdB7zuKniQ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0767161163=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0767161163==
Content-Type: multipart/alternative; boundary="15660094720.7ECdb08.861"
Content-Transfer-Encoding: 7bit


--15660094720.7ECdb08.861
Date: Sat, 17 Aug 2019 02:37:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #113 from ReddestDream <reddestdream@gmail.com> ---
4.=20

> Given that two different versions of the code produce the same result, my=
 hunch is that the problem is B. The card is not in a state where it's able=
 to receive power changes.

Something to consider: In pretty much all the dmesg logs we see, amdgpu
attempts to reset the GPU, sometimes successfully, and yet it still can't
properly message the GPU afterward and we see the same sequence of failures
starting with "amdgpu: [powerplay] Failed to send message 0x28, response 0x0
amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!"

Eventually we start to see: "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed =
to
initialize parser -125!"

This comes from:

https://github.com/torvalds/linux/commits/master/drivers/gpu/drm/amd/amdgpu=
/amdgpu_cs.c

I'm not sure what the -125 error code indicates. My guess is ECANCELED
(Operation Cancelled) as the negated error code 125.

https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/errn=
o.h

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660094720.7ECdb08.861
Date: Sat, 17 Aug 2019 02:37:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c113">Comm=
ent # 113</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>4.=20

<span class=3D"quote">&gt; Given that two different versions of the code pr=
oduce the same result, my hunch is that the problem is B. The card is not i=
n a state where it's able to receive power changes.</span >

Something to consider: In pretty much all the dmesg logs we see, amdgpu
attempts to reset the GPU, sometimes successfully, and yet it still can't
properly message the GPU afterward and we see the same sequence of failures
starting with &quot;amdgpu: [powerplay] Failed to send message 0x28, respon=
se 0x0
amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min uclk failed!&q=
uot;

Eventually we start to see: &quot;[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fa=
iled to
initialize parser -125!&quot;

This comes from:

<a href=3D"https://github.com/torvalds/linux/commits/master/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c">https://github.com/torvalds/linux/commits/master/d=
rivers/gpu/drm/amd/amdgpu/amdgpu_cs.c</a>

I'm not sure what the -125 error code indicates. My guess is ECANCELED
(Operation Cancelled) as the negated error code 125.

<a href=3D"https://github.com/torvalds/linux/blob/master/include/uapi/asm-g=
eneric/errno.h">https://github.com/torvalds/linux/blob/master/include/uapi/=
asm-generic/errno.h</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660094720.7ECdb08.861--

--===============0767161163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0767161163==--
