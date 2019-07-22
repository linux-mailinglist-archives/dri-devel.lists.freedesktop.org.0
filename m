Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE36FC56
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 11:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245178989C;
	Mon, 22 Jul 2019 09:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D80E8989C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:38:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7A39072167; Mon, 22 Jul 2019 09:38:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111182] Fade-to-white after KMS is set on RV635
Date: Mon, 22 Jul 2019 09:38:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: thumperward@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111182-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0569571965=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0569571965==
Content-Type: multipart/alternative; boundary="15637882831.F515BD.15376"
Content-Transfer-Encoding: 7bit


--15637882831.F515BD.15376
Date: Mon, 22 Jul 2019 09:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111182

            Bug ID: 111182
           Summary: Fade-to-white after KMS is set on RV635
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: thumperward@hotmail.com

Created attachment 144837
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144837&action=3Dedit
dmesg output after blacklisting radeon, then enabling it after boot

I have a laptop with a Radeon Mobility 3670. With KMS disabled I can boot
normally; however, otherwise it typically locks hard as soon as modesetting
happens, with an odd effect where the screen gradually fades to being nearly
completely white. (I can provide video if for some reason this would help).

However, on occasion (rarely) it will flicker for a second, successfully sw=
itch
modes, spit out "Timeout setting UVD clocks", and then carry on correctly.

Given that this happens very early in the boot, and hard locks the system, =
I've
taken to blacklisting radeon in my boot parameters, then doing a "sudo modp=
robe
radeon" after logging in and crossing my fingers. Attached is dmesg output =
from
such a case - note the delay between lines 918 and 919 as boot finished, I
logged in, and then ran modprobe. Lines 950-955 show the errors that get ec=
hoed
as the system then successfully switches modes.

(blacklisting until after boot isn't the only way to get it working - it ju=
st
happens to give me more of a sense of control than repeatedly power-cycling=
 and
hoping the system boots normally.)

The closest example I could find on search was 16389 - however none of the
workarounds there help, and when the screen fades the machine is subsequent=
ly
completely unreponsive.

Debian 10 buster, 1:19.0.1-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637882831.F515BD.15376
Date: Mon, 22 Jul 2019 09:38:03 +0000
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
   title=3D"NEW - Fade-to-white after KMS is set on RV635"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111182">111182</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Fade-to-white after KMS is set on RV635
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>thumperward&#64;hotmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144837=
" name=3D"attach_144837" title=3D"dmesg output after blacklisting radeon, t=
hen enabling it after boot">attachment 144837</a> <a href=3D"attachment.cgi=
?id=3D144837&amp;action=3Dedit" title=3D"dmesg output after blacklisting ra=
deon, then enabling it after boot">[details]</a></span>
dmesg output after blacklisting radeon, then enabling it after boot

I have a laptop with a Radeon Mobility 3670. With KMS disabled I can boot
normally; however, otherwise it typically locks hard as soon as modesetting
happens, with an odd effect where the screen gradually fades to being nearly
completely white. (I can provide video if for some reason this would help).

However, on occasion (rarely) it will flicker for a second, successfully sw=
itch
modes, spit out &quot;Timeout setting UVD clocks&quot;, and then carry on c=
orrectly.

Given that this happens very early in the boot, and hard locks the system, =
I've
taken to blacklisting radeon in my boot parameters, then doing a &quot;sudo=
 modprobe
radeon&quot; after logging in and crossing my fingers. Attached is dmesg ou=
tput from
such a case - note the delay between lines 918 and 919 as boot finished, I
logged in, and then ran modprobe. Lines 950-955 show the errors that get ec=
hoed
as the system then successfully switches modes.

(blacklisting until after boot isn't the only way to get it working - it ju=
st
happens to give me more of a sense of control than repeatedly power-cycling=
 and
hoping the system boots normally.)

The closest example I could find on search was 16389 - however none of the
workarounds there help, and when the screen fades the machine is subsequent=
ly
completely unreponsive.

Debian 10 buster, 1:19.0.1-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637882831.F515BD.15376--

--===============0569571965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0569571965==--
