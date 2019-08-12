Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552708A064
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2609D6E527;
	Mon, 12 Aug 2019 14:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CD686E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:10:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0982F72167; Mon, 12 Aug 2019 14:10:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 12 Aug 2019 14:10:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-yzYQCkw7aB@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1977090980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1977090980==
Content-Type: multipart/alternative; boundary="15656190110.d8bBDAAb1.31843"
Content-Transfer-Encoding: 7bit


--15656190110.d8bBDAAb1.31843
Date: Mon, 12 Aug 2019 14:10:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #85 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #84)
> (In reply to Mauro Gaspari from comment #82)
> > (In reply to Pierre-Eric Pelloux-Prayer from comment #81)
> > > Can anyone provide a apitrace/renderdoc capture that can reliably rep=
roduce
> > > the crash/freeze?
> >=20
> > Hello, Sadly my freezes are hard to reproduce. Sometimes I can play for=
 a
> > day with no freeze, sometimes it freezes in 10 minutes, one hour, and s=
o on.
> >=20
>=20
> Ok.
>=20
> This patch https://patchwork.freedesktop.org/series/64792/ might help: it
> won't fix any issue, but when a timeout is detected it should allow the s=
oft
> recovery of the GPU.
>=20
> Other things worth trying: setting AMD_DEBUG environment variables. I'd
> suggest:
>=20
>    AMD_DEBUG=3Dzerovram,nodma,nodpbb
>=20
> There are others (see mesa/src/gallium/drivers/radeonsi/si_pipe.c) to try=
 if
> these don't help.

Thank you.

I will first try to reintroduce the kernel parameters I previously used. Do=
 you
think those can help at all?

CPU
rcu_nocbs=3D0-15 (adjust to the number of cores of your cpu)
idle=3Dnomwait
processor.max_cstate=3D5
pcie_aspm=3Doff=20

GPU
amdgpu.dc=3D1
amdgpu.vm_update_mode=3D0
amdgpu.dpm=3D-1
amdgpu.ppfeaturemask=3D0xffffffff
amdgpu.vm_fault_stop=3D2
amdgpu.vm_debug=3D1
amdgpu.gpu_recovery=3D0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656190110.d8bBDAAb1.31843
Date: Mon, 12 Aug 2019 14:10:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c85">Comme=
nt # 85</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D109955#c84">comment #84</a>)
<span class=3D"quote">&gt; (In reply to Mauro Gaspari from <a href=3D"show_=
bug.cgi?id=3D109955#c82">comment #82</a>)
&gt; &gt; (In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_bug.=
cgi?id=3D109955#c81">comment #81</a>)
&gt; &gt; &gt; Can anyone provide a apitrace/renderdoc capture that can rel=
iably reproduce
&gt; &gt; &gt; the crash/freeze?
&gt; &gt;=20
&gt; &gt; Hello, Sadly my freezes are hard to reproduce. Sometimes I can pl=
ay for a
&gt; &gt; day with no freeze, sometimes it freezes in 10 minutes, one hour,=
 and so on.
&gt; &gt;=20
&gt;=20
&gt; Ok.
&gt;=20
&gt; This patch <a href=3D"https://patchwork.freedesktop.org/series/64792/"=
>https://patchwork.freedesktop.org/series/64792/</a> might help: it
&gt; won't fix any issue, but when a timeout is detected it should allow th=
e soft
&gt; recovery of the GPU.
&gt;=20
&gt; Other things worth trying: setting AMD_DEBUG environment variables. I'd
&gt; suggest:
&gt;=20
&gt;    AMD_DEBUG=3Dzerovram,nodma,nodpbb
&gt;=20
&gt; There are others (see mesa/src/gallium/drivers/radeonsi/si_pipe.c) to =
try if
&gt; these don't help.</span >

Thank you.

I will first try to reintroduce the kernel parameters I previously used. Do=
 you
think those can help at all?

CPU
rcu_nocbs=3D0-15 (adjust to the number of cores of your cpu)
idle=3Dnomwait
processor.max_cstate=3D5
pcie_aspm=3Doff=20

GPU
amdgpu.dc=3D1
amdgpu.vm_update_mode=3D0
amdgpu.dpm=3D-1
amdgpu.ppfeaturemask=3D0xffffffff
amdgpu.vm_fault_stop=3D2
amdgpu.vm_debug=3D1
amdgpu.gpu_recovery=3D0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656190110.d8bBDAAb1.31843--

--===============1977090980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1977090980==--
