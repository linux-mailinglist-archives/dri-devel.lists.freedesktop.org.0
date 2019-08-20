Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF596B3F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 23:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697AC6E891;
	Tue, 20 Aug 2019 21:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 990836E891
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 21:17:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 94DE872161; Tue, 20 Aug 2019 21:17:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Tue, 20 Aug 2019 21:17:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edmondo.tommasina@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111414-502-rBKBUzyZJD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0312685999=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0312685999==
Content-Type: multipart/alternative; boundary="15663358341.FD4Ab7Ec.29805"
Content-Transfer-Encoding: 7bit


--15663358341.FD4Ab7Ec.29805
Date: Tue, 20 Aug 2019 21:17:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

--- Comment #4 from Edmondo Tommasina <edmondo.tommasina@gmail.com> ---
@Dieter: I cannot reproduce your issue with mpv and Marek's patch applied. =
It
looks good.

$ mpv -hwdec mytest.mkv=20
Playing: mytest.mkv
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
     Subs  --sid=3D1 --slang=3Deng (subrip)
File tags:
 Title: mytest
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [gpu] 1280x720 vdpau[yuv420p]
AV: 00:00:32 / 00:42:26 (1%) A-V:  0.000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663358341.FD4Ab7Ec.29805
Date: Tue, 20 Aug 2019 21:17:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">bug 11141=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
edmondo.tommasina&#64;gmail.com" title=3D"Edmondo Tommasina &lt;edmondo.tom=
masina&#64;gmail.com&gt;"> <span class=3D"fn">Edmondo Tommasina</span></a>
</span></b>
        <pre>&#64;Dieter: I cannot reproduce your issue with mpv and Marek'=
s patch applied. It
looks good.

$ mpv -hwdec mytest.mkv=20
Playing: mytest.mkv
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
     Subs  --sid=3D1 --slang=3Deng (subrip)
File tags:
 Title: mytest
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [gpu] 1280x720 vdpau[yuv420p]
AV: 00:00:32 / 00:42:26 (1%) A-V:  0.000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663358341.FD4Ab7Ec.29805--

--===============0312685999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0312685999==--
