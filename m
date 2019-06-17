Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390904951B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 00:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C23789FA6;
	Mon, 17 Jun 2019 22:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D157889FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 22:21:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C934C72167; Mon, 17 Jun 2019 22:21:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110929] sw_init of IP block <vega10_ih> failed -12 when using
 Secure Memory Encryption (SME) with Vega 64
Date: Mon, 17 Jun 2019 22:21:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sarnex@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110929-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0359780222=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0359780222==
Content-Type: multipart/alternative; boundary="15608101100.BAedEEE.29710"
Content-Transfer-Encoding: 7bit


--15608101100.BAedEEE.29710
Date: Mon, 17 Jun 2019 22:21:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110929

            Bug ID: 110929
           Summary: sw_init of IP block <vega10_ih> failed -12 when using
                    Secure Memory Encryption (SME) with Vega 64
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: sarnex@gentoo.org

Created attachment 144574
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144574&action=3Dedit
dmesg_sme

Hi all,

If I turn on SME for my Ryzen 2700x CPU, I get the following error during b=
oot:

[   19.998488] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP
block <vega10_ih> failed -12
[   19.998490] amdgpu 0000:0c:00.0: amdgpu_device_ip_init failed
[   19.998492] amdgpu 0000:0c:00.0: Fatal error during GPU init
[   19.998493] [drm] amdgpu: finishing device.
[   19.998601] [drm] amdgpu: ttm finalized

I've attached the full dmesg.

I am using a Vega 64, Gentoo, Mesa/DRI* git, and kernel 5.1.x.

I can test any patches or provide any more information.

Thanks,
Sarnex

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608101100.BAedEEE.29710
Date: Mon, 17 Jun 2019 22:21:50 +0000
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
   title=3D"NEW - sw_init of IP block &lt;vega10_ih&gt; failed -12 when usi=
ng Secure Memory Encryption (SME) with Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110929">110929</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>sw_init of IP block &lt;vega10_ih&gt; failed -12 when using S=
ecure Memory Encryption (SME) with Vega 64
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
          <td>sarnex&#64;gentoo.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144574=
" name=3D"attach_144574" title=3D"dmesg_sme">attachment 144574</a> <a href=
=3D"attachment.cgi?id=3D144574&amp;action=3Dedit" title=3D"dmesg_sme">[deta=
ils]</a></span>
dmesg_sme

Hi all,

If I turn on SME for my Ryzen 2700x CPU, I get the following error during b=
oot:

[   19.998488] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP
block &lt;vega10_ih&gt; failed -12
[   19.998490] amdgpu 0000:0c:00.0: amdgpu_device_ip_init failed
[   19.998492] amdgpu 0000:0c:00.0: Fatal error during GPU init
[   19.998493] [drm] amdgpu: finishing device.
[   19.998601] [drm] amdgpu: ttm finalized

I've attached the full dmesg.

I am using a Vega 64, Gentoo, Mesa/DRI* git, and kernel 5.1.x.

I can test any patches or provide any more information.

Thanks,
Sarnex</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608101100.BAedEEE.29710--

--===============0359780222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0359780222==--
