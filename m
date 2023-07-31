Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B906D7696F6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80510E28E;
	Mon, 31 Jul 2023 13:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05210E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:00:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso41964305e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690808427; x=1691413227;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FUbObSzDV+OWr4/4hJgHfjmLuyqz0P8gKph4x0lk8p0=;
 b=ZyoV5UooYVUTAvAW/QiUxtIzNygDCdr44co6iAnDwRE+YEjUIgZT+lQr4MA5YH80qU
 8zHR7nB1A0Uu9wYLBLbOeGEc8+eimdmxx5PGGaw/ZUC13rHB5Qyrnrh6t0H9U3/3dIQk
 yKJ+FktL7/SjFvJoy0e8VdmG+GX/Qvu35pp1N/XRfX12wFSrqQ01oz5xo/2reKdC+8m9
 X0S3KlN6eMlt/ixdGSKwuc6tsXcRoLstdB6nJBds67VyYSyviq+WVEntTWSbCTwHK2xt
 4sDRPlDOR3VRbPuWfmcarXdL87uL6R5GWC5TkSI7JHfxFYVW76fsSWaSX8v/IHPaNnns
 avxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808427; x=1691413227;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUbObSzDV+OWr4/4hJgHfjmLuyqz0P8gKph4x0lk8p0=;
 b=YPWEjGtxFtJVSJVqz/bw44w9ZAo0cshmNPInAZbJ9eW8dN1uonQk+0jXA7FFmsOcvS
 832nuvgyR9EusAfg16S2oPg04y9bkS5M/AIvO0LdeQLVbfknoEAfAZWMcUtcejxKGTxR
 CR1Q3ukV2ciNQUQRQz6qtKxSsV2xYQJYadKr6zGEjRNA1Soh8wKc7GRambgIte4fwmMF
 TQm4T+vJALcWW+dl9CSQUEqDN7sZ0KdPtU9hQxMRgOWFYGAleH0jJs3jJ8+Vhp3TgUgK
 u6BaQVTXAu/C7hDz22tP6jYQafx4LqVJHhRew2Kr2uiny1QLA7OHQd0l41EqyObUppMQ
 lEcg==
X-Gm-Message-State: ABy/qLYYYGhD0YGHVCOCIN28iGG1fQGWcIqcdAqs+dBnBJ4sU0A8CXx7
 mGy9U01mI0of/suh4yMS+WIZPw==
X-Google-Smtp-Source: APBJJlGvNG1zjeg8VNyk3eXXTmbmkaUleTZJkL+2T26lqfmtvgn0n2SEbPFEhrwy7g46uuDI9Aq9fQ==
X-Received: by 2002:a05:600c:2946:b0:3fe:6f7:60aa with SMTP id
 n6-20020a05600c294600b003fe06f760aamr6452963wmd.12.1690808427221; 
 Mon, 31 Jul 2023 06:00:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f723:b60b:92cd:4df4?
 ([2a01:e0a:982:cbb0:f723:b60b:92cd:4df4])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcc15000000b003fd32074e74sm14246579wmh.31.2023.07.31.06.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:00:26 -0700 (PDT)
Message-ID: <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
Date: Mon, 31 Jul 2023 15:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
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
Cc: quic_parellan@quicinc.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/07/2023 00:56, Jessica Zhang wrote:
> Due to a recent introduction of the pre_enable_prev_first bridge flag [1],
> the panel driver will be probed before the DSI is enabled, causing the
> DCS commands to fail to send.
> 
> Ensure that DSI is enabled before panel probe by setting the
> prepare_prev_first flag for the panel.

Well this is specific to MSM DSI driver, it's not related at all to the panel.

Neil

> 
> [1] commit 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
> 
> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel driver")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index bb0dfd86ea67..e1363e128e7e 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>   			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ctx->panel.prepare_prev_first = true;
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> 
> ---
> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
> 
> Best regards,

