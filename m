Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BC77C58
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 00:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BD389F3B;
	Sat, 27 Jul 2019 22:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CA3C89F3B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 22:55:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 37D6372167; Sat, 27 Jul 2019 22:55:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111236] VA-API radeonsi SIGSEGV __memmove_avx_unaligned
Date: Sat, 27 Jul 2019 22:55:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111236-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1602156764=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1602156764==
Content-Type: multipart/alternative; boundary="15642681291.d6e4.32138"
Content-Transfer-Encoding: 7bit


--15642681291.d6e4.32138
Date: Sat, 27 Jul 2019 22:55:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111236

            Bug ID: 111236
           Summary: VA-API radeonsi SIGSEGV __memmove_avx_unaligned
           Product: Mesa
           Version: 19.1
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: liewkj@yahoo.com
        QA Contact: dri-devel@lists.freedesktop.org

Hardware: Ryzen 2500U Mobile APU Vega 8
OS: ArchLinux 5.2.3-arch1-1-ARCH
GUI: GNOME/Wayland

$ gst-play-1.0 /path/to/H264.mp4=20
Press 'k' to see a list of keyboard shortcuts.
Now playing /home/kliew/Videos/Dark Phoenix.mp4
mesa: for the -simplifycfg-sink-common option: may only occur zero or one
times!
mesa: for the -global-isel-abort option: may only occur zero or one times!
Redistribute latency...
Redistribute latency...
Segmentation fault (core dumped)


Thread 4 "multiqueue0:src" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7ffff5cc3700 (LWP 4886)]
0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
(gdb) disas
Dump of assembler code for function __memmove_avx_unaligned:
   0x00007ffff7f42be0 <+0>:     endbr64=20
   0x00007ffff7f42be4 <+4>:     mov    rax,rdi
   0x00007ffff7f42be7 <+7>:     cmp    rdx,0x20
   0x00007ffff7f42beb <+11>:    jb     0x7ffff7f42ca6
<__memmove_avx_unaligned_erms+86>
   0x00007ffff7f42bf1 <+17>:    cmp    rdx,0x40
   0x00007ffff7f42bf5 <+21>:    ja     0x7ffff7f42d13
<__memmove_avx_unaligned_erms+195>
   0x00007ffff7f42bfb <+27>:    vmovdqu ymm0,YMMWORD PTR [rsi]
   0x00007ffff7f42bff <+31>:    vmovdqu ymm1,YMMWORD PTR [rsi+rdx*1-0x20]
=3D> 0x00007ffff7f42c05 <+37>:    vmovdqu YMMWORD PTR [rdi],ymm0
   0x00007ffff7f42c09 <+41>:    vmovdqu YMMWORD PTR [rdi+rdx*1-0x20],ymm1
   0x00007ffff7f42c0f <+47>:    vzeroupper=20
   0x00007ffff7f42c12 <+50>:    ret=20=20=20=20
End of assembler dump.
(gdb) bt
#0  0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
#1  0x00007fffda85d3e3 in ?? () from /usr/lib/dri/radeonsi_dri.so
#2  0x00007fffda85d4f7 in ?? () from /usr/lib/dri/radeonsi_dri.so
#3  0x00007fffdb108133 in ?? () from /usr/lib/dri/radeonsi_dri.so
#4  0x00007fffe77a4903 in ?? () from /usr/lib/dri/radeonsi_drv_video.so
#5  0x00007ffff4976ffd in vaPutImage () from /usr/lib/libva.so.2
#6  0x00007ffff49f4c1e in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#7  0x00007ffff4a2ecf3 in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#8  0x00007ffff4a2f2bf in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#9  0x00007ffff4a2703b in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#10 0x00007ffff782fe53 in ?? () from /usr/lib/libgstbase-1.0.so.0
#11 0x00007ffff7835ee1 in ?? () from /usr/lib/libgstbase-1.0.so.0
#12 0x00007ffff7a3bcca in gst_pad_query () from /usr/lib/libgstreamer-1.0.s=
o.0
#13 0x00007ffff7a3c3de in gst_pad_peer_query () from
/usr/lib/libgstreamer-1.0.so.0
#14 0x00007ffff7a0a887 in gst_pad_peer_query_caps () from
/usr/lib/libgstreamer-1.0.so.0
#15 0x00007ffff7835cd1 in ?? () from /usr/lib/libgstbase-1.0.so.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642681291.d6e4.32138
Date: Sat, 27 Jul 2019 22:55:29 +0000
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
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236">111236</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>VA-API radeonsi SIGSEGV __memmove_avx_unaligned
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>liewkj&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hardware: Ryzen 2500U Mobile APU Vega 8
OS: ArchLinux 5.2.3-arch1-1-ARCH
GUI: GNOME/Wayland

