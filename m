Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7161F359D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49BE6E10B;
	Thu,  7 Nov 2019 17:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24B16E10B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:22:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E977B720E2; Thu,  7 Nov 2019 17:22:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112226] [HadesCanyon/regression] GPU hang causes also X server
 to die
Date: Thu, 07 Nov 2019 17:22:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112226-502-7JhDnZt2hm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112226-502@http.bugs.freedesktop.org/>
References: <bug-112226-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1581696871=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1581696871==
Content-Type: multipart/alternative; boundary="15731473610.3bc860D.2605"
Content-Transfer-Encoding: 7bit


--15731473610.3bc860D.2605
Date: Thu, 7 Nov 2019 17:22:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112226

--- Comment #5 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Eero Tamminen from comment #3)
>=20
> AFAIK reset should affect only the context running in the GPU when it was
> reseted, not the others [1], and in this case the problematic client shou=
ld
> be GfxBench (Manhattan test-case, see bug 108898), not X server.
>=20
> Btw. Why AMD kernel module doesn't tell which process / context had the
> issue, like i915 does?

It does, but in the case of a whole GPU reset, vram is lost after a reset so
the buffers from all processes that use the GPU are lost.  Depending on the
nature of the hang, a whole GPU reset may be required rather than just kill=
ing
the shader wave.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731473610.3bc860D.2605
Date: Thu, 7 Nov 2019 17:22:41 +0000
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
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">bug 11222=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Eero Tamminen from <a href=3D"show_bug.cgi?id=3D1=
12226#c3">comment #3</a>)
<span class=3D"quote">&gt;=20
&gt; AFAIK reset should affect only the context running in the GPU when it =
was
&gt; reseted, not the others [1], and in this case the problematic client s=
hould
&gt; be GfxBench (Manhattan test-case, see <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - (Recoverable) GPU hangs with GfxBench Manhatta=
n GL tests"
   href=3D"show_bug.cgi?id=3D108898">bug 108898</a>), not X server.
&gt;=20
&gt; Btw. Why AMD kernel module doesn't tell which process / context had the
&gt; issue, like i915 does?</span >

It does, but in the case of a whole GPU reset, vram is lost after a reset so
the buffers from all processes that use the GPU are lost.  Depending on the
nature of the hang, a whole GPU reset may be required rather than just kill=
ing
the shader wave.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731473610.3bc860D.2605--

--===============1581696871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1581696871==--
