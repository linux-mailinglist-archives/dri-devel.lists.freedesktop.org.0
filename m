Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED670A1C7B6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 13:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A4810E172;
	Sun, 26 Jan 2025 12:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xpBJIvrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BB410E172
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 12:42:03 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401c52000dso3746582e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 04:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737895321; x=1738500121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHJPjFgtb1YF6qa5Lt4KBVMfhDJmFqKHqxkQawLDy0M=;
 b=xpBJIvrQ+WFse5CbF2gsdviPVOxipXE/OlxvrzpK3YXHXL9/NQDG7EoyL2szapf5fx
 EkwHWt6MiDI5klRg4osHxYxbWgcdTc/LQCIKcZXV9X8WPODfcS+dZCww08eErk90lW20
 Zxjnm2FiMpwsOTwxyFUw9ACvVEXkXhAMcA9eVQvhlckkHlPR+tZ8cj2qruxyOhiFfIr+
 BmkMDh1Kv1QwNJHfyH6xm2x673a4JskAHBl9mJyWGaJ2Ja8rwEfa8Tow/Nllf/+3KGIN
 /5OxriM/howrXbwnDmgorSoV1b2qJ1D6Y7+3X9nhipw0jyWjPrWdahIP/S1fZFGZ3t9p
 M46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737895321; x=1738500121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHJPjFgtb1YF6qa5Lt4KBVMfhDJmFqKHqxkQawLDy0M=;
 b=bZuHIliui2tAPOaJ3b2ZZd2/0Oh+2LNPkCRhmXnF3kcBxAFGSVyNoQC4NY9SfdPvXS
 lYCtbeslX4ZfhnQG2UjXFJxRUJ91pxnXLxleSfs0wTQfxv6I0K4u2wkU3jSX2HoaDEFn
 +hH6gjPB98vXPKbWJR27GBj0OpXK0J148LsbmD0rv55eYDIL1zkj4p5fMWhZu3Hu89ER
 XwJnve9bgSVAgndZ5nf9l/AMQow2QmhYPwyEm0AUHd8kdIUkHLV1WgtVxeCIsZhZxAhO
 +YZiL8muBt2iW1drdnXBVuYm9fK846eYlkdMH/PEOtEub+dFWiOdWyXmarN9+b/5EdwI
 Vy+g==
X-Gm-Message-State: AOJu0YxUr5eFfWAvNwMyTHzXh6elmRwZhoFEI05pf3uzc/qShHDmaOYf
 OWX5x2riBCPA6zlqkoVTs5w9oKuI/MAjMUSsQ42FCG91cv1IzzCCSUEQM1mLBbM=
X-Gm-Gg: ASbGncu/QzAr4a9uKi4dRrFINtgtSx2G2Nt3t1PNFxZuD5y6zRUQsT+sqTM3hmGDwfX
 8bqjchdfVAaCJvvVtmjGGHQOHOf73E0UM7YIyfYCn+rm5Jy1kd9QZRxHOqtNwg/ZK4wK1eAD2Yz
 x6jb0IwYlj3tuMRevXZ3SQzxakqYJ7UGzee9/XR2TaupQZ6N+FlEJrgxEvregwqDbC7IOQnaDXe
 GQtJUI6zP2gV4wJ2kEHZ9QSMCqHBYtHAnFo5EBRfxzKvHulS+Wa+t6+kiitS70CtaOtHcIYXLUK
 WUQS5mfKdAsASg6TaVt7LTaIAA94ofFTRooInQZt2ZsvsXUS
X-Google-Smtp-Source: AGHT+IFXyklMCwy8gV5KcJAacumwDn3d94qptV4fqtOKVqO9v/8V2Dx639YgDjIcQcsQYse2Y9lyog==
X-Received: by 2002:ac2:4e12:0:b0:542:9987:6ea1 with SMTP id
 2adb3069b0e04-5439c268010mr15675317e87.34.1737895321385; 
 Sun, 26 Jan 2025 04:42:01 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822924asm903127e87.49.2025.01.26.04.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 04:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm: bridge: adv7511: refine actual capabilities
Date: Sun, 26 Jan 2025 14:41:57 +0200
Message-ID: <173789531323.2915366.4617860271687582791.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108170356.413063-1-olivier.moysan@foss.st.com>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 08 Jan 2025 18:03:53 +0100, Olivier Moysan wrote:
> The STM32MP257F DK board features an ADV7535 HDMI bridge,
> which belongs to the ADV7511 bridges family.
> At startup the Pipewire audio framework parses the audio devices to
> discover their capabilities. The capabilities reported by the ADV7511
> driver are not accurate enough, which results in warning messages from
> Pipewire.
> Adjust the capabilities reported by the ADV7511 driver, to more
> accurately reflect its actual capabilities.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm: bridge: adv7511: fill stream capabilities
      commit: c852646f12d4cd5b4f19eeec2976c5d98c0382f8
[2/3] ASoC: hdmi-codec: allow to refine formats actually supported
      commit: 038f79638e0676359e44c5db458d52994f9b5ac1
[3/3] drm: bridge: adv7511: remove s32 format from i2s capabilities
      commit: 7c3127e4814c304c7d5a2fa796a42e75a9b8606f

Best regards,
-- 
With best wishes
Dmitry

