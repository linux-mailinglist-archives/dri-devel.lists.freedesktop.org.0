Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F41B18B47
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FE110E32A;
	Sat,  2 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nl/fFCem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA34610E2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 16:51:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4ae73b0a891so24080301cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754067114; x=1754671914; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y9ECYOLLAIQAbD2pEWuqYO8ZzQwp7kJcvRDUK76eRyI=;
 b=nl/fFCemmb+vgViv7q/aPN6/5Ojya1rbMUi76A3Wpvd7EgEzyxptke4VfcorlsFnyT
 DPVKRfSF7MhBmi2pgOt9tuJYf6b1aZ20Dvjq8CYoYhtAKF44+SElJU+s6U2Z5Dbx2dlL
 0zos5QMfmu9aDCE1NbecKO2DuMHL/q5+ELVdJd+w6nyMi/pCjxyENuao/x7zhGSIZrcH
 xjmIGFCiHUY/AhsSNBunWSjbHAxbP1jx3LvxHRiJqRWc/+YQrHN8njoT7nKEP9gR7eWJ
 fV/FPtb2bBEx6fICMLtRRXew+ms/7up7CMP2CJQfrtbraP+OtzB+B6kLX0YU2eTmvd1/
 Hj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754067114; x=1754671914;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y9ECYOLLAIQAbD2pEWuqYO8ZzQwp7kJcvRDUK76eRyI=;
 b=Eb8ALmMaS01NsoZrRd1hTEuXexIgEHTyY8k8evTrEWdIc+caQysI9zujHjlj1Q9Phi
 RRk0heKtvLHVSEuzwRaOIRVv5/ZjoELq5sCahxy3vXFPo4BzQo/jyEK5lFKrdE0Aw8dt
 rC5SvSh6rJ0d23batCes9rvdd8LA9IYVvhIJM/GH64fSEmzP2Xy5hVOosvZh83aFFMu9
 +ThHWBG0LxpjfRhR3WyZBNCG2mR31k57j4Cnl6TbrOxAaDR3tRM7UR0X6C3h71NAbQoE
 WUgao0j+NM9/NaINQCAEHqv5XxEy5FwGnTGXjT+HR5Q3SP8UMyoyLW0HLDicuhIVHV7b
 bj6A==
X-Gm-Message-State: AOJu0YwfQViLbYqbMDSq9vjdftRB7jIXv8rMEwqQZq7oxak8v8B9VMhd
 pkOeJ+YXQa2KlLPuqq0Uf3dTvq8Xk9ILICPNhzCM+oOx+UZoXnOhhVTZ93q50tIcN3VtIK7WyfF
 Di/6zF4KLQd44xUOx+RsAO6KHBango3Q1SZ1SRvGkKL8A
X-Gm-Gg: ASbGncsO5VN0l5Xuo1p3HNKBikuIKTgwuW3tm1VE+PrzOQv8MQuGILp5ej/g7GukLxR
 u4yLLntXXDNVslWvouIII7HdGosNWa1refOlwxaLJoyf++XXuIw85LStDWzyeZ/vwOn4rUQFCXh
 w6ZCb5u+9OgWiV1vnVdC3gurfIq+7C2RDUPNGVBiB+TTEpY0kSZIpo8on4q8WclYkxXxaF/g0IN
 dojlbxVoB2/0akaY8ltoj2NT7wGz7i7eD1C1Mw=
X-Google-Smtp-Source: AGHT+IFNBDQaYwyVOhJsgRrV1wohsr8BxsVWdvuPJKQzI4fZ0Fv9LEwCZE1ezSoM15v6hOhoW3HcrRDF3qgsTdNBsZs=
X-Received: by 2002:a05:6214:c62:b0:707:451e:2787 with SMTP id
 6a1803df08f44-709366d0f49mr4389766d6.28.1754067113488; Fri, 01 Aug 2025
 09:51:53 -0700 (PDT)
