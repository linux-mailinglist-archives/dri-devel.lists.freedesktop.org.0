Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC33BB9649
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 14:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BE410E0BA;
	Sun,  5 Oct 2025 12:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dNA8pf/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E079010E0BA
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 12:36:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-363cb0cd8a1so48097681fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759667791; x=1760272591; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
 b=dNA8pf/z5R49YXzvahdp5G7RIHXG5Io9gZx8Z/9nS9cu7whMfRXH6n7i59ba95K74z
 XDLcPfKvPq9zKONDKJLjxlAwoPMmGs5A+eZy4AlJiJubup+1g8K1HjDD8MnIc9BNNy3c
 H7elpulWu6BzE63cAZbYwW2dD5EXjw9DHRMah8v0/nn1wIf8cjy8A3NhUOPN0bLTLr+y
 U60mFnqbwtsTTK9dLyfWJCxAzXHeEXVoZzpWDqEux0qYGeVBbmLOSv/cDtAOTpbTs7Ef
 2yX40bsAR/9B5FCvAlyuklWH0fDoWvvBVHInOMfnWLiVmyahBvOQsT2snHA20M8zRwlx
 dYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759667791; x=1760272591;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
 b=OX8rjwQCOYXZXZCgkIlDiVKxr8L22LbpDh/qsRNb98zeVLfK6/9cvw86wN6rvRfvzt
 WzYBgEDl7MDcz9C7d5aEEh++QjOiUKloR6ER5UQYa4/2z7KXTkIEAYrqazohdsmJMeMF
 53xxa5aN8J/ri8jZWBvctHXv0QKxiH4iT4y+cuT3m9P1sX10YDYCNZ8891htOqJRXNof
 D93kRoN+Vq0+Z3jEo6+32T4I/+JWTVT54cqxeSSgdTZOx7ZHXYq5kB2IsKZWsCpJmTYJ
 gFxvPgmN2PPwBPDJLoSITd+StXj2Vg+68EukqVfTA49Po8HMLdgI9HBNROBv3XvkjJGG
 KqWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHmNM4h9YujLMcHpcxX6t1ibMqFxgbtEt/9SaDXP7EIXPwXurvdWCiapW2tKkaomvERjUu5hHDHU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlAclOytpeptb6C6cvn4LK+el+eWW7f2rTbLCIvWZV7+PR06c6
 0+A1r1AMCyoMM4JuArxR7wJNYd84ypNKes0WsxsE8Wrygavdtzd13kYw
X-Gm-Gg: ASbGncu65O9x3ygMMFzRDJ9T1lGlGc75jW9EfdbZCipmm+VAVg5muV8XHlFPEiAcmaA
 pduBKWk3xIKdR0gsjKaOQnaQFRZJI/Waqw8oN2UkR81o5UBUyw4jmpGx/y4fNDid8N7Zg80t2LH
 hv0csnneVRjsx6VFJdVPJRLw9HtoSx0ds8lgypJMK2yg9cyg0JumNoMij3q0+6tXzsbzXP/DxkF
 Lj3fnWxq9q1SGqdENNb5VzufCzM+O++Yw63TyOqoQi/d3DpOJ+okgS4ATjK9daLzxM0dwOfwygu
 l3LUdg3wQTCjWoygfY6OHgcTTVvL3+aBSyKqyPU7EtEDQBlwm92g7O13mkoEahkI6GEsz+3HQ6O
 3goXm0uQm8U59Ym2V4vrRbb5WjsaNDFhNhZUugxehhcraB55Kphg8CObFAAa9H7296aaz/otmgd
 cd/YxYgsN/6YhnkLdN
X-Google-Smtp-Source: AGHT+IGEqErpl4/yZCkCUF1+3SE3UIJICO6kK51WxwIZOJed0A6X31dHGb4CXR4L8Vz9X90HOvSsMw==
X-Received: by 2002:a05:651c:1b05:b0:356:839:56a with SMTP id
 38308e7fff4ca-374c37ef44emr27261701fa.25.1759667790693; 
 Sun, 05 Oct 2025 05:36:30 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba2736c4sm33396251fa.7.2025.10.05.05.36.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Oct 2025 05:36:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
Date: Sun, 5 Oct 2025 16:36:15 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dongjin Kim <tobetter@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABDCFF3D-D3EF-4EF0-B51A-AD6B25D78895@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
 <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
 <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
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

> On 5 Oct 2025, at 12:22=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>=20
>>> On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>>>=20
>>> Hi Christian,
>>>=20
>>> On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
>>> <christianshewitt@gmail.com> wrote:
>>> [...]
>>>> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm =
*priv,
>>>>                       m =3D 0xf7;
>>>>                       frac =3D vic_alternate_clock ? 0x8148 : =
0x10000;
>>>>                       break;
>>>> +               case 4830000:
>>>> +                       m =3D 0xc9;
>>>> +                       frac =3D 0xd560;
>>>> +                       break;
>>> Initially I thought this was wrong because it's only added for the
>>> G12A (which is also used on G12B and SM1) code-path, leaving out the
>>> GX SoCs.
>>>=20
>>> Was the 2560x1440 mode tested on a computer monitor or a TV?
>>> I suspect it's the former, so I think it expected the code to take =
the
>>> MESON_VCLK_TARGET_DMT path, which automatically calculates m and =
frac.
>>>=20
>>> I'll give it a try on Friday as I do have a computer monitor with =
that
>>> resolution - so any hints for testing are welcome!
>>=20
>> The original patch is from Hardkernel sources - I=E2=80=99ve picked =
it several
>> years ago and then updated values semi-recently after 1000ULL =
changes.
>> The user who originally requested that I cherry-pick it (and tested =
it)
>> was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=
=99s not
>> tested by myself as I only have TV=E2=80=99s not monitors, so it will =
be good
>> to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99=
ll be happy to
>> drop it - I=E2=80=99m just trying to upstream and offload some =
longer-running
>> and allegedly good patches in the LibreELEC kernel patchset.
> So I've tried it on a Le Potato (S905X SoC) board. This patch doesn't
> do anything here (as expected, since it only targets the G12A and
> later code-path).

Thanks for testing. Let=E2=80=99s ignore this patch then :)

> Doing some more analysis, it seems that
> meson_venc_hdmi_supported_mode() simply prevents using any mode with
> more than 1920 pixels.
> I attached a simple patch to overcome this (discarding any
> meson_vclk.c changes):
> $ cat /sys/class/drm/card1-HDMI-A-1/modes
> 2560x1440
> 2048x1152
> 1920x1200
> 1920x1080
> ...
>=20
> My monitor's OSD tells me that I'm running at 2560x1440@60Hz.

I=E2=80=99ll pick that for wider testing, but it looks sensible. Thanks.

CH.

> @Neil, should we bump the limits in meson_venc.c to "4Kx2K@60" (that's
> a quote from both, S905/GXBB and S905D3/SM1 datasheets), most likely
> meaning: 4096x2160?
>=20
>=20
> Best regards,
> Martin
> <meson_venc-hdmi-support-1440p-screen.diff>

