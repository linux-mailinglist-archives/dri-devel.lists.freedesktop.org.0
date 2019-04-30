Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44706FB4D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7492E89182;
	Tue, 30 Apr 2019 14:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2991E89182
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:22:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2164172155; Tue, 30 Apr 2019 14:22:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Tue, 30 Apr 2019 14:22:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110509-502-8HFpRawAzs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1625621448=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1625621448==
Content-Type: multipart/alternative; boundary="15566341390.85D4ad.31892"
Content-Transfer-Encoding: 7bit


--15566341390.85D4ad.31892
Date: Tue, 30 Apr 2019 14:22:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #12 from James.Dutton@gmail.com ---

The error is from this bit of code in:
amdgpu_cs.c:  Line about 232
In function: amdgpu_cs_parser_init:
        if (p->ctx->vram_lost_counter !=3D p->job->vram_lost_counter) {
                ret =3D -ECANCELED;
                goto free_all_kdata;
        }

So, I guess, somewhere is the gpu reset, those values need to be fixed up.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566341390.85D4ad.31892
Date: Tue, 30 Apr 2019 14:22:19 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
James.Dutton&#64;gmail.com" title=3D"James.Dutton&#64;gmail.com">James.Dutt=
on&#64;gmail.com</a>
</span></b>
        <pre>
The error is from this bit of code in:
amdgpu_cs.c:  Line about 232
In function: amdgpu_cs_parser_init:
        if (p-&gt;ctx-&gt;vram_lost_counter !=3D p-&gt;job-&gt;vram_lost_co=
unter) {
                ret =3D -ECANCELED;
                goto free_all_kdata;
        }

So, I guess, somewhere is the gpu reset, those values need to be fixed up.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566341390.85D4ad.31892--

--===============1625621448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1625621448==--
