Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2384B9F2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40EB6E406;
	Wed, 19 Jun 2019 13:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FF696E409
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:30:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D22372167; Wed, 19 Jun 2019 13:30:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110702] segfault in radeonsi HEVC hardware decoding with
 yuv420p10le
Date: Wed, 19 Jun 2019 13:30:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
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
Message-ID: <bug-110702-502-sRrhjQ5zpQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110702-502@http.bugs.freedesktop.org/>
References: <bug-110702-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2139994670=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2139994670==
Content-Type: multipart/alternative; boundary="15609510392.e7DBAA.16773"
Content-Transfer-Encoding: 7bit


--15609510392.e7DBAA.16773
Date: Wed, 19 Jun 2019 13:30:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110702

--- Comment #11 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
(In reply to Christian K=C3=B6nig from comment #10)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #9)
> > The driver fails when trying to allocate a buffer for this video with a
> > ENOMEM error (the requested size is 3 GB).
>=20
> Well that strongly sounds like we miscalculated the necessary size somewh=
ere.

Indeed.
The size is computed by the `calc_ctx_size_h265_main10()` function.

I'm not familiar enough with hevc to fix it though (but the calculation see=
ms
to overflow because context_buffer_size_per_ctb_row is 1GB and is multiplie=
d by
max_references (=3D 23) and the result is stored in an unsigned int).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15609510392.e7DBAA.16773
Date: Wed, 19 Jun 2019 13:30:39 +0000
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
   title=3D"NEW - segfault in radeonsi HEVC hardware decoding with yuv420p1=
0le"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110702#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - segfault in radeonsi HEVC hardware decoding with yuv420p1=
0le"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110702">bug 11070=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Christian K=C3=B6nig from <a href=3D"show_bug.cgi=
?id=3D110702#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D110702#c9">comment #9</a>)
&gt; &gt; The driver fails when trying to allocate a buffer for this video =
with a
&gt; &gt; ENOMEM error (the requested size is 3 GB).
&gt;=20
&gt; Well that strongly sounds like we miscalculated the necessary size som=
ewhere.</span >

Indeed.
The size is computed by the `calc_ctx_size_h265_main10()` function.

I'm not familiar enough with hevc to fix it though (but the calculation see=
ms
to overflow because context_buffer_size_per_ctb_row is 1GB and is multiplie=
d by
max_references (=3D 23) and the result is stored in an unsigned int).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15609510392.e7DBAA.16773--

--===============2139994670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2139994670==--
