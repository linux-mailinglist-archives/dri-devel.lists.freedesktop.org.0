Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0A73E0D2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39A810E201;
	Mon, 26 Jun 2023 13:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0410E201
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:38:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b69f71a7easo17084361fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687786709; x=1690378709;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XCRpr4Gn4c355LF3VbDoLS++0IHVvVI8q7hRDfXr51g=;
 b=jNNBFaGqCW6Nojl+/WSsfBEcUQBBOwpSKxcbC1ey7zkIpFa7rqbBDsgj1e/4w+bnwM
 dOjwSCSUHDvMGjbsOcMsVT+JyThMhkAiEnrwwRlscOIHQe+k66M/6yjecnJiWvdtqfPb
 CRolHfWa6O0XPUfShc+wa+pnsMYExyhWpVftQDLj0x+YbFNZY8hTXM8JGk1L0DkptPGL
 IpVVc6Usb3uh4ANGdgjnsc7dNfDFlI8xMExGee0evKbvx230h1gz2U1AwPup8MBQouuV
 N+tvUXRaXUzLGoMNMLl3AgwSQo/UVfRv21uKLoG598iNdGl3owsEnw3gL5Xk1flPi8hg
 0j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687786709; x=1690378709;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCRpr4Gn4c355LF3VbDoLS++0IHVvVI8q7hRDfXr51g=;
 b=gKH5z+bMb2vWbACNcdsjYovtUVMb7rL8mMUsEe7t0+tDgMSEvF30iS9aJJXGnzL7er
 zXUXIwShBO7AEAJGKxaHz8OmMMCz5WMJ6Py/EyU7AHkHF5yMP1OTM6iXff81UJAtn2Rw
 vkZrCINN0FlCDK16EF/gWuidr/346cO2i8CNneDRMOU3kFPTyEdLcyP66IiX8D1WTkv7
 w+BVLVZfH8STIgywV0Xr/QBrBfpP0rBbx/Az/epBswZBpQNzecRlg0W+LnnokVNkVGxW
 ycEbqPIaiFNQ274T/0fREV7yjp6AvROJP1+2rGGpeoNYsGGsE/zfPwvdHMOzUDUKsgio
 4Kmw==
X-Gm-Message-State: AC+VfDz0e/JIJtCvdhkKmjluAz4eOeuzHU5BqkypXR0n83knmwv5vylF
 VlS5L073HyDfPPc93nIN6oWz4g==
X-Google-Smtp-Source: ACHHUZ6jy6WM6eFMu2q0Ug4BCB/4+Jk6RV0d5rm4frwryvckqO1X/NAdW9tzKf3BfxUm6yWvElxzLw==
X-Received: by 2002:a19:8c49:0:b0:4f8:5e3c:f3a7 with SMTP id
 i9-20020a198c49000000b004f85e3cf3a7mr14695992lfj.43.1687786709251; 
 Mon, 26 Jun 2023 06:38:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25a:b26e:71f3:870c?
 ([2a01:e0a:982:cbb0:b25a:b26e:71f3:870c])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003f9b0830107sm10726315wmh.41.2023.06.26.06.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 06:38:28 -0700 (PDT)
Message-ID: <5c3bcc62-28ba-e88f-6a19-4f620489284a@linaro.org>
Date: Mon, 26 Jun 2023 15:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
Content-Language: en-US
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org,
 daniel@ffwll.ch, airlied@gmail.com, dianders@google.com, hsinyi@google.com
References: <20230626120724.161117-1-yangcong5@huaqin.corp-partner.google.com>
Organization: Linaro Developer Services
In-Reply-To: <20230626120724.161117-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/06/2023 14:07, Cong Yang wrote:
> Because the setting of hproch is too small, there will be warning in
> kernel log[1]. After fine tune the HFP and HBP, this warning can be
> solved. The actual measurement frame rate is 60.1Hz.
> 
> [1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60Hz
> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 3cc9fb0d4f5d..dc276c346fd1 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -2139,9 +2139,9 @@ static const struct panel_desc starry_himax83102_j02_desc = {
>   static const struct drm_display_mode starry_ili9882t_default_mode = {
>   	.clock = 165280,
>   	.hdisplay = 1200,
> -	.hsync_start = 1200 + 32,
> -	.hsync_end = 1200 + 32 + 30,
> -	.htotal = 1200 + 32 + 30 + 32,
> +	.hsync_start = 1200 + 72,
> +	.hsync_end = 1200 + 72 + 30,
> +	.htotal = 1200 + 72 + 30 + 72,
>   	.vdisplay = 1920,
>   	.vsync_start = 1920 + 68,
>   	.vsync_end = 1920 + 68 + 2,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

but can you resend with a appropriate Fixes tag ?

thanks,
Neil
