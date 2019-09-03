Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835FA67F7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625BB8908B;
	Tue,  3 Sep 2019 12:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03A458908B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 12:00:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EF05C72161; Tue,  3 Sep 2019 12:00:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Tue, 03 Sep 2019 12:00:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-SVcv1lQZew@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0642072039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0642072039==
Content-Type: multipart/alternative; boundary="15675120330.B81E7D41.29032"
Content-Transfer-Encoding: 7bit


--15675120330.B81E7D41.29032
Date: Tue, 3 Sep 2019 12:00:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #14 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
> > And sorry that I 'hijacked' this thread - should I open a new ticket?
>=20
> I don't think you need to open a bug for it at all. As its not a bug in M=
esa
> its a shader bug.
>=20

It's not a bug in Mesa but if adopting the same behavior than other drivers=
 is
cheap performance-wise I think we should consider it.

For instance, adding a prolog to PS that always initializes v0, v1, v2 to 0
could do the trick... maybe there are other/better ways though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675120330.B81E7D41.29032
Date: Tue, 3 Sep 2019 12:00:33 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; &gt; And sorry that I 'hijacked' th=
is thread - should I open a new ticket?
&gt;=20
&gt; I don't think you need to open a bug for it at all. As its not a bug i=
n Mesa
&gt; its a shader bug.
&gt; </span >

It's not a bug in Mesa but if adopting the same behavior than other drivers=
 is
cheap performance-wise I think we should consider it.

For instance, adding a prolog to PS that always initializes v0, v1, v2 to 0
could do the trick... maybe there are other/better ways though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675120330.B81E7D41.29032--

--===============0642072039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0642072039==--
