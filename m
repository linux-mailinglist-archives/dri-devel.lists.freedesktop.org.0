Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F99F13C9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C256ECB5;
	Wed,  6 Nov 2019 10:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9DD86ECBA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:23:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B72BD720E2; Wed,  6 Nov 2019 10:23:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 06 Nov 2019 10:23:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haro41@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109955-502-yz981WlmBI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0933960504=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0933960504==
Content-Type: multipart/alternative; boundary="157303581911.bB185.9526"
Content-Transfer-Encoding: 7bit


--157303581911.bB185.9526
Date: Wed, 6 Nov 2019 10:23:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #128 from haro41@gmx.de ---
Created attachment 145901
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145901&action=3Dedit
proposed fix for crashes, caused by frequent mclk level 0/1 switches

At least one of the causes for crashes, are more frequently, if vsync is
enabled.=20

In this case, memory clock levels are switched usually more frequently.
By experiments i found, that especially the transient betweeen level 1 and
level 0 is critical. The fact, that disabling memory level 0, helps as a
workaround, confirms: this approach points in the right direction.

Result of further experiments:
By sending a 'PPSMC_MSG_SetUclkDownHyst' message to smc (enabling a hystere=
se
feature ?), the crashes can be avoided, even with enabled mclk level 0 and
vsync activated.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157303581911.bB185.9526
Date: Wed, 6 Nov 2019 10:23:39 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c128">Comm=
ent # 128</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haro41&#64;gmx.de" title=3D"haro41&#64;gmx.de">haro41&#64;gmx.de</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145901=
" name=3D"attach_145901" title=3D"proposed fix for crashes, caused by frequ=
ent mclk level 0/1 switches">attachment 145901</a> <a href=3D"attachment.cg=
i?id=3D145901&amp;action=3Dedit" title=3D"proposed fix for crashes, caused =
by frequent mclk level 0/1 switches">[details]</a></span> <a href=3D'page.c=
gi?id=3Dsplinter.html&amp;bug=3D109955&amp;attachment=3D145901'>[review]</a>
proposed fix for crashes, caused by frequent mclk level 0/1 switches

At least one of the causes for crashes, are more frequently, if vsync is
enabled.=20

In this case, memory clock levels are switched usually more frequently.
By experiments i found, that especially the transient betweeen level 1 and
level 0 is critical. The fact, that disabling memory level 0, helps as a
workaround, confirms: this approach points in the right direction.

Result of further experiments:
By sending a 'PPSMC_MSG_SetUclkDownHyst' message to smc (enabling a hystere=
se
feature ?), the crashes can be avoided, even with enabled mclk level 0 and
vsync activated.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157303581911.bB185.9526--

--===============0933960504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0933960504==--
