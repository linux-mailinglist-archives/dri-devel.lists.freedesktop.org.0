Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0596F271F4
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 23:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE37389B8F;
	Wed, 22 May 2019 21:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A3F489B8F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 21:53:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 750C972168; Wed, 22 May 2019 21:53:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110733] [Regression] Kernel 4.19.x + linux-firmware 20190514 +
 Vega 64: boot fails
Date: Wed, 22 May 2019 21:53:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110733-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1320827094=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1320827094==
Content-Type: multipart/alternative; boundary="15585619921.3ddCBEE.14520"
Content-Transfer-Encoding: 7bit


--15585619921.3ddCBEE.14520
Date: Wed, 22 May 2019 21:53:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110733

            Bug ID: 110733
           Summary: [Regression] Kernel 4.19.x + linux-firmware 20190514 +
                    Vega 64: boot fails
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mezin.alexander@gmail.com

Copying https://bugzilla.kernel.org/show_bug.cgi?id=3D203627 here, as I'm n=
ot
sure where to report the issue (and got no response in kernel bugzilla so f=
ar)

After linux-firmware upgrade from 4b6cf2bd1a9d53caa087403d943e7695009c1d0c =
to
711d3297bac870af42088a467459a0634c1970ca (20190514), 4.19 kernels (at least
4.19.40-4.19.45) don't boot anymore. Early during boot the monitor turns of=
f,
and, apparently, the system hangs. Can't connect over SSH, SysRq keys don't
work. Also the failed boot attempt doesn't get recorded by journald.

Kernels 5.0 and 5.1 still boot completely fine. Also, 4.19 kernels boot if I
downgrade firmware back to 4b6cf2bd1a9d53caa087403d943e7695009c1d0c.

Apparently, these problems are caused by
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?id=3D2579167548be33afb1fe2a9a5c141561ee5a8bbe

GPU: RX Vega 64 (Sapphire Nitro+, vbios_version: 113-D0500110-O01)
Distro: Arch Linux
Archlinux bug: https://bugs.archlinux.org/task/62666

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585619921.3ddCBEE.14520
Date: Wed, 22 May 2019 21:53:12 +0000
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
   title=3D"NEW - [Regression] Kernel 4.19.x + linux-firmware 20190514 + Ve=
ga 64: boot fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110733">110733</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Regression] Kernel 4.19.x + linux-firmware 20190514 + Vega 6=
4: boot fails
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
          <td>mezin.alexander&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Copying <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D203627">https://bugzilla.kernel.org/show_bug.cgi?id=3D203627</a> here, a=
s I'm not
sure where to report the issue (and got no response in kernel bugzilla so f=
ar)

After linux-firmware upgrade from 4b6cf2bd1a9d53caa087403d943e7695009c1d0c =
to
711d3297bac870af42088a467459a0634c1970ca (20190514), 4.19 kernels (at least
4.19.40-4.19.45) don't boot anymore. Early during boot the monitor turns of=
f,
and, apparently, the system hangs. Can't connect over SSH, SysRq keys don't
work. Also the failed boot attempt doesn't get recorded by journald.

Kernels 5.0 and 5.1 still boot completely fine. Also, 4.19 kernels boot if I
downgrade firmware back to 4b6cf2bd1a9d53caa087403d943e7695009c1d0c.

Apparently, these problems are caused by
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/commit/?id=3D2579167548be33afb1fe2a9a5c141561ee5a8bbe">https://=
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/=
?id=3D2579167548be33afb1fe2a9a5c141561ee5a8bbe</a>

GPU: RX Vega 64 (Sapphire Nitro+, vbios_version: 113-D0500110-O01)
Distro: Arch Linux
Archlinux bug: <a href=3D"https://bugs.archlinux.org/task/62666">https://bu=
gs.archlinux.org/task/62666</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585619921.3ddCBEE.14520--

--===============1320827094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1320827094==--
