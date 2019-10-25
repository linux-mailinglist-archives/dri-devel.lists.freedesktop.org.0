Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE57E4C13
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31E86EA2C;
	Fri, 25 Oct 2019 13:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 728A36EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:27:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F437720E2; Fri, 25 Oct 2019 13:27:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 25 Oct 2019 13:27:20 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-gIGMurJg3m@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1083869268=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1083869268==
Content-Type: multipart/alternative; boundary="15720100402.aE4cfEA.29838"
Content-Transfer-Encoding: 7bit


--15720100402.aE4cfEA.29838
Date: Fri, 25 Oct 2019 13:27:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #164 from L.S.S. <ragnaros39216@yandex.com> ---
EDIT: Did some analysis myself about the GCVM_L2_PROTECTION_FAULT errors...

In the errors last time contained this:

src_id:0 ring:40 vmid:7 pasid:32769
GCVM_L2_PROTECTION_FAULT_STATUS:0x00741A51 (only on first error)

Whereas in the errors this time contained this:

src_id:0 ring:40 vmid:1 pasid:32769
GCVM_L2_PROTECTION_FAULT_STATUS:0x00141A51 (only on first error)

vmid became 1 and GCVM_L2_PROTECTION_FAULT_STATUS changed from 0x00741A51 to
0x00141A51. The rest of the first error remained the same.

MORE_FAULTS: 0x1
WALKER_ERROR: 0x0
PERMISSION_FAULTS: 0x5
MAPPING_ERROR: 0x0
RW: 0x1

In subsequent errors those values were all 0.

Both times the first error has a starting address of 0x00000318c00e7000.

Not sure if these could be of any help, though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720100402.aE4cfEA.29838
Date: Fri, 25 Oct 2019 13:27:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c164">Comm=
ent # 164</a>
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
        <pre>EDIT: Did some analysis myself about the GCVM_L2_PROTECTION_FA=
ULT errors...

In the errors last time contained this:

src_id:0 ring:40 vmid:7 pasid:32769
GCVM_L2_PROTECTION_FAULT_STATUS:0x00741A51 (only on first error)

Whereas in the errors this time contained this:

src_id:0 ring:40 vmid:1 pasid:32769
GCVM_L2_PROTECTION_FAULT_STATUS:0x00141A51 (only on first error)

vmid became 1 and GCVM_L2_PROTECTION_FAULT_STATUS changed from 0x00741A51 to
0x00141A51. The rest of the first error remained the same.

MORE_FAULTS: 0x1
WALKER_ERROR: 0x0
PERMISSION_FAULTS: 0x5
MAPPING_ERROR: 0x0
RW: 0x1

In subsequent errors those values were all 0.

Both times the first error has a starting address of 0x00000318c00e7000.

Not sure if these could be of any help, though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720100402.aE4cfEA.29838--

--===============1083869268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1083869268==--
