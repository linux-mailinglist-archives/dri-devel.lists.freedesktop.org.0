Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1043C36BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B2E6E0BA;
	Tue,  1 Oct 2019 14:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B3B36E0BA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:11:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 23DF072162; Tue,  1 Oct 2019 14:11:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111876] AMD 5700 XT / Navi - BenQ XL2420G - No EDID read with
 DP connector, HDMI works fine
Date: Tue, 01 Oct 2019 14:11:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: christopherjordan87@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111876-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1074203513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1074203513==
Content-Type: multipart/alternative; boundary="15699390820.Cc5A2ee.790"
Content-Transfer-Encoding: 7bit


--15699390820.Cc5A2ee.790
Date: Tue, 1 Oct 2019 14:11:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111876

            Bug ID: 111876
           Summary: AMD 5700 XT / Navi - BenQ XL2420G - No EDID read with
                    DP connector, HDMI works fine
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: christopherjordan87@gmail.com

Created attachment 145598
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145598&action=3Dedit
dmesg output when using DP

I recently built a new machine (specs below), but I'm having trouble using =
the
display port connector with my old monitor (BenQ XL2420G) - I get the follo=
wing
EDID error:

[drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.

Following instructions to manually use an EDID appears to do nothing
(https://wiki.archlinux.org/index.php/kernel_mode_setting). I generated an =
EDID
with the "read-edid" package after modprobe-ing i2c-dev and HDMI connected,=
 as
well as my old machine's nvidia card via "acquire EDID" in nvidia-settings.

I'm not sure how quirky other G-Sync or high-refresh-rate monitors are, but
this one *only* allows a 144 Hz refresh rate with display port. However, us=
ing
HDMI, everything appears to be fine. My Windows partition in the same machi=
ne
appears quite happy to use DP at 144 Hz, so I'm particularly baffled as to =
why
linux is struggling. After scouring the internet, it appears no one else has
the same issue, so it is possible that this monitor is simply not playing
nicely.

I have supplied my lspci output, as well as dmesg outputs with "drm.debug=
=3D0x1e
log_buf_len=3D4M" for both DP and HDMI connected. I am running up-to-date
archlinux, using linux-firmware from the testing repo (which should just be
neatly providing the navi firmware in a non-AUR package) and a bunch of
packages from the mesa-git repo. My pacman -Q is also attached.

Any help would be greatly appreciated! Many thanks in advance.

ASUS TUF Gaming X570-PLUS WiFi
AMD Ryzen 3900X
Powercolor Red Devil 5700 XT

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699390820.Cc5A2ee.790
Date: Tue, 1 Oct 2019 14:11:22 +0000
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
   title=3D"NEW - AMD 5700 XT / Navi - BenQ XL2420G - No EDID read with DP =
connector, HDMI works fine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111876">111876</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD 5700 XT / Navi - BenQ XL2420G - No EDID read with DP conn=
ector, HDMI works fine
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>christopherjordan87&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145598=
" name=3D"attach_145598" title=3D"dmesg output when using DP">attachment 14=
5598</a> <a href=3D"attachment.cgi?id=3D145598&amp;action=3Dedit" title=3D"=
dmesg output when using DP">[details]</a></span>
dmesg output when using DP

I recently built a new machine (specs below), but I'm having trouble using =
the
display port connector with my old monitor (BenQ XL2420G) - I get the follo=
wing
EDID error:

[drm:dc_link_detect [amdgpu]] *ERROR* No EDID read.

Following instructions to manually use an EDID appears to do nothing
(<a href=3D"https://wiki.archlinux.org/index.php/kernel_mode_setting">https=
://wiki.archlinux.org/index.php/kernel_mode_setting</a>). I generated an ED=
ID
with the &quot;read-edid&quot; package after modprobe-ing i2c-dev and HDMI =
connected, as
well as my old machine's nvidia card via &quot;acquire EDID&quot; in nvidia=
-settings.

I'm not sure how quirky other G-Sync or high-refresh-rate monitors are, but
this one *only* allows a 144 Hz refresh rate with display port. However, us=
ing
HDMI, everything appears to be fine. My Windows partition in the same machi=
ne
appears quite happy to use DP at 144 Hz, so I'm particularly baffled as to =
why
linux is struggling. After scouring the internet, it appears no one else has
the same issue, so it is possible that this monitor is simply not playing
nicely.

I have supplied my lspci output, as well as dmesg outputs with &quot;drm.de=
bug=3D0x1e
log_buf_len=3D4M&quot; for both DP and HDMI connected. I am running up-to-d=
ate
archlinux, using linux-firmware from the testing repo (which should just be
neatly providing the navi firmware in a non-AUR package) and a bunch of
packages from the mesa-git repo. My pacman -Q is also attached.

Any help would be greatly appreciated! Many thanks in advance.

ASUS TUF Gaming X570-PLUS WiFi
AMD Ryzen 3900X
Powercolor Red Devil 5700 XT</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699390820.Cc5A2ee.790--

--===============1074203513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1074203513==--
