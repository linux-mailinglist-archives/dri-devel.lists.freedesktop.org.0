Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B48988D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244BC6E4BE;
	Mon, 12 Aug 2019 08:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E166D6E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:16:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DD06A72167; Mon, 12 Aug 2019 08:16:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 12 Aug 2019 08:16:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-iXp025cApj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1188417365=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1188417365==
Content-Type: multipart/alternative; boundary="15655978081.Acd1CEBC.5896"
Content-Transfer-Encoding: 7bit


--15655978081.Acd1CEBC.5896
Date: Mon, 12 Aug 2019 08:16:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #84 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
(In reply to Mauro Gaspari from comment #82)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #81)
> > Can anyone provide a apitrace/renderdoc capture that can reliably repro=
duce
> > the crash/freeze?
>=20
> Hello, Sadly my freezes are hard to reproduce. Sometimes I can play for a
> day with no freeze, sometimes it freezes in 10 minutes, one hour, and so =
on.
>=20

Ok.

This patch https://patchwork.freedesktop.org/series/64792/ might help: it w=
on't
fix any issue, but when a timeout is detected it should allow the soft reco=
very
of the GPU.

Other things worth trying: setting AMD_DEBUG environment variables. I'd
suggest:

   AMD_DEBUG=3Dzerovram,nodma,nodpbb

There are others (see mesa/src/gallium/drivers/radeonsi/si_pipe.c) to try if
these don't help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655978081.Acd1CEBC.5896
Date: Mon, 12 Aug 2019 08:16:48 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c84">Comme=
nt # 84</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c82">comment #82</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D109955#c81">comment #81</a>)
&gt; &gt; Can anyone provide a apitrace/renderdoc capture that can reliably=
 reproduce
&gt; &gt; the crash/freeze?
&gt;=20
&gt; Hello, Sadly my freezes are hard to reproduce. Sometimes I can play fo=
r a
&gt; day with no freeze, sometimes it freezes in 10 minutes, one hour, and =
so on.
&gt; </span >

Ok.

This patch <a href=3D"https://patchwork.freedesktop.org/series/64792/">http=
s://patchwork.freedesktop.org/series/64792/</a> might help: it won't
fix any issue, but when a timeout is detected it should allow the soft reco=
very
of the GPU.

Other things worth trying: setting AMD_DEBUG environment variables. I'd
suggest:

   AMD_DEBUG=3Dzerovram,nodma,nodpbb

There are others (see mesa/src/gallium/drivers/radeonsi/si_pipe.c) to try if
these don't help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655978081.Acd1CEBC.5896--

--===============1188417365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1188417365==--
