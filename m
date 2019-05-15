Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4981E7C7
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 07:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA950894C0;
	Wed, 15 May 2019 05:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C7D6894B7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 05:02:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 641D7721CD; Wed, 15 May 2019 05:02:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110371] HP Dreamcolor display *Error* No EDID read
Date: Wed, 15 May 2019 05:02:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110371-502-0wwAXQs9fe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110371-502@http.bugs.freedesktop.org/>
References: <bug-110371-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0771224697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0771224697==
Content-Type: multipart/alternative; boundary="15578965340.bCc8.15235"
Content-Transfer-Encoding: 7bit


--15578965340.bCc8.15235
Date: Wed, 15 May 2019 05:02:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110371

--- Comment #11 from Babblebones@gmail.com ---
Created attachment 144277
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144277&action=3Dedit
EDID file

Don't know if this helps but ALL kernels seem affected by not being able to
grab EDID on startup but the changes after 4.18 break something further as =
to
make the display unusable by changing the default behavior of the panel's m=
ode
without EDID.

[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-4.18.20
root=3D/dev/sdb2 ro amdgpu.ppfeaturemask=3D0xffffffff amdgpu.dpm=3D1 amdgpu=
.dc=3D1
amdgpu.gpu_recovery=3D1 amdgpu.powerplay=3D1 drm.edid_firmware=3DeDP-1:edid=
/edid.bin
[    4.340989] [drm] Got external EDID base block and 0 extensions from
"edid/edid.bin" for connector "eDP-1"
[    4.451624]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.451628]  ? drm_edid_block_valid+0x180/0x180
[    4.451629]  drm_do_get_edid+0xb1/0x330
[    4.451631]  drm_get_edid+0x61/0x380
[    4.451671]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.630956]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.630966]  ? drm_edid_block_valid+0x180/0x180
[    4.630969]  drm_do_get_edid+0xb1/0x330
[    4.630972]  drm_get_edid+0x61/0x380
[    4.631115]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.801879]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.801889]  ? drm_edid_block_valid+0x180/0x180
[    4.801892]  drm_do_get_edid+0xb1/0x330
[    4.801895]  drm_get_edid+0x61/0x380
[    4.802006]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.972889]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.972900]  ? drm_edid_block_valid+0x180/0x180
[    4.972903]  drm_do_get_edid+0xb1/0x330
[    4.972907]  drm_get_edid+0x61/0x380
[    4.973028]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    5.145825]  drm_do_probe_ddc_edid+0xb9/0x130
[    5.145835]  ? drm_edid_block_valid+0x180/0x180
[    5.145837]  drm_do_get_edid+0xb1/0x330
[    5.145841]  drm_get_edid+0x61/0x380
[    5.145942]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    5.170556] [drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.

Is what happens when I set the edid manually from the kernel commandline.

Setting it manually freaks out newer kernels and my display won't modeset
properly making it a mess but on 4.18 it seemed to drop this.

Any debug patches I can run to help you guys figure it out?
I have included my EDID file if you want to run it through anything to see =
what
breaks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578965340.bCc8.15235
Date: Wed, 15 May 2019 05:02:14 +0000
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
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371">bug 11037=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144277=
" name=3D"attach_144277" title=3D"EDID file">attachment 144277</a> <a href=
=3D"attachment.cgi?id=3D144277&amp;action=3Dedit" title=3D"EDID file">[deta=
ils]</a></span>
EDID file

Don't know if this helps but ALL kernels seem affected by not being able to
grab EDID on startup but the changes after 4.18 break something further as =
to
make the display unusable by changing the default behavior of the panel's m=
ode
without EDID.

[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-4.18.20
root=3D/dev/sdb2 ro amdgpu.ppfeaturemask=3D0xffffffff amdgpu.dpm=3D1 amdgpu=
.dc=3D1
amdgpu.gpu_recovery=3D1 amdgpu.powerplay=3D1 drm.edid_firmware=3DeDP-1:edid=
/edid.bin
[    4.340989] [drm] Got external EDID base block and 0 extensions from
&quot;edid/edid.bin&quot; for connector &quot;eDP-1&quot;
[    4.451624]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.451628]  ? drm_edid_block_valid+0x180/0x180
[    4.451629]  drm_do_get_edid+0xb1/0x330
[    4.451631]  drm_get_edid+0x61/0x380
[    4.451671]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.630956]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.630966]  ? drm_edid_block_valid+0x180/0x180
[    4.630969]  drm_do_get_edid+0xb1/0x330
[    4.630972]  drm_get_edid+0x61/0x380
[    4.631115]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.801879]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.801889]  ? drm_edid_block_valid+0x180/0x180
[    4.801892]  drm_do_get_edid+0xb1/0x330
[    4.801895]  drm_get_edid+0x61/0x380
[    4.802006]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    4.972889]  drm_do_probe_ddc_edid+0xb9/0x130
[    4.972900]  ? drm_edid_block_valid+0x180/0x180
[    4.972903]  drm_do_get_edid+0xb1/0x330
[    4.972907]  drm_get_edid+0x61/0x380
[    4.973028]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    5.145825]  drm_do_probe_ddc_edid+0xb9/0x130
[    5.145835]  ? drm_edid_block_valid+0x180/0x180
[    5.145837]  drm_do_get_edid+0xb1/0x330
[    5.145841]  drm_get_edid+0x61/0x380
[    5.145942]  dm_helpers_read_local_edid+0x4c/0xe0 [amdgpu]
[    5.170556] [drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.

Is what happens when I set the edid manually from the kernel commandline.

Setting it manually freaks out newer kernels and my display won't modeset
properly making it a mess but on 4.18 it seemed to drop this.

Any debug patches I can run to help you guys figure it out?
I have included my EDID file if you want to run it through anything to see =
what
breaks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578965340.bCc8.15235--

--===============0771224697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0771224697==--
