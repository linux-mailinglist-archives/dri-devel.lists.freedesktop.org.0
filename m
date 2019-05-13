Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E531BFFC
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 01:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2C89238;
	Mon, 13 May 2019 23:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9092889235
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 23:59:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 85D64721CD; Mon, 13 May 2019 23:59:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Mon, 13 May 2019 23:59:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: magist3r@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-102646-502-aPjdm0GJPt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0988718034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0988718034==
Content-Type: multipart/alternative; boundary="15577919500.99F1.10779"
Content-Transfer-Encoding: 7bit


--15577919500.99F1.10779
Date: Mon, 13 May 2019 23:59:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

magist3r <magist3r@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144237|0                           |1
        is obsolete|                            |

--- Comment #91 from magist3r <magist3r@gmail.com> ---
Created attachment 144253
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144253&action=3Dedit
fixed patch

I fixed the patch and can apply it on top of amd-drm-next and vanilla kernel
5.0.11 (my current kernel). Unfortunately it doesn't help. I added 'verbose
debug' patch too, here is my output.

1) Before applying high memory profile workaround:
 kernel: amdgpu: [powerplay] min_core_set_clock: 30000
 kernel: amdgpu: [powerplay] min_mem_set_clock: 30000
 kernel: amdgpu: [powerplay] vrefresh: 75
 kernel: amdgpu: [powerplay] min_vblank_time: 464
 kernel: amdgpu: [powerplay] num_display: 2
 kernel: amdgpu: [powerplay] multi_monitor_in_sync: 0
 kernel: amdgpu: [powerplay] performance level 0 memory clock =3D 30000
 kernel: amdgpu: [powerplay] performance level 0 engine clock =3D 30000
 kernel: amdgpu: [powerplay] performance level 1 memory clock =3D 200000
 kernel: amdgpu: [powerplay] performance level 1 engine clock =3D 136600
 kernel: amdgpu: [powerplay] mclk_latency_table entry0 frequency =3D 30000
 kernel: amdgpu: [powerplay] mclk_latency_table entry0 latency =3D 330
 kernel: amdgpu: [powerplay] mclk_latency_table entry1 frequency =3D 100000
 kernel: amdgpu: [powerplay] mclk_latency_table entry1 latency =3D 330
 kernel: amdgpu: [powerplay] mclk_latency_table entry2 frequency =3D 200000
 kernel: amdgpu: [powerplay] mclk_latency_table entry2 latency =3D 330

2) After:
kernel: amdgpu: [powerplay] min_core_set_clock: 30000
kernel: amdgpu: [powerplay] min_mem_set_clock: 30000
kernel: amdgpu: [powerplay] vrefresh: 75
kernel: amdgpu: [powerplay] min_vblank_time: 464
kernel: amdgpu: [powerplay] num_display: 2
kernel: amdgpu: [powerplay] multi_monitor_in_sync: 0
kernel: amdgpu: [powerplay] performance level 0 memory clock =3D 200000
kernel: amdgpu: [powerplay] performance level 0 engine clock =3D 30000
kernel: amdgpu: [powerplay] performance level 1 memory clock =3D 200000
kernel: amdgpu: [powerplay] performance level 1 engine clock =3D 136600
kernel: amdgpu: [powerplay] mclk_latency_table entry0 frequency =3D 30000
kernel: amdgpu: [powerplay] mclk_latency_table entry0 latency =3D 330
kernel: amdgpu: [powerplay] mclk_latency_table entry1 frequency =3D 100000
kernel: amdgpu: [powerplay] mclk_latency_table entry1 latency =3D 330
kernel: amdgpu: [powerplay] mclk_latency_table entry2 frequency =3D 200000
kernel: amdgpu: [powerplay] mclk_latency_table entry2 latency =3D 330

My GPU is RX580 8Gb with 2 monitors connected through HDMI.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15577919500.99F1.10779
Date: Mon, 13 May 2019 23:59:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:magist3r&=
#64;gmail.com" title=3D"magist3r &lt;magist3r&#64;gmail.com&gt;"> <span cla=
ss=3D"fn">magist3r</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144237 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c91">Comme=
nt # 91</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
magist3r&#64;gmail.com" title=3D"magist3r &lt;magist3r&#64;gmail.com&gt;"> =
<span class=3D"fn">magist3r</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144253=
" name=3D"attach_144253" title=3D"fixed patch">attachment 144253</a> <a hre=
f=3D"attachment.cgi?id=3D144253&amp;action=3Dedit" title=3D"fixed patch">[d=
etails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D102646&=
amp;attachment=3D144253'>[review]</a>
fixed patch

I fixed the patch and can apply it on top of amd-drm-next and vanilla kernel
5.0.11 (my current kernel). Unfortunately it doesn't help. I added 'verbose
debug' patch too, here is my output.

1) Before applying high memory profile workaround:
 kernel: amdgpu: [powerplay] min_core_set_clock: 30000
 kernel: amdgpu: [powerplay] min_mem_set_clock: 30000
 kernel: amdgpu: [powerplay] vrefresh: 75
 kernel: amdgpu: [powerplay] min_vblank_time: 464
 kernel: amdgpu: [powerplay] num_display: 2
 kernel: amdgpu: [powerplay] multi_monitor_in_sync: 0
 kernel: amdgpu: [powerplay] performance level 0 memory clock =3D 30000
 kernel: amdgpu: [powerplay] performance level 0 engine clock =3D 30000
 kernel: amdgpu: [powerplay] performance level 1 memory clock =3D 200000
 kernel: amdgpu: [powerplay] performance level 1 engine clock =3D 136600
 kernel: amdgpu: [powerplay] mclk_latency_table entry0 frequency =3D 30000
 kernel: amdgpu: [powerplay] mclk_latency_table entry0 latency =3D 330
 kernel: amdgpu: [powerplay] mclk_latency_table entry1 frequency =3D 100000
 kernel: amdgpu: [powerplay] mclk_latency_table entry1 latency =3D 330
 kernel: amdgpu: [powerplay] mclk_latency_table entry2 frequency =3D 200000
 kernel: amdgpu: [powerplay] mclk_latency_table entry2 latency =3D 330

2) After:
kernel: amdgpu: [powerplay] min_core_set_clock: 30000
kernel: amdgpu: [powerplay] min_mem_set_clock: 30000
kernel: amdgpu: [powerplay] vrefresh: 75
kernel: amdgpu: [powerplay] min_vblank_time: 464
kernel: amdgpu: [powerplay] num_display: 2
kernel: amdgpu: [powerplay] multi_monitor_in_sync: 0
kernel: amdgpu: [powerplay] performance level 0 memory clock =3D 200000
kernel: amdgpu: [powerplay] performance level 0 engine clock =3D 30000
kernel: amdgpu: [powerplay] performance level 1 memory clock =3D 200000
kernel: amdgpu: [powerplay] performance level 1 engine clock =3D 136600
kernel: amdgpu: [powerplay] mclk_latency_table entry0 frequency =3D 30000
kernel: amdgpu: [powerplay] mclk_latency_table entry0 latency =3D 330
kernel: amdgpu: [powerplay] mclk_latency_table entry1 frequency =3D 100000
kernel: amdgpu: [powerplay] mclk_latency_table entry1 latency =3D 330
kernel: amdgpu: [powerplay] mclk_latency_table entry2 frequency =3D 200000
kernel: amdgpu: [powerplay] mclk_latency_table entry2 latency =3D 330

My GPU is RX580 8Gb with 2 monitors connected through HDMI.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577919500.99F1.10779--

--===============0988718034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0988718034==--
