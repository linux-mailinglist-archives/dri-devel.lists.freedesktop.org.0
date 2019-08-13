Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474D8B07B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECFD89AC6;
	Tue, 13 Aug 2019 07:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A83E89F07
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:09:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 91B847215A; Tue, 13 Aug 2019 07:09:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111390] [CI][SHARDS] igt@kms_* - dmesg-warn - KSV list failed
 to become ready (-110)
Date: Tue, 13 Aug 2019 07:09:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111390-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0982107882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0982107882==
Content-Type: multipart/alternative; boundary="15656801580.0c86edd.11095"
Content-Transfer-Encoding: 7bit


--15656801580.0c86edd.11095
Date: Tue, 13 Aug 2019 07:09:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111390

            Bug ID: 111390
           Summary: [CI][SHARDS] igt@kms_* - dmesg-warn - KSV list failed
                    to become ready (-110)
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: IGT
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: martin.peres@free.fr

It seems like we are attempting to use HDCP in tests that do not need conte=
nt
protection:

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5128/shard-apl7/igt@kms_plane@=
plane-position-hole-dpms-pipe-b-planes.html

<7> [1747.235381] [drm:intel_hdcp_auth [i915]] KSV list failed to become re=
ady
(-110)
<7> [1747.235601] [drm:_intel_hdcp_enable [i915]] HDCP Auth failure (-110)
<7> [1747.235754] [drm:_intel_hdcp_disable [i915]] [DP-1:100] HDCP is being
disabled...
<7> [1747.238782] [drm:_intel_hdcp_disable [i915]] HDCP is disabled

Please make sure HDCP is disabled in KMS tests which are not content-protec=
tion
related.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656801580.0c86edd.11095
Date: Tue, 13 Aug 2019 07:09:18 +0000
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
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_* - dmesg-warn - KSV list failed=
 to become ready (-110)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111390">111390</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[CI][SHARDS] igt&#64;kms_* - dmesg-warn - KSV list failed to =
become ready (-110)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>IGT
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>martin.peres&#64;free.fr
          </td>
        </tr></table>
      <p>
        <div>
        <pre>It seems like we are attempting to use HDCP in tests that do n=
ot need content
protection:

<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5128/shard-apl7/igt=
&#64;kms_plane&#64;plane-position-hole-dpms-pipe-b-planes.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/IGT_5128/shard-apl7/igt&#64;kms_plane&#64;pla=
ne-position-hole-dpms-pipe-b-planes.html</a>

&lt;7&gt; [1747.235381] [drm:intel_hdcp_auth [i915]] KSV list failed to bec=
ome ready
(-110)
&lt;7&gt; [1747.235601] [drm:_intel_hdcp_enable [i915]] HDCP Auth failure (=
-110)
&lt;7&gt; [1747.235754] [drm:_intel_hdcp_disable [i915]] [DP-1:100] HDCP is=
 being
disabled...
&lt;7&gt; [1747.238782] [drm:_intel_hdcp_disable [i915]] HDCP is disabled

Please make sure HDCP is disabled in KMS tests which are not content-protec=
tion
related.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656801580.0c86edd.11095--

--===============0982107882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0982107882==--
