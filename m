Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C5A28233
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 03:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDA810E71F;
	Wed,  5 Feb 2025 02:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PHBuyi78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8BC10E71C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 02:53:13 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so5838346e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738723991; x=1739328791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CJCxeQf3VyCaGV3Y2vA9kcx9yqwJL3rmHKrDp4Nke4g=;
 b=PHBuyi78HzQOQOwJEWjfVn7+KDDpgAfkWPjTUvOng7xj2hWAp3GUGyxPsDFsgSqz78
 Nu0ZGlviaJ6uMNX4d1x/Cf9v1SWGJg0v7IwkfPoF0009W0Wl33O10Ifat1GwMf0U3QZ7
 b1T3WvXF+chvOgHzHowvEXVONHSiykPWE3kSEkOmP4sSw7F7amunQqWOFyt8Yzhu1mYP
 UNnSHrMsYKTfmhqPSPxq27DT1Hy2x0PClGHvV0qrsqJVXZvo0EL7ojsDK0KlwBgPS3jY
 todLBkWYmOU2TrBao+HBCo9KSPliV1Sn7W8SOpWMtHbAqKqRV1tIzXGjFPfvO1u5SI/E
 Z1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738723991; x=1739328791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJCxeQf3VyCaGV3Y2vA9kcx9yqwJL3rmHKrDp4Nke4g=;
 b=oBjst2lXRWhQQ+bIOQDe0Wafc9vJalRr/tQi9XuzU8aprRu3tF50xoY0LCzvXhN5VU
 FFkZd12G0EwTpq8Bn558eFKGB/YkgCZWfhSsEPsxI95fvI4A5wRRBhCF/gpGy9Z44fsv
 hhWrhUVbnq0/zdVTfYzjXW360ECYpW0DbUTnnPi08yFr/Buxr8oT+Il2JcqkSFs9Nkxn
 JUUPPABRd/+Lib7hLh8N4n+iE5UYu1gqfHTWfdDLnLD42QVktY5j6HLkZzZs4vsjj2jZ
 ho5DfEhsfr8oP3fCbo8PwMyQAoCduynB6gjqMZxXwtRZZJ6sFSv0vhQh30pxmurBTOKX
 0Xcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1/3T/QyDNhFo1s5BX7CbUirui/yaDMoCydKJFNH+v2tUhgwJQ/hJ01H8uM1IRoolqa3PqOOenufM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBdul4XeQ00MOjQxx1mFEOHFMf4zSoss9ohiGaHS9dgkbq4bWH
 Y3NJrD/nE4Mfw2RB7/BHwE4Dz2QWOxgUmFQ7ogTEX1CB/5MHSX6xiT9uuxs2dIM=
X-Gm-Gg: ASbGncsVlcxr9MtDMwV8hJRSctPY3jPAzQj59IJEgrzz+anTwS0VTyXYFzdPQRdmPm8
 z3b3dTUK/3JIxaSYvPmm3X+9tJ1QbIn5VymhU2UBlGrqjE9HFOF0GsyIzw0MqaMtVegvazfHmsE
 Xpngz3pE6zQx7kH68+vq1fc3n5lnLiZg8T/6LbJxY2wATEpI841YuUrRV7phQy/2sz1nHVd+sBo
 QFJJuTh0z2hVDrBGxTLq1Y67mzRMXUFQPZA84E7nMcLByONw5n/zP/QeYyl4S1Y9Sf3j5w0dBBS
 RfIZIgoQ/pLOrMad4FmTKm+BEROFG4pe5el1OynR1gSHA/f0f+YzJNEY8R/ejk9OPH+BcyI=
X-Google-Smtp-Source: AGHT+IHKbdkPoD4sLQRcYq98EifYY7LO/k/V7T3PEuc6tS1CgUEZ17hANIO0DvmUVzFJE0G3jLyJtA==
X-Received: by 2002:a05:6512:3ca8:b0:543:e0c9:1d97 with SMTP id
 2adb3069b0e04-54405a1067emr296878e87.12.1738723991212; 
 Tue, 04 Feb 2025 18:53:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb0a8asm1737939e87.151.2025.02.04.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 18:53:09 -0800 (PST)
Date: Wed, 5 Feb 2025 04:53:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/35] drm/bridge: Pass full state to atomic_pre_enable
Message-ID: <bedgtbsqog4euxdxfskwdqqimribehtge3khh7rvebh2o2j7jx@xpbt62sg5faa>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-2-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-2-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:30PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_pre_enable hook prototype to
> pass it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  7 +++----
>  drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
>  drivers/gpu/drm/bridge/panel.c                     |  3 +--
>  drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  3 +--
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
>  drivers/gpu/drm/drm_bridge.c                       | 15 +++------------
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  3 +--
>  include/drm/drm_bridge.h                           |  2 +-
>  19 files changed, 25 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
