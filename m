Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D639B41AE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 22:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AA06EA78;
	Mon, 16 Sep 2019 20:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D04E6EA78
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 20:20:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 01B7072167; Mon, 16 Sep 2019 20:20:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111691] hardware cursor corruption w/ AMD 5700 XT
Date: Mon, 16 Sep 2019 20:20:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: felix.schwarz@oss.schwarz.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111691-502-HD34NNeHlm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111691-502@http.bugs.freedesktop.org/>
References: <bug-111691-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0734572843=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0734572843==
Content-Type: multipart/alternative; boundary="15686652310.5E07e5b.26592"
Content-Transfer-Encoding: 7bit


--15686652310.5E07e5b.26592
Date: Mon, 16 Sep 2019 20:20:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111691

--- Comment #7 from Felix Schwarz <felix.schwarz@oss.schwarz.eu> ---
>> If this is a regression, can you bisect?
> do not know how to answer your question, this is my first bug report.

Regression: Was the bug always present (as far as you know) or did it work =
in
the past?

If it worked previously you can do a "git bisection" to find the problematic
change. This increases the likelihood that AMD's driver developers can buil=
d a
fix quickly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686652310.5E07e5b.26592
Date: Mon, 16 Sep 2019 20:20:31 +0000
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
   title=3D"NEW - hardware cursor corruption w/ AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - hardware cursor corruption w/ AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691">bug 11169=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
felix.schwarz&#64;oss.schwarz.eu" title=3D"Felix Schwarz &lt;felix.schwarz&=
#64;oss.schwarz.eu&gt;"> <span class=3D"fn">Felix Schwarz</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;&gt; If this is a regression, can yo=
u bisect?
&gt; do not know how to answer your question, this is my first bug report.<=
/span >

Regression: Was the bug always present (as far as you know) or did it work =
in
the past?

If it worked previously you can do a &quot;git bisection&quot; to find the =
problematic
change. This increases the likelihood that AMD's driver developers can buil=
d a
fix quickly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686652310.5E07e5b.26592--

--===============0734572843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0734572843==--
