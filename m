Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDBC169A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21D110E08D;
	Tue, 28 Oct 2025 19:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HRSQf8Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535F10E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:25:11 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b6cdba2663dso4600217a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761679511; x=1762284311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5IJin9cX8JhcYXZyyZU8pCrwryCs7+KxdDf2J6OLVE=;
 b=HRSQf8Mh4rjaVOiGeVqtGd3NIhiuz11d2oD+OwrJzNuNg12mh9W6FvgQFJMsRKUFfu
 gNLnwt3szLHaMK5ecKEU2cRlaHU9hKjwhvoXMWBCUmKK4zhJAVS1OM/npsCxxKcsht5g
 MWlQP7Z3vY2QGIQ+FoVQGuBhzDdsob1QM6KBywcNVCAjwuRc/MZzj82K+I39aCGvl4Hw
 oCZ4BFKnjpZCm+qM8Dp7t3aRdz1qxdpjONo4a3k072Wp4sRj5m4xKhvyJKMOFgO5P/wO
 J1r22KD6ApsgoQzmRlekrQribWJvxTY7Due19v2uSLxmvVP/JInKpFLDWWVT5lZLqCSS
 f2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761679511; x=1762284311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y5IJin9cX8JhcYXZyyZU8pCrwryCs7+KxdDf2J6OLVE=;
 b=qcymbHPPej8DoYKYVZh/OohAHXg9sFVCDBP0Eo9F5vk8eP/RlR6QsplEOGYh7+R2n9
 06XzVjYq3+uEO0xXo1qllMi1Wi1curwbTrljJOR+YO8wJF/Ywp2se0O3b+vkCDo6bQtv
 CqWa3tsDkK+6qD4dJsC8kSgCjniMHc9WJZkij/3vU9mrFQXYf4Lb2ECFWyhWffmJzMPp
 vFB9Ul1cXihZqePGxCgJ+HPpSjjxtspRpZM/AxQYsjSBHAbpMetVhMnDQHxhWlBTBmsq
 +vRA0Ro5RKYXQdkVHu24bPeyJCcvthXZAuC47J4U6Usjaj6VSUprT9To3vbb2eE2M4TY
 cFSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEqnyyYD4Vjgyyp/UJ8vZINcEPTkr0wl2auMIiTDbhfhy8w5Uy9Ahf/BKKn/0C7P8RQH2eCXGsHCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuH8865+QNuscibJS/VS5vlMpNKsTnKdewg9s5ATzuZgVAi89c
 kCHJ/6hco9u5jLoQ7Xz8Yut+1CM/+VCx6mjxP6/uU52TpcpA61Wc/UXXdtajzQSWhALec/4+H07
 9vgrFin4eQ99VHk0OVMmTn5/l5sVRfks=
X-Gm-Gg: ASbGnctpfwBdRXjTXLpFaOqTv221FXj21sloH00avtXOuKVXzHNmQvMsik3aaZMjIPw
 WYVx/LTZYvFJCQTzWpJG8CTA+XcojcWigMxU9CI+j3vSsWtg9/eTjFBxsObczXFMqVT+PC6fiHB
 PKQsvbgNf16XHkMU94/kGZwg9bTsEy3ODG1Y5sJ++8PFxhB2nZTEOu1SH99tWg+MUlUjIc14N5m
 gtopvFz78F+CajE/S7G6S50cTBxk2YogmpbRkb7IQrkwETFfSaLK5fFJ4YKdUwleNXFndtOyw==
X-Google-Smtp-Source: AGHT+IEyq9cVrd23ipRbhNl+XyOP85YlFgKWSefkr0K5LFZIlwwI05WPv7r7FptUh1BaWj4DzK3lj0msK8ATld89AEU=
X-Received: by 2002:a17:902:cec3:b0:24c:cc32:788b with SMTP id
 d9443c01a7336-294dedf48b1mr3682125ad.3.1761679510799; Tue, 28 Oct 2025
 12:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
 <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
In-Reply-To: <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
From: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Date: Tue, 28 Oct 2025 20:25:00 +0100
X-Gm-Features: AWmQ_bmdWYr7uBfo0xixBLEjoRJX3gtz0BIfuFq46xmjZBI2QQoXAUiah1dVL14
Message-ID: <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Content-Type: multipart/alternative; boundary="000000000000730a9806423cf912"
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

--000000000000730a9806423cf912
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm glad to see there are more reports about this problem. Let me know if
need my getting info about this monitor, or testing anything.

Thanks for looking into this.

Tiago Martins Ara=C3=BAjo

On Tue, Oct 28, 2025, 20:08 Jani Nikula <jani.nikula@linux.intel.com> wrote=
:

