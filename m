Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23B6E4158
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B6310E3AB;
	Mon, 17 Apr 2023 07:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7A10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:40:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso1727553wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681717220; x=1684309220;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3y8aPQgOvoJwSTlB16np8gZ7mEu48SprWU1OLM7t2EY=;
 b=Q0kUWkbBARCqihzYfC7ynvUsdGTkhMsyh5fm7/hrg/kyLi3UR04bgDIUB4ijsOVsof
 n4+aUNm6adB+iF9ilW/GhfMexNEp8a6+yj+45qlIP0UQOaC4h14EgODg+Mcs1vIZmiOq
 4dvC4rT2aC0Fy8WAlHsfX5bhRvN5iPkAiNgKRZI/h2Q+ttwC7rOfSXXAZOPkx2lnXbHQ
 uRnyTChkbe2DvC9PM9DWYIsDFd0KvSj1L9DAVyjgbeeyw+wgLM8Te5vqk9cF4qE7kiPs
 znPe2LOvB1Gr6+UrxctYlyUDU80t4YcwCJSjCwGT13vzrmTKQL4I07XxekurnFx+WMG3
 Xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681717220; x=1684309220;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3y8aPQgOvoJwSTlB16np8gZ7mEu48SprWU1OLM7t2EY=;
 b=ekP0NjuqsY2nfEfh1Mfms3E4TJVW4GoufrspVpgPnqsxEnZE5NmI0KnQ6TDGLQDONl
 E3qk9phidPDNPdu9DA/JH6yMBs/mkMUWKOfQhbpsyrfo7+MrDO7+m+jJLkTrB6Ydqr/q
 lC3Y1sLKam/2czXjYO12frkqP7scKp0o8uLFCh8NoPwg0yaUr5asT42GInwOvY+k8gCC
 CBxWHr3tQmKRMn7wRgVAHvS4YAW0pUCbC2c8S7C7Xdwt3GTsFbI6Nbbcgq1eFYGUHTas
 dmP8Z9cE3Qb5c6Sl7R3Yy0uryQ8KCv9WVDwQd9wkICc1ZXIL7KHZ3wlv/DQXvTXtVGxG
 /j1Q==
X-Gm-Message-State: AAQBX9euWJKs2bXSPohJY2HrxK+HY4urSyEUW09/6hAvS2En0+YiCM5Z
 KoAgqwMMQlLHQX28jYADlXA8wlxQ5fFYFfeTOv1Ptw==
X-Google-Smtp-Source: AKy350bC5HsSl1Rn6Xmxt8XlYpLz2a7Ubqu4/u6z89XV16jAKStdTlpNZTICilRh9Bz+VJLGEzgGLw==
X-Received: by 2002:a05:600c:22c7:b0:3eb:3945:d405 with SMTP id
 7-20020a05600c22c700b003eb3945d405mr10243498wmg.38.1681717220686; 
 Mon, 17 Apr 2023 00:40:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91?
 ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a05600c000200b003f0aa490336sm10481002wmc.26.2023.04.17.00.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:40:20 -0700 (PDT)
Message-ID: <661a2ac6-adfe-dec9-5b7b-b006f2f31a90@linaro.org>
Date: Mon, 17 Apr 2023 09:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND PATCH] drm/panel: otm8009a: Set backlight parent to panel
 device
Content-Language: en-US
To: James Cowgill <james.cowgill@blaize.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philippe CORNU <philippe.cornu@st.com>,
 Thierry Reding <treding@nvidia.com>
References: <20230412173450.199592-1-james.cowgill@blaize.com>
Organization: Linaro Developer Services
In-Reply-To: <20230412173450.199592-1-james.cowgill@blaize.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 19:35, James Cowgill wrote:
> This is the logical place to put the backlight device, and it also
> fixes a kernel crash if the MIPI host is removed. Previously the
> backlight device would be unregistered twice when this happened - once
> as a child of the MIPI host through `mipi_dsi_host_unregister`, and
> once when the panel device is destroyed.
> 
> Fixes: 12a6cbd4f3f1 ("drm/panel: otm8009a: Use new backlight API")
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index b4729a94c34a8..898b892f11439 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -471,7 +471,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>   		       DRM_MODE_CONNECTOR_DSI);
>   
>   	ctx->bl_dev = devm_backlight_device_register(dev, dev_name(dev),
> -						     dsi->host->dev, ctx,
> +						     dev, ctx,
>   						     &otm8009a_backlight_ops,
>   						     NULL);
>   	if (IS_ERR(ctx->bl_dev)) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
