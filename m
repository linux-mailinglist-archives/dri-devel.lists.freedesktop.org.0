Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C0A4AD9
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 19:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35A89518;
	Sun,  1 Sep 2019 17:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC22A8932A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 17:24:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E642B721AA; Sun,  1 Sep 2019 17:24:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] RX 560x is very slow
Date: Sun, 01 Sep 2019 17:24:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111240-502-Algk4whpZo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111240-502@http.bugs.freedesktop.org/>
References: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0144785928=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0144785928==
Content-Type: multipart/alternative; boundary="15673586920.dcE3d.16085"
Content-Transfer-Encoding: 7bit


--15673586920.dcE3d.16085
Date: Sun, 1 Sep 2019 17:24:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

--- Comment #5 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On multi-core cpus, better use the performance cpu freq governor.
Some load profiles may be badly managed by the on-demand cpu freq governor.
Due to the load profile, some cores may not get enough load to be switched =
to
their highest frequencies (which is critical for realtime game performance).

I did notice significant fps loss with the on-demand cpu governor with some=
 of
my dota2 configurations running on a 8-cores 4.7GHz (FX9590).

This is a pb for lambda users who don't want to know anything about cpu freq
governors.

Multi-threaded games must be aware of the pb and warn the users about the
cpu governor settings (this is true on any OS).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673586920.dcE3d.16085
Date: Sun, 1 Sep 2019 17:24:52 +0000
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
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>On multi-core cpus, better use the performance cpu freq govern=
or.
Some load profiles may be badly managed by the on-demand cpu freq governor.
Due to the load profile, some cores may not get enough load to be switched =
to
their highest frequencies (which is critical for realtime game performance).

I did notice significant fps loss with the on-demand cpu governor with some=
 of
my dota2 configurations running on a 8-cores 4.7GHz (FX9590).

This is a pb for lambda users who don't want to know anything about cpu freq
governors.

Multi-threaded games must be aware of the pb and warn the users about the
cpu governor settings (this is true on any OS).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673586920.dcE3d.16085--

--===============0144785928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0144785928==--