> On Mon, 15 Sep 2025, Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmai=
l.com>
> wrote:
> >> That's not the complete EDID data, though. It's missing 6*16 bytes. If
> >> you go by the hex offsets, 0x100 does not follow 0x090.
> >
> >>  please grab the EDID from sysfs.
> >
> > Fresh from my terminal:
> > =E2=9E=9C  ~ cat /sys/class/drm/card1-eDP-1/edid | edid-decode
> > edid-decode (hex):
> >
> > 00 ff ff ff ff ff ff 00 0e 6f 16 14 00 00 00 00
> > 00 20 01 04 b5 1e 13 78 03 21 15 a8 53 49 9c 25
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 ce 87 40 a0 b0 08 6a 70 30 20
> > 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28 78 e5
> > e5 46 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> > 53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
> > 00 4d 4e 45 30 30 37 5a 41 31 2d 35 0a 20 01 af
> >
> > 70 13 79 00 00 03 01 14 9a 0f 01 05 3f 0b 9f 00
> > 2f 00 1f 00 07 07 69 00 02 00 05 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 98
> >
> > ----------------
> >
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.4
> >   Vendor & Product Identification:
> >     Manufacturer: CSO
> >     Model: 5142
> >     Made in: 2022
> >   Basic Display Parameters & Features:
> >     Digital display
> >     Bits per primary color channel: 10
> >     DisplayPort interface
> >     Maximum image size: 30 cm x 19 cm
> >     Gamma: 2.20
> >     Supported color formats: RGB 4:4:4
> >     First detailed timing includes the native pixel format and preferre=
d
> > refresh rate
> >     Display supports continuous frequencies
> >   Color Characteristics:
> >     Red  : 0.6562, 0.3261
> >     Green: 0.2851, 0.6103
> >     Blue : 0.1445, 0.0595
> >     White: 0.3134, 0.3291
> >   Established Timings I & II: none
> >   Standard Timings: none
> >   Detailed Timing Descriptors:
> >     DTD 1:  2880x1800   60.000966 Hz  16:10   114.362 kHz    347.660000
> MHz
> > (301 mm x 188 mm)
> >                  Hfront   48 Hsync  32 Hback   80 Hpol N
> >                  Vfront    3 Vsync   6 Vback   97 Vpol N
> >     Display Range Limits:
> >       Monitor ranges (Range Limits Only): 40-120 Hz V, 229-229 kHz H, m=
ax
> > dotclock 700 MHz
> >     Alphanumeric Data String: 'CSOT T3'
> >     Alphanumeric Data String: 'MNE007ZA1-5'
> >   Extension blocks: 1
> > Checksum: 0xaf
> >
> > ----------------
> >
> > Block 1, DisplayID Extension Block:
> >   Version: 1.3
> >   Extension Count: 0
> >   Display Product Type: Extension Section
> >   Video Timing Modes Type 1 - Detailed Timings Data Block:
> >     DTD:  2880x1800  120.000207 Hz  16:10   228.720 kHz    695.310000 M=
Hz
> > (aspect 16:10, no 3D stereo)
> >                Hfront   48 Hsync  32 Hback   80 Hpol N
> >                Vfront    3 Vsync   6 Vback   97 Vpol N
> >   Checksum: 0xf0 (should be 0xf8)
> > Checksum: 0x98
>
> There's an i915 bug report [1] on what is likely a similar Lenovo model
> to yours, with the same display, but with an Intel GPU.
>
> I looked at adding an EDID quirk for this, but actually passing the
> information all the way down to the DisplayID checksum validation is
> going to be annoying. :(
>
>
> BR,
> Jani.
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703
>
>
> --
> Jani Nikula, Intel
>

--000000000000730a9806423cf912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;m glad to see there are more reports about thi=
s problem. Let me know if need my getting info about this monitor, or testi=
ng anything.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for =
looking into this.</div><div><br></div><div data-smartmail=3D"gmail_signatu=
re">Tiago Martins Ara=C3=BAjo<br></div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 28=
, 2025, 20:08 Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com=
">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Mon, 15 Sep 2025, Tiago Martins Ara=C3=BAjo &lt;<a href=3D"mai=
lto:tiago.martins.araujo@gmail.com" target=3D"_blank" rel=3D"noreferrer">ti=
ago.martins.araujo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; That&#39;s not the complete EDID data, though. It&#39;s missing 6*=
16 bytes. If<br>
&gt;&gt; you go by the hex offsets, 0x100 does not follow 0x090.<br>
&gt;<br>
&gt;&gt;=C2=A0 please grab the EDID from sysfs.<br>
&gt;<br>
&gt; Fresh from my terminal:<br>
&gt; =E2=9E=9C=C2=A0 ~ cat /sys/class/drm/card1-eDP-1/edid | edid-decode<br=
>
&gt; edid-decode (hex):<br>
&gt;<br>
&gt; 00 ff ff ff ff ff ff 00 0e 6f 16 14 00 00 00 00<br>
&gt; 00 20 01 04 b5 1e 13 78 03 21 15 a8 53 49 9c 25<br>
&gt; 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01<br>
&gt; 01 01 01 01 01 01 ce 87 40 a0 b0 08 6a 70 30 20<br>
&gt; 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28 78 e5<br>
&gt; e5 46 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43<br>
&gt; 53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe<br>
&gt; 00 4d 4e 45 30 30 37 5a 41 31 2d 35 0a 20 01 af<br>
&gt;<br>
&gt; 70 13 79 00 00 03 01 14 9a 0f 01 05 3f 0b 9f 00<br>
&gt; 2f 00 1f 00 07 07 69 00 02 00 05 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
&gt; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 98<br>
&gt;<br>
&gt; ----------------<br>
&gt;<br>
&gt; Block 0, Base EDID:<br>
&gt;=C2=A0 =C2=A0EDID Structure Version &amp; Revision: 1.4<br>
&gt;=C2=A0 =C2=A0Vendor &amp; Product Identification:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Manufacturer: CSO<br>
&gt;=C2=A0 =C2=A0 =C2=A0Model: 5142<br>
&gt;=C2=A0 =C2=A0 =C2=A0Made in: 2022<br>
&gt;=C2=A0 =C2=A0Basic Display Parameters &amp; Features:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Digital display<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bits per primary color channel: 10<br>
&gt;=C2=A0 =C2=A0 =C2=A0DisplayPort interface<br>
&gt;=C2=A0 =C2=A0 =C2=A0Maximum image size: 30 cm x 19 cm<br>
&gt;=C2=A0 =C2=A0 =C2=A0Gamma: 2.20<br>
&gt;=C2=A0 =C2=A0 =C2=A0Supported color formats: RGB 4:4:4<br>
&gt;=C2=A0 =C2=A0 =C2=A0First detailed timing includes the native pixel for=
mat and preferred<br>
&gt; refresh rate<br>
&gt;=C2=A0 =C2=A0 =C2=A0Display supports continuous frequencies<br>
&gt;=C2=A0 =C2=A0Color Characteristics:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Red=C2=A0 : 0.6562, 0.3261<br>
&gt;=C2=A0 =C2=A0 =C2=A0Green: 0.2851, 0.6103<br>
&gt;=C2=A0 =C2=A0 =C2=A0Blue : 0.1445, 0.0595<br>
&gt;=C2=A0 =C2=A0 =C2=A0White: 0.3134, 0.3291<br>
&gt;=C2=A0 =C2=A0Established Timings I &amp; II: none<br>
&gt;=C2=A0 =C2=A0Standard Timings: none<br>
&gt;=C2=A0 =C2=A0Detailed Timing Descriptors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0DTD 1:=C2=A0 2880x1800=C2=A0 =C2=A060.000966 Hz=C2=
=A0 16:10=C2=A0 =C2=A0114.362 kHz=C2=A0 =C2=A0 347.660000 MHz<br>
&gt; (301 mm x 188 mm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hfront=
=C2=A0 =C2=A048 Hsync=C2=A0 32 Hback=C2=A0 =C2=A080 Hpol N<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Vfront=
=C2=A0 =C2=A0 3 Vsync=C2=A0 =C2=A06 Vback=C2=A0 =C2=A097 Vpol N<br>
&gt;=C2=A0 =C2=A0 =C2=A0Display Range Limits:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Monitor ranges (Range Limits Only): 40-120 H=
z V, 229-229 kHz H, max<br>
&gt; dotclock 700 MHz<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alphanumeric Data String: &#39;CSOT T3&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alphanumeric Data String: &#39;MNE007ZA1-5&#39;<br>
&gt;=C2=A0 =C2=A0Extension blocks: 1<br>
&gt; Checksum: 0xaf<br>
&gt;<br>
&gt; ----------------<br>
&gt;<br>
&gt; Block 1, DisplayID Extension Block:<br>
&gt;=C2=A0 =C2=A0Version: 1.3<br>
&gt;=C2=A0 =C2=A0Extension Count: 0<br>
&gt;=C2=A0 =C2=A0Display Product Type: Extension Section<br>
&gt;=C2=A0 =C2=A0Video Timing Modes Type 1 - Detailed Timings Data Block:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0DTD:=C2=A0 2880x1800=C2=A0 120.000207 Hz=C2=A0 16:1=
0=C2=A0 =C2=A0228.720 kHz=C2=A0 =C2=A0 695.310000 MHz<br>
&gt; (aspect 16:10, no 3D stereo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hfront=C2=A0 =
=C2=A048 Hsync=C2=A0 32 Hback=C2=A0 =C2=A080 Hpol N<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Vfront=C2=A0 =
=C2=A0 3 Vsync=C2=A0 =C2=A06 Vback=C2=A0 =C2=A097 Vpol N<br>
&gt;=C2=A0 =C2=A0Checksum: 0xf0 (should be 0xf8)<br>
&gt; Checksum: 0x98<br>
<br>
There&#39;s an i915 bug report [1] on what is likely a similar Lenovo model=
<br>
to yours, with the same display, but with an Intel GPU.<br>
<br>
I looked at adding an EDID quirk for this, but actually passing the<br>
information all the way down to the DisplayID checksum validation is<br>
going to be annoying. :(<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
[1] <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1470=
3" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14703</a><br>
<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div>

--000000000000730a9806423cf912--
