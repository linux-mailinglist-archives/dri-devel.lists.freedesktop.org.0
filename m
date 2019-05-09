Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688A18E4D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 18:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBCD89DF7;
	Thu,  9 May 2019 16:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B7E589DFD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 16:42:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 37D207215A; Thu,  9 May 2019 16:42:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110637] Any OpenCL application causes "*ERROR* ring gfx
 timeout" on Vega 64
Date: Thu, 09 May 2019 16:42:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jv356@scarletmail.rutgers.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110637-502-9hpHeVAACo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110637-502@http.bugs.freedesktop.org/>
References: <bug-110637-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0840783460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0840783460==
Content-Type: multipart/alternative; boundary="15574201781.7BeEBB.11859"
Content-Transfer-Encoding: 7bit


--15574201781.7BeEBB.11859
Date: Thu, 9 May 2019 16:42:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110637

--- Comment #6 from Jan Vesely <jv356@scarletmail.rutgers.edu> ---
Can you post the output of 'clinfo'?
GPU hangs in clover are usually signs of old LLVM, or old mesa (that does n=
ot
catch function calls).

Do you use ocl-icd?
if yes can you confirm if the games hang when running with
OCL_ICD_VENDORS=3D/var/empty/ ?
(alternatively, you can just move libMesaOpenCL.* out of library path)



(In reply to Alex Deucher from comment #3)
> More likely a bug in the mesa OpenCL code.  If you want functional OpenCL,
> you should use the ROCm OpenCL packages.

I doubt that. clover uses the same LLVM code generation paths.
also note: "the same problem with multiple games", I doubt those use OpenCL.
the above steps should confirm that.
My guess is that compute shaders are busted (irrespective of the API).
GPU reset has never worked correctly on any AMD GPU that I've ever used.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574201781.7BeEBB.11859
Date: Thu, 9 May 2019 16:42:58 +0000
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
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637">bug 11063=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jv356&#64;scarletmail.rutgers.edu" title=3D"Jan Vesely &lt;jv356&#64;scarle=
tmail.rutgers.edu&gt;"> <span class=3D"fn">Jan Vesely</span></a>
</span></b>
        <pre>Can you post the output of 'clinfo'?
GPU hangs in clover are usually signs of old LLVM, or old mesa (that does n=
ot
catch function calls).

Do you use ocl-icd?
if yes can you confirm if the games hang when running with
OCL_ICD_VENDORS=3D/var/empty/ ?
(alternatively, you can just move libMesaOpenCL.* out of library path)



(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D110637#c3">comm=
ent #3</a>)
<span class=3D"quote">&gt; More likely a bug in the mesa OpenCL code.  If y=
ou want functional OpenCL,
&gt; you should use the ROCm OpenCL packages.</span >

I doubt that. clover uses the same LLVM code generation paths.
also note: &quot;the same problem with multiple games&quot;, I doubt those =
use OpenCL.
the above steps should confirm that.
My guess is that compute shaders are busted (irrespective of the API).
GPU reset has never worked correctly on any AMD GPU that I've ever used.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574201781.7BeEBB.11859--

--===============0840783460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0840783460==--
