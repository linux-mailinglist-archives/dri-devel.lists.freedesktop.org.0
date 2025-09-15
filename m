Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28DB5853B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 21:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9118010E114;
	Mon, 15 Sep 2025 19:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="da3i4x4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F810E114
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 19:22:23 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8276e579242so216867285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757964142; x=1758568942; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=al5/QaRmI4Fyop8+G78hecwI8fam/PPoVZVR9OpZXuU=;
 b=da3i4x4/U1RdcNMp1DCsN2EMKBpdAQ7WXyvAFXmwtQpC+3cehFQdCbTmePjm8AVBEm
 NfI9WSA+2yFndyGa39sBdC0Bmw5tUFUseCBbKxsD85qZiPolGKGCabVRenXV2e3pUhVF
 c55hZSG9jftwzfqV1lzdAMWMmGqOzpiUt0cXj1ZyqXylTrtSLJVFViQUzDEEIENuTyj+
 tYJsx8khvsvrKej7GTBGU6AWxRwXqxhEEFgKe8IwV43dbtIzM6Fic0Buz+VIniMHZdvC
 OnAZlZIpTjMcyVTHq3E52EknKe8dtxnyCyH1KtuwOYN8IMIF5IzGn203YFKbDgXAQbbo
 9TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757964142; x=1758568942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=al5/QaRmI4Fyop8+G78hecwI8fam/PPoVZVR9OpZXuU=;
 b=pjhu4AXWV8POq/AU+CUwWQ+IYQ4cwgC8bpcy23b9oHL6RaWcJSMb1qEaE9o4zBCNyj
 2SebuCEjLnFXYnvrV+Y8KHkARj8k71IuhA8E61o3ioclWK7dOhkmspyCAsjypm5ZfIgX
 CgIbtGozaKVlZ8TXRGyfVesVXTlUJTkIwNTv83TucQ2dKr6Al3rhQhifbxNAeZD2eJ8R
 wmSG15WvQVamZq6er8qKmgcG+9C3lmexQA1OR6SmhD53YnzgOW9CwAnVHJF6U2D6TV2Y
 dNM214ODoxNcZOlquKKt/wRkMuBJb2vb15JCfWFncHhZI2TwkEmz4iHLAn9+myMYiYyo
 JAuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYE+LHTfpadfJ4OQ/lO7hhux03HkGD5EJlIWhzb6BjMdUpYxzycYy2ERU8QARUi+NZUOQ+fI8K3qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNzUzMVS/jFIfxWakaTtp+psg43ww6py9wCOxtsBvxlAwpyB3o
 JKvESiSRy5eL996jVHbDisGTguQ6tXhASdav+8M6w7Tql25BRm750Ci0vVa6gvGHl5oX+oZk0co
 w8nIiQMSVHlWRjwjQWeofjUJbZWuEdkU=
X-Gm-Gg: ASbGncsN4/cwABBqyx2bgOUTG0qSxOvDxPEN+kh+3RuVnCi/8md1EpwyqSCLxFdIev7
 489dBdCWI4Wc/nZ22eHa2myPzixWTSMxW8cWtDwvRX5YxEFn9tGJWI7AeQ6ixdt4E8kSWMRof6a
 g8CvmWbRNe29yzssk8eC9ee8mdZjGOAJaG+o9vgweBafgUSjxEk939Cco4PzTLFxlM2GzaWXsLd
 scc24xV8y/kYGjIVwEREy7ebywpYTiNrKnOj1CdlA==
X-Google-Smtp-Source: AGHT+IFwT3+8QSdw8bVVOPtYpiCrsiRW2qjfy3wczOneddPvKF3UaYC4KPP4I/SB7irlVFhfaV5rIBYj/SBCu7VWSvY=
X-Received: by 2002:a05:620a:103b:b0:810:731f:32ff with SMTP id
 af79cd13be357-823ffcb21cemr1740580785a.50.1757964142090; Mon, 15 Sep 2025
 12:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
In-Reply-To: <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
From: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Date: Mon, 15 Sep 2025 21:22:11 +0200
X-Gm-Features: AS18NWA84wvz7YImxvaBJOV3Q39dTZVzml3i1bk3g61QCwj6dYVfstAeCeT1dbk
Message-ID: <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch
Content-Type: multipart/alternative; boundary="000000000000379cb3063edbecab"
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

--000000000000379cb3063edbecab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> That's not the complete EDID data, though. It's missing 6*16 bytes. If
> you go by the hex offsets, 0x100 does not follow 0x090.

>  please grab the EDID from sysfs.

