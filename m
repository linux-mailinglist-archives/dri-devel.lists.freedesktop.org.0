Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02189517
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 02:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3006E40B;
	Mon, 12 Aug 2019 00:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CEFB6E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 00:51:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F1D5A72167; Mon, 12 Aug 2019 00:51:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111372] Dual-monitor desktop environment crash with certain
 monitor positions
Date: Mon, 12 Aug 2019 00:51:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: theodorettshaw@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111372-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1931411962=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1931411962==
Content-Type: multipart/alternative; boundary="15655710660.cb1E.30294"
Content-Transfer-Encoding: 7bit


--15655710660.cb1E.30294
Date: Mon, 12 Aug 2019 00:51:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111372

            Bug ID: 111372
           Summary: Dual-monitor desktop environment crash with certain
                    monitor positions
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: theodorettshaw@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 145032
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145032&action=3Dedit
Monitor placement crash/working cutoff

There's an issue with certain desktop environments crashing on startup when=
 the
monitors of a multi-display system are in certain positions. In my case, I =
have
two monitors, and my desktop environment crashes with the error=20

cinnamon: ../src/gallium/drivers/radeonsi/si_state_viewport.c:239:
si_emit_guardband: Assertion `left <=3D -1 && top <=3D -1 && right >=3D 1 &=
& bottom
>=3D 1' failed.

when my secondary monitor is positioned to the left of the primary monitor.=
 An
example placement can be seen in the attached image. This is roughly the
cutoff; moving the secondary monitor, the Philips, any farther left and
restarting the DE will result in a crash. Keeping it further right and
restarting the DE results in no issues. The secondary monitor can be either
above or below the primary monitor with the same results. This error also
occurs if the secondary monitor is too far left when the DE starts on system
startup. Switching which monitor is the primary and secondary results in the
same issue, with a crash if the new secondary is too far left.

I'm using Linux Mint 19.2, Cinnamon 4.2.3, and kernel version 5.0.0-23-gene=
ric,
though I've tried several different kernel versions. I'm using an RX480. The
issue has been confirmed by others at
https://github.com/linuxmint/cinnamon/issues/8754 and a very similar and li=
kely
linked issue at https://bugs.launchpad.net/ubuntu/+source/cinnamon/+bug/183=
7087
. glxinfo output can be found at https://pastebin.com/RGnAR320 and I'm happ=
y to
provide any other information needed, though I may need some pointers on
something like recompiling Mesa in debug mode and getting a trace stack.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655710660.cb1E.30294
Date: Mon, 12 Aug 2019 00:51:06 +0000
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
   title=3D"NEW - Dual-monitor desktop environment crash with certain monit=
or positions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111372">111372</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dual-monitor desktop environment crash with certain monitor p=
ositions
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>theodorettshaw&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145032=
" name=3D"attach_145032" title=3D"Monitor placement crash/working cutoff">a=
ttachment 145032</a> <a href=3D"attachment.cgi?id=3D145032&amp;action=3Dedi=
t" title=3D"Monitor placement crash/working cutoff">[details]</a></span>
Monitor placement crash/working cutoff

There's an issue with certain desktop environments crashing on startup when=
 the
monitors of a multi-display system are in certain positions. In my case, I =
have
two monitors, and my desktop environment crashes with the error=20

cinnamon: ../src/gallium/drivers/radeonsi/si_state_viewport.c:239:
si_emit_guardband: Assertion `left &lt;=3D -1 &amp;&amp; top &lt;=3D -1 &am=
p;&amp; right &gt;=3D 1 &amp;&amp; bottom
<span class=3D"quote">&gt;=3D 1' failed.</span >

when my secondary monitor is positioned to the left of the primary monitor.=
 An
example placement can be seen in the attached image. This is roughly the
cutoff; moving the secondary monitor, the Philips, any farther left and
restarting the DE will result in a crash. Keeping it further right and
restarting the DE results in no issues. The secondary monitor can be either
above or below the primary monitor with the same results. This error also
occurs if the secondary monitor is too far left when the DE starts on system
startup. Switching which monitor is the primary and secondary results in the
same issue, with a crash if the new secondary is too far left.

I'm using Linux Mint 19.2, Cinnamon 4.2.3, and kernel version 5.0.0-23-gene=
ric,
though I've tried several different kernel versions. I'm using an RX480. The
issue has been confirmed by others at
<a href=3D"https://github.com/linuxmint/cinnamon/issues/8754">https://githu=
b.com/linuxmint/cinnamon/issues/8754</a> and a very similar and likely
linked issue at <a href=3D"https://bugs.launchpad.net/ubuntu/+source/cinnam=
on/+bug/1837087">https://bugs.launchpad.net/ubuntu/+source/cinnamon/+bug/18=
37087</a>
. glxinfo output can be found at <a href=3D"https://pastebin.com/RGnAR320">=
https://pastebin.com/RGnAR320</a> and I'm happy to
provide any other information needed, though I may need some pointers on
something like recompiling Mesa in debug mode and getting a trace stack.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655710660.cb1E.30294--

--===============1931411962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1931411962==--
