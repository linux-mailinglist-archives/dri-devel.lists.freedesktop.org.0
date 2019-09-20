Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D70B8DCD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08346E05A;
	Fri, 20 Sep 2019 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57AB06E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:30:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4DB5972167; Fri, 20 Sep 2019 09:30:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111755] WARNING: CPU: 9 PID: 2908 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
 dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
Date: Fri, 20 Sep 2019 09:30:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111755-502-orN0SwBZsg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111755-502@http.bugs.freedesktop.org/>
References: <bug-111755-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1930423256=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1930423256==
Content-Type: multipart/alternative; boundary="15689718280.3d47Fa5B.4439"
Content-Transfer-Encoding: 7bit


--15689718280.3d47Fa5B.4439
Date: Fri, 20 Sep 2019 09:30:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111755

--- Comment #11 from Stijn Tintel <stijn+bugs@linux-ipv6.be> ---
navi10 firmware downloaded from
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/ on 20190913 - wh=
ich
seems still current.

taz ~ # sha512sum /lib/firmware/amdgpu/navi10_*
d9f04485f53e92aa97ce6713b00236e273d40085015d3b65d34d704bae77f072b4bc709d48f=
a183691853de207569a23132eccbf7d05aff992e6c62140ee0e71
 /lib/firmware/amdgpu/navi10_asd.bin
d3631f12f444bf8a53e8e8ecf352c8601275444e6639b14075612c080cc84b9c2b5326ca905=
a40247c55c4eb2ec961ff93dcfc41b0b42f4ff64bb85a3dd4a0d4
 /lib/firmware/amdgpu/navi10_ce.bin
7867b095263d75ecc9cd071e85cacced4f61fa1f81b40335e83624910854deed8acb6017acd=
24e55bad0c410e979fbb142de24dfb4e46b68c3c8f30ba39f42c3
 /lib/firmware/amdgpu/navi10_gpu_info.bin
fd358b6412ff4e8b20df8173b29057cd5e53e8f421942e3e1b64cfd87afbcb383267e507710=
2550176f4b6597175e9d14d84113c296ec9358c3dfe76c912742d
 /lib/firmware/amdgpu/navi10_me.bin
a15f7861191ee7ed4ee1b475bee394ff418edb7e471203a8af29894caead12982b2ab924a86=
a337ba5e06fd4910a764e2f675f15f53968a38f6ce8db9fc20165
 /lib/firmware/amdgpu/navi10_mec2.bin
a15f7861191ee7ed4ee1b475bee394ff418edb7e471203a8af29894caead12982b2ab924a86=
a337ba5e06fd4910a764e2f675f15f53968a38f6ce8db9fc20165
 /lib/firmware/amdgpu/navi10_mec.bin
ac616d7be0867d6148a623a53ab5ef539dbae917c53c0e67883e3b763170cb880579be27094=
31cd1c6ca61be787732a0d0265812b7b7cfa263138b7fcc4d0f25
 /lib/firmware/amdgpu/navi10_pfp.bin
c5a3278009fed96ecdae0cf4ff8516bf23afcaa5eb5b3014cfd80a9275d8b2884aa3d0c8b18=
4ae9b3627c0e814ef670e445ad785b7b930114611cbc1c6c4724e
 /lib/firmware/amdgpu/navi10_rlc.bin
d975a66ecd7e02f27996c8badd0ceb7f452182f2d2c416e9269addedd291085c43111b30a32=
824d2bf99c4c90a12104d272ef6b4f077e49b72e7fa1a050c519d
 /lib/firmware/amdgpu/navi10_sdma1.bin
d975a66ecd7e02f27996c8badd0ceb7f452182f2d2c416e9269addedd291085c43111b30a32=
824d2bf99c4c90a12104d272ef6b4f077e49b72e7fa1a050c519d
 /lib/firmware/amdgpu/navi10_sdma.bin
3280d80b6d2f949b5a0c5f2b227ec7ef4bfa9affbad296dc127f49b64d45629cb6e067e0475=
97ceeeffdf28267455a6b08e4b9dd4c3627d0236fd5c7cbe9a6e3
 /lib/firmware/amdgpu/navi10_smc.bin
29c042f70637951ec549175194ea792cb0733c747313c04377e09e9f3dd2562c7ee242d7adf=
0713f226d8c58dd71921bfe6cbbb485b36e523e0381e074d2a4b5
 /lib/firmware/amdgpu/navi10_sos.bin
