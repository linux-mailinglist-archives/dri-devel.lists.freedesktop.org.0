Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC16735B1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 11:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9B710E059;
	Thu, 19 Jan 2023 10:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFA710E903
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:37:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b7so1413739wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bKdKCwIEVj9M4OKQvCJxtHfc8akbBWqKFuI0Hwm5VQ=;
 b=abiQ+0Ax0T69l5OzX1lCBFU9o1uoA15jyF5nqmf1NSEd8y2hpLY95Nyc5l4gU+hBka
 4U8smJsKBRjvEB9p3VlBHMSSZGyoaLP7lNk1tjL1rlBgPfz5A+sHhHmR8vxzhtGK66tf
 7G3qV60vd3adXxN6B9ADkhWwTif/4glN32jgcQHBmfXfnDHEx5eIhrHrEr8crqbheB3W
 6757bzv7i0qlKmoVthZUQPKny12E/fyqyPs5Y3rI3kkChTGN2yX0xNEqIfo2WLw3gKHB
 6zphkY5X8RPWFgLaw6FWsV2QPxMCDvcQbVFuhZZjc5VVsEUAcJ1eMWjE9X1F4h55fHWT
 TL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bKdKCwIEVj9M4OKQvCJxtHfc8akbBWqKFuI0Hwm5VQ=;
 b=yc2R/twXUt6Q7MBTdLfpeYh84OMX5LEYOFPHMTBrC2kGcvkOB4ul+vaW46voEzFv2t
 lEpY4wS7UABqdBoY8IEbKFMZskMebYGYTKaqW+12pBIP1O/xxeI0soSvy4ogVh6pWK8y
 YjG83Fx6nxQcYs1wRfW4bIxpI2Cu7D8s5NGG6pO1d3tAG/dizNAGq8ZBYlDOIO2i1em0
 YGAtctkMeQaJIU5VzqvmOwQDhrzFG3jZLYh5FIobT5k0WIjZv6ljQvTgY4hrwFAvypDh
 E41d+Pxt/QbarRcO5g5VFRiay54wf0BDkps75d4WQprV8/5WyA06PFypQUInBzPtMoca
 XO4A==
X-Gm-Message-State: AFqh2koHrpOz9dUjI5U9rsb9P9xRUZPxNTZ9NwLlk/gh+traOt7Zp/P/
 1Pb7gd9bb8BYf3i9xDbSJumUxs/MX8loOktt
X-Google-Smtp-Source: AMrXdXuhLwFKsOieEPkv4WnlwiLr1ZX0SsmCVM5hkKGfIQ6kvwNtlt7dCftyMakfb35HvImagi0P6w==
X-Received: by 2002:adf:ff8d:0:b0:2be:3538:76e with SMTP id
 j13-20020adfff8d000000b002be3538076emr4276307wrr.66.1674124677351; 
 Thu, 19 Jan 2023 02:37:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003d9b89a39b2sm4394636wmj.10.2023.01.19.02.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:37:56 -0800 (PST)
Message-ID: <67170ce0-8622-8b35-e73a-7d873b7a3b8b@linaro.org>
Date: Thu, 19 Jan 2023 11:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v6 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-2-markyacoub@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118193015.911074-2-markyacoub@google.com>
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
 Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, maxime@cerno.tech, rodrigo.vivi@intel.com,
 johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com, andersson@kernel.org,
 dianders@chromium.org, swati2.sharma@intel.com, manasi.d.navare@intel.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 20:30, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the
> code when moving it over.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-2-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-2-sean@poorly.run #v5

It seems all your previous versions were sent not to correct people and
lists. Therefore we see it for the first time even though it is v6! It's
not the first such weird CC list in chromium, so maybe your
organisational process could be improved? Not only for you but for
colleagues as well, so you all start using get_maintainers.pl on newest
kernel (not something ancient)?

Best regards,
Krzysztof

