Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB42BEFBE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 12:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DE76ED0C;
	Thu, 26 Sep 2019 10:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 371916ED0C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 10:37:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 33D8872162; Thu, 26 Sep 2019 10:37:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Thu, 26 Sep 2019 10:37:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@jeroenimo.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-joErTPyRCJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1783187068=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1783187068==
Content-Type: multipart/alternative; boundary="15694942602.CeDa6D.20098"
Content-Transfer-Encoding: 7bit


--15694942602.CeDa6D.20098
Date: Thu, 26 Sep 2019 10:37:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #106 from jeroenimo <freedesktop@jeroenimo.nl> ---

This is quite a severe bug.=20
I have reasonable stable system with Mint 19.2 (runs hours without a crash
uname -a
Linux jeroenimo-amd 4.15.0-64-generic #73-Ubuntu SMP Thu Sep 12 13:16:13 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux


(X)ubuntu 18.04 LTS LTS crashes a lot faster (1 or 2 minutes) 5.0.0.29 kern=
el

I can reproduce the bug with glmark2 instantly 100% of the times

(https://launchpad.net/glmark2) or sudo apt install glmark2

I'm not very good at debugging but this is what my dmesg looks like when I =
ssh
and run glmark2

[ 6619.587749] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:45:crtc-1] flip_done timed out

And that's it, no more info.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694942602.CeDa6D.20098
Date: Thu, 26 Sep 2019 10:37:40 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c106">Comm=
ent # 106</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;jeroenimo.nl" title=3D"jeroenimo &lt;freedesktop&#64;jeroen=
imo.nl&gt;"> <span class=3D"fn">jeroenimo</span></a>
</span></b>
        <pre>
This is quite a severe bug.=20
I have reasonable stable system with Mint 19.2 (runs hours without a crash
uname -a
Linux jeroenimo-amd 4.15.0-64-generic #73-Ubuntu SMP Thu Sep 12 13:16:13 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux


(X)ubuntu 18.04 LTS LTS crashes a lot faster (1 or 2 minutes) 5.0.0.29 kern=
el

I can reproduce the bug with glmark2 instantly 100% of the times

(<a href=3D"https://launchpad.net/glmark2">https://launchpad.net/glmark2</a=
>) or sudo apt install glmark2

I'm not very good at debugging but this is what my dmesg looks like when I =
ssh
and run glmark2

[ 6619.587749] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:45:crtc-1] flip_done timed out

And that's it, no more info.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694942602.CeDa6D.20098--

--===============1783187068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1783187068==--
