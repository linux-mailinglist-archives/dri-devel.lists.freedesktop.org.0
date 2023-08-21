Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A653783108
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 21:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34FF10E29C;
	Mon, 21 Aug 2023 19:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3287D10E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 19:46:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b9bb097c1bso58338251fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692647194; x=1693251994;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=twYIe11VURfMi70AkdnWaRrcCYBj/ZlPgX57Ec3XcJo=;
 b=A2YWsUp19BXqCHbQ86kWJjkFaYDEgSmUasbXvENrQ3zTYnAgaYVRL5NnwaCpwJoVPX
 cOAC/+dP/2nhtpvURjjZFgzjWwoD4e9Jq6BRZFYYy8sP5fSfZCS/m7wyuqVz/H7CwzVE
 Vs9s4kyrxhIkF45mHtfyLayijUXWE6emD8hjLUZ7kv4rrYP7Ez/aH3B8fMeoyBNtDF/y
 PQGnWKZY4fmQES7i2Tfre+xq4JAAUxiOcTx4sRxpATx4l8MeV+jLdZ2BluodLvww3oX7
 LLApy40ayD/f4KVPe8Wgj+H3Syq9CI7vknQAmSjwbvMUas1ZllwwHY/u4+ywcadU+eo2
 vWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692647194; x=1693251994;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=twYIe11VURfMi70AkdnWaRrcCYBj/ZlPgX57Ec3XcJo=;
 b=NR3/m4tE77ASOX5Pd80M6e7Chypl2Mr7l2I5VuN/u9jCzUzLe2kUSeUqvg13hATI9Q
 bpJrCgY6xwo4zN49sbtSqMX98aWBkIEW6V6hrY4v2azL62i19gV25BCB28IXcQFCl+km
 Qon5RIv1W500PhCenxsrnh7ZiAwt1KkYuiuH5ZhiXlPvlNLzdEgJTPboGHXymNxpcbvr
 AUhSNxYrO7KY2DCOt331iklWprm1MoeyGXMprMx/qkK/hsASXTUAZNQ51gza0IHabdxY
 nUYKimFsCt/4J46te4zdXtt+m2SiFdc+RU+HeRcVBDO0BcfX3AO7wFwewJnsbGII3H4d
 EHAw==
X-Gm-Message-State: AOJu0YwDcShe2e8O7GxAC4SSwfEjveKC60HSNfbGAoiK8SzIRFxnaWtk
 laetI1U84C0CvbG3RN8/dZk=
X-Google-Smtp-Source: AGHT+IHDWeE8l4/UcKsCVtzoTD6z0PhdM+PlACh9d0iDsqCqrpOiD2jkNzBa8zUD/7Xzp/cDvOWRjQ==
X-Received: by 2002:a2e:8295:0:b0:2bb:aaec:abad with SMTP id
 y21-20020a2e8295000000b002bbaaecabadmr5360070ljg.30.1692647194102; 
 Mon, 21 Aug 2023 12:46:34 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 q17-20020a2e9691000000b002b9ebdf70b7sm2440313lji.27.2023.08.21.12.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 12:46:33 -0700 (PDT)
Message-ID: <5822a76d-6f63-4bf6-a102-e1341aa4db45@gmail.com>
Date: Mon, 21 Aug 2023 22:46:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] drm/bridge: tc358768: Fixes and timings
 improvements
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/08/2023 14:25, Tomi Valkeinen wrote:
> This series contains various fixes and cleanups for TC358768. The target
> of this work is to get TC358768 working on Toradex's AM62 based board,
> which has the following display pipeline:
> 
> AM62 DPI -> TC358768 -> LT8912B -> HDMI connector
> 
> The main thing the series does is to improve the DSI HSW, HFP and VSDly
> calculations.

Thanks Tomi for the updates, I cannot test it or verify against the
datasheet, but codewise the series looks nice:

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Add "drm/tegra: rgb: Parameterize V- and H-sync polarities" so that
>   Tegra can configure the polarities correctly.
> - Add "drm/bridge: tc358768: Default to positive h/v syncs" as we don't
>   (necessarily) have the polarities set in the mode.
> - Drop "drm/bridge: tc358768: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   support" as it's not needed for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   support.
> - Link to v1: https://lore.kernel.org/r/20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com
> 
> ---
> Thierry Reding (1):
>       drm/tegra: rgb: Parameterize V- and H-sync polarities
> 
> Tomi Valkeinen (11):
>       drm/bridge: tc358768: Fix use of uninitialized variable
>       drm/bridge: tc358768: Fix bit updates
>       drm/bridge: tc358768: Cleanup PLL calculations
>       drm/bridge: tc358768: Use struct videomode
>       drm/bridge: tc358768: Print logical values, not raw register values
>       drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
>       drm/bridge: tc358768: Rename dsibclk to hsbyteclk
>       drm/bridge: tc358768: Clean up clock period code
>       drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
>       drm/bridge: tc358768: Attempt to fix DSI horizontal timings
>       drm/bridge: tc358768: Default to positive h/v syncs
> 
>  drivers/gpu/drm/bridge/tc358768.c | 381 ++++++++++++++++++++++++++++----------
>  drivers/gpu/drm/tegra/rgb.c       |  16 +-
>  2 files changed, 295 insertions(+), 102 deletions(-)
> ---
> base-commit: 4d49d87b3606369c6e29b9d051892ee1a6fc4e75
> change-id: 20230804-tc358768-1b6949ef2e3d
> 
> Best regards,

-- 
Péter
