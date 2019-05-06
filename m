Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9F1567E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 01:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED1D89C1C;
	Mon,  6 May 2019 23:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3CE889BF8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 23:43:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DE8FD7215A; Mon,  6 May 2019 23:43:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 100239] Incorrect rendering in CS:GO
Date: Mon, 06 May 2019 23:43:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-100239-502-U6fCpgkrcC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100239-502@http.bugs.freedesktop.org/>
References: <bug-100239-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0144529699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0144529699==
Content-Type: multipart/alternative; boundary="15571862231.f130bcC.30578"
Content-Transfer-Encoding: 7bit


--15571862231.f130bcC.30578
Date: Mon, 6 May 2019 23:43:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100239

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #22 from Timothy Arceri <t_arceri@yahoo.com.au> ---
Should be fixed by:

commit 49025292fbbf285d4473d2c20a83b6c533a79d45
Author: Timothy Arceri <tarceri@itsqueeze.com>
Date:   Mon May 6 14:39:44 2019 +1000

    radeonsi: add config entry for Counter-Strike Global Offensive

    This fixes rendering issues with gun scopes which is rather
    important.

    Cc: "19.0" "19.1" <mesa-stable@lists.freedesktop.org>
    Acked-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D100239

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571862231.f130bcC.30578
Date: Mon, 6 May 2019 23:43:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239">bug 10023=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239">bug 10023=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>Should be fixed by:

commit 49025292fbbf285d4473d2c20a83b6c533a79d45
Author: Timothy Arceri &lt;<a href=3D"mailto:tarceri&#64;itsqueeze.com">tar=
ceri&#64;itsqueeze.com</a>&gt;
Date:   Mon May 6 14:39:44 2019 +1000

    radeonsi: add config entry for Counter-Strike Global Offensive

    This fixes rendering issues with gun scopes which is rather
    important.

    Cc: &quot;19.0&quot; &quot;19.1&quot; &lt;<a href=3D"mailto:mesa-stable=
&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;
    Acked-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas&#64;basnieuwenhui=
zen.nl">bas&#64;basnieuwenhuizen.nl</a>&gt;
    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Incorrect rendering in CS:GO"
   href=3D"show_bug.cgi?id=3D100239">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100239</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571862231.f130bcC.30578--

--===============0144529699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0144529699==--
