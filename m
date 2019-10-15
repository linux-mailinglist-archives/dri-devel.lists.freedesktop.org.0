Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F416D6D54
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 04:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CAC6E1C4;
	Tue, 15 Oct 2019 02:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C76FB6E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 02:52:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C48A47296E; Tue, 15 Oct 2019 02:52:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112008] eDP -> Dual Channel LVDS bridge unable to accept any
 modelines: Corrupt display!
Date: Tue, 15 Oct 2019 02:52:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112008-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0631769417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0631769417==
Content-Type: multipart/alternative; boundary="15711079451.f5ccBc.1763"
Content-Transfer-Encoding: 7bit


--15711079451.f5ccBc.1763
Date: Tue, 15 Oct 2019 02:52:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112008

            Bug ID: 112008
           Summary: eDP -> Dual Channel LVDS bridge unable to accept any
                    modelines: Corrupt display!
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: Babblebones@gmail.com

Created attachment 145745
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145745&action=3Dedit
kernel5.3-drm.debug=3D0xe

At my wits end on this bug. My bisecting have proven useless and I wanted to
get some help from you guys. Several reverted regressions reproduce the same
behavior along the way and I have spent hours sifting and booting to see wh=
ere
it's at.

The short of it is that the monitor in my HP laptop boots to a 640x480 mode=
line
on mainline kernels newer than 4.17-rc3.
Would not be a colossal problem, as I can just force a working modeline from
userspace, if it didn't mean without the modeset the bridge utterly scrambl=
es
the display by lining up 640x480 as a wrapping 2D length in the very top of=
 my
screen as a jumble of colors.

The issue is GPU independent but is AMD related. Both W7170M and WX7100
affected.
Somewhere after kernel 4.17-rc3 the the rodeo begins.
My dmesg is probably going to be much much more helpful when it comes to
debugging and I will GLADLY test any kernel patches if you need more info &
detailed kernel/ custom dmesg dumps.

Notable stuff in the dump:

[    4.773991] [drm:amdgpu_vm_init [amdgpu]] VM update mode is SDMA
[    4.774149] [drm:drm_client_modeset_probe]=20
[    4.774156] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1]
[    4.774159] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1] status updated from unknown to connected
[    4.774268] [drm:update_stream_scaling_settings [amdgpu]] Destination
Rectangle x:0  y:0  width:640  height:480
[    4.774278] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1] probed modes :
[    4.774282] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25=
175
640 656 752 800 480 490 492 525 0x40 0xa
[    4.774284] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:63:DP-1]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711079451.f5ccBc.1763
Date: Tue, 15 Oct 2019 02:52:25 +0000
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
   title=3D"NEW - eDP -&gt; Dual Channel LVDS bridge unable to accept any m=
odelines: Corrupt display!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112008">112008</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>eDP -&gt; Dual Channel LVDS bridge unable to accept any model=
ines: Corrupt display!
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
          <td>major
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
          <td>Babblebones&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145745=
" name=3D"attach_145745" title=3D"kernel5.3-drm.debug=3D0xe">attachment 145=
745</a> <a href=3D"attachment.cgi?id=3D145745&amp;action=3Dedit" title=3D"k=
ernel5.3-drm.debug=3D0xe">[details]</a></span>
kernel5.3-drm.debug=3D0xe

At my wits end on this bug. My bisecting have proven useless and I wanted to
get some help from you guys. Several reverted regressions reproduce the same
behavior along the way and I have spent hours sifting and booting to see wh=
ere
it's at.

The short of it is that the monitor in my HP laptop boots to a 640x480 mode=
line
on mainline kernels newer than 4.17-rc3.
Would not be a colossal problem, as I can just force a working modeline from
userspace, if it didn't mean without the modeset the bridge utterly scrambl=
es
the display by lining up 640x480 as a wrapping 2D length in the very top of=
 my
screen as a jumble of colors.

The issue is GPU independent but is AMD related. Both W7170M and WX7100
affected.
Somewhere after kernel 4.17-rc3 the the rodeo begins.
My dmesg is probably going to be much much more helpful when it comes to
debugging and I will GLADLY test any kernel patches if you need more info &=
amp;
detailed kernel/ custom dmesg dumps.

Notable stuff in the dump:

[    4.773991] [drm:amdgpu_vm_init [amdgpu]] VM update mode is SDMA
[    4.774149] [drm:drm_client_modeset_probe]=20
[    4.774156] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1]
[    4.774159] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1] status updated from unknown to connected
[    4.774268] [drm:update_stream_scaling_settings [amdgpu]] Destination
Rectangle x:0  y:0  width:640  height:480
[    4.774278] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:59:eDP-1] probed modes :
[    4.774282] [drm:drm_mode_debug_printmodeline] Modeline &quot;640x480&qu=
ot;: 60 25175
640 656 752 800 480 490 492 525 0x40 0xa
[    4.774284] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:63:DP-1]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711079451.f5ccBc.1763--

--===============0631769417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0631769417==--