MIME-Version: 1.0
From: Alvaro Madela <alvaromadela@gmail.com>
Date: Fri, 1 Aug 2025 13:51:42 -0300
X-Gm-Features: Ac12FXzaj3TojPQrLtQAiZFCRO41P6MryoHoELZLI3dFwW4FIf3JIdsHXw0AUQY
Message-ID: <CALNP1JaK=LoavsmHcBXjr+ZboHFgteXR1pcPOSLxSvgdYHiD3A@mail.gmail.com>
Subject: [i915] Arrow Lake [8086:7d67] - No video output with kernel 6.16
 (Ubuntu 24.04)
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000364c8b063b50936b"
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:22 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000364c8b063b50936b
Content-Type: text/plain; charset="UTF-8"

Hello Intel Linux Graphics Team,

I'm using an Intel Arrow Lake GPU (8086:7d67) on Ubuntu 24.04 (kernel 6.16)
and facing complete lack of video output without 'nomodeset'.

Problem Description:
- GPU: Intel Arrow Lake [8086:7d67] (Core Ultra 7 265K)
- Kernel: 6.16.0-xx-generic (Ubuntu 24.04)
- Issue: No display output with i915 driver, requires 'nomodeset' to boot
- Current workaround: Using fbdev/vesa drivers at 1920x1080

Steps to Reproduce:
1. Boot system with default i915 driver
2. Screen remains black or shows corruption

Debug Data:
=== lspci -nn | grep VGA ===
00:02.0 VGA compatible controller [0300]: Intel Corporation Arrow Lake-U
[Intel Graphics] [8086:7d67] (rev 06)
80:14.5 Non-VGA unclassified device [0000]: Intel Corporation Device
[8086:7f2f] (rev 10)

=== dmesg | grep -i i915 ===
nothing

=== xrandr --verbose ===
Screen 0: minimum 16 x 16, current 1920 x 1080, maximum 32767 x 32767
None-1 connected primary 1920x1080+0+0 (0x41) normal (normal left inverted
right x axis y axis) 508mm x 285mm
Identifier: 0x21
Timestamp:  50331
Subpixel:   unknown
Gamma:      1.0:1.0:1.0
Brightness: 0.0
Clones:
CRTC:       0
CRTCs:      0
Transform:  1.000000 0.000000 0.000000
           0.000000 1.000000 0.000000
           0.000000 0.000000 1.000000
          filter:
