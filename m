Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8A2689E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85D89C1E;
	Wed, 22 May 2019 16:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBA8F89C1E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:49:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B81E972167; Wed, 22 May 2019 16:49:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110721] graphics corruption on steam client with mesa 19.1.0
 rc3 on polaris
Date: Wed, 22 May 2019 16:49:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric@damsy.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110721-502-27h3TqTZ8h@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110721-502@http.bugs.freedesktop.org/>
References: <bug-110721-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1078166776=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1078166776==
Content-Type: multipart/alternative; boundary="15585437752.7eCf.6052"
Content-Transfer-Encoding: 7bit


--15585437752.7eCf.6052
Date: Wed, 22 May 2019 16:49:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

--- Comment #9 from Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net> ---
> (In reply to Ropid from comment #6)
> @alvarex:
>=20
> Try starting chromium with this command line here, it makes it show
> corruption everywhere for me here:
>=20
> chromium --ignore-gpu-blacklist --enable-gpu-rasterization
> --enable-native-gpu-memory-buffers --enable-zero-copy
> --disable-gpu-driver-bug-workarounds
>=20

Same here so I did a bisect.
There are 2 problematic commits, making the bisect a bit more complicated.

The first one has already been solved by d6053bf2a170.
The second one is 811fa9a79cf ("mesa: unreference current winsys buffers wh=
en
unbinding winsys buffers").=20

Using master + this commit reverted: no more corruption in chromium.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585437752.7eCf.6052
Date: Wed, 22 May 2019 16:49:35 +0000
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
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721">bug 11072=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric&#64;damsy.net" title=3D"Pierre-Eric Pelloux-Prayer &lt;pierre-e=
ric&#64;damsy.net&gt;"> <span class=3D"fn">Pierre-Eric Pelloux-Prayer</span=
></a>
</span></b>
        <pre><span class=3D"quote">&gt; (In reply to Ropid from <a href=3D"=
show_bug.cgi?id=3D110721#c6">comment #6</a>)
&gt; &#64;alvarex:
&gt;=20
&gt; Try starting chromium with this command line here, it makes it show
&gt; corruption everywhere for me here:
&gt;=20
&gt; chromium --ignore-gpu-blacklist --enable-gpu-rasterization
&gt; --enable-native-gpu-memory-buffers --enable-zero-copy
&gt; --disable-gpu-driver-bug-workarounds
&gt; </span >

Same here so I did a bisect.
There are 2 problematic commits, making the bisect a bit more complicated.

The first one has already been solved by d6053bf2a170.
The second one is 811fa9a79cf (&quot;mesa: unreference current winsys buffe=
rs when
unbinding winsys buffers&quot;).=20

Using master + this commit reverted: no more corruption in chromium.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585437752.7eCf.6052--

--===============1078166776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1078166776==--
