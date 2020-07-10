Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702821B80F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79E76EC57;
	Fri, 10 Jul 2020 14:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D556EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:15:59 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id dr13so6241185ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwYB5ADm1mz6ytwc+yvSOCOhw7iU6BRbwNalytDne7Q=;
 b=PzFS6nZPlbcQcD/+5VhLYbW3rCJiR8zJNqYKo4s+XJ6oFmP2AP/EoIT6cd3FZYKd34
 UyBttIPl51cNTQDOYjIDwI4Q69r+jZv0btLnCn5S6NdFilUuLU4saHMbOS/Qb+ixZj7r
 YK6PD1Vv+YIF6j4lKY52AemDBJsXtqwYLJm9QN/E9Rc8HNLj2CWJUOjOepnt2ijK7ads
 44Yor6SlfqxCG2LSuFgUa52EAIJJNmBw9WXvjZnnRaQDI3sWy84fQz1Sd+1PeZvpGlps
 MmiN/9zoJT0dwv03UboPO36Psp5ydxBGtEIhp8REBvImVsFHVL/aiqOLiHF7BYdPGVuW
 x27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwYB5ADm1mz6ytwc+yvSOCOhw7iU6BRbwNalytDne7Q=;
 b=Zc6QjFDCD1lqfhHO270k3hfEor6JDPeKvuA4QZu+r/UDU+mwDFjNg8QO4LDG7RXXV3
 8iFDRP2xl4vwyCpbNLhP9gABh5jlgpQHG1Jd7D6TvsdEBf6g/8CTlENE6yKDfwA21nuo
 o/oY75+f2hyWreE6FNvJxs7yvXVkkzwx6pAVqk1qpXxAEy/OXAFvJZjY6WyxC1bhUqIq
 fhgf5SvM3eK4c1dO1WQmhQHs8PB4mU4mGExwViACl0Ezzi4PdmLBzWRA/M6tjfpreT/L
 hZqsq2pmp2tQoq4DZj/wN5+U828KNNt8G7GHn2nuWTtdG+B893pI1NTxthm/E0ec5KLC
 2vcQ==
X-Gm-Message-State: AOAM533QDtpmlT/O1CFthJIU0TnGrepqJ1CMQfmTUs7H3dBSmJixxvla
 EYTYlsfOe7AmM2WP7BicN0C7bMnHuJ/boDA2MKE=
X-Google-Smtp-Source: ABdhPJzjs+zsETyv/wthfn2t4mysUPgW5iKQmK2JUA4in9NjKZ6b86++Gz172z5DNjd1SmLYAdlK03tY2jJqyqV77ZQ=
X-Received: by 2002:a17:906:856:: with SMTP id
 f22mr58682642ejd.245.1594390558045; 
 Fri, 10 Jul 2020 07:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
 <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
 <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
 <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org>
