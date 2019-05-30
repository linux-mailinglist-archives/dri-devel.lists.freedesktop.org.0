Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933C30007
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5CF6E3AE;
	Thu, 30 May 2019 16:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7368F6E3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 16:15:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F7A072167; Thu, 30 May 2019 16:15:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Thu, 30 May 2019 16:15:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-icAdzwKSwz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0909183775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0909183775==
Content-Type: multipart/alternative; boundary="15592329123.4fEdB98F.17557"
Content-Transfer-Encoding: 7bit


--15592329123.4fEdB98F.17557
Date: Thu, 30 May 2019 16:15:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #32 from Tom B <tom@r.je> ---
This is still an issue in 5.1.5. It seems slightly more stable but I'm still
getting the high power usage and no boost clocks.=20

On a successful boot I see the following in dmesg:



[    3.628369] [drm] amdgpu: 16368M of VRAM memory ready
[    3.628371] [drm] amdgpu: 16368M of GTT memory ready.
[    3.629241] amdgpu 0000:44:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    3.629243] amdgpu 0000:44:00.0: psp v11.0: Failed to load firmware
"amdgpu/vega20_ta.bin"
[    4.260631] fbcon: amdgpudrmfb (fb0) is primary device
[    4.376861] amdgpu 0000:44:00.0: fb0: amdgpudrmfb frame buffer device
[    4.410360] amdgpu 0000:44:00.0: ring gfx uses VM inv eng 0 on hub 0
[    4.410363] amdgpu 0000:44:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    4.410365] amdgpu 0000:44:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    4.410367] amdgpu 0000:44:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    4.410369] amdgpu 0000:44:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    4.410371] amdgpu 0000:44:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    4.410372] amdgpu 0000:44:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    4.410374] amdgpu 0000:44:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    4.410376] amdgpu 0000:44:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    4.410378] amdgpu 0000:44:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    4.410380] amdgpu 0000:44:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    4.410382] amdgpu 0000:44:00.0: ring page0 uses VM inv eng 1 on hub 1
[    4.410383] amdgpu 0000:44:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    4.410385] amdgpu 0000:44:00.0: ring page1 uses VM inv eng 5 on hub 1
[    4.410386] amdgpu 0000:44:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    4.410388] amdgpu 0000:44:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    4.410390] amdgpu 0000:44:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    4.410391] amdgpu 0000:44:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    4.410392] amdgpu 0000:44:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    4.410393] amdgpu 0000:44:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    4.410394] amdgpu 0000:44:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    4.410396] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    4.410397] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    5.088344] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:44:00.0 on
minor 0
[    5.247245] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    5.247247] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    6.092850] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.092851] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    6.939351] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.939351] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    7.784543] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[    7.784544] amdgpu: [powerplay] Failed to set soft min gfxclk !
[    7.784545] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    7.842345] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.143759] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.143761] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.159090] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.159091] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.159092] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.245063] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.825759] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.825760] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.825919] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.825919] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.825920] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.826116] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.842518] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.842519] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.842691] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.842692] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.842692] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.885751] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.892421] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.892422] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.892614] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.892614] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.892615] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.892741] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.893595] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.893732] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.920997] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.921135] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.941712] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.941834] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.153837] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.154359] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.166532] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.170008] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.211796] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.227359] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[   15.447508] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[   15.449293] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592329123.4fEdB98F.17557
Date: Thu, 30 May 2019 16:15:12 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>This is still an issue in 5.1.5. It seems slightly more stable=
 but I'm still
getting the high power usage and no boost clocks.=20

On a successful boot I see the following in dmesg:



[    3.628369] [drm] amdgpu: 16368M of VRAM memory ready
[    3.628371] [drm] amdgpu: 16368M of GTT memory ready.
[    3.629241] amdgpu 0000:44:00.0: Direct firmware load for
amdgpu/vega20_ta.bin failed with error -2
[    3.629243] amdgpu 0000:44:00.0: psp v11.0: Failed to load firmware
&quot;amdgpu/vega20_ta.bin&quot;
[    4.260631] fbcon: amdgpudrmfb (fb0) is primary device
[    4.376861] amdgpu 0000:44:00.0: fb0: amdgpudrmfb frame buffer device
[    4.410360] amdgpu 0000:44:00.0: ring gfx uses VM inv eng 0 on hub 0
[    4.410363] amdgpu 0000:44:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    4.410365] amdgpu 0000:44:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    4.410367] amdgpu 0000:44:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    4.410369] amdgpu 0000:44:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    4.410371] amdgpu 0000:44:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    4.410372] amdgpu 0000:44:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    4.410374] amdgpu 0000:44:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    4.410376] amdgpu 0000:44:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    4.410378] amdgpu 0000:44:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    4.410380] amdgpu 0000:44:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    4.410382] amdgpu 0000:44:00.0: ring page0 uses VM inv eng 1 on hub 1
[    4.410383] amdgpu 0000:44:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    4.410385] amdgpu 0000:44:00.0: ring page1 uses VM inv eng 5 on hub 1
[    4.410386] amdgpu 0000:44:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    4.410388] amdgpu 0000:44:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    4.410390] amdgpu 0000:44:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    4.410391] amdgpu 0000:44:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    4.410392] amdgpu 0000:44:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    4.410393] amdgpu 0000:44:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    4.410394] amdgpu 0000:44:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    4.410396] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    4.410397] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    5.088344] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:44:00.0 on
minor 0
[    5.247245] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    5.247247] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    6.092850] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.092851] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    6.939351] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.939351] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    7.784543] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[    7.784544] amdgpu: [powerplay] Failed to set soft min gfxclk !
[    7.784545] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    7.842345] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.143759] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.143761] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.159090] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.159091] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.159092] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.245063] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.825759] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.825760] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.825919] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.825919] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.825920] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.826116] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.842518] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.842519] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.842691] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.842692] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.842692] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.885751] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.892421] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.892422] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.892614] amdgpu: [powerplay] Failed to send message 0x26, response 0x=
ff
[    8.892614] amdgpu: [powerplay] Failed to set soft min socclk!
[    8.892615] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[    8.892741] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.893595] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.893732] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.920997] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.921135] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.941712] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    8.941834] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.153837] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.154359] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.166532] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.170008] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.211796] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[    9.227359] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[   15.447508] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff
[   15.449293] amdgpu: [powerplay] Failed to send message 0x28, response 0x=
ff</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592329123.4fEdB98F.17557--

--===============0909183775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0909183775==--
