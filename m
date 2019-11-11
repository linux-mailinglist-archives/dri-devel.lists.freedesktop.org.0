Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB6F70F5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE36E878;
	Mon, 11 Nov 2019 09:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 504F86E878
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:40:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4D45E720E2; Mon, 11 Nov 2019 09:40:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112243] Micro stuttering in RocketLeague
Date: Mon, 11 Nov 2019 09:40:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112243-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1985161915=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1985161915==
Content-Type: multipart/alternative; boundary="15734652481.d40fD.30847"
Content-Transfer-Encoding: 7bit


--15734652481.d40fD.30847
Date: Mon, 11 Nov 2019 09:40:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112243

            Bug ID: 112243
           Summary: Micro stuttering in RocketLeague
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mh@familie-heinz.name

Created attachment 145932
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145932&action=3Dedit
Shader clock and fps directly after boot

Hi,

I'm copying this over from bugzilla.kernel.org, because I think it's the wr=
ong
place for amdgpu bug reports.

So everytime I start RocketLeague the first time after a boot I have some k=
ind
of  micro stuttering. This happens with my RX550 and on a Vega 56.

A workaround is to set power_dpm_force_performance_level to "high".

Setting it back to "auto" on the RX550 makes the stuttering return. Doing t=
he
same thing on the Vega 56 not and the stuttering is gone until the next boo=
t.

I recently found out that I can set power_dpm_force_performance_level to
"manual" as well and forbid the lowest clock mode by setting pp_dpm_mclk to=
 "1
2 3".

I'll attach three screenshots that display the shader clock and fps via gal=
lium
hud. One directly after a boot, one with performance_level set to "high" and
one after resetting it to "auto". All screenshots were made with the Vega 56
and Mesa 18.2.0.

The Mesa version is quiet old, but neither a newer kernel, nor an updated M=
esa
helps.

Best regards
Matthias

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734652481.d40fD.30847
Date: Mon, 11 Nov 2019 09:40:48 +0000
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
   title=3D"NEW - Micro stuttering in RocketLeague"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112243">112243</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Micro stuttering in RocketLeague
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
          <td>normal
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
          <td>mh&#64;familie-heinz.name
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145932=
" name=3D"attach_145932" title=3D"Shader clock and fps directly after boot"=
>attachment 145932</a> <a href=3D"attachment.cgi?id=3D145932&amp;action=3De=
dit" title=3D"Shader clock and fps directly after boot">[details]</a></span>
Shader clock and fps directly after boot

Hi,

I'm copying this over from bugzilla.kernel.org, because I think it's the wr=
ong
place for amdgpu bug reports.

So everytime I start RocketLeague the first time after a boot I have some k=
ind
of  micro stuttering. This happens with my RX550 and on a Vega 56.

A workaround is to set power_dpm_force_performance_level to &quot;high&quot=
;.

Setting it back to &quot;auto&quot; on the RX550 makes the stuttering retur=
n. Doing the
same thing on the Vega 56 not and the stuttering is gone until the next boo=
t.

I recently found out that I can set power_dpm_force_performance_level to
&quot;manual&quot; as well and forbid the lowest clock mode by setting pp_d=
pm_mclk to &quot;1
2 3&quot;.

I'll attach three screenshots that display the shader clock and fps via gal=
lium
hud. One directly after a boot, one with performance_level set to &quot;hig=
h&quot; and
one after resetting it to &quot;auto&quot;. All screenshots were made with =
the Vega 56
and Mesa 18.2.0.

The Mesa version is quiet old, but neither a newer kernel, nor an updated M=
esa
helps.

Best regards
Matthias</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734652481.d40fD.30847--

--===============1985161915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1985161915==--