e92fc20428117c7a7ce951b3db80f534844d514d12db0fc72deb9ff593adee167a6c1f2f276=
13e344230c06e9b129d33cadf6ed1b6bed21cbeb86e613c664140
 /lib/firmware/amdgpu/navi10_vcn.bin

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689718280.3d47Fa5B.4439
Date: Fri, 20 Sep 2019 09:30:28 +0000
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
   title=3D"NEW - WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/.=
./display/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x=
220 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/.=
./display/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x=
220 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755">bug 11175=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stijn+bugs&#64;linux-ipv6.be" title=3D"Stijn Tintel &lt;stijn+bugs&#64;linu=
x-ipv6.be&gt;"> <span class=3D"fn">Stijn Tintel</span></a>
</span></b>
        <pre>navi10 firmware downloaded from
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a> on 20190913 - wh=
ich
seems still current.

taz ~ # sha512sum /lib/firmware/amdgpu/navi10_*
d9f04485f53e92aa97ce6713b00236e273d40085015d3b65d34d704bae77f072b4bc709d48f=
a183691853de207569a23132eccbf7d05aff992e6c62140ee0e71
 /lib/firmware/amdgpu/navi10_asd.bin
d3631f12f444bf8a53e8e8ecf352c8601275444e6639b14075612c080cc84b9c2b5326ca905=
a40247c55c4eb2ec961ff93dcfc41b0b42f4ff64bb85a3dd4a0d4
 /lib/firmware/amdgpu/navi10_ce.bin
7867b095263d75ecc9cd071e85cacced4f61fa1f81b40335e83624910854deed8acb6017acd=
24e55bad0c410e979fbb142de24dfb4e46b68c3c8f30ba39f42c3
 /lib/firmware/amdgpu/navi10_gpu_info.bin
fd358b6412ff4e8b20df8173b29057cd5e53e8f421942e3e1b64cfd87afbcb383267e507710=
2550176f4b6597175e9d14d84113c296ec9358c3dfe76c912742d
 /lib/firmware/amdgpu/navi10_me.bin
a15f7861191ee7ed4ee1b475bee394ff418edb7e471203a8af29894caead12982b2ab924a86=
a337ba5e06fd4910a764e2f675f15f53968a38f6ce8db9fc20165
 /lib/firmware/amdgpu/navi10_mec2.bin
a15f7861191ee7ed4ee1b475bee394ff418edb7e471203a8af29894caead12982b2ab924a86=
a337ba5e06fd4910a764e2f675f15f53968a38f6ce8db9fc20165
 /lib/firmware/amdgpu/navi10_mec.bin
ac616d7be0867d6148a623a53ab5ef539dbae917c53c0e67883e3b763170cb880579be27094=
31cd1c6ca61be787732a0d0265812b7b7cfa263138b7fcc4d0f25
 /lib/firmware/amdgpu/navi10_pfp.bin
c5a3278009fed96ecdae0cf4ff8516bf23afcaa5eb5b3014cfd80a9275d8b2884aa3d0c8b18=
4ae9b3627c0e814ef670e445ad785b7b930114611cbc1c6c4724e
 /lib/firmware/amdgpu/navi10_rlc.bin
d975a66ecd7e02f27996c8badd0ceb7f452182f2d2c416e9269addedd291085c43111b30a32=
824d2bf99c4c90a12104d272ef6b4f077e49b72e7fa1a050c519d
 /lib/firmware/amdgpu/navi10_sdma1.bin
d975a66ecd7e02f27996c8badd0ceb7f452182f2d2c416e9269addedd291085c43111b30a32=
824d2bf99c4c90a12104d272ef6b4f077e49b72e7fa1a050c519d
 /lib/firmware/amdgpu/navi10_sdma.bin
3280d80b6d2f949b5a0c5f2b227ec7ef4bfa9affbad296dc127f49b64d45629cb6e067e0475=
97ceeeffdf28267455a6b08e4b9dd4c3627d0236fd5c7cbe9a6e3
 /lib/firmware/amdgpu/navi10_smc.bin
29c042f70637951ec549175194ea792cb0733c747313c04377e09e9f3dd2562c7ee242d7adf=
0713f226d8c58dd71921bfe6cbbb485b36e523e0381e074d2a4b5
 /lib/firmware/amdgpu/navi10_sos.bin
e92fc20428117c7a7ce951b3db80f534844d514d12db0fc72deb9ff593adee167a6c1f2f276=
13e344230c06e9b129d33cadf6ed1b6bed21cbeb86e613c664140
 /lib/firmware/amdgpu/navi10_vcn.bin</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689718280.3d47Fa5B.4439--

--===============1930423256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1930423256==--
