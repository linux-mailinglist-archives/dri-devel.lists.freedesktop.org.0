Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEAA384B4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56E9899DB;
	Fri,  7 Jun 2019 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF89B8999C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:05:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A437D72167; Fri,  7 Jun 2019 07:05:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110850] Vlc fails to decode video using vaapi
Date: Fri, 07 Jun 2019 07:05:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: akarshanbiswas@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110850-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1029252391=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1029252391==
Content-Type: multipart/alternative; boundary="15598911180.1dDAFc61a.29286"
Content-Transfer-Encoding: 7bit


--15598911180.1dDAFc61a.29286
Date: Fri, 7 Jun 2019 07:05:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110850

            Bug ID: 110850
           Summary: Vlc fails to decode video using vaapi
           Product: Mesa
           Version: 19.1
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: akarshanbiswas@fedoraproject.org
        QA Contact: dri-devel@lists.freedesktop.org

Tested Mesa version: 19.1.0 rc4, 19.0.5

Operating System: Fedora 30 with kernel 5.1.6

VLC version: 3.0.7 Vetinari (revision 3.0.6-223-g5fc4822ace)

GPU's tested: Both on Radeon RX550 and AMD APU a9-9410(stoney series)

Testing on both Xorg and Wayland


This bug is present since long time, selecting either vaapi video decoder or
vaapi video decoder via drm in vlc--> toos --> preferences--> Input/Codecs =
-->
hardware accelerated decoding fails and vlc switches to either vdpau or
software decoding.
(vdpau driver can't decode some hevc videos, vdpau is not supported on wayl=
and)

Steps to reproduce:

1) After selecting vaapi video decoder in vlc, run vlc on a terminal with t=
he
-v flag (for verbose)
2) play any media
3) Check the terminal ( Meanwhile vlc will try to switch to vdpau)



Actual results:
vlc's vaapi decoder fails with:
```
libva info: VA-API version 1.4.1
libva info: va_getDriverName() returns 0
libva info: User requested driver 'radeonsi'
libva info: Trying to open /usr/lib64/dri/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_4
libva info: va_openDriver() returns 0
[00007f4c78001f60] glconv_vaapi_x11 gl error: vaDeriveImage: operation fail=
ed
[00007f4c7c062b30] main video output error: video output creation failed
[00007f4c88056060] main decoder error: failed to create video output
```

Expected result:
Vlc should play vaapi as it does in Intel GPUs.



I have a vlc bug ticket which says that the driver is buggy here:
https://trac.videolan.org/vlc/ticket/21194

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15598911180.1dDAFc61a.29286
Date: Fri, 7 Jun 2019 07:05:18 +0000
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
   title=3D"NEW - Vlc fails to decode video using vaapi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110850">110850</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Vlc fails to decode video using vaapi
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
          <td>akarshanbiswas&#64;fedoraproject.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Tested Mesa version: 19.1.0 rc4, 19.0.5

Operating System: Fedora 30 with kernel 5.1.6

VLC version: 3.0.7 Vetinari (revision 3.0.6-223-g5fc4822ace)

GPU's tested: Both on Radeon RX550 and AMD APU a9-9410(stoney series)

Testing on both Xorg and Wayland


This bug is present since long time, selecting either vaapi video decoder or
vaapi video decoder via drm in vlc--&gt; toos --&gt; preferences--&gt; Inpu=
t/Codecs --&gt;
hardware accelerated decoding fails and vlc switches to either vdpau or
software decoding.
(vdpau driver can't decode some hevc videos, vdpau is not supported on wayl=
and)

Steps to reproduce:

1) After selecting vaapi video decoder in vlc, run vlc on a terminal with t=
he
-v flag (for verbose)
2) play any media
3) Check the terminal ( Meanwhile vlc will try to switch to vdpau)



Actual results:
vlc's vaapi decoder fails with:
```
libva info: VA-API version 1.4.1
libva info: va_getDriverName() returns 0
libva info: User requested driver 'radeonsi'
libva info: Trying to open /usr/lib64/dri/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_4
libva info: va_openDriver() returns 0
[00007f4c78001f60] glconv_vaapi_x11 gl error: vaDeriveImage: operation fail=
ed
[00007f4c7c062b30] main video output error: video output creation failed
[00007f4c88056060] main decoder error: failed to create video output
```

Expected result:
Vlc should play vaapi as it does in Intel GPUs.



I have a vlc bug ticket which says that the driver is buggy here:
<a href=3D"https://trac.videolan.org/vlc/ticket/21194">https://trac.videola=
n.org/vlc/ticket/21194</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15598911180.1dDAFc61a.29286--

--===============1029252391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1029252391==--
