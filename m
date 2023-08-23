Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75C785A8B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 16:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FC510E433;
	Wed, 23 Aug 2023 14:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B5A10E433
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 14:32:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ff882397ecso8708504e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692801132; x=1693405932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lGSkTW5lsuSL6E7U5gxr9FfAhYaXdi6ezZxEKj4mao=;
 b=S6S2mpu6elnu6h7iCGGz+jz1JXUB3aF01EFcaAFzB73oeqiRnOrc1B+NcAB0OJuMfw
 n7Ja/WxiRx1iMFX1Xi/ASaKo2BKDFCPN2dhlbnaYnvjjFxSvNuV3K4fuqOgwR3FSHBj6
 fHki8zhulxF/YC0KCXhZVi9YiC3kz0doONJ2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692801132; x=1693405932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lGSkTW5lsuSL6E7U5gxr9FfAhYaXdi6ezZxEKj4mao=;
 b=JiW9K9PGU1nlptVNRxUzHtYAc+P7/QjBnsqYIAOUj0wIaVyHk3kRakvbf07NpzvqSz
 pEnpKiW6Oev6Ng7ZDbEjEfdWSuxvqsX8+dZC9qIJ5/iKB+2JERWJclTl18OSVH8peVXK
 P95vk4bGfVCt+LMMLvIDkNSCTjWjHVjdYwyYbknNyQNfXWoCkoJHhx4/IGTtxdjYOiVF
 rBtsF/66w8Mr1BKpLLTvDLkiPFTZyk6dcI5OCPwUathJCcBFSGCsG5F/oi2KHh0GKHK/
 S5zUlP+6lmgEnhvv7TDIwUdhBH0LkJJGSC3xMowF8nzvm2JUIH4SVUQQUO8wDmXqWdlh
 yfGw==
X-Gm-Message-State: AOJu0YwWxEergKLwlccRn3z+kN93fqXQ8MDAvdc4ip+5yCjdkx7a5Mvc
 qPw8qU76T14dWaeuqsgU8IO6XJxRwv3618nosQgquZN3
X-Google-Smtp-Source: AGHT+IEeutskQ6Lg0YDGjBuRfyzJidU7MKyuothEWAIWz5B+sBRdsLUM2Be/owCj7OZHiLGKIznHvQ==
X-Received: by 2002:a05:6512:2347:b0:4fb:89f2:594d with SMTP id
 p7-20020a056512234700b004fb89f2594dmr11950300lfu.63.1692801131045; 
 Wed, 23 Aug 2023 07:32:11 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004ff9d22e486sm2680898lfq.226.2023.08.23.07.32.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 07:32:10 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5009687f822so2422e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 07:32:10 -0700 (PDT)
X-Received: by 2002:a50:9b1e:0:b0:523:193b:5587 with SMTP id
 o30-20020a509b1e000000b00523193b5587mr283073edi.6.1692800786058; Wed, 23 Aug
 2023 07:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Aug 2023 07:26:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
Message-ID: <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Aug 13, 2023 at 1:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The driver has ID  table, but still it uses device_get_match_data()
> for retrieving match data. Replace device_get_match_data->
> i2c_get_match_data() for retrieving OF/ACPI/I2C match data by adding
> match data for ID table similar to OF table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is only compile tested
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

It seems like this is a sign that nobody is actually using the i2c
match table. It was probably added because the original author just
copy/pasted from something else, but obviously it hasn't been kept up
to date and isn't working. While your patch would make it work for
"anx7814", it wouldn't make it work for any of the other similar
parts. ...and yes, you could add support for those parts in your patch
too, but IMO it makes more sense to just delete the i2c table and when
someone has an actual need then they can re-add it.

Sound OK?

-Doug
