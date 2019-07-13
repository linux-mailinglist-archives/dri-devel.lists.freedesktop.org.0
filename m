Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688C678E8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 08:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2FE6E3BB;
	Sat, 13 Jul 2019 06:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 601FA6E3BB
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 06:56:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5B82C72167; Sat, 13 Jul 2019 06:56:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Sat, 13 Jul 2019 06:56:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreaskem@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0709901110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0709901110==
Content-Type: multipart/alternative; boundary="15630009991.6eE4.11758"
Content-Transfer-Encoding: 7bit


--15630009991.6eE4.11758
Date: Sat, 13 Jul 2019 06:56:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

            Bug ID: 111122
           Summary: 2500U: Graphics corruption on kernel 5.2
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: andreaskem@web.de

Created attachment 144771
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144771&action=3Dedit
Kernel log

Arch Linux
Lenovo E485 (16 GiB RAM)
AMD Ryzen 2500U

xorg-server 1.20.5-2
mesa 19.1.2-1
xf86-video-amdgpu 19.0.1-1
libdrm 2.4.99-1

After upgrading to the linux kernel 5.2 from the Arch Linux repositories, my
laptop started to show graphical corruption in Firefox or Konsole. It is mu=
ch
worse if something is moving on the screen e.g., a video is playing. Someti=
mes
Firefox is almost unusable as a result. A downgrade to 5.1.16 immediately f=
ixes
the issues.

Somebody mentioned similar corruption for bug 109206:
https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c57

My kernel command line is:

initrd=3D\amd-ucode.img initrd=3D\initramfs-linux.img
root=3DPARTUUID=3D34098e4c-f1bf-4a43-a0a8-2ba3ed3c71a6 idle=3Dnomwait
psmouse.synaptics_intertouch=3D1 acpi_osi=3DLinux amdgpu.gpu_recovery=3D1
ivrs_ioapic[32]=3D00:14.0

I used to have iommu=3Dpt or iommu=3Doff on the command line to get this la=
ptop to
boot properly but I have not needed that switch for a while. I might try to
reintroduce it with 5.2 just to see what happens. In any case, my setup wor=
ked
before, so something does not seem right.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630009991.6eE4.11758
Date: Sat, 13 Jul 2019 06:56:39 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">111122</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>2500U: Graphics corruption on kernel 5.2
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>andreaskem&#64;web.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144771=
" name=3D"attach_144771" title=3D"Kernel log">attachment 144771</a> <a href=
=3D"attachment.cgi?id=3D144771&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

Arch Linux
Lenovo E485 (16 GiB RAM)
AMD Ryzen 2500U

xorg-server 1.20.5-2
mesa 19.1.2-1
xf86-video-amdgpu 19.0.1-1
libdrm 2.4.99-1

After upgrading to the linux kernel 5.2 from the Arch Linux repositories, my
laptop started to show graphical corruption in Firefox or Konsole. It is mu=
ch
worse if something is moving on the screen e.g., a video is playing. Someti=
mes
Firefox is almost unusable as a result. A downgrade to 5.1.16 immediately f=
ixes
the issues.

Somebody mentioned similar corruption for <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"show_bug.cgi?id=3D109206">bug 109206</a>:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"show_bug.cgi?id=3D109206#c57">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109206#c57</a>

My kernel command line is:

initrd=3D\amd-ucode.img initrd=3D\initramfs-linux.img
root=3DPARTUUID=3D34098e4c-f1bf-4a43-a0a8-2ba3ed3c71a6 idle=3Dnomwait
psmouse.synaptics_intertouch=3D1 acpi_osi=3DLinux amdgpu.gpu_recovery=3D1
ivrs_ioapic[32]=3D00:14.0

I used to have iommu=3Dpt or iommu=3Doff on the command line to get this la=
ptop to
boot properly but I have not needed that switch for a while. I might try to
reintroduce it with 5.2 just to see what happens. In any case, my setup wor=
ked
before, so something does not seem right.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630009991.6eE4.11758--

--===============0709901110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0709901110==--
