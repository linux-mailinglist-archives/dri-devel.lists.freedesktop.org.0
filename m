Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C234A013C1
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 10:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3E410E296;
	Sat,  4 Jan 2025 09:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I5+0rUES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AAB10E296
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 09:47:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso22451529a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2025 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735984010; x=1736588810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
 b=I5+0rUESb1JNVeen1TrEAQFS4zU6nWs4mkCyn0eesTDaMkXml2FpyjvEMQbwWsmytz
 BAajBksUVMnMbEV2VMuJeV6K2TDQ+KWW3DaFAKmCyDQUjmm8S0dN15U9Satqzac2nLNS
 bIHnJ3ei3x4kbsEnzRizq8NR28hOn6K4Le+5+BN81HrFPRVgk9clKoYDIhuX8uEEacCU
 dvFO7pMj54s/HufhOPm21d85e/m+TdVecrARXUugow3KoCuB3jRuPgoT9x2tq11LzrLY
 SkXEXqmDSW9LbRs3tJI1e2hMpFdEuoza7cBbpcwNSNHlhBw02mDOSfppYS8UEz5P6pZb
 Pkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735984010; x=1736588810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OL2v2cgbonvN/57biijzRWsX5GH+mP+xPVPcn+nnd/k=;
 b=N0HYCK0k7K7dUapx4LVik72eT6KidnJKWYSdVAv+2b1zvE33ZcHy8k7wKvpRghRfZ5
 Vywl8wnW6ehhAZpclAlLztAac9EKGLhPaXdExebWw0b4WMAqV2hpLvpTYbPd9xfOyzYB
 rpv2kTYdZNdB7EH2eCGWeYsOGpxZrSBeFZZGeEfWehOHHGBd89hoGadt4h8/g3gGO1ID
 k3YvqtaItZkCfPP7YGsk89HvwHMs774C2RTps5AH6nOZuwF27vBJicX6joRljjWo6QGW
 88lFDn8bABdqNZ/evVsJLVcpJMpCJTw75NqnIDSP9t06JHSt3UpPF2JAo7/wMEnzhjCX
 zYVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz7TQwAa48x+92RL5sJjfbWy1C/q8oHaU793Q3JKgvaoW0NuQLqqntyuyoCE/zyOaSDbNkwfFitkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx7qXxwvN+CrxXIXHeZtI5OoEIIoAPnhlyIj5R01/uzhRGZqeK
 X324u1+Sss9GWhf6fnoGKRW4fgQb3Feunu41M9D6EEvcGtby3CerMCQxQ1FavfSOh7oCUOGQ8V9
 eAd4=
X-Gm-Gg: ASbGncvY0jGgzP2hSrdCA2kpucl1fkZOEwxnPV5907ZnXsKsg0R5aiQ57e+JXG+by4C
 rkrSubStXrWu105hWpB9idq30/qyv+Y0SpUYAqlZZt/6XUMw0ka+UgyqVs022sGB1jiZRmyM0lO
 i/qKjtYJIUSxyYc+1qt8wBPAtQbeIE7deOrixoMt35Pi9AFmfgCs53B58JfM/ElzIgD5zhhclcy
 nhN8WPyTIE5sX2C8eHLYdxsfAh2Qdm4UU/fREeK9wXBHt4BtK0pTM6hWe8qwxJX0JKRqnW3lIWN
 AOsAZU0Y0sq8YN5krIs99+XZ
X-Google-Smtp-Source: AGHT+IH3b8Wrusc5F4Hb8fKgaj49rA+Ki+WtT2vpjNm4L2ymezTReLIBxE1xf5KxHdrS/65tedN1lQ==
X-Received: by 2002:a05:6512:1114:b0:540:2fbb:22cb with SMTP id
 2adb3069b0e04-54229533aeemr14027670e87.13.1735973304217; 
 Fri, 03 Jan 2025 22:48:24 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223825f3csm4213238e87.226.2025.01.03.22.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 22:48:22 -0800 (PST)
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
 Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Date: Sat,  4 Jan 2025 08:48:19 +0200
Message-ID: <173597328997.875472.12782462213120017264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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

On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] ASoC: hdmi-codec: pass data to get_dai_id too
        commit: 6af45d7df1099ccac634b36f8cdfa32fbca8c1d1
[02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
        commit: bb1d67bf82fbd2c550fa637e0b8a966ee81a293b
[03/10] drm/connector: implement generic HDMI audio helpers
        commit: baf616647fe6f857a0cf2187197de31e9bb17a71
[04/10] drm/bridge: connector: add support for HDMI codec framework
        commit: 0beba3f9d366c6df10e5b080fc99c45ac17248ed
[05/10] drm/bridge: lt9611: switch to using the DRM HDMI codec framework
        commit: c054aa1bf529a2fa13546b25231d16bb0fd87ca2
[06/10] drm/display/hdmi: implement hotplug functions
        commit: ab716b74dc9dd4903b9006f473137e1aa624af56
[07/10] drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
        commit: 4b5a79d7f4d5c34120c6f2e8836bc8ad3a43594c
[08/10] drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
        commit: 9640f1437a88d8c617ff5523f1f9dc8c3ff29121
[09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
        commit: b4fa0800760c20fe34318a1079687526fc323572
[10/10] drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()
        commit: 2ea9ec5d2c207a41d523f8804053cee00fe50763

Best regards,
-- 
With best wishes
Dmitry

