Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2166FFAC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 14:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F589BA5;
	Mon, 22 Jul 2019 12:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0386389C13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 12:30:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0039972167; Mon, 22 Jul 2019 12:30:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Mon, 22 Jul 2019 12:30:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-qI5avfczQx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0974870535=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0974870535==
Content-Type: multipart/alternative; boundary="15637986222.9BebFFd6.10923"
Content-Transfer-Encoding: 7bit


--15637986222.9BebFFd6.10923
Date: Mon, 22 Jul 2019 12:30:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #6 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to Brian Schott from comment #3)
> I think that I'm seeing something related with my 2700u Inspiron 7375.
>=20
> If I have compositing enabled in XFWM4, the system will immediately stop
> responding after logging in with LightDM. If the window manager compositi=
ng
> is disabled, I'm able to log in, but then there is graphical corruption.
>=20
> With git bisect I traced the problem back to
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?h=3Ddf8368be1382&id=3Ddf8368be1382b442384507a5147c89978cd60702
>=20
> I can edit the source file, and by only changing the KMS_DRIVER_MINOR
> definition from 32 to 30, get the system working correctly with 5.2.0.

Your issue in particular is likely unrelated - it's an issue in userspace.

The bisected commit is the one that allowed xf86-video-amdgpu to start scan=
ning
out DCC compressed buffers that mesa produces, with the caveat that mesa ne=
eds
a hook on present for the re-tile. My guess is that hook isn't running when=
 you
aren't using "compositing".

I'm not sure if mesa or xf86-video-amdgpu have options yet to disable DCC or
not, but for that particular setup you'd probably want it disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637986222.9BebFFd6.10923
Date: Mon, 22 Jul 2019 12:30:22 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to Brian Schott from <a href=3D"show_bug.cgi?id=3D11=
1122#c3">comment #3</a>)
<span class=3D"quote">&gt; I think that I'm seeing something related with m=
y 2700u Inspiron 7375.
&gt;=20
&gt; If I have compositing enabled in XFWM4, the system will immediately st=
op
&gt; responding after logging in with LightDM. If the window manager compos=
iting
&gt; is disabled, I'm able to log in, but then there is graphical corruptio=
n.
&gt;=20
&gt; With git bisect I traced the problem back to
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/commit/</a>
&gt; ?h=3Ddf8368be1382&amp;id=3Ddf8368be1382b442384507a5147c89978cd60702
&gt;=20
&gt; I can edit the source file, and by only changing the KMS_DRIVER_MINOR
&gt; definition from 32 to 30, get the system working correctly with 5.2.0.=
</span >

Your issue in particular is likely unrelated - it's an issue in userspace.

The bisected commit is the one that allowed xf86-video-amdgpu to start scan=
ning
out DCC compressed buffers that mesa produces, with the caveat that mesa ne=
eds
a hook on present for the re-tile. My guess is that hook isn't running when=
 you
aren't using &quot;compositing&quot;.

I'm not sure if mesa or xf86-video-amdgpu have options yet to disable DCC or
not, but for that particular setup you'd probably want it disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637986222.9BebFFd6.10923--

--===============0974870535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0974870535==--
