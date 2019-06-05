Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D529359E0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDEA89453;
	Wed,  5 Jun 2019 09:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 664CB89453
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:51:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4CB8F72168; Wed,  5 Jun 2019 09:51:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Wed, 05 Jun 2019 09:51:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-nSVe7zpH90@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2018386860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2018386860==
Content-Type: multipart/alternative; boundary="15597282711.490DEF.19456"
Content-Transfer-Encoding: 7bit


--15597282711.490DEF.19456
Date: Wed, 5 Jun 2019 09:51:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #11 from Gobinda Joy <gobinda.joy@gmail.com> ---
Bisect
ad51c46eec739c18be24178a30b47801b10e0357 is the first bad commit
commit ad51c46eec739c18be24178a30b47801b10e0357
Author: Chengming Gui <Jack.Gui@amd.com>
Date:   Thu Mar 21 13:26:28 2019 +0800

    drm/amd/amdgpu: fix PCIe dpm feature issue (v3)

    use pcie_bandwidth_available to get real link state
    to update pcie table.

    v2: fix incorrect initialized return value
    v3: expand the fetching method about the link width to all asics.

    Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

:040000 040000 673bf23a6c2c2e461c6ff36e9bcca9d35c958881
605de484316e97aaa83273d5a08340e873ff851e M      drivers

This is the merge with that and other commits introducing the bug
ea2cec24c8d429ee6f99040e4eb6c7ad627fe777
 Merge tag 'drm-fixes-2019-04-05' of git://anongit.freedesktop.org/drm=E2=
=80=A6

=E2=80=A6/drm

Pull drm fixes from Dave Airlie:
 "Pretty quiet week, just some amdgpu and i915 fixes.

  i915:
   - deadlock fix
   - gvt fixes

  amdgpu:
   - PCIE dpm feature fix
   - Powerplay fixes"

* tag 'drm-fixes-2019-04-05' of git://anongit.freedesktop.org/drm/drm:
  drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug
  drm/i915/gvt: Correct the calculation of plane size
  drm/amdgpu: remove unnecessary rlc reset function on gfx9
  drm/i915: Always backoff after a drm_modeset_lock() deadlock
  drm/i915/gvt: do not let pin count of shadow mm go negative
  drm/i915/gvt: do not deliver a workload if its creation fails
  drm/amd/display: VBIOS can't be light up HDMI when restart system
  drm/amd/powerplay: fix possible hang with 3+ 4K monitors
  drm/amd/powerplay: correct data type to avoid overflow
  drm/amd/powerplay: add ECC feature bit
  drm/amd/amdgpu: fix PCIe dpm feature issue (v3)

Hope it helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597282711.490DEF.19456
Date: Wed, 5 Jun 2019 09:51:11 +0000
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
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>Bisect
ad51c46eec739c18be24178a30b47801b10e0357 is the first bad commit
commit ad51c46eec739c18be24178a30b47801b10e0357
Author: Chengming Gui &lt;<a href=3D"mailto:Jack.Gui&#64;amd.com">Jack.Gui&=
#64;amd.com</a>&gt;
Date:   Thu Mar 21 13:26:28 2019 +0800

    drm/amd/amdgpu: fix PCIe dpm feature issue (v3)

    use pcie_bandwidth_available to get real link state
    to update pcie table.

    v2: fix incorrect initialized return value
    v3: expand the fetching method about the link width to all asics.

    Signed-off-by: Chengming Gui &lt;<a href=3D"mailto:Jack.Gui&#64;amd.com=
">Jack.Gui&#64;amd.com</a>&gt;
    Reviewed-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;a=
md.com">alexander.deucher&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

:040000 040000 673bf23a6c2c2e461c6ff36e9bcca9d35c958881
605de484316e97aaa83273d5a08340e873ff851e M      drivers

This is the merge with that and other commits introducing the bug
ea2cec24c8d429ee6f99040e4eb6c7ad627fe777
 Merge tag 'drm-fixes-2019-04-05' of git://anongit.freedesktop.org/drm=E2=
=80=A6

=E2=80=A6/drm

Pull drm fixes from Dave Airlie:
 &quot;Pretty quiet week, just some amdgpu and i915 fixes.

  i915:
   - deadlock fix
   - gvt fixes

  amdgpu:
   - PCIE dpm feature fix
   - Powerplay fixes&quot;

* tag 'drm-fixes-2019-04-05' of git://anongit.freedesktop.org/drm/drm:
  drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug
  drm/i915/gvt: Correct the calculation of plane size
  drm/amdgpu: remove unnecessary rlc reset function on gfx9
  drm/i915: Always backoff after a drm_modeset_lock() deadlock
  drm/i915/gvt: do not let pin count of shadow mm go negative
  drm/i915/gvt: do not deliver a workload if its creation fails
  drm/amd/display: VBIOS can't be light up HDMI when restart system
  drm/amd/powerplay: fix possible hang with 3+ 4K monitors
  drm/amd/powerplay: correct data type to avoid overflow
  drm/amd/powerplay: add ECC feature bit
  drm/amd/amdgpu: fix PCIe dpm feature issue (v3)

Hope it helps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597282711.490DEF.19456--

--===============2018386860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2018386860==--
