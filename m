Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB09E5EA0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C634310EF81;
	Thu,  5 Dec 2024 19:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WgCW9EU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2010EF8C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 19:10:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53e0844ee50so1409733e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733425837; x=1734030637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
 b=WgCW9EU9IgfbbXa/XSdvbVeWA6X+IcsqNsbhCEpSJqW7rVXOghYGApxt6AQLMQYin8
 IQ1KmbHROqRadBZVbdahNi6wyoROnHK1GBCM6mmYTp+JTNO2Y4sWtatIfTtjvyOAhF/F
 Mql5qs0Jd1MRk3yhlqJbGnR90Q34fcTwP5UJ6PSbIRLo5m+eKoyukZ/e2iiKE7ybN7mI
 oLpHuHuq9rkQKIOFvPk0rF2SGXF5546fDvrGvyDn1hNmxD8C28x26HqFJ64NwH7c8uk/
 hC6ltaJkio8Nnz4S1P/nc5zlkhr6vcDBF87sjQ7gdfjZ0/bRQU9gE7Q/3BzWxHyxFxMX
 kBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733425837; x=1734030637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
 b=aF2/GT2ZMFETC+kN1/0A5ol4X3qj0XpRb06pwI7pXOQkzdWP6qwOFRPrYFjYHrsODG
 blGUzaGLQmExtiJTGCj0qEipWHLxoBjxZJaagge4wLLq7xgi09ON8rKKsHM/dxS9nqKB
 MQXonhf/tjlfk8So0byAD9km9sOVMmgU5d39GJkHOOfD0f5E3rfyqUlfi183OrXK/WgD
 FIq+0PKr6ejtCwwla1XUdAwzVJNv/zB1i+8wIyaoJMieYBPVt8wEGjbk9x55d8+40Crh
 AB9yTwWAdDp1LoSETDKA/lXEy0h0H/DvQqvls07A7vU00YOedbSLBsjIiN8xNBbz97em
 NqCA==
X-Gm-Message-State: AOJu0YwWm7QbnzIE2uqMjoP1UIgXkpOcdeXJza2AX6VqT1C5EIwW/0Gv
 3lB4x1H6oi0vyZHDHn1eU5vdSVC77tSTijtudt8MB033B+tIcoiUpja7Yv4GWwA=
X-Gm-Gg: ASbGnctPFtqyZ8+SHef4HMnD5WB5o2cGuYZEsDpkc/LvK2JtF9fHrKRb751JP7MYjUY
 OhfLTKDAhlvFURK4JqqVkRmC9Jcn+WUVfRj1G/r3ewReH9Ydri3WTbeXGz2w3eYAvw5S+b1caBv
 jqPCWNe9ucMYg8j2R157C88CvV2Mwtfpw+ldJ1Rg1WgAPnwt6ydcAuHbB8tC4UbeOODnoR+UEXn
 hmVKE4Z2uMI+7AsSA7yW1OvLBGEI9Ra9rDZ5oQZwi6cZ3Amx3DreA4KyMA6HUbzMyDBTCEb2f3q
 RMLnxfd7zb0PQOmFBA==
X-Google-Smtp-Source: AGHT+IHUNLqaLQBuYan1ZGoMqkshI2yl9UY4KpKLMA9S8dD5jZebO/X3lWSvz99JLzTn4lGzisOwhw==
X-Received: by 2002:a05:6512:3c99:b0:53d:ab21:4e17 with SMTP id
 2adb3069b0e04-53e2c2f0135mr21836e87.55.1733425836767; 
 Thu, 05 Dec 2024 11:10:36 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm314252e87.52.2024.12.05.11.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 11:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Thu,  5 Dec 2024 21:10:31 +0200
Message-ID: <173342582161.2533869.11795486713615996638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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

On Sat, 30 Nov 2024 03:52:25 +0200, Dmitry Baryshkov wrote:
> Several HDMI drivers have common code pice in the .mode_valid function
> that validates RGB / 8bpc rate using the TMDS char rate callbacks.
> 
> Move this code piece to the common helper and remove the need to perform
> this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
> skip the check in favour of performing it in drm_bridge_connector.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: handle empty modes in find_preferred_mode()
        commit: d3314efd6ebf335a3682b1d6b1b81cdab3d8254a
[02/10] drm/tests: hdmi: rename connector creation function
        commit: 67d31cd02c8dfb3d006dba62a854e6758cf7a0e4
[03/10] drm/tests: hdmi: return meaningful value from set_connector_edid()
        commit: a8403be6eea91e4f5d8ad5dbc463dd08339eaece
[04/10] drm/display: hdmi: add generic mode_valid helper
        commit: 47368ab437fdd1b5118644659a97a6e5dab45248
[05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
        commit: ae048fc4f96d716a2ef326bd6e894694057c078c
[06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
        commit: d4581ae8695863b21f9b739dddce8159f3068ca3
[07/10] drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
        commit: 54d7b7f9d637a53ba19d117eb9b01619bb1704ed
[08/10] drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
        commit: efda6551aa866b80dcb5a94158d805c560fc4f1c
[09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
        commit: 2d7202c6f38d14260a3998a2aa249a53415a24f5
[10/10] drm/sun4i: use drm_atomic_helper_connector_hdmi_check()
        commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b

Best regards,
-- 
With best wishes
Dmitry