RANDR Emulation: 1
non-desktop: 0
supported: 0, 1
  1920x1080 (0x41) 173.000MHz -HSync +VSync *current +preferred
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock
 67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock
 59.96Hz
  1440x1080 (0x42) 129.000MHz -HSync +VSync
        h: width  1440 start 1528 end 1680 total 1920 skew    0 clock
 67.19KHz
        v: height 1080 start 1083 end 1087 total 1120           clock
 59.99Hz
  1400x1050 (0x43) 121.750MHz -HSync +VSync
        h: width  1400 start 1488 end 1632 total 1864 skew    0 clock
 65.32KHz
        v: height 1050 start 1053 end 1057 total 1089           clock
 59.98Hz
  1280x1024 (0x44) 109.000MHz -HSync +VSync
        h: width  1280 start 1368 end 1496 total 1712 skew    0 clock
 63.67KHz
        v: height 1024 start 1027 end 1034 total 1063           clock
 59.89Hz
  1280x960 (0x45) 101.250MHz -HSync +VSync
        h: width  1280 start 1360 end 1488 total 1696 skew    0 clock
 59.70KHz
        v: height  960 start  963 end  967 total  996           clock
 59.94Hz
  1152x864 (0x46) 81.750MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock
 53.78KHz
        v: height  864 start  867 end  871 total  897           clock
 59.96Hz
  1024x768 (0x47) 63.500MHz -HSync +VSync
        h: width  1024 start 1072 end 1176 total 1328 skew    0 clock
 47.82KHz
        v: height  768 start  771 end  775 total  798           clock
 59.92Hz
  800x600 (0x48) 38.250MHz -HSync +VSync
        h: width   800 start  832 end  912 total 1024 skew    0 clock
 37.35KHz
        v: height  600 start  603 end  607 total  624           clock
 59.86Hz
  640x480 (0x49) 23.750MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock
 29.69KHz
        v: height  480 start  483 end  487 total  500           clock
 59.38Hz
  320x240 (0x4a)  6.000MHz -HSync +VSync
        h: width   320 start  336 end  360 total  400 skew    0 clock
 15.00KHz
        v: height  240 start  243 end  247 total  252           clock
 59.52Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock
 65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock
 59.95Hz
  1440x900 (0x4c) 106.500MHz -HSync +VSync
        h: width  1440 start 1528 end 1672 total 1904 skew    0 clock
 55.93KHz
        v: height  900 start  903 end  909 total  934           clock
 59.89Hz
  1280x800 (0x4d) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock
 49.70KHz
        v: height  800 start  803 end  809 total  831           clock
 59.81Hz
  1152x720 (0x4e) 66.750MHz -HSync +VSync
        h: width  1152 start 1208 end 1320 total 1488 skew    0 clock
 44.86KHz
        v: height  720 start  723 end  729 total  748           clock
 59.97Hz
  960x600 (0x4f) 45.250MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock
 37.21KHz
        v: height  600 start  603 end  609 total  624           clock
 59.63Hz
  928x580 (0x50) 42.750MHz -HSync +VSync
        h: width   928 start  968 end 1056 total 1184 skew    0 clock
 36.11KHz
        v: height  580 start  583 end  589 total  603           clock
 59.88Hz
  800x500 (0x51) 30.750MHz -HSync +VSync
        h: width   800 start  824 end  896 total  992 skew    0 clock
 31.00KHz
        v: height  500 start  503 end  509 total  521           clock
 59.50Hz
  768x480 (0x52) 28.750MHz -HSync +VSync
        h: width   768 start  792 end  864 total  960 skew    0 clock
 29.95KHz
        v: height  480 start  483 end  489 total  500           clock
 59.90Hz
  720x480 (0x53) 26.750MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock
 29.85KHz
        v: height  480 start  483 end  493 total  500           clock
 59.71Hz
  640x400 (0x54) 20.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock
 25.00KHz
        v: height  400 start  403 end  409 total  417           clock
 59.95Hz
  320x200 (0x55)  5.000MHz -HSync +VSync
        h: width   320 start  336 end  360 total  400 skew    0 clock
 12.50KHz
        v: height  200 start  203 end  209 total  212           clock
 58.96Hz
  1600x900 (0x56) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock
 55.99KHz
        v: height  900 start  903 end  908 total  934           clock
 59.95Hz
  1368x768 (0x57) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock
 47.79KHz
        v: height  768 start  771 end  781 total  798           clock
 59.88Hz
  1280x720 (0x58) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock
 44.77KHz
        v: height  720 start  723 end  728 total  748           clock
 59.86Hz
  1024x576 (0x59) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock
 35.88KHz
        v: height  576 start  579 end  584 total  599           clock
 59.90Hz
  864x486 (0x5a) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock
 30.32KHz
        v: height  486 start  489 end  494 total  506           clock
 59.92Hz
  720x400 (0x5b) 22.250MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock
 24.83KHz
        v: height  400 start  403 end  413 total  417           clock
 59.55Hz
  640x350 (0x5c) 17.500MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock
 21.88KHz
        v: height  350 start  353 end  363 total  366           clock
 59.77Hz

Request:
Please add support for Arrow Lake [8086:7d67] in future kernel releases.

Thanks

Alvaro Madela.

--000000000000364c8b063b50936b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Intel Linux Graphics Team, =C2=A0<br><br>I&#39;m usi=
ng an Intel Arrow Lake GPU (8086:7d67) on Ubuntu 24.04 (kernel 6.16) and fa=
cing complete lack of video output without &#39;nomodeset&#39;.=C2=A0=C2=A0=
<div><br></div><div>Problem Description:<br>- GPU: Intel Arrow Lake [8086:7=
d67] (Core Ultra 7 265K)<br>- Kernel: 6.16.0-xx-generic (Ubuntu 24.04)<br>-=
 Issue: No display output with i915 driver, requires &#39;nomodeset&#39; to=
 boot<br>- Current workaround: Using fbdev/vesa drivers at 1920x1080<br><br=
