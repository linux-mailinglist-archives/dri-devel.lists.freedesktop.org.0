Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB2196C84
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 00:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B126898C2;
	Tue, 20 Aug 2019 22:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6701C6E8A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 22:44:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6367472161; Tue, 20 Aug 2019 22:44:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Tue, 20 Aug 2019 22:44:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111414-502-JRhiROuBd6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111414-502@http.bugs.freedesktop.org/>
References: <bug-111414-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0794637148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0794637148==
Content-Type: multipart/alternative; boundary="15663410881.6821.12072"
Content-Transfer-Encoding: 7bit


--15663410881.6821.12072
Date: Tue, 20 Aug 2019 22:44:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

--- Comment #5 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
Hello Edmondo,

thank you for your comment.

Now, I get this:

mpv -hwdec /data/Filme/test.mkv
Playing: /data/Filme/test.mkv
 (+) Video --vid=3D1 (*) 'OceanWorld.2D.2009.BluRay.1080p.AC3.x264-CHD' (h2=
64
1920x1080 24.000fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) 'AC3 5.1 channels, 640kbps' (ac3 6ch
48000Hz)
File tags:
 Title: =E6=B7=B1=E6=B5=B7=E6=8E=A2=E5=A5=87 2D
ATTENTION: default value of option mesa_glthread overridden by environment.
ATTENTION: option value of option mesa_glthread ignored.
ATTENTION: default value of option mesa_glthread overridden by environment.
ATTENTION: option value of option mesa_glthread ignored.
mesa: for the   --simplifycfg-sink-common option: may only occur zero or one
times!
mesa: for the   --global-isel-abort option: may only occur zero or one time=
s!
mpv: ../src/gallium/state_trackers/vdpau/vdpau_private.h:138:
FormatYCBCRToPipe: Assertion `0' failed.
Abbruch (core dumped)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663410881.6821.12072
Date: Tue, 20 Aug 2019 22:44:48 +0000
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
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">bug 11141=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>Hello Edmondo,

thank you for your comment.

Now, I get this:

mpv -hwdec /data/Filme/test.mkv
Playing: /data/Filme/test.mkv
 (+) Video --vid=3D1 (*) 'OceanWorld.2D.2009.BluRay.1080p.AC3.x264-CHD' (h2=
64
1920x1080 24.000fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) 'AC3 5.1 channels, 640kbps' (ac3 6ch
48000Hz)
File tags:
 Title: =E6=B7=B1=E6=B5=B7=E6=8E=A2=E5=A5=87 2D
ATTENTION: default value of option mesa_glthread overridden by environment.
ATTENTION: option value of option mesa_glthread ignored.
ATTENTION: default value of option mesa_glthread overridden by environment.
ATTENTION: option value of option mesa_glthread ignored.
mesa: for the   --simplifycfg-sink-common option: may only occur zero or one
times!
mesa: for the   --global-isel-abort option: may only occur zero or one time=
s!
mpv: ../src/gallium/state_trackers/vdpau/vdpau_private.h:138:
FormatYCBCRToPipe: Assertion `0' failed.
Abbruch (core dumped)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663410881.6821.12072--

--===============0794637148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0794637148==--
