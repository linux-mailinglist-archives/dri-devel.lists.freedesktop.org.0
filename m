Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BEC209F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 14:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666056E03F;
	Mon, 30 Sep 2019 12:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 256C76E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 12:30:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1C73372162; Mon, 30 Sep 2019 12:30:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111869] Navi "divide error" hang
Date: Mon, 30 Sep 2019 12:30:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: git@dougty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111869-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0789417289=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0789417289==
Content-Type: multipart/alternative; boundary="15698466270.bDc63ed.14801"
Content-Transfer-Encoding: 7bit


--15698466270.bDc63ed.14801
Date: Mon, 30 Sep 2019 12:30:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111869

            Bug ID: 111869
           Summary: Navi "divide error" hang
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: git@dougty.com

Created attachment 145593
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145593&action=3Dedit
divide-error_09-20.txt

Occasionally, usually while watching videos in Firefox, my GPU will hang and
the screen will freeze -- sound and keyboard input still work in the
background, and I need to use REISUB hotkeys to reboot. This is separate, in
addition to the sdma and ring gfx_0.0.0 hangs.

Upon rebooting, journalctl shows the attached "divide error". I've included
logs from 3 instances of it happening. I'm currently using the Jul 14 firmw=
are
from Fedora's linux-firmware package as the hang appears to occur more ofte=
n on
the newer firmware from
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/ however this may
just be placebo.

It occurs with or without the "0-sized IBs" kernel patch from
https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c33 and on both PCIe =
3.0
and 4.0. I'm not using a PCIe riser and the card works without issue on Win=
dows
10 dual boot.

CPU: 3700X
GPU: Sapphire 5700XT (reference)
Motherboard: Gigabyte X570-I (BIOS F4)
Kernel: 5.3.0
Mesa: mesa-git 1:19.3.0_devel.115682.3c966fd688c-1
LLVM: llvm-git 10.0.0_r327425.63f6066b53d-1

Please let me know if any more information would be helpful, or if there's
anything I can do to troubleshoot. Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698466270.bDc63ed.14801
Date: Mon, 30 Sep 2019 12:30:27 +0000
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
   title=3D"NEW - Navi &quot;divide error&quot; hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111869">111869</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Navi &quot;divide error&quot; hang
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
          <td>git&#64;dougty.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145593=
" name=3D"attach_145593" title=3D"divide-error_09-20.txt">attachment 145593=
</a> <a href=3D"attachment.cgi?id=3D145593&amp;action=3Dedit" title=3D"divi=
de-error_09-20.txt">[details]</a></span>
divide-error_09-20.txt

Occasionally, usually while watching videos in Firefox, my GPU will hang and
the screen will freeze -- sound and keyboard input still work in the
background, and I need to use REISUB hotkeys to reboot. This is separate, in
addition to the sdma and ring gfx_0.0.0 hangs.

Upon rebooting, journalctl shows the attached &quot;divide error&quot;. I'v=
e included
logs from 3 instances of it happening. I'm currently using the Jul 14 firmw=
are
from Fedora's linux-firmware package as the hang appears to occur more ofte=
n on
the newer firmware from
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a> however this may
just be placebo.

It occurs with or without the &quot;0-sized IBs&quot; kernel patch from
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481#c33">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111481#c33</a> and on both PCIe 3.0
and 4.0. I'm not using a PCIe riser and the card works without issue on Win=
dows
10 dual boot.

CPU: 3700X
GPU: Sapphire 5700XT (reference)
Motherboard: Gigabyte X570-I (BIOS F4)
Kernel: 5.3.0
Mesa: mesa-git 1:19.3.0_devel.115682.3c966fd688c-1
LLVM: llvm-git 10.0.0_r327425.63f6066b53d-1

Please let me know if any more information would be helpful, or if there's
anything I can do to troubleshoot. Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698466270.bDc63ed.14801--

--===============0789417289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0789417289==--
