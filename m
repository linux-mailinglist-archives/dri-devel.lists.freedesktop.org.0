Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F0A431D6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 01:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0F10E032;
	Tue, 25 Feb 2025 00:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cxEg+9q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2AC10E032
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:26:40 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30a2cdb2b98so49986891fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740443198; x=1741047998;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MonBVftq71LB80zSOFj1KpiAwzenwGE0PbED6OoLK8c=;
 b=cxEg+9q7OLvCx2MrmvD8H+wiRrJTvOgMa96ISsVFgNFKqMxTZTFMkUDpOL+Q0wNkx0
 FvGBRch9JNHp+SZVloWX8IvUsb/eI/efBk444/82KpiGG6cyQrKewz2WGoX8sJWFjw9o
 G1/+N+1YQZeM2E/NxwimgIFPRq+3cPdblCmNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740443198; x=1741047998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MonBVftq71LB80zSOFj1KpiAwzenwGE0PbED6OoLK8c=;
 b=PT2xmwpBfeJ4xbJd67dOGJYr4QIsM9+WNBIl4x1qgZmGBRhdF53pFMADddJHvqBmRK
 XGVu5QQ2IxWeg+VlqVJr4zF6y/07Ka4yOvAeJEQte80mvc18bEN1IS8dSNhEq+SNX+le
 iewzjXYgWlGP1M0ZXbZkezjfOWAlA9txSODJAVU2BIHGiHgevz+M6+keqP5P5NNrcI81
 RuNbO7L9MKRaoYinv5mkHF5aQnuDOkZWdJsJVwaFvfR1MeXgOgPXpm73BaxJdY10rrC5
 Wot9x4PZlWLLizPY/IhBzH98SjjFmJyOulFckGaGEGjcxLUqvzNPce95nWngBGr+QMT8
 Q3Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsw/HDxGFYGF2C/mhf3yNqxpdHLyEg0sO6uIqqZ/Akb66SZVCeW8L2cTyTtqDwUxkkcf0XnT3wH24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg4lN4ELhO9uPCnbwb+xcFXwDentb5WSagg/Msrh9uvUoUStQH
 Rc0BZXxb+DqnqbDRCs9yhLT9BpEv951Z6KGhaUSZOP7ePLUTHrxUvNo5ZV/slyhzneIsBmhVGlz
 vFQ==
X-Gm-Gg: ASbGncsvWandFSoKMweoHSDmh1RO5xs8k5YCzbWg2tTs/GCYHbWhaK6/24Bjs56dcqs
 JlrAG8KUxP+hNyBqa0hCdp1qE4AJZyJpowKih3k67oJtYC5wtPl7YngGJO9Q8VdCPCCv/54gGg/
 tlgRcotEZWHs3O1s/7Vrt62KV5rHokDyqYQ69ZP9aCu2auRN1/NUVEhJMjh4pt2Xps93kUbXV7D
 jLXEN7igNTckMVaQooG3cpCBwZXAqX9Wm/D3QIRkVQqmjMVtM2t3UhLROsRu+f29z8XUw2A/fk/
 +v8uJrvgHbFpQMNSwFS3mVraZCQ39lyVribtG7qi6n7drOc46GyPFczypeMfABieYGXxqg==
X-Google-Smtp-Source: AGHT+IE9PajYz377xbYKRxZdK5bN7z8UJ1I1/BBiy5MuxyCAU/x9T+6f03PEWney7cRPhggmRiNPZQ==
X-Received: by 2002:a2e:9410:0:b0:30a:4476:b08 with SMTP id
 38308e7fff4ca-30a5b1a7a9emr49754241fa.19.1740443197546; 
 Mon, 24 Feb 2025 16:26:37 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819f4aeasm738911fa.51.2025.02.24.16.26.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 16:26:36 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3078fb1fa28so38593541fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:26:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOs5FEy06sW2fRhznlI0jD38aiP9lIV0aflhoS5f4MF+N9mdQfMIP1LdGyt5KHvi+7hiaJSoGjqBM=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2214:b0:545:23bb:23f4 with SMTP id
 2adb3069b0e04-54839129a5amr5535877e87.8.1740443196300; Mon, 24 Feb 2025
 16:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20250217174936.758420-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250217174936.758420-2-u.kleine-koenig@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 16:26:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XhS6kaYm2FbdOcqeFTHJN=H5B3QBa2yHc-tk-E=2TJ6A@mail.gmail.com>
X-Gm-Features: AWEUYZl2Mhiqo6raYNMP-1ZeB3LqAFThBdttHbacGYJMZcSHZ-EkeSwClwp4YDk
Message-ID: <CAD=FV=XhS6kaYm2FbdOcqeFTHJN=H5B3QBa2yHc-tk-E=2TJ6A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using
 IS_REACHABLE()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org
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

Hi,

On Mon, Feb 17, 2025 at 9:49=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Currently CONFIG_PWM is a bool but I intend to change it to tristate. If
> CONFIG_PWM=3Dm in the configuration, the cpp symbol CONFIG_PWM isn't
> defined and so the PWM code paths in the ti-sn65dsi86 driver are not
> used.
>
> The correct way to check for CONFIG_PWM is using IS_REACHABLE which does
> the right thing for all cases
> CONFIG_DRM_TI_SN65DSI86 =E2=88=88 { y, m } x CONFIG_PWM =E2=88=88 { y, m,=
 n }.
>
> There is no change until CONFIG_PWM actually becomes tristate.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> even without the change to make CONFIG_PWM tristate using IS_REACHABLE()
> is the more idiomatic way to check for CONFIG_PWM.
>
> Note that IS_ENABLED() is wrong in the case CONFIG_DRM_TI_SN65DSI86=3Dy +
> CONFIG_PWM=3Dm.
>
> Best regards
> Uwe
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This has already been on the lists for a while and nothing here is
controversial, so pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using IS_REACHABLE()
      commit: ed531feda7852de0aa702fbe3d23a0f743ccc77b

-Doug
