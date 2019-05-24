Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D82992C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 15:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7A76E10F;
	Fri, 24 May 2019 13:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D275D6E110
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 13:44:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CEF5872167; Fri, 24 May 2019 13:44:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Fri, 24 May 2019 13:44:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-M12RlNNxD2@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1020295505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1020295505==
Content-Type: multipart/alternative; boundary="15587054662.3b4D2.6661"
Content-Transfer-Encoding: 7bit


--15587054662.3b4D2.6661
Date: Fri, 24 May 2019 13:44:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #24 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Sylvain BERTRAND from comment #23)
> It seems I get the same freezes than you. It takes hours of gaming to get
> some
> random hard hang (no log). I thought I was overheating, but realized that=
 my
> system is on
> "vacation" while playing.
> linux amd-staging-drm-new/x11 native/mesa/llvm(erk...), all git no older
> than a
> week.
> playing mostly dota2 vulkan on AMD TAHITI XT

Hi, a bit frustrating eh? :)
I have been asking around and it seems that RadeonVII and RX590 do not suff=
er
those issues. Probably related to default clock speeds by manufacturers.

Anyway, If you try the kernel parameters I mentioned above, those should he=
lp.
I have not had crashes in weeks after I enabled those on my grub. And not
related to distribution, those grub kernel settings worked for me on
Tumbleweed, Arch, Ubuntu Budgie.

I hope it helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15587054662.3b4D2.6661
Date: Fri, 24 May 2019 13:44:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Sylvain BERTRAND from <a href=3D"show_bug.cgi?id=
=3D109955#c23">comment #23</a>)
<span class=3D"quote">&gt; It seems I get the same freezes than you. It tak=
es hours of gaming to get
&gt; some
&gt; random hard hang (no log). I thought I was overheating, but realized t=
hat my
&gt; system is on
&gt; &quot;vacation&quot; while playing.
&gt; linux amd-staging-drm-new/x11 native/mesa/llvm(erk...), all git no old=
er
&gt; than a
&gt; week.
&gt; playing mostly dota2 vulkan on AMD TAHITI XT</span >

Hi, a bit frustrating eh? :)
I have been asking around and it seems that RadeonVII and RX590 do not suff=
er
those issues. Probably related to default clock speeds by manufacturers.

Anyway, If you try the kernel parameters I mentioned above, those should he=
lp.
I have not had crashes in weeks after I enabled those on my grub. And not
related to distribution, those grub kernel settings worked for me on
Tumbleweed, Arch, Ubuntu Budgie.

I hope it helps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15587054662.3b4D2.6661--

--===============1020295505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1020295505==--
