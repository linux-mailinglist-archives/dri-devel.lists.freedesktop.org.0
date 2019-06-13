Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20F44DD3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AFB89081;
	Thu, 13 Jun 2019 20:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79C1089081
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:50:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 767EF72167; Thu, 13 Jun 2019 20:50:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110856] Freesync causes in-game blackscreens when game has low
 fps.
Date: Thu, 13 Jun 2019 20:50:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mokurai82@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110856-502-TTLUqgF0ho@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110856-502@http.bugs.freedesktop.org/>
References: <bug-110856-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0142377402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0142377402==
Content-Type: multipart/alternative; boundary="15604590511.2FFb4E.13166"
Content-Transfer-Encoding: 7bit


--15604590511.2FFb4E.13166
Date: Thu, 13 Jun 2019 20:50:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110856

--- Comment #8 from Arek Tumas <mokurai82@gmail.com> ---

I've tried it but it did not work. I made a custom edid.bin file through CR=
U on
windows, but in rocket League when I click on menus the screen resets/flash=
es
black (as in the monitors hardware does). Also when I select the frame rate
target below the vrr window it stays black. It does happen less in in-game =
3d
scenes I think, but that may be subjective. This happens all the time in
Witcher 2.
I've been on this for hours. I also tried advice from the following sites l=
ater
on:
https://forum.manjaro.org/t/solved-setting-custom-resolution-for-second-mon=
itor-via-xorg-conf/83693/18

https://kodi.wiki/view/Creating_and_using_edid.bin_via_xorg.conf#Configure_=
xorg_to_read_custom_EDID_file

I of course adjusted it for amdgpu purposes.

I've tried these settings in /usr/share/X11/xorg.conf.d/10-amdgpu.conf=20
according to those tutorials:

Section "OutputClass"
        Identifier "AMDgpu"
        MatchDriver "amdgpu"
        Driver "amdgpu"
EndSection
Section "Device"
    Identifier "AMD"
    Driver "amdgpu"
    Option  "ConnectedMonitor" "DP-2"
    Option  "CustomEDID" "DP-2:/etc/X11/edid.bin"
    Option  "IgnoreEDID" "false"
    Option  "UseEDID" "true"
    Option  "VariableRefresh" "true"
    Option  "TearFree" "on"
    Option  "DRI" "3"
#    Option "AccelMethod" "glamor"
EndSection

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604590511.2FFb4E.13166
Date: Thu, 13 Jun 2019 20:50:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856">bug 11085=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mokurai82&#64;gmail.com" title=3D"Arek Tumas &lt;mokurai82&#64;gmail.com&gt=
;"> <span class=3D"fn">Arek Tumas</span></a>
</span></b>
        <pre>
I've tried it but it did not work. I made a custom edid.bin file through CR=
U on
windows, but in rocket League when I click on menus the screen resets/flash=
es
black (as in the monitors hardware does). Also when I select the frame rate
target below the vrr window it stays black. It does happen less in in-game =
3d
scenes I think, but that may be subjective. This happens all the time in
Witcher 2.
I've been on this for hours. I also tried advice from the following sites l=
ater
on:
<a href=3D"https://forum.manjaro.org/t/solved-setting-custom-resolution-for=
-second-monitor-via-xorg-conf/83693/18">https://forum.manjaro.org/t/solved-=
setting-custom-resolution-for-second-monitor-via-xorg-conf/83693/18</a>

<a href=3D"https://kodi.wiki/view/Creating_and_using_edid.bin_via_xorg.conf=
#Configure_xorg_to_read_custom_EDID_file">https://kodi.wiki/view/Creating_a=
nd_using_edid.bin_via_xorg.conf#Configure_xorg_to_read_custom_EDID_file</a>

I of course adjusted it for amdgpu purposes.

I've tried these settings in /usr/share/X11/xorg.conf.d/10-amdgpu.conf=20
according to those tutorials:

Section &quot;OutputClass&quot;
        Identifier &quot;AMDgpu&quot;
        MatchDriver &quot;amdgpu&quot;
        Driver &quot;amdgpu&quot;
EndSection
Section &quot;Device&quot;
    Identifier &quot;AMD&quot;
    Driver &quot;amdgpu&quot;
    Option  &quot;ConnectedMonitor&quot; &quot;DP-2&quot;
    Option  &quot;CustomEDID&quot; &quot;DP-2:/etc/X11/edid.bin&quot;
    Option  &quot;IgnoreEDID&quot; &quot;false&quot;
    Option  &quot;UseEDID&quot; &quot;true&quot;
    Option  &quot;VariableRefresh&quot; &quot;true&quot;
    Option  &quot;TearFree&quot; &quot;on&quot;
    Option  &quot;DRI&quot; &quot;3&quot;
#    Option &quot;AccelMethod&quot; &quot;glamor&quot;
EndSection</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604590511.2FFb4E.13166--

--===============0142377402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0142377402==--
