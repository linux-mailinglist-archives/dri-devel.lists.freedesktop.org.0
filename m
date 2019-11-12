Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43EF8D72
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B613C6EB19;
	Tue, 12 Nov 2019 11:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 689596E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:03:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5FD34720E2; Tue, 12 Nov 2019 11:03:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Tue, 12 Nov 2019 11:03:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-rIjfW8S9k3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0903644302=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0903644302==
Content-Type: multipart/alternative; boundary="15735566340.205EbEBA.27870"
Content-Transfer-Encoding: 7bit


--15735566340.205EbEBA.27870
Date: Tue, 12 Nov 2019 11:03:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #134 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to Wilko Bartels from comment #133)
> (In reply to haro41 from comment #132)
> > (In reply to Wilko Bartels from comment #131)
> > > Thank you. I already tried exactly that. And the unit unable to autos=
tart
> > > (permission denied). Only manual systemctl start works. Dont know why=
.=20
> >=20
> > If you double checked the permissions of both, the .service and the .sh
> > files,
> > you could try delay the automatic service start, for example by replaci=
ng:
> >=20
> > 'WantedBy=3Dmulti-user.target' with 'WantedBy=3Dgraphical.target'
> >=20
> > and maybe insert a line in the [Unit] section: 'After=3Dmulti-user.targ=
et'
>=20
> sadly that doesnt change a thing
> line 2: /sys/class/drm/card0/device/power_dpm_force_performance_level:
> Permission denied
>=20
> line 3: /sys/class/drm/card0/device/pp_dpm_mclk: Permission denied
> amd-pp.service: Main process exited, code=3Dexited, status=3D1/FAILURE
>=20
> -rw-r--r-- 1 root root 4,0K  7. Nov 17:45
> /sys/class/drm/card0/device/power_dpm_force_performance_level
>=20
> -rw-r--r-- 1 root root 4,0K  7. Nov 17:45
> /sys/class/drm/card0/device/pp_dpm_mclk
>=20
> again after logging (i3/xinit or plasma/sddm i have no errors with system=
ctl
> start and it works
>=20
> [jason@behemoth ~]$ cat /sys/class/drm/card0/device/pp_dpm_mclk
> 0: 167Mhz=20
> 1: 500Mhz *
> 2: 700Mhz=20
> 3: 800Mhz

running a script at plasma login now. with no password for that command in
sudoers. also after sleep.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15735566340.205EbEBA.27870
Date: Tue, 12 Nov 2019 11:03:54 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c134">Comm=
ent # 134</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1=
09955#c133">comment #133</a>)
<span class=3D"quote">&gt; (In reply to haro41 from <a href=3D"show_bug.cgi=
?id=3D109955#c132">comment #132</a>)
&gt; &gt; (In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1099=
55#c131">comment #131</a>)
&gt; &gt; &gt; Thank you. I already tried exactly that. And the unit unable=
 to autostart
&gt; &gt; &gt; (permission denied). Only manual systemctl start works. Dont=
 know why.=20
&gt; &gt;=20
&gt; &gt; If you double checked the permissions of both, the .service and t=
he .sh
&gt; &gt; files,
&gt; &gt; you could try delay the automatic service start, for example by r=
eplacing:
&gt; &gt;=20
&gt; &gt; 'WantedBy=3Dmulti-user.target' with 'WantedBy=3Dgraphical.target'
&gt; &gt;=20
&gt; &gt; and maybe insert a line in the [Unit] section: 'After=3Dmulti-use=
r.target'
&gt;=20
&gt; sadly that doesnt change a thing
&gt; line 2: /sys/class/drm/card0/device/power_dpm_force_performance_level:
&gt; Permission denied
&gt;=20
&gt; line 3: /sys/class/drm/card0/device/pp_dpm_mclk: Permission denied
&gt; amd-pp.service: Main process exited, code=3Dexited, status=3D1/FAILURE
&gt;=20
&gt; -rw-r--r-- 1 root root 4,0K  7. Nov 17:45
&gt; /sys/class/drm/card0/device/power_dpm_force_performance_level
&gt;=20
&gt; -rw-r--r-- 1 root root 4,0K  7. Nov 17:45
&gt; /sys/class/drm/card0/device/pp_dpm_mclk
&gt;=20
&gt; again after logging (i3/xinit or plasma/sddm i have no errors with sys=
temctl
&gt; start and it works
&gt;=20
&gt; [jason&#64;behemoth ~]$ cat /sys/class/drm/card0/device/pp_dpm_mclk
&gt; 0: 167Mhz=20
&gt; 1: 500Mhz *
&gt; 2: 700Mhz=20
&gt; 3: 800Mhz</span >

running a script at plasma login now. with no password for that command in
sudoers. also after sleep.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15735566340.205EbEBA.27870--

--===============0903644302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0903644302==--
