Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608CA31873
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 23:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA83110E314;
	Tue, 11 Feb 2025 22:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ARfXVai1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4010E314
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 22:16:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-545054d78edso3729936e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739312216; x=1739917016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6U/i0AyDpGaJpOZ3KaZQJIAbdIyIIccKfpuccmj4AeU=;
 b=ARfXVai1unegyCErCAeN7EAE6AFLfdDzJlTCM9rt4+4ZknUIYQlnC5Uq5cwUK2ph1B
 /G/FxqxePK8I4GzMVaA7rWhAcxXhrhGqrXPcGigLq+8d9GqMugLx/fI3lnHppYV/xNG5
 kK2g+3KleiVR0b3tkqdlqBE8Ur+Pa8moffrtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739312216; x=1739917016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6U/i0AyDpGaJpOZ3KaZQJIAbdIyIIccKfpuccmj4AeU=;
 b=thP3HfaTRxxtg4ylYdv3XL2a77fI1kbL6LCHlFT0ICW2jrPviPTq6JpZHTuhRH4sz+
 toUuJUbeUQt+VBzFFeQ1JF1A0U5rvMZOEyk3NVfKj8/wI5suK3qjbCDGkNdskZb8XrxY
 JMBbCxuzgiykeSW/JQ5OJ/ytdWteyqhQ42v2t+byAU8MGEAQSD5vUM5sbxtCvMY/z+SP
 jT82E5G7kem5RjcknW33hVaQwqcf41XBdsFUiYAWgRb06kbSXiba0uQH+Nsy2lwA77Rx
 TqWaVjWJvq7S3CGxLdgP4+ZGHAmoqVO8vb/NaScCIF37eukb2OnvHOGlaYPpOCian1qz
 gbNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvEyd4aDo/UljeTHHnuSA5j2cViBzcYqnOJqHewSaCOJniv2l7yGe202JbKorg3REuqzmA9cmnOyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpNgQ3kiDam/Yxb8RvUHMjwCLBn9xdGcsJI+xI0jcPh2OjJX3C
 EnJNrz/Gs2MUdjf6ZpNXwBHGFWJ6iSXpQDSdY1I2m/KSVaxcsqiOGegJrLWpbhVB5hR842A/YtZ
 zEw==
X-Gm-Gg: ASbGnctBCZU+T6z2afrMrcWwTQvdVxqU08h3qDxYnA19hoOiW2GHmVrS1mCnWtFsDMN
 d4aTmhymyw0qcYXXdlH52WjyE1bIIelADDr//RwgzUMJmy081BeBTcqIujO9mjF1buaubsMF5Qg
 1cF4COUOW645zZepaAjXH/kK3/BRMC/yE4S6tZuI+8Us48a/kxUT2/62WnN0c8tzcXLQ928cbV+
 VQn4aQNuZ1B2X/10frZs5AURsdAQAGvsH/xU2y9ooaFzimwbWNOUKsU0udtPIPdyjozgtBeDGmZ
 qh8lsTKIipkVzR306cXzLju5BBbqoT7H6TBOHUd7rUw/hYEFleQM23o=
X-Google-Smtp-Source: AGHT+IGbdxD7Eg/pm1mGD0cO+fWy59LUpjFr3y1BaWc4n1/l+7eqIJ8nKt5dEm1MBi5qCMTvd6m75g==
X-Received: by 2002:a05:6512:110e:b0:545:8a1:5386 with SMTP id
 2adb3069b0e04-5451811d2d0mr156773e87.25.1739312216361; 
 Tue, 11 Feb 2025 14:16:56 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450d0998e8sm693936e87.103.2025.02.11.14.16.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 14:16:53 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54504bf07cdso4044151e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:16:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoaUSz5B2wXJLakadrwtyX3Sl8IwRTLK0dejHbbrcN6PkwnEatcilMQkidTFRDSROUuFhnBJfIzxI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3691:b0:545:6cf:6f41 with SMTP id
 2adb3069b0e04-5451819442fmr182315e87.48.1739312210792; Tue, 11 Feb 2025
 14:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Feb 2025 14:16:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXkqfWoAiqbsfWiJo259oQxMV0UrQsX=qD5nVH=Dmaqg@mail.gmail.com>
X-Gm-Features: AWEUYZmmeWZCqEjhBQK0EshkrCCF8NKprJL2-UJ0EsnsvngShwlhJQxLIfqImNM
Message-ID: <CAD=FV=WXkqfWoAiqbsfWiJo259oQxMV0UrQsX=qD5nVH=Dmaqg@mail.gmail.com>
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>
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

On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(struc=
t device *dev)
>          * panel (including the aux channel) w/out any need for an input =
clock
>          * so we can do it in resume which lets us read the EDID before
>          * pre_enable(). Without a reference clock we need the MIPI refer=
ence
>          * clock so reading early doesn't work.
>          */
> -       if (pdata->refclk)
> -               ti_sn65dsi86_enable_comms(pdata);
> +       if (pdata->refclk) {
> +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current_s=
tate(&pdata->bridge));
> +               drm_modeset_unlock(&pdata->bridge.base.lock);

Oh. I haven't tested yet (my device is at home, but I think there is
an easy solution to my deadlock problems. Drop the modeset locks here
and just pass NULL for the state. We only end up here if
"pdata->refclk" is not NULL. Then we only use the passed state if
"pdata->refclk" _is_ NULL.
