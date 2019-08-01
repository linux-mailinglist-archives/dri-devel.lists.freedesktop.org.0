Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C77DD88
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 16:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFB46E637;
	Thu,  1 Aug 2019 14:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 803046E63B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 14:13:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7BB5172167; Thu,  1 Aug 2019 14:13:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104602] [apitrace] Graphical artifacts in Civilization VI on RX
 Vega
Date: Thu, 01 Aug 2019 14:13:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@jasonplayne.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-104602-502-GkXyIbsLlg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104602-502@http.bugs.freedesktop.org/>
References: <bug-104602-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0619509286=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0619509286==
Content-Type: multipart/alternative; boundary="15646687992.E770aC7.6572"
Content-Transfer-Encoding: 7bit


--15646687992.E770aC7.6572
Date: Thu, 1 Aug 2019 14:13:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104602

--- Comment #21 from Jason Playne <jason@jasonplayne.com> ---
(In reply to Connor Abbott from comment #20)
> I wanted to make sure that improving the NIR path to reach parity with TG=
SI
> in local variable handling wouldn't break things, so I investigated this a
> bit more. It seems this is triggered by the fact that on Vega the TGSI pa=
th
> always uses scratch, even for smaller local arrays. This bloats the scrat=
ch
> space used by the VS in question. There are three back-to-back draw calls
> with this VS (used to build up the map), each using scratch, and it seems
> that radeonsi doesn't properly wait for each call to be done before start=
ing
> the next and reuses the same scratch buffer, resulting in the threads from
> one draw call overwriting the scratch of the previous call. Hacking
> si_update_spi_tmpring_size() to always allocate a new scratch buffer "fix=
es"
> the black triangles.

Thanks heaps for looking into the issue Conner. Looking at the explanation =
on
what was happening makes it sound simple - I am sure the debugging effort w=
as
far greater!

<3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646687992.E770aC7.6572
Date: Thu, 1 Aug 2019 14:13:19 +0000
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
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602">bug 10460=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jason&#64;jasonplayne.com" title=3D"Jason Playne &lt;jason&#64;jasonplayne.=
com&gt;"> <span class=3D"fn">Jason Playne</span></a>
</span></b>
        <pre>(In reply to Connor Abbott from <a href=3D"show_bug.cgi?id=3D1=
04602#c20">comment #20</a>)
<span class=3D"quote">&gt; I wanted to make sure that improving the NIR pat=
h to reach parity with TGSI
&gt; in local variable handling wouldn't break things, so I investigated th=
is a
&gt; bit more. It seems this is triggered by the fact that on Vega the TGSI=
 path
&gt; always uses scratch, even for smaller local arrays. This bloats the sc=
ratch
&gt; space used by the VS in question. There are three back-to-back draw ca=
lls
&gt; with this VS (used to build up the map), each using scratch, and it se=
ems
&gt; that radeonsi doesn't properly wait for each call to be done before st=
arting
&gt; the next and reuses the same scratch buffer, resulting in the threads =
from
&gt; one draw call overwriting the scratch of the previous call. Hacking
&gt; si_update_spi_tmpring_size() to always allocate a new scratch buffer &=
quot;fixes&quot;
&gt; the black triangles.</span >

Thanks heaps for looking into the issue Conner. Looking at the explanation =
on
what was happening makes it sound simple - I am sure the debugging effort w=
as
far greater!

&lt;3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646687992.E770aC7.6572--

--===============0619509286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0619509286==--
