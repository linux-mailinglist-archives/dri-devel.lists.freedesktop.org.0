Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D435009
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 20:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915289BB0;
	Tue,  4 Jun 2019 18:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95A7E89BB0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 18:54:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8E19F72167; Tue,  4 Jun 2019 18:54:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Tue, 04 Jun 2019 18:54:21 +0000
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
Message-ID: <bug-110822-502-a4EbkLvM3W@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0481135037=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0481135037==
Content-Type: multipart/alternative; boundary="15596744611.aecf7D3.17534"
Content-Transfer-Encoding: 7bit


--15596744611.aecf7D3.17534
Date: Tue, 4 Jun 2019 18:54:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #7 from Gobinda Joy <gobinda.joy@gmail.com> ---
(In reply to Sylvain BERTRAND from comment #6)
> bisect is quite common in the git world. You'll find tons of tutorials on=
 the
> web, namely you're good for a little bit of reading.
> Just don't forget to "git reset --hard" before calling "git bisect good|b=
ad".
> (just performed a bisection on linux yesterday).

Figured out how to bisect but the problem is building the rpm packages to
install in my fedora system. As the guide they put out in wiki is almost 6
years old and the python script for building the kernel/modules rpm doesn't
work.

However I found the pre-built kernel packages at
https://koji.fedoraproject.org/koji/packageinfo?buildStart=3D0&packageID=3D=
8&buildOrder=3D-completion_time&tagOrder=3Dname&tagStart=3D50#buildlist

I've tested the kernels from there. It seems they used the snapshot from
mainline tree.

I started from the working version 5.0.0 and tested all the kernels until t=
he
problem occurred at version 5.1.0-0.rc3.git3.1.fc31.x86_64

I can bisect the kernel at that tag but can't build the rpm packages, have =
to
research further I guess.

Attached the logs from the problematic version and the immediate earlier
working version.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596744611.aecf7D3.17534
Date: Tue, 4 Jun 2019 18:54:21 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c7">Commen=
t # 7</a>
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
        <pre>(In reply to Sylvain BERTRAND from <a href=3D"show_bug.cgi?id=
=3D110822#c6">comment #6</a>)
<span class=3D"quote">&gt; bisect is quite common in the git world. You'll =
find tons of tutorials on the
&gt; web, namely you're good for a little bit of reading.
&gt; Just don't forget to &quot;git reset --hard&quot; before calling &quot=
;git bisect good|bad&quot;.
&gt; (just performed a bisection on linux yesterday).</span >

Figured out how to bisect but the problem is building the rpm packages to
install in my fedora system. As the guide they put out in wiki is almost 6
years old and the python script for building the kernel/modules rpm doesn't
work.

However I found the pre-built kernel packages at
<a href=3D"https://koji.fedoraproject.org/koji/packageinfo?buildStart=3D0&a=
mp;packageID=3D8&amp;buildOrder=3D-completion_time&amp;tagOrder=3Dname&amp;=
tagStart=3D50#buildlist">https://koji.fedoraproject.org/koji/packageinfo?bu=
ildStart=3D0&amp;packageID=3D8&amp;buildOrder=3D-completion_time&amp;tagOrd=
er=3Dname&amp;tagStart=3D50#buildlist</a>

I've tested the kernels from there. It seems they used the snapshot from
mainline tree.

I started from the working version 5.0.0 and tested all the kernels until t=
he
problem occurred at version 5.1.0-0.rc3.git3.1.fc31.x86_64

I can bisect the kernel at that tag but can't build the rpm packages, have =
to
research further I guess.

Attached the logs from the problematic version and the immediate earlier
working version.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596744611.aecf7D3.17534--

--===============0481135037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0481135037==--
