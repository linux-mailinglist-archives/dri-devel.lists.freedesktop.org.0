Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45845B8178
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EC76F9F0;
	Thu, 19 Sep 2019 19:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9C466F9F2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 19:37:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D616372167; Thu, 19 Sep 2019 19:37:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Thu, 19 Sep 2019 19:37:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nix.or.die@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111244-502-wfi2skA9Ew@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0126675872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0126675872==
Content-Type: multipart/alternative; boundary="15689218472.C7e5.24239"
Content-Transfer-Encoding: 7bit


--15689218472.C7e5.24239
Date: Thu, 19 Sep 2019 19:37:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #29 from Gabriel C <nix.or.die@gmail.com> ---
Michael,

I see the same on a Ryzen 7 35750H APU + RX 560x Nitro5 Laptop.

reverting
https://github.com/freedesktop/xorg-xf86-video-amdgpu/commit/a2b32e72fdaff3=
007a79b84929997d8176c2d512

fixes the problem for me.

I tested kernels 5.2*, 5.3, and all have the same problem=20
when suspending from X with that commit, without the commit
everything is working fine.


( will test 5.4git once drm-next is in but I tested amd-staging-drm-next
some days ago and that didn't work also )

If you need more informations please let me know.

I can test any kind patches kernel/X/mesa and/or give
you debug info if you tell me what you may need.

Best Regards,

Gabriel C

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689218472.C7e5.24239
Date: Thu, 19 Sep 2019 19:37:27 +0000
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
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nix.or.die&#64;gmail.com" title=3D"Gabriel C &lt;nix.or.die&#64;gmail.com&g=
t;"> <span class=3D"fn">Gabriel C</span></a>
</span></b>
        <pre>Michael,

I see the same on a Ryzen 7 35750H APU + RX 560x Nitro5 Laptop.

reverting
<a href=3D"https://github.com/freedesktop/xorg-xf86-video-amdgpu/commit/a2b=
32e72fdaff3007a79b84929997d8176c2d512">https://github.com/freedesktop/xorg-=
xf86-video-amdgpu/commit/a2b32e72fdaff3007a79b84929997d8176c2d512</a>

fixes the problem for me.

I tested kernels 5.2*, 5.3, and all have the same problem=20
when suspending from X with that commit, without the commit
everything is working fine.


( will test 5.4git once drm-next is in but I tested amd-staging-drm-next
some days ago and that didn't work also )

If you need more informations please let me know.

I can test any kind patches kernel/X/mesa and/or give
you debug info if you tell me what you may need.

Best Regards,

Gabriel C</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689218472.C7e5.24239--

--===============0126675872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0126675872==--
