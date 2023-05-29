Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696327151E7
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11510E307;
	Mon, 29 May 2023 22:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DFE10E307
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:36:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af2c35fb85so38394561fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685399800; x=1687991800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rAnUWpSKK6l41AS9672288ydxu3/VZl63dbk9kxKDjw=;
 b=s1XZVqEQSQASnsDt2XEi7yhUV73XrgBEetrJrFOBM58Ck9N4t/H4RGnpEARIeLWWVZ
 fmlw7HOvWMCwEvw6IBJqvxGUdsE974HeUCa8wByTKaFOQYguWg8aGHG1kJQgNhcHBWfT
 6sjTbvRVjUX5y14IjBzvLvhH0nFWLa6C939w89tGBgiRjY6xHINRIEG3H9fJoUxNXg/0
 JPV3Ce/RaZcs4SaJwJon+l+k3zreVnG3AyCywQca+vd96PDUkotmqhoHPHj/DF/9LFcP
 bH9uYE/q7BnD/MzDekEM1HPDNDS/dnj5sjRvYOv0GuEDZODrgZhjOAxlGG/IfUw0VgEa
 yRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685399800; x=1687991800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rAnUWpSKK6l41AS9672288ydxu3/VZl63dbk9kxKDjw=;
 b=Ifv1gFjk++ZWWX9ddmxJZLTG4b0DGvW9LJ3dr/hjJkxyEPm4n1AzVy1EJziq96wqoQ
 OxY5v/+NQkHceHd4UU7CRsPaDY6O21YJ4/MSWI3LtNhPNBYJoMS0CmpgvKiG/Lrtjr7v
 dZdX+xUkO9Me2EteApZi8ZJHqKi+ns/xg54ZDoe3kyu9BIQAf/r5l0x2/lL/1MPnq7Gs
 cyBQfrgQRf5kKpJknFI70RYbPsL+PjljVmb0SeFId59+vkbW4D0JBqcOvuC5JqTZp+CW
 LLX47b1PtESoARD4j/Lz5kkWKrgXpb1VzRdUnouMPzBCTj7OArHK+5x1uCuX2VAPRcOJ
 EAbQ==
X-Gm-Message-State: AC+VfDyzbcN15uwl2AFNeqb5tonyXM4D0qgU1aSBu4Mck+UKcSYB+jSj
 11xYlNxH3Pkhnu97qwGq+KxiDg==
X-Google-Smtp-Source: ACHHUZ6kQQV4gAjW1OJAD9ogabePKfoMe2Xitwes5igmZMF8vyZr7USNGkDV3Ju00LxVrR6+Q7e/YA==
X-Received: by 2002:a2e:9c0c:0:b0:2a8:aec9:b0ba with SMTP id
 s12-20020a2e9c0c000000b002a8aec9b0bamr470lji.11.1685399800107; 
 Mon, 29 May 2023 15:36:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a2e7014000000b002ab5421959fsm2629226ljc.90.2023.05.29.15.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:36:39 -0700 (PDT)
Message-ID: <6ac6c00b-981c-4726-3824-6ab8eb4799f4@linaro.org>
Date: Tue, 30 May 2023 01:36:39 +0300
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

This sounds like 'a possible room for expansion' which might never be 
actually used. I think, if we ever get such information or when the 
panel's DSC config gets variadic following the mode, we can reintroduce 
this check.

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

-- 
With best wishes
Dmitry

