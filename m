Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFAF1F1E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 20:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00E16E2DA;
	Wed,  6 Nov 2019 19:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C40446EE31
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 19:39:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C10BB720E2; Wed,  6 Nov 2019 19:39:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 06 Nov 2019 19:39:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: smith-erc@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-OVyoFtLjQV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1690169848=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1690169848==
Content-Type: multipart/alternative; boundary="157306919312.32EdBA66d.22312"
Content-Transfer-Encoding: 7bit


--157306919312.32EdBA66d.22312
Date: Wed, 6 Nov 2019 19:39:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #213 from Marco Liedtke <smith-erc@gmx.de> ---
(In reply to wychuchol from comment #212)
> (In reply to Marco Liedtke from comment #211)
> >=20
> > I have already set AMD_DEBUG=3Dnodam in /etc/environment and in ~/.prof=
ile.
> > Last time i played World of Tanks via Wine and DXVK the same freeze occ=
ured,
> > again the same error that xorg pid timed out...
>=20
> Don't know if you made a typo here but do you have AMD_DEBUG=3D"nongg,nod=
ma"
> line in /etc/environment ? Bugs still occur for me but they're far less
> frequent.
> Also since you're running ryzen 3000 try to get kernel 5.4. It won't solve
> your problems but there's a massive performance buff for zen2 in 5.4.

Hi, i have noch kernel 5.4 rc6 installed and the problem didnt change.
I have written AMD_DEBUG=3Dnodma and NOT AMD_DEBUG=3D"nodma" in /etc/enviro=
nment.

Now i have added the amdgpu.gpu_recovery=3D1 attribute in grub.

So now there is a long output from dmesg while nothing done then clicking
"login" in bugzilla with firefox.

see attachment dmesg_with_gpu_recovery enabled....

I hope this helps a bit...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157306919312.32EdBA66d.22312
Date: Wed, 6 Nov 2019 19:39:53 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c213">Comm=
ent # 213</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
smith-erc&#64;gmx.de" title=3D"Marco Liedtke &lt;smith-erc&#64;gmx.de&gt;">=
 <span class=3D"fn">Marco Liedtke</span></a>
</span></b>
        <pre>(In reply to wychuchol from <a href=3D"show_bug.cgi?id=3D11148=
1#c212">comment #212</a>)
<span class=3D"quote">&gt; (In reply to Marco Liedtke from <a href=3D"show_=
bug.cgi?id=3D111481#c211">comment #211</a>)
&gt; &gt;=20
&gt; &gt; I have already set AMD_DEBUG=3Dnodam in /etc/environment and in ~=
/.profile.
&gt; &gt; Last time i played World of Tanks via Wine and DXVK the same free=
ze occured,
&gt; &gt; again the same error that xorg pid timed out...
&gt;=20
&gt; Don't know if you made a typo here but do you have AMD_DEBUG=3D&quot;n=
ongg,nodma&quot;
&gt; line in /etc/environment ? Bugs still occur for me but they're far less
&gt; frequent.
&gt; Also since you're running ryzen 3000 try to get kernel 5.4. It won't s=
olve
&gt; your problems but there's a massive performance buff for zen2 in 5.4.<=
/span >

Hi, i have noch kernel 5.4 rc6 installed and the problem didnt change.
I have written AMD_DEBUG=3Dnodma and NOT AMD_DEBUG=3D&quot;nodma&quot; in /=
etc/environment.

Now i have added the amdgpu.gpu_recovery=3D1 attribute in grub.

So now there is a long output from dmesg while nothing done then clicking
&quot;login&quot; in bugzilla with firefox.

see attachment dmesg_with_gpu_recovery enabled....

I hope this helps a bit...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157306919312.32EdBA66d.22312--

--===============1690169848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1690169848==--