>Steps to Reproduce:<br>1. Boot system with default i915 driver<br>2. Scree=
n remains black or shows corruption<br><br>Debug Data:</div><div>=3D=3D=3D =
lspci -nn | grep VGA =3D=3D=3D</div><div>00:02.0 VGA compatible controller =
[0300]: Intel Corporation Arrow Lake-U [Intel Graphics] [8086:7d67] (rev 06=
)<br>80:14.5 Non-VGA unclassified device [0000]: Intel Corporation Device [=
8086:7f2f] (rev 10)<br></div><div><br></div><div>=3D=3D=3D dmesg | grep -i =
i915 =3D=3D=3D<br>nothing<br><br>=3D=3D=3D xrandr --verbose =3D=3D=3D</div>=
<div>Screen 0: minimum 16 x 16, current 1920 x 1080, maximum 32767 x 32767<=
br>None-1 connected primary 1920x1080+0+0 (0x41) normal (normal left invert=
ed right x axis y axis) 508mm x 285mm<br>	Identifier: 0x21<br>	Timestamp: =
=C2=A050331<br>	Subpixel: =C2=A0 unknown<br>	Gamma: =C2=A0 =C2=A0 =C2=A01.0=
:1.0:1.0<br>	Brightness: 0.0<br>	Clones: =C2=A0 =C2=A0<br>	CRTC: =C2=A0 =C2=
=A0 =C2=A0 0<br>	CRTCs: =C2=A0 =C2=A0 =C2=A00<br>	Transform: =C2=A01.000000=
 0.000000 0.000000<br>	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.000000 1=
.000000 0.000000<br>	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.000000 0.0=
00000 1.000000<br>	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter: <br>	RANDR E=
mulation: 1 <br>	non-desktop: 0 <br>		supported: 0, 1<br>=C2=A0 1920x1080 (=
0x41) 173.000MHz -HSync +VSync *current +preferred<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 h: width =C2=A01920 start 2048 end 2248 total 2576 skew =C2=A0 =C2=
=A00 clock =C2=A067.16KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height 1080 sta=
rt 1083 end 1088 total 1120 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A0=
59.96Hz<br>=C2=A0 1440x1080 (0x42) 129.000MHz -HSync +VSync<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 h: width =C2=A01440 start 1528 end 1680 total 1920 skew =
=C2=A0 =C2=A00 clock =C2=A067.19KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: heigh=
t 1080 start 1083 end 1087 total 1120 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cl=
ock =C2=A059.99Hz<br>=C2=A0 1400x1050 (0x43) 121.750MHz -HSync +VSync<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01400 start 1488 end 1632 total 1=
864 skew =C2=A0 =C2=A00 clock =C2=A065.32KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 v: height 1050 start 1053 end 1057 total 1089 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 clock =C2=A059.98Hz<br>=C2=A0 1280x1024 (0x44) 109.000MHz -HSync +VS=
ync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01280 start 1368 end 1496 =
total 1712 skew =C2=A0 =C2=A00 clock =C2=A063.67KHz<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 v: height 1024 start 1027 end 1034 total 1063 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 clock =C2=A059.89Hz<br>=C2=A0 1280x960 (0x45) 101.250MHz -HSy=
nc +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01280 start 1360 end=
 1488 total 1696 skew =C2=A0 =C2=A00 clock =C2=A059.70KHz<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v: height =C2=A0960 start =C2=A0963 end =C2=A0967 total =C2=
