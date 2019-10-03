Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9360CAE02
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 20:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134ED6EA41;
	Thu,  3 Oct 2019 18:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B0D66EA3E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 18:19:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7427072162; Thu,  3 Oct 2019 18:19:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111729] RX480 : random NULL pointer dereference on resume from
 suspend
Date: Thu, 03 Oct 2019 18:19:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: nmset@netcourrier.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111729-502-hIdeCDAWHZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111729-502@http.bugs.freedesktop.org/>
References: <bug-111729-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0900584779=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0900584779==
Content-Type: multipart/alternative; boundary="15701267410.DE9AC.30158"
Content-Transfer-Encoding: 7bit


--15701267410.DE9AC.30158
Date: Thu, 3 Oct 2019 18:19:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111729

--- Comment #5 from SET <nmset@netcourrier.com> ---
(In reply to Alex Deucher from comment #4)
> Can you bisect?

Bisecting would be of great help. I doubt it's feasible in practice. The bug
happens after an undetermined number of syspend/resume cycles. It would take
weeks or months to isolate the searched patch. By that time, it may well be=
come
invalid due to other changes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701267410.DE9AC.30158
Date: Thu, 3 Oct 2019 18:19:01 +0000
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
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729">bug 11172=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nmset&#64;netcourrier.com" title=3D"SET &lt;nmset&#64;netcourrier.com&gt;">=
 <span class=3D"fn">SET</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
1729#c4">comment #4</a>)
<span class=3D"quote">&gt; Can you bisect?</span >

Bisecting would be of great help. I doubt it's feasible in practice. The bug
happens after an undetermined number of syspend/resume cycles. It would take
weeks or months to isolate the searched patch. By that time, it may well be=
come
invalid due to other changes.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701267410.DE9AC.30158--

--===============0900584779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0900584779==--
