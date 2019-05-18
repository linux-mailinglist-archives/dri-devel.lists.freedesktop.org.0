Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53022369
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 13:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6924C896E9;
	Sat, 18 May 2019 11:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1B7989700
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 11:43:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CEB6472167; Sat, 18 May 2019 11:43:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Sat, 18 May 2019 11:43:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stalkerg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110701-502-LidbeRsgxn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110701-502@http.bugs.freedesktop.org/>
References: <bug-110701-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1125390380=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1125390380==
Content-Type: multipart/alternative; boundary="15581797962.c9CC51B.20805"
Content-Transfer-Encoding: 7bit


--15581797962.c9CC51B.20805
Date: Sat, 18 May 2019 11:43:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

--- Comment #6 from Yury Zhuravlev <stalkerg@gmail.com> ---
Ok, currently I know bug somewhere in this 3 commits
f3ae455eb08e8d718b828eb42f2529437916179b radeonsi: compute culling - flush =
CS
to remove write references to buffers
0f1b070bad34c46c4bcc6c679fa533bf6b4b79e5 radeonsi: remove old_va parameter =
from
si_rebind_buffer by remembering offsets
78e35df52aa2f7d770f929a0866a0faa89c261a9 radeonsi: update buffer descriptor=
s in
all contexts after buffer invalidation

I will test more. Looks like some commit after current makes this bug more
reproducible. Before it also exists but not so often.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15581797962.c9CC51B.20805
Date: Sat, 18 May 2019 11:43:16 +0000
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
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stalkerg&#64;gmail.com" title=3D"Yury Zhuravlev &lt;stalkerg&#64;gmail.com&=
gt;"> <span class=3D"fn">Yury Zhuravlev</span></a>
</span></b>
        <pre>Ok, currently I know bug somewhere in this 3 commits
f3ae455eb08e8d718b828eb42f2529437916179b radeonsi: compute culling - flush =
CS
to remove write references to buffers
0f1b070bad34c46c4bcc6c679fa533bf6b4b79e5 radeonsi: remove old_va parameter =
from
si_rebind_buffer by remembering offsets
78e35df52aa2f7d770f929a0866a0faa89c261a9 radeonsi: update buffer descriptor=
s in
all contexts after buffer invalidation

I will test more. Looks like some commit after current makes this bug more
reproducible. Before it also exists but not so often.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15581797962.c9CC51B.20805--

--===============1125390380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1125390380==--
