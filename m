Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85542146B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0FD897AC;
	Mon,  6 May 2019 08:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CC9C897AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:47:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 266A87215A; Mon,  6 May 2019 08:47:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Mon, 06 May 2019 08:47:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-OsNUCm67SL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0909743027=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0909743027==
Content-Type: multipart/alternative; boundary="15571324471.BAAB3ecc.20301"
Content-Transfer-Encoding: 7bit


--15571324471.BAAB3ecc.20301
Date: Mon, 6 May 2019 08:47:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #16 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to supercoolemail from comment #11)
>     42.80%  Gothic2.exe     radeonsi_dri.so         [.]
> _mesa_unpack_depth_span

It would be interesting to know where _mesa_unpack_depth_span is getting ca=
lled
from. Can you enable call graphs for the perf data gathering and reporting?=
 (It
might be easier to use sysprof and attach the profile data saved from that)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571324471.BAAB3ecc.20301
Date: Mon, 6 May 2019 08:47:27 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to supercoolemail from <a href=3D"show_bug.cgi?id=3D=
108893#c11">comment #11</a>)
<span class=3D"quote">&gt;     42.80%  Gothic2.exe     radeonsi_dri.so     =
    [.]
&gt; _mesa_unpack_depth_span</span >

It would be interesting to know where _mesa_unpack_depth_span is getting ca=
lled
from. Can you enable call graphs for the perf data gathering and reporting?=
 (It
might be easier to use sysprof and attach the profile data saved from that)=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571324471.BAAB3ecc.20301--

--===============0909743027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0909743027==--
