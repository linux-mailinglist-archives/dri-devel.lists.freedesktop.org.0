Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AB9FB8A6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 03:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264510E5CB;
	Tue, 24 Dec 2024 02:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WcIhb9t2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CE310E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 02:12:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540215984f0so4980208e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735006342; x=1735611142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3s/fP327ZPotoIZCGDOewI4b6zUAPi0UgIAIenPI+A=;
 b=WcIhb9t2uBjr6aG7fDiQB52SfoPIcZ13wV6MAWJ/Yf0VuzZQJyzs+cS37Q199X98nd
 /wXTS24CkiGblEZeGm8VJLUCPn1kink/Bfm9UpAAQcG+CLkJfndqzdDFDrBxBWLOs9tW
 5+0GHSC2+K3bsPoiKE+OlwGLHBWRhiaCTxbcxnKD6W1kK9JNMKIwe+jGuqDA/dyHMqzk
 QqOpwdJRszoMnl8by3ki0W5sqamVZs7wF659UIres+jA30OgfquiYBynN4HvdaOINTAd
 7KOaAzjcNUXMdfU7Hr2oLjjv9Zau3tV97vZiavfiV/4aU4E2PjNmgd/6SVfG33CCbKA1
 6P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735006342; x=1735611142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3s/fP327ZPotoIZCGDOewI4b6zUAPi0UgIAIenPI+A=;
 b=pp/acVNUB0g74zXkK8Lm/+dRVITqUBxsHf7ukoZINGnIdszgx9wnS4uQW9Ec7SVMmz
 7VFBmAbKFwl3I64WevSZOELv+Lqt61s8g/Vfj0rkaLYGPL7B3PmrQHtWcif8MzVJK9t3
 LGJO7RmPJsF3yhyPk497rGcScwdMiWRe5rCtlgWGGxGIhsmy58t6PhE7YJmgi20adihE
 If4U7ExcvbNEyniXIvt8cVTsWaeXc5G1UUoK2eWRyqAgoEPqe0+umpKYjsVKfr25n/OT
 zLNg6wmKGg22e5X2GcpLWnxMH12iP4kinUeJC9xQfjg9szGYu9Tr1i6eVR5QCVgJGnP1
 cHzw==
X-Gm-Message-State: AOJu0YxIBDAY/B3DLO6xa3F46eKT/UWPO1app3kSnrmbAuT0+Bf5tsoz
 DSd1kdVpF48owrx7QXZn7eZiCNRaQzWTY+O3tvBE8hJt+xS5j2IagalIfZAsCbA=
X-Gm-Gg: ASbGnct9HIv0MvhjS5TIGXJdAlOtHG8AlCEJM5/hx6abPZAtOiCZ6cLmREsDHQWzMvT
 ePgY3nxyQjizkdYfrhc5D0IQvjzNZvBXOQxzMJ7HnRsY3SjodaVkRO3N6YwkID6E6UVYdsHWw+i
 4eiu1TsNKi5+lfe3C9yTke9BJPrQpedhTexLy3mNgqZS3Y06QMgikg6DhdAoQPLIVLOE3IBvFHe
 zSPK1ASZMp7bG2ji1f4fbxLl1Sr3aZrCLflzFWCN2YVRfuppno5G1Zxep+LFgawr613zWroOfU/
 6W16zHrUgu5ZKCG3y+iqtR/i
X-Google-Smtp-Source: AGHT+IGEs8XAzgYoh7KQhbBvXEuwwwcuCvcNiTckpl6MIX+TBAcLiiS/Om3LTtJCv7kDsn4qzeT1xA==
X-Received: by 2002:a05:6512:32c9:b0:542:28a9:dcac with SMTP id
 2adb3069b0e04-54229549419mr4786750e87.30.1735006341775; 
 Mon, 23 Dec 2024 18:12:21 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382fabfsm1449528e87.231.2024.12.23.18.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 18:12:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/bridge: move
 drm_atomic_helper_connector_hdmi_check() to drm_bridge_connector
Date: Tue, 24 Dec 2024 04:12:17 +0200
Message-ID: <173500633363.4003211.18246952957985542872.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
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

On Tue, 10 Dec 2024 16:16:46 +0200, Dmitry Baryshkov wrote:
> Reduce boilerplate code and move calls to
> drm_atomic_helper_connector_hdmi_check() to the drm_bridge_connector.
> Initially the drm_bridge_connector didn't use HDMI state helpers
> directly, so each driver had to call that function on its own. Since the
> commit 9a71cf8b6fa4 ("drm/bridge-connector: reset the HDMI connector
> state") it depends on DRM_DISPLAY_HDMI_STATE_HELPER, allowing us to use
> the helper from the generic code too.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/display: bridge_connector: provide atomic_check for HDMI bridges
      commit: 8ec116ff21a97918d187491dc8f90d7eb173dc1d
[2/4] drm/bridge: ite-it6263: drop atomic_check() callback
      commit: 487d1ed989e5ec418b45b9294e8cceefe29ce4fa
[3/4] drm/bridge: lontium-lt9611: drop atomic_check() callback
      commit: 15b8f5a297f793f859ed2104755ebcf29384e26b
[4/4] drm/bridge: dw-hdmi-qp: drop atomic_check() callback
      commit: f8a2397baf041a5cee408b082334bb09c7e161df

Best regards,
-- 
With best wishes
Dmitry

