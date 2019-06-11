Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC13D44A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F0188E53;
	Tue, 11 Jun 2019 17:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFEBC891D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:33:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DC5AF72167; Tue, 11 Jun 2019 17:33:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 11 Jun 2019 17:33:50 +0000
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
Message-ID: <bug-110781-502-04bgKHimHu@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0114952237=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0114952237==
Content-Type: multipart/alternative; boundary="15602744303.40fCd.7506"
Content-Transfer-Encoding: 7bit


--15602744303.40fCd.7506
Date: Tue, 11 Jun 2019 17:33:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #65 from Rui Salvaterra <rsalvaterra@gmail.com> ---
(In reply to Richard Thier from comment #64)
> Rui!
>=20
> Btw I am also running your patch already too and did not see much problems
> so far, but many of the stuff I am running was DX7 and DX8 level in graph=
ics
> settings so I do not know how many times I actually tried your code
> literally, but it is built into my mesa too.

Good to know! It worked fine here, too.

> Also Mount&Blade is working well too now! It was misconfigured in the new
> wine to have CSMT and that was =C3=BCber-slow on my single core machine l=
eading
> to starvation and a lot of overhead that was even visible in the perf out=
put.
>=20
> So far everything works at full speed now!

Great!

> I am thinking about maybe trying to figure out HyperZ on r300. According =
to
> the feature matrix it is untested and I see bad glitches but elevated
> performance. I already made some changes to try it...
>=20
> But if I continue with hyperZ stuff likely it will be another bug report,
> just for sake of transparency about knowing this one is pretty much seems
> solved completely...

Yes, I think it's a good idea to open a new bug.
By the way, I have a vague memory of HiZ on the R4xx being exclusive (i.e.,
only the first app to use the Z-buffer gets HiZ), but I could be completely
wrong.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602744303.40fCd.7506
Date: Tue, 11 Jun 2019 17:33:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c65">Comme=
nt # 65</a>
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
        <pre>(In reply to Richard Thier from <a href=3D"show_bug.cgi?id=3D1=
10781#c64">comment #64</a>)
<span class=3D"quote">&gt; Rui!
&gt;=20
&gt; Btw I am also running your patch already too and did not see much prob=
lems
&gt; so far, but many of the stuff I am running was DX7 and DX8 level in gr=
aphics
&gt; settings so I do not know how many times I actually tried your code
&gt; literally, but it is built into my mesa too.</span >

Good to know! It worked fine here, too.

<span class=3D"quote">&gt; Also Mount&amp;Blade is working well too now! It=
 was misconfigured in the new
&gt; wine to have CSMT and that was =C3=BCber-slow on my single core machin=
e leading
&gt; to starvation and a lot of overhead that was even visible in the perf =
output.
&gt;=20
&gt; So far everything works at full speed now!</span >

Great!

<span class=3D"quote">&gt; I am thinking about maybe trying to figure out H=
yperZ on r300. According to
&gt; the feature matrix it is untested and I see bad glitches but elevated
&gt; performance. I already made some changes to try it...
&gt;=20
&gt; But if I continue with hyperZ stuff likely it will be another bug repo=
rt,
&gt; just for sake of transparency about knowing this one is pretty much se=
ems
&gt; solved completely...</span >

Yes, I think it's a good idea to open a new bug.
By the way, I have a vague memory of HiZ on the R4xx being exclusive (i.e.,
only the first app to use the Z-buffer gets HiZ), but I could be completely
wrong.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602744303.40fCd.7506--

--===============0114952237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0114952237==--
