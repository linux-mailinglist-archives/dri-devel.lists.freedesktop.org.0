Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA69ADB4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 12:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D436E054;
	Fri, 23 Aug 2019 10:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7672B6EC74
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 10:57:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7356A72161; Fri, 23 Aug 2019 10:57:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Fri, 23 Aug 2019 10:57:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: yshuiv7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102646-502-8I94yTHUf8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0782983961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0782983961==
Content-Type: multipart/alternative; boundary="15665578386.995eF.1987"
Content-Transfer-Encoding: 7bit


--15665578386.995eF.1987
Date: Fri, 23 Aug 2019 10:57:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

--- Comment #114 from Yuxuan Shui <yshuiv7@gmail.com> ---
(In reply to magist3r from comment #111)
> (In reply to tempel.julian from comment #110)
> > (In reply to magist3r from comment #109)
> > > My patch fixes a bug that breaks this behavior when OverDrive mask is
> > > enabled, nothing more.
> >=20
> > It unfortunately also forces my single display 1440p 75Hz into maximum =
VRAM
> > clock.
>=20
> It's not caused by my patch. Try to disable overdrive mask, revert the pa=
tch
> and you will see the same behavior.

Can confirm your patch fixed the glitch for me. Also yes, my MCLK is stuck =
at
the highest level without your patch anyways.

I have 2 monitors at 60hz.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15665578386.995eF.1987
Date: Fri, 23 Aug 2019 10:57:18 +0000
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
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c114">Comm=
ent # 114</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yshuiv7&#64;gmail.com" title=3D"Yuxuan Shui &lt;yshuiv7&#64;gmail.com&gt;">=
 <span class=3D"fn">Yuxuan Shui</span></a>
</span></b>
        <pre>(In reply to magist3r from <a href=3D"show_bug.cgi?id=3D102646=
#c111">comment #111</a>)
<span class=3D"quote">&gt; (In reply to tempel.julian from <a href=3D"show_=
bug.cgi?id=3D102646#c110">comment #110</a>)
&gt; &gt; (In reply to magist3r from <a href=3D"show_bug.cgi?id=3D102646#c1=
09">comment #109</a>)
&gt; &gt; &gt; My patch fixes a bug that breaks this behavior when OverDriv=
e mask is
&gt; &gt; &gt; enabled, nothing more.
&gt; &gt;=20
&gt; &gt; It unfortunately also forces my single display 1440p 75Hz into ma=
ximum VRAM
&gt; &gt; clock.
&gt;=20
&gt; It's not caused by my patch. Try to disable overdrive mask, revert the=
 patch
&gt; and you will see the same behavior.</span >

Can confirm your patch fixed the glitch for me. Also yes, my MCLK is stuck =
at
the highest level without your patch anyways.

I have 2 monitors at 60hz.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15665578386.995eF.1987--

--===============0782983961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0782983961==--
