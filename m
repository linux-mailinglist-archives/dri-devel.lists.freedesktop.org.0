Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FB44FBE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 01:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576CF892A5;
	Thu, 13 Jun 2019 23:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5A890C2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 23:02:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 24AAD72167; Thu, 13 Jun 2019 23:02:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110856] Freesync causes in-game blackscreens when game has low
 fps.
Date: Thu, 13 Jun 2019 23:02:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: rropid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110856-502-wMzlPMsHW6@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1940246980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1940246980==
Content-Type: multipart/alternative; boundary="15604669270.0B4c7Ad.22284"
Content-Transfer-Encoding: 7bit


--15604669270.0B4c7Ad.22284
Date: Thu, 13 Jun 2019 23:02:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110856

--- Comment #10 from Ropid <rropid@gmail.com> ---
Those Xorg config options you tried to use do not exist on the
xf86-video-amdgpu driver (I mean "CustomEDID" etc.). Those EDID options you
used are unique Nvidia driver config options and do not exist in any other
driver.

If you are intersted, you can find a list about possible Xorg options for
amdgpu by running "man 4 amdgpu", and then there's more general stuff
documented in "man xorg.conf". There is sadly nothing about EDID anywhere.

For the open drivers that use kernel-mode-setting, you need to tell the dri=
ver
about your EDID file on the kernel command line. That's the only way to do =
it.

In the /etc/mkinitcpio.conf file you shared, you made a mistake on the
"MODULES=3D..." line. You need to remove that "drm_kms_helper..." text from=
 that
line. That text you added there has to go onto the kernel command line, not
into mkinitcpio.conf.

The only thing you have to do in /etc/mkinitcpio.conf is what you already d=
id
on the "FILES=3D..." line.

About that "drm_kms_helper..." kernel command line parameter, where you hav=
e to
add it is your boot loader's configuration file. I don't know how that work=
s on
Manjaro.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604669270.0B4c7Ad.22284
Date: Thu, 13 Jun 2019 23:02:07 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856">bug 11085=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rropid&#64;gmail.com" title=3D"Ropid &lt;rropid&#64;gmail.com&gt;"> <span c=
lass=3D"fn">Ropid</span></a>
</span></b>
        <pre>Those Xorg config options you tried to use do not exist on the
xf86-video-amdgpu driver (I mean &quot;CustomEDID&quot; etc.). Those EDID o=
ptions you
used are unique Nvidia driver config options and do not exist in any other
driver.

If you are intersted, you can find a list about possible Xorg options for
amdgpu by running &quot;man 4 amdgpu&quot;, and then there's more general s=
tuff
documented in &quot;man xorg.conf&quot;. There is sadly nothing about EDID =
anywhere.

For the open drivers that use kernel-mode-setting, you need to tell the dri=
ver
about your EDID file on the kernel command line. That's the only way to do =
it.

In the /etc/mkinitcpio.conf file you shared, you made a mistake on the
&quot;MODULES=3D...&quot; line. You need to remove that &quot;drm_kms_helpe=
r...&quot; text from that
line. That text you added there has to go onto the kernel command line, not
into mkinitcpio.conf.

The only thing you have to do in /etc/mkinitcpio.conf is what you already d=
id
on the &quot;FILES=3D...&quot; line.

About that &quot;drm_kms_helper...&quot; kernel command line parameter, whe=
re you have to
add it is your boot loader's configuration file. I don't know how that work=
s on
Manjaro.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604669270.0B4c7Ad.22284--

--===============1940246980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1940246980==--
