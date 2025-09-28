Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532ABA7856
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 23:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3BA10E094;
	Sun, 28 Sep 2025 21:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="kIzob6OD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875F710E094
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:24:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-27edcbbe7bfso41149125ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1759094652; x=1759699452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
 b=kIzob6ODCRMkRnKSisam0y0jB5NHDrPZ5cs3tu9HXOxr+s8s1tgwLPFMPWGwXFQzSL
 UN5K28ihivp2E01zq4+NDwZhQbmodgdhF+xN5CUD52KNdmDMNdfy2qI3AaioOoLMiZZH
 jr87ACVlyN2IQ7FFAWeYRdFsi0hLaXYCBo5+QZYSHcX6pEUtI0PMqMqkBo5xgi2QplER
 BV6TFSl9t1IgxhILHyLbhvoiALFgLbNdYW7SB1iCAIJA2C3SjomlNCbaUtsNmU4mu5mo
 CAlQ/hlcBFrY8SmCbffewLZTJysYunYOT3EAEedkTqqWDPXTzFVT6z+CTzTcBPJl6Qrq
 dgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759094652; x=1759699452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
 b=t8KmJaaIrLBvnm4gskV2bS8HkraEw6Ez81ni3uGBomav+XhUGHVRGXbG41PAHWOXrh
 nLw9l/R7mds0u+FLljLMx1XWpiRJ0gyYIyWZEgAOq0YiQiu0mftqfoZc6gVmyDgJMAoW
 nU0OY8tz+dIomZ4zrQQTS5zRm34LbZ9b/ILMSl9nVHaKkS0nnPePXwU3OHW9uOyDEqO1
 RwWd8QvP5ROHGN+xSk24awj2AVpmZbnQ3kzbIJ0agL191YWJg0EMWEHErmdsHMeQqEQP
 /OjUphtcLq70wvSkmmcoh59JNUi6GAeFIiIkP8lUKCgdMQ4MPtrodEzlGKMWrfA6Pvbh
 M6+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU10vhfayD1pQjsyhw5T6I7zdSTt3TOE63Egd8y/3t7pB4QI1oDgYD6q7EL4Ui+ibH0Ld+GkXae0dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMSm63erOKtmXhz/rZmY2SRfUOJBAYTdCznS9GKBbnfWaaNtAx
 Su9qTOfiacrQdwFzlmeto+suoSGoc/Zn/NZ4KcRd5ymIMAxSBrsKL9cCK9xoXpElzseQopaTVNf
 1tJayNprNbNxUlZXTzmb3clsNPBrSozc=
X-Gm-Gg: ASbGncttKGoIZnC0mnwIjw7yw2uZtVY/H/gNLP2PH8SAfPp+kRKXRDRIFa6LO5Gozxz
 Mi2+xXL6pGSSlpcwwemNv3GmDfoXnt1lx7jXQ8iufYnA+SgvfVnFU1IuSfBk0QeLLENgy4xrLqB
 LLwgQNTf2OCQSpUokHXn2HVTZ55KyMg5t3H/MVGZZx6kuJ02iXcmI+6YwTUBy7ZImmsy5jslbRn
 7akhkmd8KA0tNoH141zkOhwsHfuFk9d48V6y+36
X-Google-Smtp-Source: AGHT+IGYeAH/2koMMwWRpMeTjHt3nx4vF27nPj6cQxfPYTjKMshJ5FnJQAOC0KdwVHl9l4KPM6h4tqlgjIdg+H3Sves=
X-Received: by 2002:a17:903:19ee:b0:269:b6c8:4a4b with SMTP id
 d9443c01a7336-27ed49c7798mr160858095ad.6.1759094652033; Sun, 28 Sep 2025
 14:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250927130239.825060-1-christianshewitt@gmail.com>
In-Reply-To: <20250927130239.825060-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 23:24:01 +0200
X-Gm-Features: AS18NWDzM6EO1Jvv--jbu1zBUk9kHyWLoS06NGipbYnYIhNafpGwzdVcGq2jayY
Message-ID: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dongjin Kim <tobetter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Christian,

On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv,
>                         m =3D 0xf7;
>                         frac =3D vic_alternate_clock ? 0x8148 : 0x10000;
>                         break;
> +               case 4830000:
> +                       m =3D 0xc9;
> +                       frac =3D 0xd560;
> +                       break;
Initially I thought this was wrong because it's only added for the
G12A (which is also used on G12B and SM1) code-path, leaving out the
GX SoCs.

Was the 2560x1440 mode tested on a computer monitor or a TV?
I suspect it's the former, so I think it expected the code to take the
MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.

I'll give it a try on Friday as I do have a computer monitor with that
resolution - so any hints for testing are welcome!


Best regards,
Martin
