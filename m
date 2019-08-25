Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22869C623
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 22:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15E46E12B;
	Sun, 25 Aug 2019 20:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 127906E130
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 20:46:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0F2A272161; Sun, 25 Aug 2019 20:46:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 25 Aug 2019 20:46:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-6qk9ydCQSo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1344411365=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1344411365==
Content-Type: multipart/alternative; boundary="15667659800.C4A59.10396"
Content-Transfer-Encoding: 7bit


--15667659800.C4A59.10396
Date: Sun, 25 Aug 2019 20:46:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #116 from ReddestDream <reddestdream@gmail.com> ---
Created attachment 145153
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145153&action=3Dedit
dmesgAMD2Monitors

I've been doing a few tests. I looked into and compiled 5.3-rc5 along with
these patches, but nothing seemed to resolve our multimonitor issue. :/

https://phoronix.com/scan.php?page=3Dnews_item&px=3DAMDGPU-Multi-Monitor-vR=
AM-Clock

I've also gotten some dmesg output with 5.2.9 with amdgpu.dc_log=3D1
drm.debug=3D0x1e log_buf_len=3D2M. Turns out that amdgpu.dc_log=3D1 does no=
thing on
this kernel, but I didn't know this when I ran the tests. The interesting a=
dded
data appears to be coming from drm.debug=3D0x1e.

I have two (physically) identical LG 24UD58-B 4K60 monitors connected via D=
P.
One test was done with both monitors connected to Radeon VII, and the other=
 was
done using my stable Intel+Radeon VII setup where one monitor is connected =
to
Radeon VII and the other is connected to the Intel iGPU (HD 630, also via D=
P at
4K60).

These dmesg dumps were taken with all DMs/DEs/Graphics disabled in order to
limit interference. The system was booted to a text commandline at native
resolution.

Since 5.3 isn't changing anything, I plan to do a recompile of 5.2.9 (or 5.=
2.10
if it's out for Arch) with the smum_send_msg_to_smc_with_parameter patch
suggested by Tom B.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667659800.C4A59.10396
Date: Sun, 25 Aug 2019 20:46:20 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c116">Comm=
ent # 116</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145153=
" name=3D"attach_145153" title=3D"dmesgAMD2Monitors">attachment 145153</a> =
<a href=3D"attachment.cgi?id=3D145153&amp;action=3Dedit" title=3D"dmesgAMD2=
Monitors">[details]</a></span>
dmesgAMD2Monitors

I've been doing a few tests. I looked into and compiled 5.3-rc5 along with
these patches, but nothing seemed to resolve our multimonitor issue. :/

<a href=3D"https://phoronix.com/scan.php?page=3Dnews_item&amp;px=3DAMDGPU-M=
ulti-Monitor-vRAM-Clock">https://phoronix.com/scan.php?page=3Dnews_item&amp=
;px=3DAMDGPU-Multi-Monitor-vRAM-Clock</a>

I've also gotten some dmesg output with 5.2.9 with amdgpu.dc_log=3D1
drm.debug=3D0x1e log_buf_len=3D2M. Turns out that amdgpu.dc_log=3D1 does no=
thing on
this kernel, but I didn't know this when I ran the tests. The interesting a=
dded
data appears to be coming from drm.debug=3D0x1e.

I have two (physically) identical LG 24UD58-B 4K60 monitors connected via D=
P.
One test was done with both monitors connected to Radeon VII, and the other=
 was
done using my stable Intel+Radeon VII setup where one monitor is connected =
to
Radeon VII and the other is connected to the Intel iGPU (HD 630, also via D=
P at
4K60).

These dmesg dumps were taken with all DMs/DEs/Graphics disabled in order to
limit interference. The system was booted to a text commandline at native
resolution.

Since 5.3 isn't changing anything, I plan to do a recompile of 5.2.9 (or 5.=
2.10
if it's out for Arch) with the smum_send_msg_to_smc_with_parameter patch
suggested by Tom B.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667659800.C4A59.10396--

--===============1344411365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1344411365==--