Fresh from my terminal:
=E2=9E=9C  ~ cat /sys/class/drm/card1-eDP-1/edid | edid-decode
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 6f 16 14 00 00 00 00
00 20 01 04 b5 1e 13 78 03 21 15 a8 53 49 9c 25
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 87 40 a0 b0 08 6a 70 30 20
36 00 2d bc 10 00 00 18 00 00 00 fd 00 28 78 e5
e5 46 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 45 30 30 37 5a 41 31 2d 35 0a 20 01 af

70 13 79 00 00 03 01 14 9a 0f 01 05 3f 0b 9f 00
2f 00 1f 00 07 07 69 00 02 00 05 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 98

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: CSO
    Model: 5142
    Made in: 2022
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 10
    DisplayPort interface
    Maximum image size: 30 cm x 19 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and preferred
refresh rate
    Display supports continuous frequencies
  Color Characteristics:
    Red  : 0.6562, 0.3261
    Green: 0.2851, 0.6103
    Blue : 0.1445, 0.0595
    White: 0.3134, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  2880x1800   60.000966 Hz  16:10   114.362 kHz    347.660000 MHz
(301 mm x 188 mm)
                 Hfront   48 Hsync  32 Hback   80 Hpol N
                 Vfront    3 Vsync   6 Vback   97 Vpol N
    Display Range Limits:
      Monitor ranges (Range Limits Only): 40-120 Hz V, 229-229 kHz H, max
dotclock 700 MHz
    Alphanumeric Data String: 'CSOT T3'
    Alphanumeric Data String: 'MNE007ZA1-5'
  Extension blocks: 1
Checksum: 0xaf

----------------

Block 1, DisplayID Extension Block:
  Version: 1.3
  Extension Count: 0
  Display Product Type: Extension Section
  Video Timing Modes Type 1 - Detailed Timings Data Block:
    DTD:  2880x1800  120.000207 Hz  16:10   228.720 kHz    695.310000 MHz
(aspect 16:10, no 3D stereo)
               Hfront   48 Hsync  32 Hback   80 Hpol N
               Vfront    3 Vsync   6 Vback   97 Vpol N
  Checksum: 0xf0 (should be 0xf8)
Checksum: 0x98

Let me know if you need something else from my side.

> There is code already to ignore EDID checksum for CEA extension
> blocks, look for EDID_BLOCK_CHECKSUM, it probably could be extended to
> cover displayid blocks,
Are you recommending me to make use of this to suggest a fix/bypass, or is
that just a suggestion for the other maintainers?

> Otherwise I do wonder how common this is, and whether it should be
> quirk per panel or just always do it.
This is the machine model, from Lenovo's website:
https://pcsupport.lenovo.com/de/en/products/laptops-and-netbooks/5-series/i=
deapad-pro-5-14aph8/83am/83amcto1ww
There probably plenty of other models that make use of the same panel.

Thanks for looking into this,
Tiago

--000000000000379cb3063edbecab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail-HOEnZb gmail-adM"><div class=3D"g=
mail-im">&gt; That&#39;s not the complete EDID data, though. It&#39;s missi=
ng 6*16 bytes. If</div></div>&gt; you go by the hex offsets, 0x100 does not=
 follow 0x090.<span class=3D"gmail-im"><br><br>&gt;=C2=A0</span> please gra=
b the EDID from sysfs.<div><br></div><div>Fresh from my terminal:<br>=E2=9E=
=9C =C2=A0~ cat /sys/class/drm/card1-eDP-1/edid | edid-decode<br>edid-decod=
e (hex):<br><br>00 ff ff ff ff ff ff 00 0e 6f 16 14 00 00 00 00<br>00 20 01=
 04 b5 1e 13 78 03 21 15 a8 53 49 9c 25<br>0f 50 54 00 00 00 01 01 01 01 01=
 01 01 01 01 01<br>01 01 01 01 01 01 ce 87 40 a0 b0 08 6a 70 30 20<br>36 00=
 2d bc 10 00 00 18 00 00 00 fd 00 28 78 e5<br>e5 46 01 0a 20 20 20 20 20 20=
 00 00 00 fe 00 43<br>53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe<br>00=
 4d 4e 45 30 30 37 5a 41 31 2d 35 0a 20 01 af<br><br>70 13 79 00 00 03 01 1=
