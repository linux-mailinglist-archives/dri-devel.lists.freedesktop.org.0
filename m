Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4AE4BDF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309B56EA23;
	Fri, 25 Oct 2019 13:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9710D6EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:16:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 933D1720E2; Fri, 25 Oct 2019 13:16:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 25 Oct 2019 13:16:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111481-502-bTpSFfJqJI@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1008533025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1008533025==
Content-Type: multipart/alternative; boundary="15720093919.5d6DbA8.27852"
Content-Transfer-Encoding: 7bit


--15720093919.5d6DbA8.27852
Date: Fri, 25 Oct 2019 13:16:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

L.S.S. <ragnaros39216@yandex.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145807|0                           |1
        is obsolete|                            |

--- Comment #163 from L.S.S. <ragnaros39216@yandex.com> ---
Created attachment 145814
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145814&action=3Dedit
Newly captured GCVM_L2_PROTECTION_FAULT errors. This was captured on 5.4(rc)
kernel, and with AMD_DEBUG=3Dnodma.

I got a few more freezes when using Nemo. This time with AMD_DEBUG=3Dnodma =
or
AMD_DEBUG=3D"nodma,nongg".

I put AMD_DEBUG to /etc/environment, and I can indeed confirm it from termi=
nal
(echo $AMD_DEBUG). It seems this doesn't work, as the freezes I got this ti=
me
are also sdma0 type, same as before.

I also captured some new GCVM_L2_PROTECTION_FAULT errors. Not sure if they'=
re
different from last time. This is captured on 5.4(rc) kernel with
AMD_DEBUG=3Dnodma.

In the end, the sdma0 error doesn't seem to go away and I'm not even sure
whether the parameter was set correctly. Where am I supposed to put the
AMD_DEBUG parameters on Manjaro?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720093919.5d6DbA8.27852
Date: Fri, 25 Oct 2019 13:16:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ragnaros3=
9216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.com&gt;">=
 <span class=3D"fn">L.S.S.</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145807 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c163">Comm=
ent # 163</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ragnaros39216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.=
com&gt;"> <span class=3D"fn">L.S.S.</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145814=
" name=3D"attach_145814" title=3D"Newly captured GCVM_L2_PROTECTION_FAULT e=
rrors. This was captured on 5.4(rc) kernel, and with AMD_DEBUG=3Dnodma.">at=
tachment 145814</a> <a href=3D"attachment.cgi?id=3D145814&amp;action=3Dedit=
" title=3D"Newly captured GCVM_L2_PROTECTION_FAULT errors. This was capture=
d on 5.4(rc) kernel, and with AMD_DEBUG=3Dnodma.">[details]</a></span>
Newly captured GCVM_L2_PROTECTION_FAULT errors. This was captured on 5.4(rc)
kernel, and with AMD_DEBUG=3Dnodma.

I got a few more freezes when using Nemo. This time with AMD_DEBUG=3Dnodma =
or
AMD_DEBUG=3D&quot;nodma,nongg&quot;.

I put AMD_DEBUG to /etc/environment, and I can indeed confirm it from termi=
nal
(echo $AMD_DEBUG). It seems this doesn't work, as the freezes I got this ti=
me
are also sdma0 type, same as before.

I also captured some new GCVM_L2_PROTECTION_FAULT errors. Not sure if they'=
re
different from last time. This is captured on 5.4(rc) kernel with
AMD_DEBUG=3Dnodma.

In the end, the sdma0 error doesn't seem to go away and I'm not even sure
whether the parameter was set correctly. Where am I supposed to put the
AMD_DEBUG parameters on Manjaro?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720093919.5d6DbA8.27852--

--===============1008533025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1008533025==--
