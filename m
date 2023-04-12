Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CF6DEC3F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2EF10E71F;
	Wed, 12 Apr 2023 07:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7F10E72F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:08:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w24so224440wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 00:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681283293; x=1683875293;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRVDoRxZOnCqyPQ0MQntkNzttq8Ux3AtLsMWOQ7D4FE=;
 b=ha2vypvTHY16Ds2mJiLw9Or9VCm3IVSgJRWOqg6JpyIS0+hmMidH8e2HNWdCXuFK8H
 O5KpWQANuTJkVDCNNEc/P0VA9ZT9rhHDdmzC9uLkcZwKgCXxK3s1UmlZBuuYrZ6lCvra
 MgNmnP9El5Z0SaWfMs7M1tjvnNrcS0iq1JQeb4AvzVNv9OKirgw0ha9E9VIUp4e6sWBY
 IUB7tUMdRqqYr/QUGmcSIUBCMilREn3H2e9cPJA4KaekF9y//c0x9o6+6xOtF0ZSeCjW
 Hy4uw/Hh4FKmUo3iL7bEuk8Z7Vrox0RQb1eYgfVaGRrtbPrZAM2s7lB9tCYcXWoa/30c
 8UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681283293; x=1683875293;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WRVDoRxZOnCqyPQ0MQntkNzttq8Ux3AtLsMWOQ7D4FE=;
 b=z8HS7WPHvgJ8NQgzb8JHDEmZwy2B+gvU0J97/LsP9Z77eIesii1r8bBJ3cxL4P1XmU
 Z9PZ0l40CJiliQN0uM/J59ZursGX78ZoY3iBTsC5mFYiG0J2IdFnwBprg70eEiyT44RP
 /FXobY7ni1OVHebY06BKOXKgx6kftJ1fVbMl4ziYHgK+Rxne8B4L6KDdAW2bKfzpWxX5
 OXgHmBAx8dueTmQz0aWebPGmOP9wqXSM9Z0kwVuV3uYsQDZkM+mCIr3h+O5H+R6FpQbs
 oRTUVfaBJyoFKBli508af7j6cj740dKlGGgo/1kz6zkUGRrBHjHzhDoPepp9V+wfomNZ
 4kFQ==
X-Gm-Message-State: AAQBX9cWCtSXcePATIkZXe0m3Onr83pPvW9HyuCcEaIlRMA4+pQDo7y9
 FjBPqPRWJ5JHuML1eRv9MXU=
X-Google-Smtp-Source: AKy350ZtUps0T9bcSmLM6ndGrgQLrodvDdIkAWKxyVJNGFb0684QdbduVSGa5v/3RLCg/FHwnh7rIQ==
X-Received: by 2002:a5d:4105:0:b0:2d9:10e7:57e8 with SMTP id
 l5-20020a5d4105000000b002d910e757e8mr1152031wrp.16.1681283293444; 
 Wed, 12 Apr 2023 00:08:13 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002d45575643esm16249833wro.43.2023.04.12.00.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 00:08:12 -0700 (PDT)
Message-ID: <09c61b94-1ed1-eb72-9682-1f1f203f6f63@gmail.com>
Date: Wed, 12 Apr 2023 09:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 1/9] drm/mediatek: dp: Cache EDID for eDP panel
In-Reply-To: <20230404104800.301150-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/04/2023 12:47, AngeloGioacchino Del Regno wrote:
> Since eDP panels are not removable it is safe to cache the EDID:
> this will avoid a relatively long read transaction at every PM
> resume that is unnecessary only in the "special" case of eDP,
> hence speeding it up a little, as from now on, as resume operation,
> we will perform only link training.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 1f94fcc144d3..84f82cc68672 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -118,6 +118,7 @@ struct mtk_dp {
>   	const struct mtk_dp_data *data;
>   	struct mtk_dp_info info;
>   	struct mtk_dp_train_info train_info;
> +	struct edid *edid;
>   
>   	struct platform_device *phy_dev;
>   	struct phy *phy;
> @@ -1993,7 +1994,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>   		usleep_range(2000, 5000);
>   	}
>   
> -	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
> +	/* eDP panels aren't removable, so we can return a cached EDID. */
> +	if (mtk_dp->edid && mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
> +		new_edid = drm_edid_duplicate(mtk_dp->edid);
> +	else
> +		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);

Maybe it would make sense to add a macro for the check of mtk_dp->bridge.type == 
DRM_MODE_CONNECTOR_eDP
it would make the code more readable.

>   
>   	/*
>   	 * Parse capability here to let atomic_get_input_bus_fmts and
> @@ -2022,6 +2027,10 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>   		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>   	}
>   
> +	/* If this is an eDP panel and the read EDID is good, cache it for later */
> +	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && !mtk_dp->edid && new_edid)
> +		mtk_dp->edid = drm_edid_duplicate(new_edid);
> +

How about putting this in an else if branch of mtk_dp_parse_capabilities. At 
least we could get rid of the check regarding if new_edid != NULL.

I was thinking on how to put both if statements in one block, but I think the 
problem is, that we would leak memory if the capability parsing failes due to 
the call to drm_edid_duplicate(). Correct?

Regards,
Matthais

>   	return new_edid;
>   }.	/
>   
