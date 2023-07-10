Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D274E00A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 23:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9CC10E149;
	Mon, 10 Jul 2023 21:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7494D10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 21:11:54 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b69e6d324aso78551001fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689023512; x=1691615512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GJenQ6f6ywLinDtg4prv44o2QMZjJQ5Y8NtEkgjX+F4=;
 b=intrAPE1oGXQ5h0kGbkzl21JZwwqG7+xqKe2/OH+7oxAiorT6bS9ZO7mHkQgsgHsGq
 L1L3N3e4SjqIDcxezdURCPzQu3fk+jZcB+yHa3ys16+shORr8u2MGgLc2NHEVTS8YDnd
 ObqIIR++a2++vSYd+IuTPgrsfQdEb9gkNdUtAGqwRrZi+PlCR+6SuT1rfgt/B/BZZ9cv
 j8frFuTe9QdAiiKqmWJbcScCl1I0sJv/H9ocC25IGHU+60n5foxintSmDz8f1Ohok8wk
 GJU9SicCjy5ye1zt3W9ylisNst67BTMzgtxkh34oSqMvwKILbiCOZAmZEhSah9vELGho
 3Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689023512; x=1691615512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJenQ6f6ywLinDtg4prv44o2QMZjJQ5Y8NtEkgjX+F4=;
 b=a7TeBzjHuuhi423K0ppCoLaa98o2z2Wm+8wFGn3hfsJzaKAtKQQRFZwK5+GmxSkQqE
 ZvpdDgeGT/3zuwZehMkL+Rqmn3eJjKzSXWlAJtWYHmTBnT1VaeiXRSonwJ6XUv013MvV
 5DJT5bfXxl+utjCgISvJGtQcP2c67cA6TFwhF45jCJa7+J2cVjRP2GvBF2wL906d3RWi
 SX4QJhrn/t3BrfRTtY50mXw3Ok85I8Ern2i9FH4QhjZ94UMBMBTKEm6KDjF9+r1buU00
 AqKS3GL6k78bUKllSsQFJpVFKYBt3uqO4MA92/Uq1mGfec+VEH+56FXZXhAdOIUkbOLF
 iyMg==
X-Gm-Message-State: ABy/qLYaMPR3px0urjFpYSwBZYZTVRm5FMVm2gKDrI31VaNTW79D8pfW
 g1wOx1w13sKJlxj1p5F35CAgLQ==
X-Google-Smtp-Source: APBJJlECknYOx1HT0pSCZAbvCXQdaniHuFh6q/nvRIAezFbLQ7Moab69lE7D8j1itiQh6IaRFQ/iFg==
X-Received: by 2002:a2e:800b:0:b0:2b6:a344:29cf with SMTP id
 j11-20020a2e800b000000b002b6a34429cfmr9781907ljg.17.1689023512008; 
 Mon, 10 Jul 2023 14:11:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a2e9946000000b002b6d781b60esm138615ljj.82.2023.07.10.14.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 14:11:51 -0700 (PDT)
Message-ID: <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
Date: Tue, 11 Jul 2023 00:11:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230710091029.27503-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2023 12:10, Thomas Zimmermann wrote:
> Generate a hotplug event after registering a client to allow the
> client to configure its display. Remove the hotplug calls from the
> existing clients for fbdev emulation. This change fixes a concurrency
> bug between registering a client and receiving events from the DRM
> core. The bug is present in the fbdev emulation of all drivers.
> 
> The fbdev emulation currently generates a hotplug event before
> registering the client to the device. For each new output, the DRM
> core sends an additional hotplug event to each registered client.
> 
> If the DRM core detects first output between sending the artificial
> hotplug and registering the device, the output's hotplug event gets
> lost. If this is the first output, the fbdev console display remains
> dark. This has been observed with amdgpu and fbdev-generic.
> 
> Fix this by adding hotplug generation directly to the client's
> register helper drm_client_register(). Registering the client and
> receiving events are serialized by struct drm_device.clientlist_mutex.
> So an output is either configured by the initial hotplug event, or
> the client has already been registered.
> 
> The bug was originally added in commit 6e3f17ee73f7 ("drm/fb-helper:
> generic: Call drm_client_add() after setup is done"), in which adding
> a client and receiving a hotplug event switched order. It was hidden,
> as most hardware and drivers have at least on static output configured.
> Other drivers didn't use the internal DRM client or still had struct
> drm_mode_config_funcs.output_poll_changed set. That callback handled
> hotplug events as well. After not setting the callback in amdgpu in
> commit 0e3172bac3f4 ("drm/amdgpu: Don't set struct
> drm_driver.output_poll_changed"), amdgpu did not show a framebuffer
> console if output events got lost. The bug got copy-pasted from
> fbdev-generic into the other fbdev emulation.
> 
> Reported-by: Moritz Duge <MoritzDuge@kolahilft.de>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2649
> Fixes: 6e3f17ee73f7 ("drm/fb-helper: generic: Call drm_client_add() after setup is done")
> Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
> Fixes: 63c381552f69 ("drm/armada: Implement fbdev emulation as in-kernel client")
> Fixes: 49953b70e7d3 ("drm/exynos: Implement fbdev emulation as in-kernel client")
> Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulation")
> Fixes: 940b869c2f2f ("drm/msm: Implement fbdev emulation as in-kernel client")
> Fixes: 9e69bcd88e45 ("drm/omapdrm: Implement fbdev emulation as in-kernel client")
> Fixes: e317a69fe891 ("drm/radeon: Implement client-based fbdev emulation")
> Fixes: 71ec16f45ef8 ("drm/tegra: Implement fbdev emulation as in-kernel client")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Moritz Duge <MoritzDuge@kolahilft.de>
> Tested-by: Torsten Krah <krah.tm@gmail.com>
> Tested-by: Paul Schyska <pschyska@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.2+
> ---
>   drivers/gpu/drm/armada/armada_fbdev.c     |  4 ----
>   drivers/gpu/drm/drm_client.c              | 21 +++++++++++++++++++++
>   drivers/gpu/drm/drm_fbdev_dma.c           |  4 ----
>   drivers/gpu/drm/drm_fbdev_generic.c       |  4 ----
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ----
>   drivers/gpu/drm/gma500/fbdev.c            |  4 ----
>   drivers/gpu/drm/msm/msm_fbdev.c           |  4 ----

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

>   drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ----
>   drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ----
>   drivers/gpu/drm/tegra/fbdev.c             |  4 ----
>   10 files changed, 21 insertions(+), 36 deletions(-)

BTW: As you have been clearing this area. I see that significant amount 
of DRM drivers use exactly the same code for msm_fbdev_client_funcs and 
for the significant part of foo_fbdev_setup(). Do you have any plans for 
moving that into a library / generic code? If not, I can take a look at 
crafting the patch.

-- 
With best wishes
Dmitry

