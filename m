Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1C4702C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 15:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37750892FA;
	Sat, 15 Jun 2019 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB86B892FA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 13:27:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D80D672167; Sat, 15 Jun 2019 13:27:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sat, 15 Jun 2019 13:27:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-9M7WzvbMal@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0209955277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0209955277==
Content-Type: multipart/alternative; boundary="15606052311.B75Ae5.29294"
Content-Transfer-Encoding: 7bit


--15606052311.B75Ae5.29294
Date: Sat, 15 Jun 2019 13:27:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #46 from Richard Thier <u9vata@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #45)
> The problem might be in the kernel. See function rs400_gpu_init. I think =
it
> should call r300_gpu_init instead of r420_pipes_init.

I will put some logging there to be sure because as I see the codebase on t=
he
mesa side I got the feeling that "rs400" is basically r420+ and even RC410 =
and
such belong to r300 so if this is consistent and good, then the kernel code
there can be too. Except if it is really called on my machine as then that
might be really-really a mistake then.

I will look at it later. Still testing a bit first if this way everything w=
orks
properly - also I have less time because there is good weather to work on w=
ine
field and later there will be rainy weather to work endlessly on these. ;-)

> RC410 most likely has only 1 pipe.
> 3 pipes would be for a discrete GPU that isn't small.

Thanks for this guess! I really had no experience to even guess this.
Everything points in this direction though so I think this is the case.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606052311.B75Ae5.29294
Date: Sat, 15 Jun 2019 13:27:11 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c46">Comme=
nt # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D110897#c45">comment #45</a>)
<span class=3D"quote">&gt; The problem might be in the kernel. See function=
 rs400_gpu_init. I think it
&gt; should call r300_gpu_init instead of r420_pipes_init.</span >

I will put some logging there to be sure because as I see the codebase on t=
he
mesa side I got the feeling that &quot;rs400&quot; is basically r420+ and e=
ven RC410 and
such belong to r300 so if this is consistent and good, then the kernel code
there can be too. Except if it is really called on my machine as then that
might be really-really a mistake then.

I will look at it later. Still testing a bit first if this way everything w=
orks
properly - also I have less time because there is good weather to work on w=
ine
field and later there will be rainy weather to work endlessly on these. ;-)

<span class=3D"quote">&gt; RC410 most likely has only 1 pipe.
&gt; 3 pipes would be for a discrete GPU that isn't small.</span >

Thanks for this guess! I really had no experience to even guess this.
Everything points in this direction though so I think this is the case.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606052311.B75Ae5.29294--

--===============0209955277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0209955277==--
