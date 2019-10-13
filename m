Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1935D55A4
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 12:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916D86E11F;
	Sun, 13 Oct 2019 10:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16B6A6E11F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 10:25:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 101C0729DA; Sun, 13 Oct 2019 10:25:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 10:25:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111987-502-WZFONvijbb@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111987-502@http.bugs.freedesktop.org/>
References: <bug-111987-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1643760511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1643760511==
Content-Type: multipart/alternative; boundary="15709623160.dbdaB8c7E.28267"
Content-Transfer-Encoding: 7bit


--15709623160.dbdaB8c7E.28267
Date: Sun, 13 Oct 2019 10:25:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #10 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> =
---
Firmware signatures:

user@debian:/lib/firmware/amdgpu$ sha256sum fiji_*
615693b2736f13c4ef3cd9220efe4d55df3c5d82fe128d3f1b34a45edba65fbd  fiji_ce.b=
in
b0d51dc0b361afa07bcefa0f4670c344679b1fcbe1be68c06e727eaaf0098236  fiji_mc.b=
in
953747f5b93bd743bb75747b950be3e4ccbe481ac1f7110a58d399ac840f158a  fiji_me.b=
in
cd1133103874ce368c4f46eeb38fe293caad5f77e4fee8567f6f6be9c47687c4  fiji_mec2=
.bin
cd1133103874ce368c4f46eeb38fe293caad5f77e4fee8567f6f6be9c47687c4  fiji_mec.=
bin
91bda514a4d0d846d48321aa4d3c92ff1049fe53cbf3e007686553a29a9018de  fiji_pfp.=
bin
f0fa903f16502cff35dc073a77c1ef382f4218ec2928f23a173400888f90400d  fiji_rlc.=
bin
1c5ab71e854cc59e4998559ed07c436d05b2a97b0df0a51a3924b1c240398949=20
fiji_sdma1.bin
b5cf6b3a3b7e6839a68a92ac8651d53d0ae41e1caee28c68155b2d7865f1cf4c  fiji_sdma=
.bin
fd13fe6b32cef9129f1b75f46b014babcf4075ebc8a715bf19da573be8b68223  fiji_smc.=
bin
b7401cfda1087ee5cf71acef19163f311c71775802b331ca82b9177119e4d97b  fiji_uvd.=
bin
0fe1a2e4e2e4f6f8d5600d8c13cb60a8bc87089cd37c766fef2f95ccd5e277ac  fiji_vce.=
bin
user@debian:/lib/firmware/amdgpu$

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709623160.dbdaB8c7E.28267
Date: Sun, 13 Oct 2019 10:25:16 +0000
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
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987">bug 11198=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
witold.baryluk+freedesktop&#64;gmail.com" title=3D"Witold Baryluk &lt;witol=
d.baryluk+freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Witold Baryluk=
</span></a>
</span></b>
        <pre>Firmware signatures:

user&#64;debian:/lib/firmware/amdgpu$ sha256sum fiji_*
615693b2736f13c4ef3cd9220efe4d55df3c5d82fe128d3f1b34a45edba65fbd  fiji_ce.b=
in
b0d51dc0b361afa07bcefa0f4670c344679b1fcbe1be68c06e727eaaf0098236  fiji_mc.b=
in
953747f5b93bd743bb75747b950be3e4ccbe481ac1f7110a58d399ac840f158a  fiji_me.b=
in
cd1133103874ce368c4f46eeb38fe293caad5f77e4fee8567f6f6be9c47687c4  fiji_mec2=
.bin
cd1133103874ce368c4f46eeb38fe293caad5f77e4fee8567f6f6be9c47687c4  fiji_mec.=
bin
91bda514a4d0d846d48321aa4d3c92ff1049fe53cbf3e007686553a29a9018de  fiji_pfp.=
bin
f0fa903f16502cff35dc073a77c1ef382f4218ec2928f23a173400888f90400d  fiji_rlc.=
bin
1c5ab71e854cc59e4998559ed07c436d05b2a97b0df0a51a3924b1c240398949=20
fiji_sdma1.bin
b5cf6b3a3b7e6839a68a92ac8651d53d0ae41e1caee28c68155b2d7865f1cf4c  fiji_sdma=
.bin
fd13fe6b32cef9129f1b75f46b014babcf4075ebc8a715bf19da573be8b68223  fiji_smc.=
bin
b7401cfda1087ee5cf71acef19163f311c71775802b331ca82b9177119e4d97b  fiji_uvd.=
bin
0fe1a2e4e2e4f6f8d5600d8c13cb60a8bc87089cd37c766fef2f95ccd5e277ac  fiji_vce.=
bin
user&#64;debian:/lib/firmware/amdgpu$</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709623160.dbdaB8c7E.28267--

--===============1643760511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1643760511==--
