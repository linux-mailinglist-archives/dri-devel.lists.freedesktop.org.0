Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5F74506
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 07:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F246E616;
	Thu, 25 Jul 2019 05:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EB566E5BB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:36:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6AC4E72167; Thu, 25 Jul 2019 05:36:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Thu, 25 Jul 2019 05:36:25 +0000
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
Message-ID: <bug-110674-502-bbSe4VDlX5@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2107062365=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2107062365==
Content-Type: multipart/alternative; boundary="15640329851.36a43a88D.6880"
Content-Transfer-Encoding: 7bit


--15640329851.36a43a88D.6880
Date: Thu, 25 Jul 2019 05:36:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #47 from ReddestDream <reddestdream@gmail.com> ---
(In reply to Tom B from comment #46)
> Has anyone tested 5.3 yet? I noticed there are a lot of powerplay changes.
>=20
> Since this bug messes up the card's power profile, how safe is testing new
> kernels? Is there any danger of my card being damaged due to wrong voltag=
es
> if the powerplay code is as buggy or worse than it has been since 5.1?

I've tested 5.3-rc-1 and no dice. I still get the PowerPlay Failed to send
message errors in dmesg when I have more than one monitor connected to Rade=
on
VII. :(

My current workaround is to connect my second monitor to the iGPU before bo=
ot.
Then the PowerPlay errors do not happen. As long as I don't get the PowerPl=
ay
errors in dmesg, graphics are stable. If the errors do appear, graphics wil=
l be
unstable. It's a pretty clear connection . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15640329851.36a43a88D.6880
Date: Thu, 25 Jul 2019 05:36:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c47">Comme=
nt # 47</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>(In reply to Tom B from <a href=3D"show_bug.cgi?id=3D110674#c4=
6">comment #46</a>)
<span class=3D"quote">&gt; Has anyone tested 5.3 yet? I noticed there are a=
 lot of powerplay changes.
&gt;=20
&gt; Since this bug messes up the card's power profile, how safe is testing=
 new
&gt; kernels? Is there any danger of my card being damaged due to wrong vol=
tages
&gt; if the powerplay code is as buggy or worse than it has been since 5.1?=
</span >

I've tested 5.3-rc-1 and no dice. I still get the PowerPlay Failed to send
message errors in dmesg when I have more than one monitor connected to Rade=
on
VII. :(

My current workaround is to connect my second monitor to the iGPU before bo=
ot.
Then the PowerPlay errors do not happen. As long as I don't get the PowerPl=
ay
errors in dmesg, graphics are stable. If the errors do appear, graphics wil=
l be
unstable. It's a pretty clear connection . . .</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15640329851.36a43a88D.6880--

--===============2107062365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2107062365==--
