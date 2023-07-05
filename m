Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A174849A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22E10E162;
	Wed,  5 Jul 2023 13:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8D410E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:05:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3141c8a6f30so7025432f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688562335; x=1691154335;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CA54dLzrUoc/7PYdDYtu4eUol1rypI3WEhlD1W/X9Q0=;
 b=jJTkU8pPVyxow9SduDzddj5wGH2HNtJz+VH/cHmtziG24I3Qf9LYKJjoO9GIWNkV+9
 9A6ibO+kz8t9Y5hV19tMqTKqmLZXQBBSG6M1976e0Ouw3Q3I8b62ilI4SlXjIz4idQyc
 hD7VaE5Y4OWh5E6s9PFMsQuDwfeTfrgfam2+CQK0xlsofa5dVcssLlQsS3qobBHHaVvc
 OJSZiyQ2FDifTfbvgyFqI9BvzFhjAtBSoxshmSRhi4Z5HNng4AbGXi8remdhlWzpqAu4
 2BTB0D3zTOrTIKgKb3OFZNAG8//668S+fzKQjoW9HkkzOWugohTNDh2jPnwEN3XFbtL+
 xXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688562335; x=1691154335;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CA54dLzrUoc/7PYdDYtu4eUol1rypI3WEhlD1W/X9Q0=;
 b=DnzM7kDoj2oxlh4vTrTAfhc/D+E9ReRz9B3I7UZ/8MUzdnQtni+GuazCvcEXxCrB6P
 YWCntJ3UfHQCPZWPnWat1yCrkOcbFSSczLGmju0RJK1JLt3jEFknM0pv8fkOngu00iWf
 PKNhrnfXnlU1BULnYv7OU3OEbpZYh53lYs9HcbEF/1xYTZP9v8nVkOIg+3voLaxHAMCT
 aUADpDgGeeALPSMm9QSp4BltsPazd3YtgUk1mqz1AQfp67R+lrmQbHbVotOu7B6007Kh
 dYNPOR+AEpUZoavxAwzDysEwP1z83HJ0Wex9AfP1mzaKMUymgFKY3JQEHIy6wZtd5fGF
 uABQ==
X-Gm-Message-State: ABy/qLbIpqMCmY7I2AsrnKpSsrAdzjVB+m+uLoINcVgvnb0mpnDRTJPz
 OUu6vU1mOqCKiaEVkdUPXsEkyQ==
X-Google-Smtp-Source: APBJJlGJU83ICpcO8IQe64PfKBuOhINm2kolngsASCVWqz4EpB8g6LPTdIMJsusjCxZ7gidF9bcwfg==
X-Received: by 2002:a5d:61d1:0:b0:314:25d:c8f4 with SMTP id
 q17-20020a5d61d1000000b00314025dc8f4mr12984929wrv.2.1688562335178; 
 Wed, 05 Jul 2023 06:05:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85?
 ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm31201883wrb.84.2023.07.05.06.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 06:05:34 -0700 (PDT)
Message-ID: <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
Date: Wed, 5 Jul 2023 15:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
Organization: Linaro Developer Services
In-Reply-To: <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2023 14:04, Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 30, 2023 at 03:36:04PM +0300, Dmitry Baryshkov wrote:
>> On 30/05/2023 15:15, AngeloGioacchino Del Regno wrote:
>>> Il 30/05/23 13:44, Dmitry Baryshkov ha scritto:
>>>> On Tue, 30 May 2023 at 10:24, Neil Armstrong
>>>> <neil.armstrong@linaro.org> wrote:
>>>>>
>>>>> Hi Marijn, Dmitry, Caleb, Jessica,
>>>>>
>>>>> On 29/05/2023 23:11, Marijn Suijten wrote:
>>>>>> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
>>>>>> <snip>
>>>>>>>> +   if (ctx->dsi->dsc) {
>>>>>>>
>>>>>>> dsi->dsc is always set, thus this condition can be dropped.
>>>>>>
>>>>>> I want to leave room for possibly running the panel without DSC (at a
>>>>>> lower resolution/refresh rate, or at higher power consumption if there
>>>>>> is enough BW) by not assigning the pointer, if we get access to panel
>>>>>> documentation: probably one of the magic commands sent in this driver
>>>>>> controls it but we don't know which.
>>>>>
>>>>> I'd like to investigate if DSC should perhaps only be enabled if we
>>>>> run non certain platforms/socs ?
>>>>>
>>>>> I mean, we don't know if the controller supports DSC and those
>>>>> particular
>>>>> DSC parameters so we should probably start adding something like :
>>>>>
>>>>> static drm_dsc_config dsc_params_qcom = {}
>>>>>
>>>>> static const struct of_device_id panel_of_dsc_params[] = {
>>>>>           { .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
>>>>>           { .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
>>>>>           { .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
>>>>>           { .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
>>>>> };
>>>>
>>>> I think this would damage the reusability of the drivers. The panel
>>>> driver does not actually care if the SoC is SM8350, sunxi-something or
>>>> RCar.
>>>> Instead it cares about host capabilities.
>>>>
>>>> I think instead we should extend mipi_dsi_host:
>>>>
>>>> #define MIPI_DSI_HOST_MODE_VIDEO BIT(0)
>>>> #define MIPI_DSI_HOST_MODE_CMD  BIT(1)
>>>> #define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
>>>> // FIXME: do we need to provide additional caps here ?
>>>>
>>>> #define MIPI_DSI_DSC_1_1 BIT(0)
>>>> #define MIPI_DSI_DSC_1_2 BIT(1)
>>>> #define MIPI_DSI_DSC_NATIVE_422 BIT(2)
>>>> #define MIPI_DSI_DSC_NATIVE_420 BIT(3)
>>>> #define MIPI_DSI_DSC_FRAC_BPP BIT(4)
>>>> // etc.
>>>>
>>>> struct mipi_dsi_host {
>>>>    // new fields only
>>>>     unsigned long mode_flags;
>>>>     unsigned long dsc_flags;
>>>> };
>>>>
>>>> Then the panel driver can adapt itself to the host capabilities and
>>>> (possibly) select one of the internally supported DSC profiles.
>>>>
>>>
>>> I completely agree about extending mipi_dsi_host, other SoCs could reuse
>>> that and
>>> support for DSC panels would become a lot cleaner.
>>
>> Sounds good. I will wait for one or two more days (to get the possible
>> feedback on fields/flags/etc) and post an RFC patch to dri-devel.
> 
> I just came across that discussion, and couldn't find those patches, did
> you ever send them?
> 
> Either way, I'm not really sure it's a good idea to multiply the
> capabilities flags of the DSI host, and we should just stick to the
> spec. If the spec says that we have to support DSC while video is
> output, then that's what the panels should expect.

Except some panels supports DSC & non-DSC, Video and Command mode, and
all that is runtime configurable. How do you handle that ?

> 
> If a host isn't able to provide that, it's a bug and we should fix the
> controller driver instead of creating a workaround in the core for
> broken drivers.
> 
> Another concern I have is that, those broken drivers are usually the
> undocumented ones that already have trouble supporting the most trivial
> setup. Creating more combinations both at the controller and panel level
> will just make it harder for those drivers.
> 
> Maxime

