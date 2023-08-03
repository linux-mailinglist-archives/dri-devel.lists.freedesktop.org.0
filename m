Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E476E294
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26010E5C0;
	Thu,  3 Aug 2023 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBD910E5C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:12:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe110de46dso6881985e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691050350; x=1691655150;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6Und5YZ86VldXU2R2EeUENrtdoW05YhCbc25DsdIRgY=;
 b=e10Hdd/1RX4n3g1L0Ssf8Bcgo1AdrbDlJ0yS4kr5wa/EUQT26mx/b3aEBK5jeeiji9
 CJrIq9qkvUvY5kRK2bWJ/6cFj0Wy9doMDcMp14ba0qW11+sLOKcTGb3YgskArmeJy8dX
 MKafxbCgFiOCvk4yW1Tkr04dgB8WL/Y9+OmDKY5Q15ZsJlH4FVVWK5MEmI1lQTUt3I3N
 quQMHCkvJdbSC4S4Tfe0XKqaB8NPq0c2C3fWGcVvWN2TMXIN0vQSGqcWr/12v+AkAl4h
 Va5cqXgv5f+z+d2gOcmc93hckl9m6pceZJNDl5oP+vr85yQcw0fV+ieVWe8Nvvf/6qz4
 PXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691050350; x=1691655150;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Und5YZ86VldXU2R2EeUENrtdoW05YhCbc25DsdIRgY=;
 b=L1sXCwGpdqRMT2CvYD4K3y1mbQLCRFORV3iu3BhnzLXw29BUmg1xe7fAh/cGF9czvL
 AG/03e2Oj09GsDngKwLL/VfwoVwDzqFmrEUYFOEfMqjU1ZTZHlMjyt0PaZCs2P6cdQgM
 5o4r2DCX1xTs6rR5x1jBxj10/5637T8+FkW8LDh432UiYFCqIx0cBg5LLFMcYuIQ6Mgj
 8xPhFNiNDg2nsSNXcDgxhlQl4/ZClU1UoteZWeU9ekTVuFxqHmilmgfiTt9saGrdcRIV
 qOqPj4/ALZj0tRecHg/dZCPwKu1r4o58LthnZZTArpJY5mXwUy9saAW+X0LC+q9/pO5v
 /NHg==
X-Gm-Message-State: ABy/qLb5/inNQfH3bGzyLepzzyzL7pVDlXD8SEXsnrmmX6ltMw8k7g0Y
 XLR1LjI3kpBpZF2FyJzaB3deeg==
X-Google-Smtp-Source: APBJJlG/YOO+u6HT6L5SMevwes6eeDd3CFOIIeZioqBlEygdRg1hzggi+IFVem11pMYzMCZjVloYQA==
X-Received: by 2002:a7b:c40a:0:b0:3fe:2102:8085 with SMTP id
 k10-20020a7bc40a000000b003fe21028085mr6664138wmi.8.1691050350175; 
 Thu, 03 Aug 2023 01:12:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a5d410a000000b00317495f88fasm20989785wrp.112.2023.08.03.01.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 01:12:29 -0700 (PDT)
Message-ID: <2c671efa-4550-3749-395d-621dd3153279@linaro.org>
Date: Thu, 3 Aug 2023 10:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Fix kernel-doc typo for `follower_lock`
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
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
Reply-To: neil.armstrong@linaro.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 16:47, Douglas Anderson wrote:
> In the kernel doc for the `follower_lock` member of `struct drm_panel`
> there was a typo where it was called `followers_lock`. This resulted
> in a warning when making "htmldocs":
> 
>    ./include/drm/drm_panel.h:270: warning:
>    Function parameter or member 'follower_lock' not described in 'drm_panel'
> 
> Fix the typo.
> 
> Fixes: de0874165b83 ("drm/panel: Add a way for other devices to follow panel state")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20230802142136.0f67b762@canb.auug.org.au
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   include/drm/drm_panel.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index d6c73f79c131..10015891b056 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -238,7 +238,7 @@ struct drm_panel {
>   	struct list_head followers;
>   
>   	/**
> -	 * @followers_lock:
> +	 * @follower_lock:
>   	 *
>   	 * Lock for followers list.
>   	 */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
