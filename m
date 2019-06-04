Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C333EF9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 08:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC3C89126;
	Tue,  4 Jun 2019 06:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9972089126
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 06:29:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8F6E472167; Tue,  4 Jun 2019 06:29:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Tue, 04 Jun 2019 06:29:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-Or9Ateca54@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1103087450=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1103087450==
Content-Type: multipart/alternative; boundary="15596297670.1F8c8d.31439"
Content-Transfer-Encoding: 7bit


--15596297670.1F8c8d.31439
Date: Tue, 4 Jun 2019 06:29:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #3 from Gobinda Joy <gobinda.joy@gmail.com> ---
Thanks for the reply.

By today's standard my whole system spec is slow to be honest.

But slow ram speed shouldn't cause this problems with powerplay. As I can r=
un
the card fine with load or idle with kernel version 5.0.17. It seems to me =
the
new commits from AMD for kernel version 5.1 is to blame. But I can't say for
certain.

Interestingly enough if I use amdgpu.dpm=3D0 to disable dynamic power manag=
ement
kernel version up to 5.1.6 works just fine except crappy performance when u=
nder
graphics load.

I was curious so checked out the commit log on amd-staging-drm-next branch.=
 And
I see some reverts of powerplay related commits.

Link: https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-drm-ne=
xt

I am currently waiting for this to getting merged with master branch.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596297670.1F8c8d.31439
Date: Tue, 4 Jun 2019 06:29:27 +0000
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
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>Thanks for the reply.

By today's standard my whole system spec is slow to be honest.

But slow ram speed shouldn't cause this problems with powerplay. As I can r=
un
the card fine with load or idle with kernel version 5.0.17. It seems to me =
the
new commits from AMD for kernel version 5.1 is to blame. But I can't say for
certain.

Interestingly enough if I use amdgpu.dpm=3D0 to disable dynamic power manag=
ement
kernel version up to 5.1.6 works just fine except crappy performance when u=
nder
graphics load.

I was curious so checked out the commit log on amd-staging-drm-next branch.=
 And
I see some reverts of powerplay related commits.

Link: <a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-sta=
ging-drm-next">https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-stagi=
ng-drm-next</a>

I am currently waiting for this to getting merged with master branch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596297670.1F8c8d.31439--

--===============1103087450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1103087450==--
