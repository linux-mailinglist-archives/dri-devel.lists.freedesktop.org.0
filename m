Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521134F8F5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 01:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AD589D43;
	Sat, 22 Jun 2019 23:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05FB289D43
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 23:35:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ECB7772167; Sat, 22 Jun 2019 23:35:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110971] GPU HANG: ecode 6:1:0xfffffffe, in spring-main [8656],
 hang on rcs0
Date: Sat, 22 Jun 2019 23:35:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: Chris.Rebischke@archlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110971-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0196572259=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0196572259==
Content-Type: multipart/alternative; boundary="15612465030.e28cB6.16963"
Content-Transfer-Encoding: 7bit


--15612465030.e28cB6.16963
Date: Sat, 22 Jun 2019 23:35:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110971

            Bug ID: 110971
           Summary: GPU HANG: ecode 6:1:0xfffffffe, in spring-main [8656],
                    hang on rcs0
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/i915
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: Chris.Rebischke@archlinux.org
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144614
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144614&action=3Dedit
crash dump from /sys/class/drm/card0/error

I get unspecified GPU hangs while playing games. It mostly occurs when my C=
PU
starts throttling:

[ 5838.889104] mce: CPU0: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889108] mce: CPU2: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889110] mce: CPU3: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889112] mce: CPU1: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5900.819612] mce: CPU2: Core temperature above threshold, cpu clock throt=
tled
(total events =3D 16235)
[ 5900.819613] mce: CPU3: Core temperature above threshold, cpu clock throt=
tled
(total events =3D 16235)
[ 5900.827685] mce: CPU2: Core temperature/speed normal
[ 5900.827686] mce: CPU3: Core temperature/speed normal
[ 6138.891505] mce: CPU1: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891506] mce: CPU0: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891528] mce: CPU2: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891529] mce: CPU3: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6176.479565] i915 0000:00:02.0: GPU HANG: ecode 6:1:0xfffffffe, in
spring-main [8656], hang on rcs0
[ 6176.479570] [drm] GPU hangs can indicate a bug anywhere in the entire gfx
stack, including userspace.
[ 6176.479572] [drm] Please file a _new_ bug report on bugs.freedesktop.org
against DRI -> DRM/Intel
[ 6176.479573] [drm] drm/i915 developers can then reassign to the right
component if it's not a kernel issue.
[ 6176.479574] [drm] The gpu crash dump is required to analyze gpu hangs, so
please always attach it.
[ 6176.479575] [drm] GPU crash dump saved to /sys/class/drm/card0/error
[ 6176.479642] i915 0000:00:02.0: Resetting chip for hang on rcs0
[ 6422.644956] i915 0000:00:02.0: Resetting chip for hang on rcs0
[ 6438.888919] mce: CPU3: Package temperature/speed normal
[ 6438.888920] mce: CPU2: Package temperature/speed normal
[ 6438.888924] mce: CPU1: Package temperature/speed normal
[ 6438.888926] mce: CPU0: Package temperature/speed normal

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15612465030.e28cB6.16963
Date: Sat, 22 Jun 2019 23:35:03 +0000
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
   title=3D"NEW - GPU HANG: ecode 6:1:0xfffffffe, in spring-main [8656], ha=
ng on rcs0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110971">110971</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU HANG: ecode 6:1:0xfffffffe, in spring-main [8656], hang o=
n rcs0
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/i915
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>Chris.Rebischke&#64;archlinux.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144614=
" name=3D"attach_144614" title=3D"crash dump from /sys/class/drm/card0/erro=
r">attachment 144614</a> <a href=3D"attachment.cgi?id=3D144614&amp;action=
=3Dedit" title=3D"crash dump from /sys/class/drm/card0/error">[details]</a>=
</span>
crash dump from /sys/class/drm/card0/error

I get unspecified GPU hangs while playing games. It mostly occurs when my C=
PU
starts throttling:

[ 5838.889104] mce: CPU0: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889108] mce: CPU2: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889110] mce: CPU3: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5838.889112] mce: CPU1: Package temperature above threshold, cpu clock
throttled (total events =3D 100749)
[ 5900.819612] mce: CPU2: Core temperature above threshold, cpu clock throt=
tled
(total events =3D 16235)
[ 5900.819613] mce: CPU3: Core temperature above threshold, cpu clock throt=
tled
(total events =3D 16235)
[ 5900.827685] mce: CPU2: Core temperature/speed normal
[ 5900.827686] mce: CPU3: Core temperature/speed normal
[ 6138.891505] mce: CPU1: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891506] mce: CPU0: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891528] mce: CPU2: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6138.891529] mce: CPU3: Package temperature above threshold, cpu clock
throttled (total events =3D 171156)
[ 6176.479565] i915 0000:00:02.0: GPU HANG: ecode 6:1:0xfffffffe, in
spring-main [8656], hang on rcs0
[ 6176.479570] [drm] GPU hangs can indicate a bug anywhere in the entire gfx
stack, including userspace.
[ 6176.479572] [drm] Please file a _new_ bug report on bugs.freedesktop.org
against DRI -&gt; DRM/Intel
[ 6176.479573] [drm] drm/i915 developers can then reassign to the right
component if it's not a kernel issue.
[ 6176.479574] [drm] The gpu crash dump is required to analyze gpu hangs, so
please always attach it.
[ 6176.479575] [drm] GPU crash dump saved to /sys/class/drm/card0/error
[ 6176.479642] i915 0000:00:02.0: Resetting chip for hang on rcs0
[ 6422.644956] i915 0000:00:02.0: Resetting chip for hang on rcs0
[ 6438.888919] mce: CPU3: Package temperature/speed normal
[ 6438.888920] mce: CPU2: Package temperature/speed normal
[ 6438.888924] mce: CPU1: Package temperature/speed normal
[ 6438.888926] mce: CPU0: Package temperature/speed normal</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15612465030.e28cB6.16963--

--===============0196572259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0196572259==--