$ gst-play-1.0 /path/to/H264.mp4=20
Press 'k' to see a list of keyboard shortcuts.
Now playing /home/kliew/Videos/Dark Phoenix.mp4
mesa: for the -simplifycfg-sink-common option: may only occur zero or one
times!
mesa: for the -global-isel-abort option: may only occur zero or one times!
Redistribute latency...
Redistribute latency...
Segmentation fault (core dumped)


Thread 4 &quot;multiqueue0:src&quot; received signal SIGSEGV, Segmentation =
fault.
[Switching to Thread 0x7ffff5cc3700 (LWP 4886)]
0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
(gdb) disas
Dump of assembler code for function __memmove_avx_unaligned:
   0x00007ffff7f42be0 &lt;+0&gt;:     endbr64=20
   0x00007ffff7f42be4 &lt;+4&gt;:     mov    rax,rdi
   0x00007ffff7f42be7 &lt;+7&gt;:     cmp    rdx,0x20
   0x00007ffff7f42beb &lt;+11&gt;:    jb     0x7ffff7f42ca6
&lt;__memmove_avx_unaligned_erms+86&gt;
   0x00007ffff7f42bf1 &lt;+17&gt;:    cmp    rdx,0x40
   0x00007ffff7f42bf5 &lt;+21&gt;:    ja     0x7ffff7f42d13
&lt;__memmove_avx_unaligned_erms+195&gt;
   0x00007ffff7f42bfb &lt;+27&gt;:    vmovdqu ymm0,YMMWORD PTR [rsi]
   0x00007ffff7f42bff &lt;+31&gt;:    vmovdqu ymm1,YMMWORD PTR [rsi+rdx*1-0=
x20]
=3D&gt; 0x00007ffff7f42c05 &lt;+37&gt;:    vmovdqu YMMWORD PTR [rdi],ymm0
   0x00007ffff7f42c09 &lt;+41&gt;:    vmovdqu YMMWORD PTR [rdi+rdx*1-0x20],=
ymm1
   0x00007ffff7f42c0f &lt;+47&gt;:    vzeroupper=20
   0x00007ffff7f42c12 &lt;+50&gt;:    ret=20=20=20=20
End of assembler dump.
(gdb) bt
#0  0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
#1  0x00007fffda85d3e3 in ?? () from /usr/lib/dri/radeonsi_dri.so
#2  0x00007fffda85d4f7 in ?? () from /usr/lib/dri/radeonsi_dri.so
#3  0x00007fffdb108133 in ?? () from /usr/lib/dri/radeonsi_dri.so
#4  0x00007fffe77a4903 in ?? () from /usr/lib/dri/radeonsi_drv_video.so
#5  0x00007ffff4976ffd in vaPutImage () from /usr/lib/libva.so.2
#6  0x00007ffff49f4c1e in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#7  0x00007ffff4a2ecf3 in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#8  0x00007ffff4a2f2bf in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#9  0x00007ffff4a2703b in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#10 0x00007ffff782fe53 in ?? () from /usr/lib/libgstbase-1.0.so.0
#11 0x00007ffff7835ee1 in ?? () from /usr/lib/libgstbase-1.0.so.0
#12 0x00007ffff7a3bcca in gst_pad_query () from /usr/lib/libgstreamer-1.0.s=
o.0
#13 0x00007ffff7a3c3de in gst_pad_peer_query () from
/usr/lib/libgstreamer-1.0.so.0
#14 0x00007ffff7a0a887 in gst_pad_peer_query_caps () from
/usr/lib/libgstreamer-1.0.so.0
#15 0x00007ffff7835cd1 in ?? () from /usr/lib/libgstbase-1.0.so.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642681291.d6e4.32138--

--===============1602156764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1602156764==--