=A0996 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.94Hz<br>=C2=A0 115=
2x864 (0x46) 81.750MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: widt=
h =C2=A01152 start 1216 end 1336 total 1520 skew =C2=A0 =C2=A00 clock =C2=
=A053.78KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0864 start =C2=A0=
867 end =C2=A0871 total =C2=A0897 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =
=C2=A059.96Hz<br>=C2=A0 1024x768 (0x47) 63.500MHz -HSync +VSync<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 h: width =C2=A01024 start 1072 end 1176 total 1328 ske=
w =C2=A0 =C2=A00 clock =C2=A047.82KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: hei=
ght =C2=A0768 start =C2=A0771 end =C2=A0775 total =C2=A0798 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 clock =C2=A059.92Hz<br>=C2=A0 800x600 (0x48) 38.250MHz=
 -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 800 start =C2=
=A0832 end =C2=A0912 total 1024 skew =C2=A0 =C2=A00 clock =C2=A037.35KHz<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0600 start =C2=A0603 end =C2=A0=
607 total =C2=A0624 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.86Hz<=
br>=C2=A0 640x480 (0x49) 23.750MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 h: width =C2=A0 640 start =C2=A0664 end =C2=A0720 total =C2=A0800 sk=
ew =C2=A0 =C2=A00 clock =C2=A029.69KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: he=
ight =C2=A0480 start =C2=A0483 end =C2=A0487 total =C2=A0500 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 clock =C2=A059.38Hz<br>=C2=A0 320x240 (0x4a) =C2=A06.0=
00MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 320 star=
t =C2=A0336 end =C2=A0360 total =C2=A0400 skew =C2=A0 =C2=A00 clock =C2=A01=
5.00KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0240 start =C2=A0243 =
end =C2=A0247 total =C2=A0252 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=
=A059.52Hz<br>=C2=A0 1680x1050 (0x4b) 146.250MHz -HSync +VSync<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 h: width =C2=A01680 start 1784 end 1960 total 2240 ske=
w =C2=A0 =C2=A00 clock =C2=A065.29KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: hei=
ght 1050 start 1053 end 1059 total 1089 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
clock =C2=A059.95Hz<br>=C2=A0 1440x900 (0x4c) 106.500MHz -HSync +VSync<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01440 start 1528 end 1672 total 1=
904 skew =C2=A0 =C2=A00 clock =C2=A055.93KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 v: height =C2=A0900 start =C2=A0903 end =C2=A0909 total =C2=A0934 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.89Hz<br>=C2=A0 1280x800 (0x4d) 8=
3.500MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01280 s=
tart 1352 end 1480 total 1680 skew =C2=A0 =C2=A00 clock =C2=A049.70KHz<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0800 start =C2=A0803 end =C2=A08=
09 total =C2=A0831 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.81Hz<b=
r>=C2=A0 1152x720 (0x4e) 66.750MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 h: width =C2=A01152 start 1208 end 1320 total 1488 skew =C2=A0 =C2=
=A00 clock =C2=A044.86KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A072=
0 start =C2=A0723 end =C2=A0729 total =C2=A0748 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 clock =C2=A059.97Hz<br>=C2=A0 960x600 (0x4f) 45.250MHz -HSync +VSyn=
c<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 960 start =C2=A0992 end 10=
88 total 1216 skew =C2=A0 =C2=A00 clock =C2=A037.21KHz<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 v: height =C2=A0600 start =C2=A0603 end =C2=A0609 total =C2=A062=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.63Hz<br>=C2=A0 928x580 =
(0x50) 42.750MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=
=A0 928 start =C2=A0968 end 1056 total 1184 skew =C2=A0 =C2=A00 clock =C2=
=A036.11KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0580 start =C2=A0=
583 end =C2=A0589 total =C2=A0603 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =
=C2=A059.88Hz<br>=C2=A0 800x500 (0x51) 30.750MHz -HSync +VSync<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 800 start =C2=A0824 end =C2=A0896 tota=
l =C2=A0992 skew =C2=A0 =C2=A00 clock =C2=A031.00KHz<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 v: height =C2=A0500 start =C2=A0503 end =C2=A0509 total =C2=A052=
1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.50Hz<br>=C2=A0 768x480 =
(0x52) 28.750MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=
=A0 768 start =C2=A0792 end =C2=A0864 total =C2=A0960 skew =C2=A0 =C2=A00 c=
lock =C2=A029.95KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0480 star=
t =C2=A0483 end =C2=A0489 total =C2=A0500 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clock =C2=A059.90Hz<br>=C2=A0 720x480 (0x53) 26.750MHz -HSync +VSync<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 720 start =C2=A0744 end =C2=A0=
808 total =C2=A0896 skew =C2=A0 =C2=A00 clock =C2=A029.85KHz<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 v: height =C2=A0480 start =C2=A0483 end =C2=A0493 total =
=C2=A0500 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.71Hz<br>=C2=A0 =
640x400 (0x54) 20.000MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: wi=
dth =C2=A0 640 start =C2=A0664 end =C2=A0720 total =C2=A0800 skew =C2=A0 =
=C2=A00 clock =C2=A025.00KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=
=A0400 start =C2=A0403 end =C2=A0409 total =C2=A0417 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 clock =C2=A059.95Hz<br>=C2=A0 320x200 (0x55) =C2=A05.000MHz -=
HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 320 start =C2=
=A0336 end =C2=A0360 total =C2=A0400 skew =C2=A0 =C2=A00 clock =C2=A012.50K=
Hz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0200 start =C2=A0203 end =
=C2=A0209 total =C2=A0212 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A058=
.96Hz<br>=C2=A0 1600x900 (0x56) 118.250MHz -HSync +VSync<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 h: width =C2=A01600 start 1696 end 1856 total 2112 skew =C2=
=A0 =C2=A00 clock =C2=A055.99KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =
=C2=A0900 start =C2=A0903 end =C2=A0908 total =C2=A0934 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 clock =C2=A059.95Hz<br>=C2=A0 1368x768 (0x57) 85.250MHz -=
HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01368 start 1440 =
end 1576 total 1784 skew =C2=A0 =C2=A00 clock =C2=A047.79KHz<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 v: height =C2=A0768 start =C2=A0771 end =C2=A0781 total =
=C2=A0798 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.88Hz<br>=C2=A0 =
1280x720 (0x58) 74.500MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: w=
idth =C2=A01280 start 1344 end 1472 total 1664 skew =C2=A0 =C2=A00 clock =
=C2=A044.77KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0720 start =C2=
=A0723 end =C2=A0728 total =C2=A0748 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clo=
ck =C2=A059.86Hz<br>=C2=A0 1024x576 (0x59) 46.500MHz -HSync +VSync<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A01024 start 1064 end 1160 total 1296=
 skew =C2=A0 =C2=A00 clock =C2=A035.88KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v:=
 height =C2=A0576 start =C2=A0579 end =C2=A0584 total =C2=A0599 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.90Hz<br>=C2=A0 864x486 (0x5a) 32.50=
0MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 864 start=
 =C2=A0888 end =C2=A0968 total 1072 skew =C2=A0 =C2=A00 clock =C2=A030.32KH=
z<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0486 start =C2=A0489 end =
=C2=A0494 total =C2=A0506 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059=
.92Hz<br>=C2=A0 720x400 (0x5b) 22.250MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 h: width =C2=A0 720 start =C2=A0744 end =C2=A0808 total =C2=A089=
6 skew =C2=A0 =C2=A00 clock =C2=A024.83KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
: height =C2=A0400 start =C2=A0403 end =C2=A0413 total =C2=A0417 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=A059.55Hz<br>=C2=A0 640x350 (0x5c) 17.50=
0MHz -HSync +VSync<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h: width =C2=A0 640 start=
 =C2=A0664 end =C2=A0720 total =C2=A0800 skew =C2=A0 =C2=A00 clock =C2=A021=
.88KHz<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 v: height =C2=A0350 start =C2=A0353 e=
nd =C2=A0363 total =C2=A0366 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock =C2=
=A059.77Hz<br><br>Request:<br>Please add support for Arrow Lake [8086:7d67]=
 in future kernel releases.</div><div><br></div><div>Thanks<br><br>Alvaro M=
adela.</div></div>

--000000000000364c8b063b50936b--
