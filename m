Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CE385E6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 10:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAF889791;
	Fri,  7 Jun 2019 08:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8841897BC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 08:05:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D595B72167; Fri,  7 Jun 2019 08:05:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Fri, 07 Jun 2019 08:05:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rsalvaterra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-ufPtzFHFW7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1744974756=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1744974756==
Content-Type: multipart/alternative; boundary="15598947412.fb55E4.13294"
Content-Transfer-Encoding: 7bit


--15598947412.fb55E4.13294
Date: Fri, 7 Jun 2019 08:05:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #47 from Rui Salvaterra <rsalvaterra@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #45)
> Yeah that looks good.

Great! In that case, I'm going to do a proper version and send it. I don't =
like
the fact that I'm doing chip_families[r300screen->caps.family] directly in
r300_disk_cache_create, when we already have r300_get_name(struct pipe_scre=
en*
pscreen), so I'm going to factor that out to something like
r300_get_family_name(struct r300_screen* r300screen).
Thanks for the review, Marek!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15598947412.fb55E4.13294
Date: Fri, 7 Jun 2019 08:05:41 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c47">Comme=
nt # 47</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D110781#c45">comment #45</a>)
<span class=3D"quote">&gt; Yeah that looks good.</span >

Great! In that case, I'm going to do a proper version and send it. I don't =
like
the fact that I'm doing chip_families[r300screen-&gt;caps.family] directly =
in
r300_disk_cache_create, when we already have r300_get_name(struct pipe_scre=
en*
pscreen), so I'm going to factor that out to something like
r300_get_family_name(struct r300_screen* r300screen).
Thanks for the review, Marek!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15598947412.fb55E4.13294--

--===============1744974756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1744974756==--
