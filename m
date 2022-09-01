Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C485A8E8F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 08:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059C10E627;
	Thu,  1 Sep 2022 06:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67110E627;
 Thu,  1 Sep 2022 06:45:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z8so12464582edb.6;
 Wed, 31 Aug 2022 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=++zrN/rWVjY3ex9jtOllxTCInKN3pkXs9YkUhtChz5k=;
 b=YnX8YJAiNhDBYXCKbeG4LzILhSuYf6l34DOfoXAV+2BNNiqDejkT1JhCOqk85bbLvM
 zoR2Hcge5b95X53WQMadn1yVJwPDDawbp0y0RILXXbQrJ05xxfQJ9LytnW8uFtfxdomX
 HQxLEqSY0zmbjFH5qo+HIVqX11AzLuaXZXmMVUbkcVJyin2bh3p19cTXD3ijCHkGg3JQ
 QmozsU/gGAP4TCFY028A4kfd3jsdpgVW6S3Vuu6BkOJHrMWqfM1ne9IOHZplONd14kYK
 3KjcL+VdwhlqnsHbUMqkKTTGVJncmoWHNfx6LnxwRuQcifdVoguXtSILMcx3/MwDW/MA
 kCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=++zrN/rWVjY3ex9jtOllxTCInKN3pkXs9YkUhtChz5k=;
 b=oinhfMRtf1hyd8PIQ8Y10/cJtgR024rilVz5mT4Ad9E5UmuQ+Jaf6UhbWWQgxHrLxc
 1c/eAks7BJz6Bt5g1Pzoh2LDWiY1atpxRtTb88aiLKm+H9KK7+ZtA7KDu4YHzi8rXtRu
 8hRZ32TSy4D0nMUVR3hInW4uAcASjN1ak81NGWgpcaOYSsR1uWgIjvANUGaT9FIUbV2h
 NNKgixEWTvYMAZPYUHwpfcmbYXbYexociI4tcyAUnTXoh1e/TNUfa6zyldIniMKUsXbR
 PuPtiWf/Pi+Mp0UgfCSJWiH6mF8Ygfy+jEJKGX8JBYKvDl1BBkH62q9WUvPNBLgM+IF4
 qauQ==
X-Gm-Message-State: ACgBeo2RB6krQ+xgWkFxgoBvcwWfnNRBE5xIr3fypbsiEk6y1hKzY82N
 pg+uDKZtpobzjXhYdptSslo=
X-Google-Smtp-Source: AA6agR4WM9TvD6ATr67LU+K3A/g1BJohEx6M/gXPe6GWUlzDISRTSlHNurPT278X8F2LNo/Uip9krw==
X-Received: by 2002:aa7:cb13:0:b0:448:3759:8c57 with SMTP id
 s19-20020aa7cb13000000b0044837598c57mr18470629edt.8.1662014745147; 
 Wed, 31 Aug 2022 23:45:45 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de.
 [79.194.10.212]) by smtp.gmail.com with ESMTPSA id
 gt23-20020a170906f21700b007306a4bc9b4sm8019660ejb.38.2022.08.31.23.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 23:45:44 -0700 (PDT)
Message-ID: <06cad130-4b0d-a894-d444-21b5ee5b5a63@gmail.com>
Date: Thu, 1 Sep 2022 08:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v4 07/21] drm/omapdrm: Prepare to dynamic
 dma-buf locking specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-8-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220831153757.97381-8-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
> Prepare OMAP DRM driver to the common dynamic dma-buf locking convention
> by starting to use the unlocked versions of dma-buf API functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index 393f82e26927..8e194dbc9506 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -125,7 +125,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>   
>   	get_dma_buf(dma_buf);
>   
> -	sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
>   	if (IS_ERR(sgt)) {
>   		ret = PTR_ERR(sgt);
>   		goto fail_detach;
> @@ -142,7 +142,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>   	return obj;
>   
>   fail_unmap:
> -	dma_buf_unmap_attachment(attach, sgt, DMA_TO_DEVICE);
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_TO_DEVICE);
>   fail_detach:
>   	dma_buf_detach(dma_buf, attach);
>   	dma_buf_put(dma_buf);

