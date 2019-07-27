Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D848F77667
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 06:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F746EE87;
	Sat, 27 Jul 2019 04:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F4666EE87
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 04:14:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 039D872168; Sat, 27 Jul 2019 04:14:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Sat, 27 Jul 2019 04:14:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111229-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1002756913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1002756913==
Content-Type: multipart/alternative; boundary="15642008431.dBfb20.5491"
Content-Transfer-Encoding: 7bit


--15642008431.dBfb20.5491
Date: Sat, 27 Jul 2019 04:14:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

            Bug ID: 111229
           Summary: Unable to unbind GPU from amdgpu
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: wedens13@yandex.ru

Created attachment 144877
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144877&action=3Dedit
dmesg kernel 5.2.1

Arch linux
Kernel version: 5.2.1

I have two GPUs in my system: integrated Intel and Sapphire Pulse Vega 56.
I boot with Intel as my primary gpu and I use Vega for VFIO (gpu passthroug=
h)
and gpu offloading.
What I'm trying to do is to boot with amdgpu driver for Vega and bind it to
vfio-pci when I start VM (qemu).

The problem occurs when I try to unbind Vega from amdgpu driver using this
command:
echo -n "0000:03:00.0" > /sys/bus/pci/drivers/amdgpu/unbind

It results in segfault with following error in dmesg (full dmesg from boot =
to
shutdown is attached):
[drm:amdgpu_pci_remove [amdgpu]] *ERROR* Device removal is currently not
supported outside of fbcon

After that I'm unable to rebind device back to amdgpu or any other driver:
echo "0000:03:00.0" > /sys/bus/pci/drivers/amdgpu/bind
bash: echo: write error: No such device

Also I'm unable to shutdown properly. Shutdown process becomes stuck at some
point and only holding the button helps.

I've attached relevant lspci -vvv output before and after attempt to unbind=
, in
case it's useful.

Another thing I've tried is to unbind using kernel 4.19.60 and it just hangs
after executing the command. I've attached the log of this attempt (error is
different from 5.2.1).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642008431.dBfb20.5491
Date: Sat, 27 Jul 2019 04:14:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">111229</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to unbind GPU from amdgpu
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wedens13&#64;yandex.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144877=
" name=3D"attach_144877" title=3D"dmesg kernel 5.2.1">attachment 144877</a>=
 <a href=3D"attachment.cgi?id=3D144877&amp;action=3Dedit" title=3D"dmesg ke=
rnel 5.2.1">[details]</a></span>
dmesg kernel 5.2.1

Arch linux
Kernel version: 5.2.1

I have two GPUs in my system: integrated Intel and Sapphire Pulse Vega 56.
I boot with Intel as my primary gpu and I use Vega for VFIO (gpu passthroug=
h)
and gpu offloading.
What I'm trying to do is to boot with amdgpu driver for Vega and bind it to
vfio-pci when I start VM (qemu).

The problem occurs when I try to unbind Vega from amdgpu driver using this
command:
echo -n &quot;0000:03:00.0&quot; &gt; /sys/bus/pci/drivers/amdgpu/unbind

It results in segfault with following error in dmesg (full dmesg from boot =
to
shutdown is attached):
[drm:amdgpu_pci_remove [amdgpu]] *ERROR* Device removal is currently not
supported outside of fbcon

After that I'm unable to rebind device back to amdgpu or any other driver:
echo &quot;0000:03:00.0&quot; &gt; /sys/bus/pci/drivers/amdgpu/bind
bash: echo: write error: No such device

Also I'm unable to shutdown properly. Shutdown process becomes stuck at some
point and only holding the button helps.

I've attached relevant lspci -vvv output before and after attempt to unbind=
, in
case it's useful.

Another thing I've tried is to unbind using kernel 4.19.60 and it just hangs
after executing the command. I've attached the log of this attempt (error is
different from 5.2.1).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642008431.dBfb20.5491--

--===============1002756913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1002756913==--
