Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C49ABC1CB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19610E2FD;
	Mon, 19 May 2025 15:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sJk9TNtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EDB10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:11:40 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6006cf5000aso597107a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747667499; x=1748272299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv2jL2CIgoQgCOrnHWOAEQ/yU7hN35XKLb9t90BK5zA=;
 b=sJk9TNtSDlvycQOhso4Q4VHt/k2jeW1O5rivvXXam6untUjQYltPxz7Kw7S8Zn2Zbg
 XuI25n2c1qSD4coZqz5/gvtzNZlfrqQaevInHRVu9HzQpa/BRxsBe1N/aAa0Cc7aWpRr
 +W9QkR5jSCVdcD54Ftn1qlPOFtIukkPB84BItSqj04aH5nirbX94bf0TjORmvJe/iPYz
 nDQKxHqOR7ZUazi/WpdVoPbJROjkN8yb6Icnv+je+yarCzK9+A0uD1UK0cf+k6iAKuFo
 tYn5cN1wtV77MADDw9yvUDQ79sxK6SVtB2JhfpHeZV0vKmvmoa5P4ABJtxOmsQ/JJQE0
 BLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747667499; x=1748272299;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yv2jL2CIgoQgCOrnHWOAEQ/yU7hN35XKLb9t90BK5zA=;
 b=GJWWgEZdWJdE73iKXJpufgfvfn2+Dum8fM3sVjIMa/Phfvhspcz4KFcPbL/NLUdCCq
 5eeOgn8f4+/BQfgPccq3c/tgx1WwdEWzLqBBSA7ovv1ZcVRZgz+HliE/brGcug+dvOVF
 b6kZhkofCjhCWEpB5EwCbq0sk5rXi7eaR4aV3s1qq6Z55uxd5IbHy0vsqH9yq2GGMLM2
 kmljogZZFqk8Z+gK0rogaMTlPl9EfiE0SbTR3oAxNTuKsSlJRT/CqG44KJPb21r2amDN
 6c2FR4t/b8QUw5hNMIRUrAcKj2TZ65cfvq5/hePUzGMCqDBAQ4BtbR4y3xBb5SADmAn5
 nzfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1UU8ebur07zv1Ylam2jvHmDopio4zFqIlr26vAAp1VXj40KYbhSKWatHahTSfScGJjvpe3GUB6gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbHw5kS3bNn2Kiz8KGtUQl9BuIyIxbVGXbSYeizSD17CHavItf
 2BGLw5zoMubxXPIkV3vyX6s26zczEAudQzTjAaoOzZY+YP4h6mgj8jMUzh+v4Ep7PlY=
X-Gm-Gg: ASbGncviOZv2Vbk2lvf9Nb2hvtVKzEp0wmnF1B/OfhmSXpVhSxezuhx+XKyaUD3chGl
 zvbGf1aWi0gaOf2ye6wYBvbCxYsrFq1EIO15eYtYO15aheN04JVtSCGrSw8J8f3QXd3By77k5Qx
 XIuM2Ermc/IqL/PdzUKsRRMLH9efvihmKXKDRZ5Qb3s5PxtnGuGHnOL/2+cUF632t0rNbggRWgL
 o1Q9ScJumfasEGKb1Db54uGxKZB5zIckgDX4O8pX+p/2DVEKX+UfN+v/xcs9WRKUoq5NGMUROtn
 36KhvXuI1olida5dDRmJGmjvxUkI6NejuUHBsLqyHOJ+DJoh2v6rW+DZoOfFJ1uVHT7Jv0w=
X-Google-Smtp-Source: AGHT+IEJp0HK+RclBsl7yhDxHBPPtCcr2CtN7uGmWtAaF+rtTBS/afg6uPSghq1UwkKLGWMcmuWwWw==
X-Received: by 2002:a05:6402:270c:b0:600:caf:51e5 with SMTP id
 4fb4d7f45d1cf-6009010e282mr4547796a12.8.1747667499003; 
 Mon, 19 May 2025 08:11:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4381d5sm611186666b.99.2025.05.19.08.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 08:11:38 -0700 (PDT)
Message-ID: <c557a0a9-4505-4abf-87e2-448a1598c0c9@linaro.org>
Date: Mon, 19 May 2025 17:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
 <hobn3fq647z54q6uqrooapokipr4zoxfb3tztg46lwzcsof3jd@5bwn34r2v7ks>
 <65710c50-9bfc-42e8-afad-ac01c7f96a9e@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <65710c50-9bfc-42e8-afad-ac01c7f96a9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 05/05/2025 23:28, Abhinav Kumar wrote:
>>>   static int dsi_clk_init(struct msm_dsi_host *msm_host)
>>>   {

Dmitry,

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

>>>   	struct platform_device *pdev = msm_host->pdev;
>>> @@ -370,6 +411,46 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>>>   	return 0;
>>>   }
>>>   
>>> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
>>> +{
>>> +	struct device *dev = &msm_host->pdev->dev;
>>> +	int ret;
>>> +
>>> +	/*
>>> +	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
>>> +	 * setting the rates of pixel/byte clocks.
>>> +	 */
>>
>> According to the docs this should be handled by the
>> CLK_OPS_PARENT_ENABLE flag. Please correct me if I'm wrong.
>>
> 
> I am also interested to know that if we are indeed setting 
> CLK_OPS_PARENT_ENABLE flag, do we need this logic in the dsi driver.
> 
> If CLK_OPS_PARENT_ENABLE flag is not working as expected, shouldnt this 
> be something fixed on the clk fwk side?
> 

You are both right - CLK_OPS_PARENT_ENABLE handles this and I just did
not test that exact case (fixed dispcc driver, here dropping
clk_prepare_enable).

Best regards,
Krzysztof
