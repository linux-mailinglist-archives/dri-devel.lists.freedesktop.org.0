Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25B7151B4
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155DB10E0D7;
	Mon, 29 May 2023 22:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723B010E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:17:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2af28a07be9so38566531fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685398635; x=1687990635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZmFbsJmJz59jGjCT949YHD7+Zz7ERnx0QJrjFNPlUZA=;
 b=i5EvsBHz5G8JEAqPFcvFEELd9XeB5Ls2Eq+Z1f4yQWRFHexRenrld94y3lO5ZHhhKv
 cLV3M+JA9pnXjOl7w54K7CZaFifHmqrTz8U1ujltRcnfqsfQTMdZC0xBdNwXk3RDawzU
 a+jNh54XH9EhSii1rhcTFcM2oCq0WpENnmj4fnKZAI8XErV1Hafi9rNiiywyAf9tJJEL
 IRwxes/3cQgOKt5DdWZ86rOhWe3XtTwl1ez7YT1XCfygfSn8Wh4ev2iu4rpr10mOx4oh
 7abjw5DGXoOgh5aOi9CbmKbIvzOUq4g7bphmvSBIu/PAQC+rYJiTwssHckKYzI+h6xve
 kAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398635; x=1687990635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmFbsJmJz59jGjCT949YHD7+Zz7ERnx0QJrjFNPlUZA=;
 b=ZKA0I/mU20yYaFC0OR5NPaJjUzRJ8Yv2/xN5GSRGFtvvaO4p2ZD2vHulBP6PdO2ugt
 6oIzoJ4LCZMfCJculKXkeVLf3wwsTjXNJ2YDa9MTxfaYNwpvikKRJseRn7CrCM/fB3ru
 ssejuBNOkIGORLpdZUh+ftV/3OKlZj/Cpz9gWEAvF7NOaRG2Kpk5OjMG/nVHMGiz1ls7
 DTulXsTbib1KESUhhDXSZONJ3LDOsdYqXNx8YOi/xCgxoKwfTs7UcuXXsZjXSQMO5RS6
 1glVN/6z+B0JIDhqIUzIGZi9nQ/drJp13q5EVjiic59k5kCuclFUuq4l2XNRRcoNSzkh
 +Nxw==
X-Gm-Message-State: AC+VfDzysLtiTlq3cJhBXhMwL/8MmuHB6BxLy5gJNuMLApDynYpPyF2y
 f8tzvli6TSY+hxErLBhK5EkDsg==
X-Google-Smtp-Source: ACHHUZ5x5sMBTtbzq3t8Wi/plEwrJ12amn05zxLWrBamdM2rk6uis4SaCwIJ3NKPC/344ExPs1lMyg==
X-Received: by 2002:a2e:8792:0:b0:2a8:bdd3:fcb5 with SMTP id
 n18-20020a2e8792000000b002a8bdd3fcb5mr4374054lji.39.1685398634976; 
 Mon, 29 May 2023 15:17:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a2e94c2000000b002adc6c2cb3bsm2608036ljh.5.2023.05.29.15.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:17:14 -0700 (PDT)
Message-ID: <255ecc1c-d97a-71ad-62b4-de71fd44292f@linaro.org>
Date: Tue, 30 May 2023 01:17:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia
 XZ3
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 00:11, Marijn Suijten wrote:
> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> <snip>
>>> +	if (ctx->dsi->dsc) {
>>
>> dsi->dsc is always set, thus this condition can be dropped.
> 
> I want to leave room for possibly running the panel without DSC (at a
> lower resolution/refresh rate, or at higher power consumption if there
> is enough BW) by not assigning the pointer, if we get access to panel
> documentation: probably one of the magic commands sent in this driver
> controls it but we don't know which.
> 
>>> +		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
>>> +
>>> +		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
>>> +		if (ret < 0) {
>>> +			dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +		ret = mipi_dsi_compression_mode(ctx->dsi, true);
>>> +		if (ret < 0) {
>>> +			dev_err(dev, "failed to enable compression mode: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +
>>> +		msleep(28);
>>> +	}
>>> +
>>> +	ctx->prepared = true;
>>> +	return 0;
>>> +
>>> +fail:
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	regulator_disable(ctx->vddio);
>>> +	return ret;
>>> +}
> <snip>
>>> +	/* This panel only supports DSC; unconditionally enable it */
> 
> On that note I should perhaps reword this.
> 
>>> +	dsi->dsc = dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>>
>> I think double assignments are frowned upon.
> 
> Ack.
> 
>>
>>> +	if (!dsc)
>>> +		return -ENOMEM;
>>> +
>>> +	dsc->dsc_version_major = 1;
>>> +	dsc->dsc_version_minor = 1;
>>> +
>>> +	dsc->slice_height = 32;
>>> +	dsc->slice_count = 2;
>>> +	// TODO: Get hdisplay from the mode
>>
>> Would you like to fix the TODO?
> 
> I can't unless either migrating to drm_bridge (is that doable?) or
> expand drm_panel.  That's a larger task, but I don't think this driver
> is the right place to track that desire.  Should I drop the comment
> entirely or reword it?

I'd say, reword it, so that it becomes more obvious why this TODO can 
not be fixed at this moment.

> 
>>> +	WARN_ON(1440 % dsc->slice_count);
>>> +	dsc->slice_width = 1440 / dsc->slice_count;
> 
> <snip>
> 
> - Marijn

-- 
With best wishes
Dmitry

