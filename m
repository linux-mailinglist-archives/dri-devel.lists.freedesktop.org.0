Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7580990
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 07:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7C06E1D6;
	Sun,  4 Aug 2019 05:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 315CC6E1D8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 05:05:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2DC4472167; Sun,  4 Aug 2019 05:05:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 04 Aug 2019 05:05:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-afpFF0LzWG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1830816441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1830816441==
Content-Type: multipart/alternative; boundary="15648951522.021e.13847"
Content-Transfer-Encoding: 7bit


--15648951522.021e.13847
Date: Sun, 4 Aug 2019 05:05:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #76 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Sylvain BERTRAND from comment #75)
> On Sat, Aug 03, 2019 at 05:43:01PM +0000, bugzilla-daemon@freedesktop.org
> wrote:
> > > > [    5.759204] amdgpu 0000:0a:00.0: Direct firmware load for
> > > > amdgpu/vega20_ta.bin failed with error -2
> > > > [    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmw=
are
> > > > "amdgpu/vega20_ta.bin"
>=20
> It seems you have a corrupted/old/missing vega20_ta.bin firmware file.
> It looks like outdated distro files.

Hello,
I did some quick search online and it seems a common problem for many users
amdgpu. And looking around on other reports they seem to be dismissed as
warnings and not mandatory. I am not an expert and I do not  want to dismis=
s it
here, just report what I see.

By the way, Interesting to see that even my ubuntu budgie LTS with valve
mesa-aco and different kernel, has the same warning.

[    5.435346] [drm] amdgpu kernel modesetting enabled.
[    5.435500] fb0: switching to amdgpudrmfb from EFI VGA
[    5.735058] amdgpu 0000:0a:00.0: No more image in the PCI ROM
[    5.735102] amdgpu 0000:0a:00.0: VRAM: 16368M 0x0000008000000000 -
0x00000083FEFFFFFF (16368M used)
[    5.735103] amdgpu 0000:0a:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    5.735104] amdgpu 0000:0a:00.0: AGP: 267894784M 0x0000008400000000 -
0x0000FFFFFFFFFFFF
[    5.735185] [drm] amdgpu: 16368M of VRAM memory ready
[    5.735186] [drm] amdgpu: 16368M of GTT memory ready.
[    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
"amdgpu/vega20_ta.bin"
[    6.354308] fbcon: amdgpudrmfb (fb0) is primary device
[    6.354490] amdgpu 0000:0a:00.0: fb0: amdgpudrmfb frame buffer device
[    6.384079] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[    6.384080] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    6.384081] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    6.384082] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    6.384083] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    6.384084] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    6.384084] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    6.384085] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    6.384086] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    6.384087] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    6.384088] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    6.384089] amdgpu 0000:0a:00.0: ring page0 uses VM inv eng 1 on hub 1
[    6.384089] amdgpu 0000:0a:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    6.384090] amdgpu 0000:0a:00.0: ring page1 uses VM inv eng 5 on hub 1
[    6.384090] amdgpu 0000:0a:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    6.384091] amdgpu 0000:0a:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    6.384092] amdgpu 0000:0a:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    6.384092] amdgpu 0000:0a:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    6.384093] amdgpu 0000:0a:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    6.384094] amdgpu 0000:0a:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    6.384094] amdgpu 0000:0a:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    6.384095] amdgpu 0000:0a:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    6.384096] amdgpu 0000:0a:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    7.067068] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:0a:00.0 on
minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648951522.021e.13847
Date: Sun, 4 Aug 2019 05:05:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c76">Comme=
nt # 76</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Sylvain BERTRAND from <a href=3D"show_bug.cgi?id=
=3D109955#c75">comment #75</a>)
<span class=3D"quote">&gt; On Sat, Aug 03, 2019 at 05:43:01PM +0000, <a hre=
f=3D"mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freede=
sktop.org</a>
&gt; wrote:
&gt; &gt; &gt; &gt; [    5.759204] amdgpu 0000:0a:00.0: Direct firmware loa=
d for
&gt; &gt; &gt; &gt; amdgpu/vega20_ta.bin failed with error -2
&gt; &gt; &gt; &gt; [    5.759205] amdgpu 0000:0a:00.0: psp v11.0: Failed t=
o load firmware
&gt; &gt; &gt; &gt; &quot;amdgpu/vega20_ta.bin&quot;
&gt;=20
&gt; It seems you have a corrupted/old/missing vega20_ta.bin firmware file.
&gt; It looks like outdated distro files.</span >

Hello,
I did some quick search online and it seems a common problem for many users
amdgpu. And looking around on other reports they seem to be dismissed as
warnings and not mandatory. I am not an expert and I do not  want to dismis=
s it
here, just report what I see.

By the way, Interesting to see that even my ubuntu budgie LTS with valve
mesa-aco and different kernel, has the same warning.

[    5.435346] [drm] amdgpu kernel modesetting enabled.
[    5.435500] fb0: switching to amdgpudrmfb from EFI VGA
[    5.735058] amdgpu 0000:0a:00.0: No more image in the PCI ROM
[    5.735102] amdgpu 0000:0a:00.0: VRAM: 16368M 0x0000008000000000 -
0x00000083FEFFFFFF (16368M used)
[    5.735103] amdgpu 0000:0a:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    5.735104] amdgpu 0000:0a:00.0: AGP: 267894784M 0x0000008400000000 -
0x0000FFFFFFFFFFFF
[    5.735185] [drm] amdgpu: 16368M of VRAM memory ready
[    5.735186] [drm] amdgpu: 16368M of GTT memory ready.
[    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
&quot;amdgpu/vega20_ta.bin&quot;
[    6.354308] fbcon: amdgpudrmfb (fb0) is primary device
[    6.354490] amdgpu 0000:0a:00.0: fb0: amdgpudrmfb frame buffer device
[    6.384079] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[    6.384080] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    6.384081] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    6.384082] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    6.384083] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    6.384084] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    6.384084] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    6.384085] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    6.384086] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    6.384087] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    6.384088] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    6.384089] amdgpu 0000:0a:00.0: ring page0 uses VM inv eng 1 on hub 1
[    6.384089] amdgpu 0000:0a:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    6.384090] amdgpu 0000:0a:00.0: ring page1 uses VM inv eng 5 on hub 1
[    6.384090] amdgpu 0000:0a:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    6.384091] amdgpu 0000:0a:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    6.384092] amdgpu 0000:0a:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    6.384092] amdgpu 0000:0a:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    6.384093] amdgpu 0000:0a:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    6.384094] amdgpu 0000:0a:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    6.384094] amdgpu 0000:0a:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    6.384095] amdgpu 0000:0a:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    6.384096] amdgpu 0000:0a:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    7.067068] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:0a:00.0 on
minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648951522.021e.13847--

--===============1830816441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1830816441==--