In-Reply-To: <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Jul 2020 07:16:29 -0700
Message-ID: <CAF6AEGvrhqXr=a=SLLHp1K+1kBb--62B85SB3S1K+KkYUtBqKg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Steev Klimaszewski <steev@kali.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 11:15 PM Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi,
>
> On 7/9/20 11:12 PM, Doug Anderson wrote:
> >> root@c630:~# bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
> >> root@c630:~# i2cdump ${bus} 0x50 i > edid
> >> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> >> I will probe file /dev/i2c-16, address 0x50, mode i2c block
> >> Continue? [Y/n]
> >> root@c630:~# edid-decode edid
> >> edid-decode (hex):
> >>
> >> 00 ff ff ff ff ff ff 00 09 e5 d1 07 00 00 00 00
> >> 01 1c 01 04 a5 1d 11 78 0a 1d b0 a6 58 54 9e 26
> >> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> >> 01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
> >> 36 00 26 a5 10 00 00 1a 00 00 00 00 00 00 00 00
> >> 00 00 00 00 00 00 00 00 00 1a 00 00 00 fe 00 42
> >> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> >> 00 4e 56 31 33 33 46 48 4d 2d 4e 36 31 0a 00 9a
> >>
> >> 03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb
> >> fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73
> >> 44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61
> >> 92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2
> >> 66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70
> >> 43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc
> >> 45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3
> >> 30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29
> >>
> >> ----------------
> >>
> >> EDID version: 1.4
> >> Manufacturer: BOE Model 2001 Serial Number 0
> >> Made in week 1 of 2018
> >> Digital display
> >> 8 bits per primary color channel
> >> DisplayPort interface
> >> Maximum image size: 29 cm x 17 cm
> >> Gamma: 2.20
> >> Supported color formats: RGB 4:4:4, YCrCb 4:4:4
> >> First detailed timing includes the native pixel format and preferred
> >> refresh rate
> >> Color Characteristics
> >>     Red:   0.6484, 0.3447
> >>     Green: 0.3310, 0.6181
> >>     Blue:  0.1503, 0.0615
> >>     White: 0.3125, 0.3281
> >> Established Timings I & II: none
> >> Standard Timings: none
> >> Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
> >>                  1920 1968 2000 2200 ( 48  32 200)
> >>                  1080 1083 1089 1120 (  3   6  31)
> >>                  +hsync -vsync
> >>                  VertFreq: 60.000 Hz, HorFreq: 67.200 kHz
> >> Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 00 00 00
> >> 00 00 00 00 00 00 00 00 1a  ................
> >> Alphanumeric Data String: BOE CQ
> >> Alphanumeric Data String: NV133FHM-N61
> >> Checksum: 0x9a
> >>
> >> ----------------
> >>
> >> Unknown EDID Extension Block 0x03
> >>     03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb .&.w...qo...C.j.
> >>     fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73  ... 9."nehwp..4s
> >>     44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61 D!...m.b.*|...ja
> >>     92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2 ...SL9...#.H.9..
> >>     66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70 f.p..w.J..Lrn]Gp
> >>     43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc C......x..A..j(.
> >>     45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3 E....*..5.4.>.^.
> >>     30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29 0^.).H.....1..;)
> >> Checksum: 0x29 (should be 0x82)
> >>
> >>
> >> - My edid does in fact say it's 8bit
> > Crazy!  Mine:
> >
> > Extracted contents:
> > header:          00 ff ff ff ff ff ff 00
> > serial number:   09 e5 2d 08 00 00 00 00 23 1c
> > version:         01 04
> > basic params:    95 1d 11 78 02
> > chroma info:     d5 00 a6 58 54 9f 27 0f 4f 57
> > established:     00 00 00
> > standard:        01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01
> > descriptor 1:    c0 39 80 18 71 38 28 40 30 20 36 00 26 a5 10 00 00 1a
> > descriptor 2:    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > descriptor 3:    00 00 00 fe 00 42 4f 45 20 43 51 0a 20 20 20 20 20 20
> > descriptor 4:    00 00 00 fe 00 4e 56 31 33 33 46 48 4d 2d 4e 36 32 0a
> > extensions:      00
> > checksum:        40
> >
> > Manufacturer: BOE Model 82d Serial Number 0
> > Made week 35 of 2018
> > EDID version: 1.4
> > Digital display
> > 6 bits per primary color channel
> > DisplayPort interface
> > Maximum image size: 29 cm x 17 cm
> > Gamma: 2.20
> > Supported color formats: RGB 4:4:4
> > First detailed timing is preferred timing
> > Established timings supported:
> > Standard timings supported:
> > Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
> >                 1920 1968 2000 2200 hborder 0
> >                 1080 1083 1089 1120 vborder 0
> >                 +hsync -vsync
> > Manufacturer-specified data, tag 0
> > ASCII string: BOE
> > ASCII string: NV133FHM-N62
> > Checksum: 0x40 (valid)
> >
> > Unknown extension block
> >
> > EDID block does NOT conform to EDID 1.3!
> >          Missing name descriptor
> >          Missing monitor ranges
> >          Detailed block string not properly terminated
> > EDID block does not conform at all!
> >          Has 128 nonconformant extension block(s)
>
> I did attempt to modify the patch, and I don't think I did it correctly
>
> Around line 232, I changed
>
> IS_SC7180_TARGET(c->hw.hwversion))
>
> to
>
> IS_SC7180_TARGET(c->hw.hwversion) ||
>
> IS_SDM845_TARGET(c->hw.hwversion))
>
>
> But it would seem that only gets us 1/2 way there...
>
> https://dev.gentoo.org/~steev/files/image2.jpg
>

neat.. I guess this is because 845/850 supports split-lm (layer
mixer), and uses it for horiz resolution above 1080
(MAX_HDISPLAY_SPLIT)

I *think* you could probably increase MAX_HDISPLAY_SPLIT to 1920 and
it will "work".  (Or at least I think our reasons for using a lower
value are power, on older gens we only used split mode above 2k
width.)

BR,
-R

>
> But should I continue on this path, or should we be finding others who
> have an N61 and see what their EDID reports?
>
> I have another c630, but unfortunately, it appears to have the IVO
> screen in it, instead of another N61.  I asked another user and he also
> had the IVO.
>
> -- steev
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
