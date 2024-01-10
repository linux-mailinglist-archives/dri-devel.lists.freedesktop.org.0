Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836488298C9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29A610E59D;
	Wed, 10 Jan 2024 11:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980F10E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:22:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so4048723e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885718; x=1705490518; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9b2yiBXwtkSRZmmY/3LYcaTb30ZNQHsA4BF97X5Y9EU=;
 b=ELiBZHHFARKnMXhu/ncKVEb+kNYjOLrKty+DS0uAqQRKmAX+FGRuFjJzLUYkK7o4vW
 rHcJsCICxEYOAZjPxyhEBNR7C+NAdcLfjgcUJ5V2YRvVYs9j718fbGolXXzV2GQYddLn
 3LsTb6uMdCEyYlQO29vnu6AyEdrYciUIvlcwpByn/RbrnFckhy41C0zMVeCocyt62j0n
 2nmV8dB1o/Np6v6ZdpC5jL2AR20FSoaG904ZdMP2XQF6NjsEFqVpNe2EFAiDMgMn1FAu
 TXejeZKu6imPe3451wTESbECOuzEcSYaWUihqyu2FtwVVqxLhIuYU0IchQ9I6RH600pL
 lFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885718; x=1705490518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9b2yiBXwtkSRZmmY/3LYcaTb30ZNQHsA4BF97X5Y9EU=;
 b=WVMqINUaW92zUP9KQNc27BKbIX+Zi+0H1QNx5CZT0NQx0Mly22OjW7obJUG/PwW6f1
 ejLN1nvQ//dQdwNgMjfsvebbuKYfSUZgzOilIuTTlJd2KaHfHunM6OPiGm1dF4btwLAt
 FgO4e42hZLvpW4cHSaMez9cmkPkeOR8TbaXUNyUo5uT0x2Zjo0vZSO3LW0ZtaSR7fw2C
 WN2+0vC1EIscqMaLkwLXTJd/ELzNUrQ+niTKHhderYJVeaXyCWjqptze4shwYUhEsYri
 BJwK36H1dR7mNSg+MpE+rFbqcs1wkbB5Ze8yN2+7oWHoYMk9XgAuHlUjl7L8GJ6s6W3F
 +uiA==
X-Gm-Message-State: AOJu0Yxn0SHt71lvOZGqWEILw9n3VjyRssR4ai4WV2RIUiPUxq1mJnyk
 ybY/Ef2ON0JEwcoOYgDER2TVeKtArjddmA==
X-Google-Smtp-Source: AGHT+IHcGQyjXBPiarp8rWr+YJ/jevRS1XGqhac+QJ+UkCjR2HI0HnemR4vGs+V5ztmdi+RTq+ANlw==
X-Received: by 2002:ac2:4432:0:b0:50e:7dbe:eba9 with SMTP id
 w18-20020ac24432000000b0050e7dbeeba9mr199607lfl.68.1704885718139; 
 Wed, 10 Jan 2024 03:21:58 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 y3-20020a197503000000b0050e7e19b692sm627836lfe.154.2024.01.10.03.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:21:57 -0800 (PST)
Message-ID: <e6f2590f-7753-49e2-b51b-2edf30a66dde@linaro.org>
Date: Wed, 10 Jan 2024 12:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] drm/msm/dp: move all IO handling to dp_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-12-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-12-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> Rather than parsing the I/O addresses from dp_parser and then passing
> them via a struct pointer to dp_catalog, handle I/O region parsing in
> dp_catalog and drop it from dp_parser.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index b28052e87101..1e2ca4efb029 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -14,37 +14,16 @@
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> -struct dss_io_region {
> -	size_t len;
> -	void __iomem *base;
> -};
> -
> -struct dss_io_data {
> -	struct dss_io_region ahb;
> -	struct dss_io_region aux;
> -	struct dss_io_region link;
> -	struct dss_io_region p0;
> -};
> -
> -/**
> - * struct dp_ctrl_resource - controller's IO related data
> - *
> - * @dp_controller: Display Port controller mapped memory address
> - * @phy_io: phy's mapped memory address
> - */
> -struct dp_io {
> -	struct dss_io_data dp_controller;
> -	struct phy *phy;
> -};
> -
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
>    *
>    * @pdev: platform data of the client
> + * @io: Display Port controller mapped memory address

Should be removed instead

Konrad
> + * @phy: PHY handle
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> -	struct dp_io io;
> +	struct phy *phy;
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
> 
