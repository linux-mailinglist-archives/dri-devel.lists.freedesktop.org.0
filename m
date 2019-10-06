Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C806CD8A1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 20:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5BF6E43B;
	Sun,  6 Oct 2019 18:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A5B26E43C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 18:36:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 770E472162; Sun,  6 Oct 2019 18:36:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel: [drm] psp command failed and
 response status is (-65529) at 27th time of S3. 28th time of S3 freeze the
 system.
Date: Sun, 06 Oct 2019 18:36:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-fapQGrREt9@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1868092263=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1868092263==
Content-Type: multipart/alternative; boundary="15703870192.d70bA7D.22346"
Content-Transfer-Encoding: 7bit


--15703870192.d70bA7D.22346
Date: Sun, 6 Oct 2019 18:36:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #25 from Kai-Heng Feng <kai.heng.feng@canonical.com> ---
(In reply to Andrey Grodzovsky from comment #24)
> (In reply to Kai-Heng Feng from comment #23)
> > Created attachment 145576 [details]
> > journalctl last boot kernel message
>=20
> Can u retry with latest FW from
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it

Still same issue.

>=20
> and also load kernel with drm.debug=3D1 as there seems  a failure in PSP
> command submission during FW loading but the actual code of failure is now
> under debug log level.

I can reproduce the issue on latest firmware ("amdgpu: update vega20 ucode =
for
19.30") and latest amd-staging-drm-next ("drm/amdgpu: remove redundant vari=
able
r and redundant return statement").

I don't see keep trying latest kernel/firmware makes us going anywhere. If =
you
need a physical hardware to debug, please just let me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703870192.d70bA7D.22346
Date: Sun, 6 Oct 2019 18:36:59 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Andrey Grodzovsky from <a href=3D"show_bug.cgi?id=
=3D110886#c24">comment #24</a>)
<span class=3D"quote">&gt; (In reply to Kai-Heng Feng from <a href=3D"show_=
bug.cgi?id=3D110886#c23">comment #23</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D145576" n=
ame=3D"attach_145576" title=3D"journalctl last boot kernel message">attachm=
ent 145576</a> <a href=3D"attachment.cgi?id=3D145576&amp;action=3Dedit" tit=
le=3D"journalctl last boot kernel message">[details]</a></span>
&gt; &gt; journalctl last boot kernel message
&gt;=20
&gt; Can u retry with latest FW from
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/li=
nux-firmware.git">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/=
linux-firmware.git</a></span >

Still same issue.

<span class=3D"quote">&gt;=20
&gt; and also load kernel with drm.debug=3D1 as there seems  a failure in P=
SP
&gt; command submission during FW loading but the actual code of failure is=
 now
&gt; under debug log level.</span >

I can reproduce the issue on latest firmware (&quot;amdgpu: update vega20 u=
code for
19.30&quot;) and latest amd-staging-drm-next (&quot;drm/amdgpu: remove redu=
ndant variable
r and redundant return statement&quot;).

I don't see keep trying latest kernel/firmware makes us going anywhere. If =
you
need a physical hardware to debug, please just let me know.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703870192.d70bA7D.22346--

--===============1868092263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1868092263==--
