Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4279CA36345
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC810ED0A;
	Fri, 14 Feb 2025 16:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cOt4fm0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577B10ED0A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:38:36 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-308f71d5efcso22338871fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739551113; x=1740155913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiENR5Ei6ZKv4VQ0yGfBeOiN7n/8XjskxjvRSd0fnk0=;
 b=cOt4fm0Q2pZ44tFrclmdzvJP83HM/IQWoUyX7/ilL+1mT8jm/Eirw2YMa7DZ4pjfr8
 IGCr9yomUSbN2IabQCh7n+SP2B2h1GtIqVmDYusYQRBmI9WACkDxzlyMyCrL4HjB+ixn
 AsVmKjVeZP0xKu9QobsfZX4yZI7ucO1F+iMHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739551113; x=1740155913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiENR5Ei6ZKv4VQ0yGfBeOiN7n/8XjskxjvRSd0fnk0=;
 b=nPwHUdi98X5IHW1JIACL6VhiBVYisizE3s8wruDgv/4Pxe0gZ0seeBMYodks8oYmjj
 pzig4mdRwXmEm5LOWmxUZphBf534aYW+TMAx4Bz4tKN6lRe/XKs/dEOp4EQdiSgrpH+c
 /YLLG4/wqlWP8Cilqvmbb4tHpXhr8NXkYUhIyOJZu9VUQjt6ud/sAOYMyXHTq20al0ap
 72F6cUON5CWVGpMhshejJaCD7wzsBw/T8zJHR8MocmMHAY7xQb+yUDCgAxuDDbz0wHDt
 T3W5oxeezTGa74goa4iYPVJXdw8NL9Jcp0ZO+K0FFbNvyaMELLNjbS+uWqV6WAiKJaXp
 7snQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaqtVJKHndcb0eyPhpIbC1wL+bBgst1n3febbjvjPUBVOG49zkKLpRFxnOVLsiHxLR5hGr0hER05c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyykJFVGli1nhBx4uHxBrAATGprgamTwx2Zn2bhUEQUx5OybI+I
 247vzJQmlsx/qUPp+qnYn5Uh971dFNlKhwj+cawGgJyhXZHIFZjA6yn5SBxAx0Z2MFPmGujVvdi
 mJg==
X-Gm-Gg: ASbGncvXlvkN6Q9cKtOkws7E0urcJYScwTZllQtWztStNWHv1/1JLKnG0YxeQYzy+1p
 Jun985zhej/jRZkBZg+nerNMlkLb3Y8s4rRcIpI/fSOSQjHplAjFgUo1p3s/6wrIUGyATd9/ooq
 tS48LNIPndApPlMQVp0FzstD2/KX2aqSBIHCLKIRpTonqUvIcli3xZCFu4pmKTwhuuX/S+3oCBc
 EVy0wfjXWpGcPh4vllRT14OUB2vITDdvGGB+oSctikTPQFuyIw1fqg30L6coddUcCdL4p19mJY7
 W5iBLc6/zWN59Qq8Mw8KDVxC+zodJbdOebq+BIC2GyiNAHwTX+QNjo8CHAg=
X-Google-Smtp-Source: AGHT+IGVF98AyQ8SFNf2jLwh9t+GrKed8oCqVOh5bbNcaK41k47xoINssGjQVwm0LWjV2BjRrO20+A==
X-Received: by 2002:a2e:a296:0:b0:308:f6cf:3602 with SMTP id
 38308e7fff4ca-30927ad5602mr409651fa.25.1739551112701; 
 Fri, 14 Feb 2025 08:38:32 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091011ed74sm6016241fa.55.2025.02.14.08.38.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 08:38:29 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-308ee953553so23526921fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:38:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW36mbhD1dxhdGwJo3If+gQEmnJZFQGbijdzSWv4AbYTjp+1AU1cuRtBp7lyoDg+Toz1zRtJt9zi+U=@lists.freedesktop.org
X-Received: by 2002:a2e:9246:0:b0:300:330d:a5c4 with SMTP id
 38308e7fff4ca-30927a49b85mr626221fa.10.1739551108840; Fri, 14 Feb 2025
 08:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-37-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-37-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 08:38:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uwq3BZNmESmB0Ra5y-jJCb5bi-UTLknrRhVsUbuVbvCA@mail.gmail.com>
X-Gm-Features: AWEUYZkDTyh9KPW7vj9obdMVUza9a_l0OTDPgjC_IVV9XEkSBuB7Tzn1y-D7bMw
Message-ID: <CAD=FV=Uwq3BZNmESmB0Ra5y-jJCb5bi-UTLknrRhVsUbuVbvCA@mail.gmail.com>
Subject: Re: [PATCH v3 37/37] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
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

On Thu, Feb 13, 2025 at 6:45=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
>
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 58 +++++++++++++++++++++++------=
------
>  1 file changed, 39 insertions(+), 19 deletions(-)

While I'm not an expert on all the concepts addressed in this series,
the patch does look reasonable to me from the point of view of
ti-sn65dsi86. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that on sc7180-trogdor-coachz that the display still
comes up after this patch:

Tested-by: Douglas Anderson <dianders@chromium.org>
