Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D557FEAA1B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 06:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480DE6ED85;
	Thu, 31 Oct 2019 05:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BAEA6EC52
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 05:14:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 16FCA720E2; Thu, 31 Oct 2019 05:14:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 31 Oct 2019 05:14:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: venemo@msn.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-KVJZdcpmIr@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0900037228=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0900037228==
Content-Type: multipart/alternative; boundary="15724988650.dC4576304.1459"
Content-Transfer-Encoding: 7bit


--15724988650.dC4576304.1459
Date: Thu, 31 Oct 2019 05:14:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #183 from Timur Krist=C3=B3f <venemo@msn.com> ---
(In reply to Jaap Buurman from comment #142)
> How can I set both AMD_DEBUG=3Dnongg and AMD_DEBUG=3Dnodma in the
> /etc/environment file? Do they need to be on two separate lines, or will =
the
> second line simply overwrite the first one by setting the same environment
> variable? Do they need to be comma separated maybe?

Add the following line to your /etc/environment

export AMD_DEBUG=3Dnongg,nodma

(In reply to Pierre-Eric Pelloux-Prayer from comment #141)
> I don't think radv uses SDMA at all, so they cannot be affected by this
> issue.=20

Correct, radv doesn't use the SDMA so is not affected by this problem. If y=
ou
see hangs in Vulkan games, it is currently most likely an LLVM problem. The
LLVM devs have fixed most of the problems in their latest master, but haven=
't
backported the fixes to LLVM 9 yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15724988650.dC4576304.1459
Date: Thu, 31 Oct 2019 05:14:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c183">Comm=
ent # 183</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
venemo&#64;msn.com" title=3D"Timur Krist=C3=B3f &lt;venemo&#64;msn.com&gt;"=
> <span class=3D"fn">Timur Krist=C3=B3f</span></a>
</span></b>
        <pre>(In reply to Jaap Buurman from <a href=3D"show_bug.cgi?id=3D11=
1481#c142">comment #142</a>)
<span class=3D"quote">&gt; How can I set both AMD_DEBUG=3Dnongg and AMD_DEB=
UG=3Dnodma in the
&gt; /etc/environment file? Do they need to be on two separate lines, or wi=
ll the
&gt; second line simply overwrite the first one by setting the same environ=
ment
&gt; variable? Do they need to be comma separated maybe?</span >

Add the following line to your /etc/environment

export AMD_DEBUG=3Dnongg,nodma

(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_bug.cgi?id=3D1=
11481#c141">comment #141</a>)
<span class=3D"quote">&gt; I don't think radv uses SDMA at all, so they can=
not be affected by this
&gt; issue. </span >

Correct, radv doesn't use the SDMA so is not affected by this problem. If y=
ou
see hangs in Vulkan games, it is currently most likely an LLVM problem. The
LLVM devs have fixed most of the problems in their latest master, but haven=
't
backported the fixes to LLVM 9 yet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15724988650.dC4576304.1459--

--===============0900037228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0900037228==--
