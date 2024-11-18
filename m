Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745959D18D2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 20:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0F510E55C;
	Mon, 18 Nov 2024 19:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OS/CWLvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E68D10E276;
 Mon, 18 Nov 2024 19:25:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso34238925e9.3; 
 Mon, 18 Nov 2024 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731957958; x=1732562758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9pD0Ic6pq3x9QjpEUEJLIp8QMqGQFkQZMFW6bkNDgUM=;
 b=OS/CWLvGwG9nTEACckM5bLUjgEntMcEqkm+tAVDaHsUtTileueOTWAlsZ3nNBshbD4
 rRsAdVkNEQ6zG8xBEcsmkKfGbzE/TSCFxFDnc8auE/qGOBh2ID7PKmi4UK3whIqoNChQ
 On9y96anttNLKikxx7ExpfKIAGsjyvy/MxlvdxmNT7Qo+rxJuidIx/FXOeuMXC+kRu7N
 8hp8z7yoq4Ot2OGMuWKa/QOPedlPs9mNIux+mom0n5xBXUOtb+BXqy9Tk4g93D5kpf+H
 seeHUyfAD2chTjgikn4Csj2t6DGbxp/9H9YSAszER8H/wOmVhuqXTFt8ZL5DIVao7iFO
 Hy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731957958; x=1732562758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9pD0Ic6pq3x9QjpEUEJLIp8QMqGQFkQZMFW6bkNDgUM=;
 b=arjmtdLLPHdn0TqVw0B3YV5lZc+v27eaqI6VrtbyCRbtakIkgNWvT1lw0xBRQE7Rsv
 +vAVyx9hti1RjPIP6AUBChrCeNrLwM/sHxN+JAJ6Z0H12Jr1jmQjFSdwhfRY/JHVgecQ
 I+7LQD1G/JqXAUWcnfSgNi+xpVJR26mgQLZnSGP+R88aZ/oKgNVTF9bfnN5cawPNp4aQ
 ZLjONFTFIzXNK+hJ2FoFVU3wmrkJYWOAlCcKkvUTu+lEL/VEMJG9IE17ji6hjAWlYP8H
 p3KDcFpKUnpKVWWi8Y3XY4oQBGOsPSkOQD4TCYj9HRl73nlyKiddjCZcsHs14Hj+cDb1
 FHRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG3a7fAU0VDhLafgO3ky73oa3mt0jrbq7LaqFSBJHtK8wre7wEP61VI3/O6ktyicAsxKxk5Z0pdmMT@lists.freedesktop.org,
 AJvYcCUd3uX88EX4Pnj+gE5GohLIdbGAnlXMj6mPlEvdX6YrqDyIIekFESdQkWzY8mOeGoF/uhWdkGJXdg==@lists.freedesktop.org,
 AJvYcCVZ9DhdOFDsi2wdPRP6/4gJjCnn3jOBXxD94XPbj6wjHME3SCN29SKsfWVvMf3B4BQiFYWG6XqVgdU=@lists.freedesktop.org,
 AJvYcCVeGGFCmZQRq3Ky1SG1Q+c5hJ9uWesrgM+7LOpTNW7YMj4RJHVAEcRKHkECVZdZAyOup0tSQxvI6X8b@lists.freedesktop.org,
 AJvYcCWj5+q6q+QVCfQBBiT+Ak12RWlOGQ5UrEwg2zeHNfNsIU5GjPHQZ7k5pir+vK1n2u4pfGbgesDe@lists.freedesktop.org,
 AJvYcCXBqArqguEIySDx68fFSsioP84xBMWzD+cCRwxFj6tmsN+cybeoOXe1u4dZ4JQH05gnyeBA3gVwKXbY2oM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/8ZMWmlyBbIRT4p90lYS6sXE1MkhveMljckpEZQ0d0w6HLf08
 hIWa9RcT2oytQKczyf2bplMq3bfxboiL3+QgckKDNMQt8+Toz+3W
X-Google-Smtp-Source: AGHT+IH+lcOQ8Rj8oM11CtrUWBNXK6zZA1wltL3ZBTXjDjqXIpvoTVhgtssacVRTup7RXCuDYGl00g==
X-Received: by 2002:a05:600c:1d97:b0:426:59fe:ac27 with SMTP id
 5b1f17b1804b1-432df78f3demr130180715e9.26.1731957957571; 
 Mon, 18 Nov 2024 11:25:57 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da298c81sm172023915e9.39.2024.11.18.11.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 11:25:57 -0800 (PST)
Message-ID: <8a4f69dd-b393-4e84-be3c-58f8b33bd59d@gmail.com>
Date: Mon, 18 Nov 2024 20:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sti: hda: pass const struct drm_display_mode* to
 hda_get_mode_idx()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-3-b1b523156f71@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-3-b1b523156f71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



> Make hda_get_mode_idx() accept const struct drm_display_mode pointer
> instead of just raw struct drm_display_mode.  This is a preparation to
> converting the mode_valid() callback of drm_connector to accept const
> struct drm_display_mode argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Hi Dmitry,

Thank you for the patch.

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>


Regards,
Raphaël
