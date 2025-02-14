Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF325A363C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E7710E35C;
	Fri, 14 Feb 2025 17:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="c6y2ok8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1659710E35C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:00:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545097ff67cso2271520e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739552436; x=1740157236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MiFR3quRFEg087vBzbccqqMF50xWoSlOV/fK1lFI+w4=;
 b=c6y2ok8xJaOSdCq+/xnGEdrB3Dk7d294eZSUnHF01Vumu0mII+ffufDPHbrpQVQVXn
 t14UHre+s5NOhaiZCSMbH/eo+DXS6HoJrsn7A32KfLbjdifwuzS7Hm+EWf1qcy/52lDw
 NadVSMDm06czmt1uE1IUouHKrB17ehjuBtjx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739552436; x=1740157236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MiFR3quRFEg087vBzbccqqMF50xWoSlOV/fK1lFI+w4=;
 b=FSJNp4qcc8XPhvRnTXORZFegouuAQ6jHyxQso8Hw1wizy9YdVECSFRMD8Ph/PL8Tbb
 h1ORZGl0fe1W7osPjxY9MR7CZVH39AA8/WNXqF2j1FBMK7ORqaLURzsdF6m3eKL37DRx
 AdlYg+64P2quCFwhycqOlNUPBqmualkQtG1XLXzg4ufctKF93IGTgDMpToH9f9Ea/I80
 qwdBo//yDPdcTTn/62T5GSExfNlk0qKHkT6mkyBBK6IGFzcJYQdlD5AclV4hl5K35BRa
 ZlFoBZMHIUgDPaYJIN5nicncHEuhf0/LazFbiggQLvKnuaVORWgqsqhjXAiQfgnpF8kR
 ndOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2ZpsXivHVfjTbG6qVUTM2FiEN9vOGXGA4rT1DGgUG2AZVhQGYtFIUBVFa2E0Ws2ulHgZIlo3Yh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb8ID33IJE10zF2ws3YTY9C4zduZBAqpmSP/3/ImZOQGe71l5x
 I/5eQY14RJUukHmyS2wUmETXCYLY+7ZVudntWQ+8ygy+GgcknBt5EU9zbqj9bSlRbdKiSDElhmC
 T2JEF
X-Gm-Gg: ASbGncvy9sD5kgnt7Vh/Fmce3K1Ctq8NEEoFmiE/ElFOExpCvB1s31hRX57TPbt9Hzp
 Sx4c0LZkWabTC4XfDFDMU2JSktDM+zjvs+O8fHVE+WZDwd9aXT7uVllEQjVSA4X48PJI1sM5GIS
 pMK2+yWhLJBm+DWLr4gRV49zXeZZf1MfQY8FF1nKaOVszOGibdlqhFOmKZv9M4ciY6lVBq6eE8f
 bGKkejOz640IO6PUXUYOHfiuzaOTHuYUuyyUsJ+XyyO6G0sKBauFCbcXvGzc1j+MVYsmMXb//7L
 +bRFq0hmawqdv2gIOTIhZkeB5XOevknV3M+WAa/vLWOQBDvhqyHjBJXHtzk=
X-Google-Smtp-Source: AGHT+IEhiwJl0AikRY0e5HjA8F0hNQ+llwGgpdQ1qfxAAzW1diXvGZuQmcAvE1iSYWYmOPXTguk5BA==
X-Received: by 2002:a05:6512:308b:b0:545:25c6:d6f5 with SMTP id
 2adb3069b0e04-5452fe96673mr7289e87.53.1739552434533; 
 Fri, 14 Feb 2025 09:00:34 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e90496csm122948e87.22.2025.02.14.09.00.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 09:00:34 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-308f141518cso24660091fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKg/67hnDfPvNbFWahMS6ORKrSX7SoVy0EEt6MVXIY+8sSL3nwhVUm0xZqayxD3AucKCBfKYD4jo=@lists.freedesktop.org
X-Received: by 2002:a2e:9cd1:0:b0:308:eabd:2991 with SMTP id
 38308e7fff4ca-30927a3a12fmr938761fa.1.1739552432081; Fri, 14 Feb 2025
 09:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-3-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-3-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 09:00:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE4kFwJcTd_zJ3g5eMw4w2D6dZh_imr9K1p+s=K9DS-w@mail.gmail.com>
X-Gm-Features: AWEUYZnF4y9fC-8_sEsNYrB6_o2BfDQWhIPmNhTZZs2O4VRlvUgwtwaAGfHPT9E
Message-ID: <CAD=FV=XE4kFwJcTd_zJ3g5eMw4w2D6dZh_imr9K1p+s=K9DS-w@mail.gmail.com>
Subject: Re: [PATCH v3 03/37] drm/bridge: Pass full state to atomic_enable
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Feb 13, 2025 at 6:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_enable hook prototype to pass it
> directly.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

From the point of view of ti-sn65dsi86:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
