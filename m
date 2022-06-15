Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C454CEA8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6EE10EA8E;
	Wed, 15 Jun 2022 16:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4610EA8E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 16:31:15 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f9so10897876plg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YdNSDdpF28pADLYgfkDW0JNGk35ddAn9s2Wtj0NQQ2Q=;
 b=Ra3/gzgHLMvhMwLdQQySr/AEsKgTQMBRhU6/8HG3JugrGp53TKxO0j9eEm7MGgognn
 fx5xOfjJ6rcI23PbqmaP9MCfc/xgt5WF6pl46Cqk3RVVe5FcIjhkGzEPHOmswY03z/WK
 9BzK10ikXKviG0ZqWns1DxWiDTGgWkobEIeiBqHTDEklBELLFGkYqUrZJBm/KkHpLJph
 C4wWwQe8pf3La5DBg+t6Q6pI+/RXGKnMKNRhvgLM6C2KCfQ6yrSFRY9vd4iRR5e/klWj
 L9hV51sHMf3BoA2/pP9k8/BO1if/8OFkX+GFKKBMTs2bt3oxfMOMoWcTBw3uLAvUqn2l
 fmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YdNSDdpF28pADLYgfkDW0JNGk35ddAn9s2Wtj0NQQ2Q=;
 b=DIVXQ40yG5aIVDuunTgmofuPrfe83o6E8qgeWnPdOfeXTGP0ZCACxVaZbpOPTwhnfH
 MhEFiTUq/s63ljlMFdvJIsaXTfb5y1KQvmNxj6ZvB1rjVt8SVV0Zu3TNdbOKuvbe9hUZ
 VKFe12q15xSeNeRbzLFWkdzogQK1WNBCkzAQbsb0/9Ll4SzCEJ24kh8eJ+pQofdcaok5
 7oZJ6b1M8CI4utjDs6rdWybh3q4S2B3HTI325+e9Sjv4vfLPs/CjQD5otbzKFa5qlVS6
 l5gxlCiNLkY2YhU86Gmk+a4j/Uimhzdr85qgxantwdByeTIn7S1/fTbA8pjEjWO3YFIQ
 SBTg==
X-Gm-Message-State: AJIora+CSt8gEI4arpEf625D4TbSDb+jmPPe5ECarrHjI4zuBUUAbAP5
 bMqnN8e+T+lgRoTJ1ute9nOZmlgVud3bWGdt1U+7yg==
X-Google-Smtp-Source: AGRyM1tVeSFJ9MDUV4QfDSYCsyFBWbtC+ASjHQDphSfhT/CWvCSk9MOpeXGJRW96EvLtaQncLlpGenrTxVdGQtgFTzQ=
X-Received: by 2002:a17:902:f353:b0:167:7bc1:b1b9 with SMTP id
 q19-20020a170902f35300b001677bc1b1b9mr192047ple.117.1655310674625; Wed, 15
 Jun 2022 09:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220613150653.1310029-1-zhengbin13@huawei.com>
In-Reply-To: <20220613150653.1310029-1-zhengbin13@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 15 Jun 2022 18:31:02 +0200
Message-ID: <CAG3jFysx_sS2QAdh2G9xivD8OjNXRPn1H0zVq=1V4P7yi7UoOw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: it6505: Add missing CRYPTO_HASH
 dependency
To: Zheng Bin <zhengbin13@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, gaochao49@huawei.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 16:54, Zheng Bin <zhengbin13@huawei.com> wrote:
>
> The driver uses crypto hash functions so it needs to select CRYPTO_HASH.
> This fixes build errors:
>
> drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_hdcp_wait_ksv_list':
> ite-it6505.c:(.text+0x4c26): undefined reference to `crypto_alloc_shash'
> ite-it6505.c:(.text+0x4c6d): undefined reference to `crypto_shash_digest'
> ite-it6505.c:(.text+0x4c7d): undefined reference to `crypto_destroy_tfm'
> ite-it6505.c:(.text+0x4d69): undefined reference to `crypto_destroy_tfm'
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 8ffd601e68f9..1afe99dac0ff 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -94,6 +94,8 @@ config DRM_ITE_IT6505
>          select DRM_KMS_HELPER
>          select DRM_DP_HELPER
>          select EXTCON
> +        select CRYPTO
> +        select CRYPTO_HASH
>          help
>            ITE IT6505 DisplayPort bridge chip driver.
>
> --
> 2.31.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next
