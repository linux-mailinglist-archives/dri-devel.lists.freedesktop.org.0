Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF2829F6D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387A810E61A;
	Wed, 10 Jan 2024 17:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813A310E610
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 17:41:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e6ee8e911so4755865e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704908494; x=1705513294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HgI3b5nVyvdJT18kOSX4sUXOm57u0vvWVXG95l7nSRE=;
 b=yhbVUnegLeDpGtquwoaoCQVXyKYaTM1KR1eooyJoOEpRkGjENbkSWDtlXVmdAv0JHk
 IKKdGkt2c5PdnacyJCjavEmeveDzz76S91IhKk88GxewLl4rFZ0r1Dk/8usACfrORZvs
 ghydr4P7mJ43scJH06nyaDAuvZQ3+p6gRM0ZLovhHPrnKlxyIyWFP/6NDvGBBboEDy5r
 fodxhYbIpKiUQQoAwWVw8g97NIY+BuZ9NRcfG25Pr6hS/XtLeZm9VHbEtiEJeayBajXQ
 fvEx7OtcSyTp9Ntqff2n85jII7JBW7GR9IF+fFf69uDEK0tPqNIUY4lw/TaMpiXgXUpf
 egXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704908494; x=1705513294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HgI3b5nVyvdJT18kOSX4sUXOm57u0vvWVXG95l7nSRE=;
 b=Gc/TRfI6e6bAPHLG/AMecvpRzmS3xkuWO1ZunrlsdBZseFCY3a1/ZZpdF/wPHosmYw
 rJC07h7r0bLTBcK0mPH98fKb5xuElWW8U8D9e6ZLZ8adMR8p317xfMCLFKQw4gRnX78g
 kPOgW1zwCebR09GZYyRgDAsYpFoGgIlzNJqT9H6RLE7SF+iCFBsjV0SzPRsrHnjRnfN6
 GyFob7nB+NoRVQdEXze/UVZhaDjRStoJweYjWvnh2lSf98uw3JYHamnbbzjE4ncQPcL1
 Y6KZe/uOO6wVD1DJLbRPO2NXLEDbBTJYoFgnGk8mO2h8oecHo233NCb8Z9ontUN0IwEM
 bO2w==
X-Gm-Message-State: AOJu0Yzxa4kb1KxK/oCNr8A7O6KFlNFuOro4PPwtVvb84cP5krOsW9ZQ
 E67Ofb6WQvEXn+6+TuzG/AoHhxAdZJupAA==
X-Google-Smtp-Source: AGHT+IEC4uszuGwST+4r1WGXDV8hmFYqZKMqSEx0gyGO+XtHZameYMXu1gqzf4ujDAdIpt9LiMjx0Q==
X-Received: by 2002:a05:6512:3c83:b0:50e:1daa:6705 with SMTP id
 h3-20020a0565123c8300b0050e1daa6705mr673715lfv.6.1704908493622; 
 Wed, 10 Jan 2024 09:41:33 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 09:41:33 -0800 (PST)
Message-ID: <59ad396a-59c3-4cf6-aae4-5a8d00f1a6a9@linaro.org>
Date: Wed, 10 Jan 2024 18:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/10/24 16:14, Luca Weiss wrote:
> The GMU won't probe without GPU being enabled, so we can remove the
> disabled status so we don't have to explicitly enable the GMU in all the
> devices that enable GPU.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
