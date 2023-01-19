Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE636735A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 11:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4897010E904;
	Thu, 19 Jan 2023 10:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6D10E905
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:35:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h16so1371034wrz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 02:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtMyXO+XFAd7bhjLH/6eN7IyGN6nezPLZZSqRmEiMMs=;
 b=Zq5fEPrYoJ5p66SaptrWOmIBuVV3Ru3K6GuVs5q+LWxwE4Odxsdf+D0Olxhm9ERWlU
 rE+ArNSWDYZkQT0zjlN+gS0exZ5D4BAj7rJgAJ1jcIv5FMMea2jp070lyySIE8ZniMwp
 8fryby50Vd5FIzLrYDQhJygsbYXNs4E22MQWOV8/a0g1vcpVlfJ7zSBNq1QJHb1i5gG8
 oTbr9WNcxQpeTNpw7MfJma5R3QXMguN1ArLvuLY3NIn4jd7v92J3AA3BQljhVhYHqabF
 1QjIzRyAjoZogl/RuCvc2iyWofZIb/VjsViHg71g5MpXAKulKsbFEDPp9am8+c3CJR4v
 tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtMyXO+XFAd7bhjLH/6eN7IyGN6nezPLZZSqRmEiMMs=;
 b=70b7xpk0J0RwqSrnGrwjQKmNGM8d+WOPNSGmlWXjTGXd9qykzYMSA/AuBPqXhj1Q7Z
 UxxZdXDRqBZv8ixkXTAo8/r9Ys9ZwXo9dZfZKxxK3pvmg/vMeLWbGtUUh6LBlh3E/i9l
 R5SIVFEQ3B5LX0MmpoSj2m2HbYFhMrtP4Nos5jTnGg06MxXpFjVdQX7Eg/qJEGYBWe7c
 Mcft9qxeULb0bsRT+0W83KllGAe2zNaL83cDBESwl4FD414gbG0QX+M4FGChX74oW504
 01Sf5+Eug46+I7+FmiObU3ec1M4qm2odANvJepns6qglssFHBIT8D1Ea3P8pkZUFCvRw
 O53Q==
X-Gm-Message-State: AFqh2krAwopUKsNA+ZkWPS3FElQy1pQ0MiTiY4+hOwdF8hIscYCKoWJD
 lJgB1YwC508+Z2UEufNgiADh+w==
X-Google-Smtp-Source: AMrXdXvx+FBmmoMdPtes6WLfL4U/PKZM2tRc6m6sgE2QM3WyiD511MetmxVKIvnYStyWu5TeGl5PJQ==
X-Received: by 2002:a5d:5224:0:b0:2ba:a771:5812 with SMTP id
 i4-20020a5d5224000000b002baa7715812mr8496539wra.24.1674124537156; 
 Thu, 19 Jan 2023 02:35:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm9198986wri.69.2023.01.19.02.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:35:36 -0800 (PST)
Message-ID: <aee03688-54b6-ed9f-e32c-b46e31d72198@linaro.org>
Date: Thu, 19 Jan 2023 11:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118193015.911074-10-markyacoub@google.com>
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com, marex@denx.de,
 ashutosh.dixit@intel.com, sean@poorly.run, abhinavk@codeaurora.org,
 javierm@redhat.com, arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, maxime@cerno.tech,
 rodrigo.vivi@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, andersson@kernel.org, dianders@chromium.org,
 swati2.sharma@intel.com, manasi.d.navare@intel.com, tzimmermann@suse.de,
 bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 20:30, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the register ranges required for HDCP key injection and

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

This applies to all your patches. Fix it everywhere.

> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".

What does it mean? Where do you do it?

> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-10-sean@poorly.run #v5

Drop the links.

> 
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> 
> ---

Changelog after --- .

>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Best regards,
Krzysztof

