Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF181323B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 18:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715796E81D;
	Fri,  3 May 2019 16:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B55A6E81D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:32:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 77D197215A; Fri,  3 May 2019 16:32:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Fri, 03 May 2019 16:32:24 +0000
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
Message-ID: <bug-108893-502-1jPjxeLgPk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1760015640=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1760015640==
Content-Type: multipart/alternative; boundary="15569011441.fab45B7.4519"
Content-Transfer-Encoding: 7bit


--15569011441.fab45B7.4519
Date: Fri, 3 May 2019 16:32:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #10 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to supercoolemail from comment #9)
> Output of perf (if you want anything more, e.g. full perf.data or somethi=
ng,
> I'll deliver):

AFAIK perf.data generally won't be useful outside of your system.


> perf report --stdio
>     32.26%  Gothic2.exe      wined3d.dll.so            [.]
> wined3d_resource_map
>     20.34%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053=
c222

Can you redo this with debugging symbols available for radeonsi_dri.so?

BTW, just to be clear, make sure you only collect profiling data while the =
game
is showing the slow menu, not before or after.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569011441.fab45B7.4519
Date: Fri, 3 May 2019 16:32:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c10">Comme=
nt # 10</a>
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
108893#c9">comment #9</a>)
<span class=3D"quote">&gt; Output of perf (if you want anything more, e.g. =
full perf.data or something,
&gt; I'll deliver):</span >

AFAIK perf.data generally won't be useful outside of your system.


<span class=3D"quote">&gt; perf report --stdio
&gt;     32.26%  Gothic2.exe      wined3d.dll.so            [.]
&gt; wined3d_resource_map
&gt;     20.34%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000=
053c222</span >

Can you redo this with debugging symbols available for radeonsi_dri.so?

BTW, just to be clear, make sure you only collect profiling data while the =
game
is showing the slow menu, not before or after.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569011441.fab45B7.4519--

--===============1760015640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1760015640==--
