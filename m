Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E2341F36F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7496EE7B;
	Fri,  1 Oct 2021 17:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6116EE77
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:43:11 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i4so42138565lfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=trOpTX3fPgPSfjOpDMDPYXwd4LNjI9d/+tq2q/EXfXQ=;
 b=KI3fJiRswZHK7JIIXimHTd8OowVIiXi/9S53GbwPQ83bF/hY52XkV0A9vlrTu+XBf6
 Y63wVv35AvDlsSlaO6hsekVqxNao1ElfQNxyhV8XtgGYuZS7p3RCZSy27g2Vm9ErDf4c
 AKLSENXIget1Mxj9It9IJBJFVM7fA5r1hVRrzLfyGI+UeHSCWlx8b4N+FHesI8dCOn+Y
 jVVqYwwcBZ4LPGR8DFafriSOG78Tuov+fIPsyruyJ/p6h5mrTwHUOctS/ioY2nN5zl76
 Fdx1siPDvoxni6Hvn3dPpXzTLCD/83TR630uVYjaQAWvTqiHgA2XqKyd8azozC1SGmWf
 owTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=trOpTX3fPgPSfjOpDMDPYXwd4LNjI9d/+tq2q/EXfXQ=;
 b=psDpJgr2KASxStniZkYDnAi1srKAd8i+WFJeqVPmycQUX7YcwMv6LedKStzFEdqy6o
 8FkxuuVeAXprh3LNIV540hlpsx2MyZh++QdKUyj6Jpv27hPECq9AsHHF5MFnh/UOTotF
 h9KyP/MIZ+U3oEp5X8uw9/jGRZBRCg0q14byHhedsAyjozX+EMCZaU3RmUlDcRgVYWsf
 YKkZTHz6bZp5/GuBj2G6rCP0Rxjms0ijMY9gbSFzgq5UFA6KM5E7KP7UjYmUsLnbJVzQ
 M4DaB9W8DWKF/mV4Lz1Cge47prUcURMmr+GLzRTvgwLe3BQsnBuArTpOm+05h2Zs7BuN
 ghzQ==
X-Gm-Message-State: AOAM530xwcgvIezAZlLX5BfD4gxa+/TBAsPXlyQyVX9/d/G4jGPUvlU8
 YyFR/FVlBr043az+491PpicGCA==
X-Google-Smtp-Source: ABdhPJwnqJ4zOBa3TwxdlBctEXCtk8ih+ennQVb4Li8mAsgMGpf5gT3g7NpA8Y+kGCVKPaXiLBBb9A==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr6563941lfc.43.1633110189970; 
 Fri, 01 Oct 2021 10:43:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v3sm873116lfq.70.2021.10.01.10.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:43:09 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dp: Remove redundant initialization of variable
 bpp
To: Colin King <colin.king@canonical.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929105458.209895-1-colin.king@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f0d9d9f5-2f6f-8936-1a6d-825ce07a5d65@linaro.org>
Date: Fri, 1 Oct 2021 20:43:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929105458.209895-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2021 13:54, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable bpp is being initialized with a value that is never
> read, it is being updated later on in both paths of an if statement.
> The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 2181b60e1d1d..71db10c0f262 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -234,7 +234,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
>   		u32 mode_edid_bpp, u32 mode_pclk_khz)
>   {
>   	struct dp_panel_private *panel;
> -	u32 bpp = mode_edid_bpp;
> +	u32 bpp;
>   
>   	if (!dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
>   		DRM_ERROR("invalid input\n");
> 


-- 
With best wishes
Dmitry
