Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53635A2D27F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 02:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B81C10E17E;
	Sat,  8 Feb 2025 01:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dvlQV7d6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C410E17E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 01:08:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401c52000dso2778463e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738976904; x=1739581704;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wVrbWDXXYM0CQX9h6yILLnqWA7VmPSj8PhYgMA/4GQ=;
 b=dvlQV7d6OUNlzM7/GKIAEimYnRebRn31jRkYsb5idkT6+45dkH1gG5sA7QOpxLElev
 xmY0w5ASd0Ggl4k1bLlOO7gHhY6O76C3g3/Qa4NZe+7IaR/WyBN4Tm5fv/R7O6MUgdr7
 BF8PW5LsaZzskyawIr62vU57qd9n5gQBSdKz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738976904; x=1739581704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wVrbWDXXYM0CQX9h6yILLnqWA7VmPSj8PhYgMA/4GQ=;
 b=pNdnMgu36M6mxPjPP7YsJjyKWNYENECgaGncCI/x8/lU/dqlMzMPkLWvnYfxk8yC8D
 t2ebDPkR3961Yxm7geueS1Q3R1KQRH2t0C93sN6REwnexnqIo2ky/Fr3MC6yBFiAEAnX
 e8GighsEmGj4tnjE8OrBamC/uATPWRxR8ojNTbSrBmMhUTSDvM4m0zErdMjKpY8bEQs1
 4hOfZ2weFALSaJ/FtjgFGoVoIP14eu69nQwX63WO5B/ty9iA1G+1Lt3Nznmfh8qoevld
 6WU8u0E4oGne1Zxp77e19ycQNOum/gcqTOO0ql08U7XsP//Z+d4WS9v+n8NOEXiwkkSm
 LmzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzOhNjPurrlJIGTxPJybeAzRgB2G9jTQiWWTB6SVklGRrE7s1N3MBxAtUu8pd0jF8RJG4n5C/dd5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvLzsv6UY5ZFua74CXxwvTa2SjrwG1eA55pVdq1bDAbenVfcm6
 gNxJPXbNOguIGX7whcYZbWQQiPKDGsWxGrWNwBtX+l1O4r/xNsydNKqPE8rhUncPq2qPI+/KAM2
 QDmYU
X-Gm-Gg: ASbGncvp5u0kN11wxi4gCNy46yVdaTWDEYfYaqmnUbTZ+WHQStWJTc9Tm8d1l0ZwnQb
 hsUxSBOhU+218Z5QuDzH+buZa9KluTSMXhYuNxJ8YlJRTcEkr0g2SNGeO6+uVikBiAHjg0uzG4d
 unUxBaScr2ILSH8QzL+JyEi5UhgHUmUN+bSe6R9EPk33VQ/rQHQfi5oQanXxKkPC2hHccnjzcfv
 LgS4SfnnsgvkKzBS9VELmq7Im/IxYM3K6HsH6lttAcD4SRDq18nFW4QiIkHHat/uCr3eERP0JPE
 5uSeRMozKKq7i2D9XEeljbYuCkqDhvc1GHjHlImha6nEdiFHww4fmC0=
X-Google-Smtp-Source: AGHT+IH7XDHDJZ4CY3XYVYMyUvkBjjUY4/zw7AvbnpgIvFgjIN4Y3DgWCcyP0W8FXhEHZZ+2jZme4A==
X-Received: by 2002:ac2:568e:0:b0:540:3594:aa39 with SMTP id
 2adb3069b0e04-54414aae43dmr2010166e87.5.1738976903818; 
 Fri, 07 Feb 2025 17:08:23 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105e64c3sm590135e87.167.2025.02.07.17.08.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 17:08:22 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5450475df18so262767e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:08:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaizpU01ynV2dQsk5l+dhJ9uvQtdKn3DwS2AlCan8XnKkZ3Tbr8T77D9BUCpOQeECnOaxLzVSTcDs=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e88 with SMTP id
 2adb3069b0e04-54414b01b82mr2226286e87.32.1738976901540; Fri, 07 Feb 2025
 17:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0FVUTYbAHUu4+eAUMpdLjN4VugJfkz=w8nTFUWsCxdw@mail.gmail.com>
X-Gm-Features: AWEUYZlKhL9EQkxrrPGn2Xxl9dRf0ql99TamMut4CnEufz_dZhA1D8oIf-xamMo
Message-ID: <CAD=FV=U0FVUTYbAHUu4+eAUMpdLjN4VugJfkz=w8nTFUWsCxdw@mail.gmail.com>
Subject: Re: [PATCH v2 18/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_pre_enable()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Feb 4, 2025 at 6:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> drm_atomic_bridge_chain_pre_enable() enables all bridges affected by
> a new commit. It takes the drm_atomic_state being committed as a
> parameter.
>
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index ab166972b1b0df239ca014296be49846a857df6e..02ddfe962b99bed4316b2a7b0=
c72112e127afa8b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -672,23 +672,23 @@ void drm_atomic_bridge_chain_post_disable(struct dr=
m_bridge *bridge,
>         }
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>
>  static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
> -                                             struct drm_atomic_state *ol=
d_state)
> +                                             struct drm_atomic_state *st=
ate)
>  {
>         if (old_state && bridge->funcs->atomic_pre_enable)

drivers/gpu/drm/drm_bridge.c:683:6: error: use of undeclared
identifier 'old_state'; did you mean 'node_state'?
  683 |         if (old_state && bridge->funcs->atomic_pre_enable)
      |             ^~~~~~~~~
      |             node_state