4 9a 0f 01 05 3f 0b 9f 00<br>2f 00 1f 00 07 07 69 00 02 00 05 00 00 00 00 0=
0<br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00<br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00<br>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 f0 98<br><br>----------------<br><br>Block 0, Base EDID:<br>=C2=A0 EDID S=
tructure Version &amp; Revision: 1.4<br>=C2=A0 Vendor &amp; Product Identif=
ication:<br>=C2=A0 =C2=A0 Manufacturer: CSO<br>=C2=A0 =C2=A0 Model: 5142<br=
>=C2=A0 =C2=A0 Made in: 2022<br>=C2=A0 Basic Display Parameters &amp; Featu=
res:<br>=C2=A0 =C2=A0 Digital display<br>=C2=A0 =C2=A0 Bits per primary col=
or channel: 10<br>=C2=A0 =C2=A0 DisplayPort interface<br>=C2=A0 =C2=A0 Maxi=
mum image size: 30 cm x 19 cm<br>=C2=A0 =C2=A0 Gamma: 2.20<br>=C2=A0 =C2=A0=
 Supported color formats: RGB 4:4:4<br>=C2=A0 =C2=A0 First detailed timing =
includes the native pixel format and preferred refresh rate<br>=C2=A0 =C2=
=A0 Display supports continuous frequencies<br>=C2=A0 Color Characteristics=
:<br>=C2=A0 =C2=A0 Red =C2=A0: 0.6562, 0.3261<br>=C2=A0 =C2=A0 Green: 0.285=
1, 0.6103<br>=C2=A0 =C2=A0 Blue : 0.1445, 0.0595<br>=C2=A0 =C2=A0 White: 0.=
3134, 0.3291<br>=C2=A0 Established Timings I &amp; II: none<br>=C2=A0 Stand=
ard Timings: none<br>=C2=A0 Detailed Timing Descriptors:<br>=C2=A0 =C2=A0 D=
TD 1: =C2=A02880x1800 =C2=A0 60.000966 Hz =C2=A016:10 =C2=A0 114.362 kHz =
=C2=A0 =C2=A0347.660000 MHz (301 mm x 188 mm)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hfront =C2=A0 48 Hsync =C2=A032 Hback=
 =C2=A0 80 Hpol N<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Vfront =C2=A0 =C2=A03 Vsync =C2=A0 6 Vback =C2=A0 97 Vpol N<br>=
=C2=A0 =C2=A0 Display Range Limits:<br>=C2=A0 =C2=A0 =C2=A0 Monitor ranges =
(Range Limits Only): 40-120 Hz V, 229-229 kHz H, max dotclock 700 MHz<br>=
=C2=A0 =C2=A0 Alphanumeric Data String: &#39;CSOT T3&#39;<br>=C2=A0 =C2=A0 =
Alphanumeric Data String: &#39;MNE007ZA1-5&#39;<br>=C2=A0 Extension blocks:=
 1<br>Checksum: 0xaf<br><br>----------------<br><br>Block 1, DisplayID Exte=
nsion Block:<br>=C2=A0 Version: 1.3<br>=C2=A0 Extension Count: 0<br>=C2=A0 =
Display Product Type: Extension Section<br>=C2=A0 Video Timing Modes Type 1=
 - Detailed Timings Data Block:<br>=C2=A0 =C2=A0 DTD: =C2=A02880x1800 =C2=
=A0120.000207 Hz =C2=A016:10 =C2=A0 228.720 kHz =C2=A0 =C2=A0695.310000 MHz=
 (aspect 16:10, no 3D stereo)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Hfront =C2=A0 48 Hsync =C2=A032 Hback =C2=A0 80 Hpol N<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vfront =C2=A0 =C2=A03 V=
sync =C2=A0 6 Vback =C2=A0 97 Vpol N<br>=C2=A0 Checksum: 0xf0 (should be 0x=
f8)<br>Checksum: 0x98</div><div><br></div><div>Let me know if you need some=
thing else from my side.<br><br>&gt; There is code already to ignore EDID c=
hecksum for CEA extension<br>&gt; blocks, look for EDID_BLOCK_CHECKSUM, it =
probably could be extended to<br>&gt; cover displayid blocks,<br></div><div=
>Are you recommending me to make use of this to suggest a fix/bypass, or is=
 that just a suggestion for the other maintainers?<br></div><div><br>&gt; O=
therwise I do wonder how common this is, and whether it should be<br>&gt; q=
uirk per panel or just always do it.<font color=3D"#888888"><br></font>This=
 is the machine model, from Lenovo&#39;s website:<br><a href=3D"https://pcs=
upport.lenovo.com/de/en/products/laptops-and-netbooks/5-series/ideapad-pro-=
5-14aph8/83am/83amcto1ww">https://pcsupport.lenovo.com/de/en/products/lapto=
ps-and-netbooks/5-series/ideapad-pro-5-14aph8/83am/83amcto1ww</a></div><div=
>There probably plenty of other models that make use of the same panel.</di=
v><br></div><div>Thanks for looking into this,<br></div><div>Tiago</div></d=
iv>

--000000000000379cb3063edbecab--
