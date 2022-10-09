Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EC5F8D97
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1568510E544;
	Sun,  9 Oct 2022 18:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E9010E544
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:57:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn8so11116599ljb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WDDeNedlMFreEkFqdCoxqyamH5eFrq2g19d8reIB7Ls=;
 b=WeThPWRXkwpZfJsWoWGSVb4uWG4PHezAIA37BaqNXSNIVx1dbJNzDf2VsdmdR+8HqF
 f6cRHKZoEjwZtxzNyXnM0ke1R9FfMvLXyrn3xXpKN4fWgINYQPNuDnqDH2IqWPDLR+8y
 XHoBNraba3Od7sWAq3DB3FXN3RmmTGXZcPnR6J8vv3tgC4Z+D4No6vUU5cQ6b10uHq4e
 MI8qejIcGDMT8YWYpfl3K+bAEt3HWch5vnJYWXMKTtoiIcRtE7AqaurW8rI87tZVeZPs
 D75m4rqncv1XQdFmXIcFQ4nLrY2nn+98c4j7bSvTuGFTTRu3sLzAcPmgl/gYq+IUWtHj
 iUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WDDeNedlMFreEkFqdCoxqyamH5eFrq2g19d8reIB7Ls=;
 b=u64mRwF81EmlA3ByvqNQczMovg1+01ezloK1hT/KHziw23osTa/EcH2j6T51uFdXvr
 XBRxzrOokjRXtR+RQF7QY/OIM8vdW3z++nJbR9tvk5cYtE+nocK0HPIlnpwr0mexxFUt
 sswg65nbML3AHaJR3Dgx6Y5Mj2IxHSVHCf0GHolZ61UtcXIYqt1G1w1SanzE0s0Pst7a
 r5QO5Bk8pjFOX26ePOxoD8M6J/AVYXKZHy3qDw/dpw1VJm08XW83pNMsEXOq3635avKV
 zRCYVVnR/3g2S0gVUa76PX2lX4Cclv7GDmDRviR1kYkkjvVXJoWrDZl9kt2dAGPQb5xS
 np+g==
X-Gm-Message-State: ACrzQf2UttQEkbp7+0cR8Cxu/j4yaxVO2ZA5vOFmQGtHcRqkbf6l52Fz
 X9ctVhAQAG5qqTWNBp3v6Vx+iQ==
X-Google-Smtp-Source: AMsMyM6fBnWKqL2m8+7OmLJdVQRJBD+PLD6fsTbPQKaR/ZodrumStMsrSZTw2rU8z7gB/eEeIjRerQ==
X-Received: by 2002:a05:651c:210a:b0:26e:ea0b:26ad with SMTP id
 a10-20020a05651c210a00b0026eea0b26admr1445510ljq.149.1665341843459; 
 Sun, 09 Oct 2022 11:57:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056512324a00b00492d7a7b4e3sm1122940lfr.4.2022.10.09.11.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:57:23 -0700 (PDT)
Message-ID: <b2bdf59e-abeb-2828-ae05-8cdb34c27c9c@linaro.org>
Date: Sun, 9 Oct 2022 21:57:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 07/10] drm/msm/dsi: Disallow 8 BPC DSC configuration
 for alternative BPC values
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185150.461323-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185150.461323-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:51, Marijn Suijten wrote:
> According to the `/* bpc 8 */` comment below only values for a
> bits_per_component of 8 are currently hardcoded in place.  This is
> further confirmed by downstream sources [1] containing different
> constants for other BPC values (and different initial_offset too,
> with an extra dependency on bits_per_pixel).  Prevent future mishaps by
> explicitly disallowing any other bits_per_component value until the
> right parameters are put in place and tested.
> 
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L110-139
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

