Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C59AB01
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD226EC45;
	Fri, 23 Aug 2019 09:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8345A6EC45
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:04:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 804A672161; Fri, 23 Aug 2019 09:04:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Fri, 23 Aug 2019 09:04:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: etienne_lorrain@yahoo.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-H6sPmoEUmy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1808301857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1808301857==
Content-Type: multipart/alternative; boundary="15665510781.c8A0Ce.14504"
Content-Transfer-Encoding: 7bit


--15665510781.c8A0Ce.14504
Date: Fri, 23 Aug 2019 09:04:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #35 from Etienne Lorrain <etienne_lorrain@yahoo.fr> ---
(In reply to Andrew Shark from comment #31)
> (In reply to Etienne Lorrain from comment #30)
> I do not understand what problem you are talking about. Package just refu=
ses
> to install because of explicitly doing so in preinst script. My script
> solves it.

Sorry, it is some time ago and now that my system is working I am reluctant=
 to
break it again to see if I can re-install again.
I use your script to install on 19.4, I just had:

> but leads to a
> Segmentation fault at address 0x0 of /usr/lib/xorg/Xorg seen in
> .local/share/xorg/Xorg.0.log

That I fixed by commenting out the line:
ModulePath "/opt/amdgpu/lib/xorg/modules"
in 00-amdgpu.conf

I am not sure why I cannot use files in "/opt/amdgpu/lib/xorg/modules", I h=
ave
to use the files in "/usr/lib/xorg/modules/" (same filenames, different
files)...

Cheers.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15665510781.c8A0Ce.14504
Date: Fri, 23 Aug 2019 09:04:38 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
etienne_lorrain&#64;yahoo.fr" title=3D"Etienne Lorrain &lt;etienne_lorrain&=
#64;yahoo.fr&gt;"> <span class=3D"fn">Etienne Lorrain</span></a>
</span></b>
        <pre>(In reply to Andrew Shark from <a href=3D"show_bug.cgi?id=3D11=
0795#c31">comment #31</a>)
<span class=3D"quote">&gt; (In reply to Etienne Lorrain from <a href=3D"sho=
w_bug.cgi?id=3D110795#c30">comment #30</a>)
&gt; I do not understand what problem you are talking about. Package just r=
efuses
&gt; to install because of explicitly doing so in preinst script. My script
&gt; solves it.</span >

Sorry, it is some time ago and now that my system is working I am reluctant=
 to
break it again to see if I can re-install again.
I use your script to install on 19.4, I just had:

<span class=3D"quote">&gt; but leads to a
&gt; Segmentation fault at address 0x0 of /usr/lib/xorg/Xorg seen in
&gt; .local/share/xorg/Xorg.0.log</span >

That I fixed by commenting out the line:
ModulePath &quot;/opt/amdgpu/lib/xorg/modules&quot;
in 00-amdgpu.conf

I am not sure why I cannot use files in &quot;/opt/amdgpu/lib/xorg/modules&=
quot;, I have
to use the files in &quot;/usr/lib/xorg/modules/&quot; (same filenames, dif=
ferent
files)...

Cheers.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15665510781.c8A0Ce.14504--

--===============1808301857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1808301857==--
