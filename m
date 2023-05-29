Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8D7151F6
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6338210E071;
	Mon, 29 May 2023 22:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE8510E071
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:39:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso4083693e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685399951; x=1687991951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Xub4E75y8Nyr5XajoijONWb7PnUiTj5szgyWiuoPJQ=;
 b=MneeusNPF5NlydCsdbfh/dap+ohfCB4fgHdqa2BiNfYpPkKSUL6R7YM/Y4tXnpktFG
 e9Dwm0RCk1+uJPcmzdXjzFsAa6CK4T2GYqX35VNV5Xs2qMkOyOIPQUoHY7Umj9oSIkda
 LpcsZQEAcC0OQBp3IoT0ssriIOY9SiQu7X2dFxsNWFMpf68LONBDstH9WlY7rnGHWPiM
 IQJ4vUgwdOqc+VPpm9CY4yol+rr4G1PmDpG6sXCCdvyCNG0O0U/qo3qIUsM7BsTqExdl
 lCDBUDOFvlOZKHfkoupjfALiOTsHqOxHMU2m5g3jsKaPxmL50s7B8MRrFT7gJ57n3cKf
 w2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685399951; x=1687991951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Xub4E75y8Nyr5XajoijONWb7PnUiTj5szgyWiuoPJQ=;
 b=ZLJVwQiRsG0Z6xChqqHYp4773GHEUJbYekdmP24KMm1UCiKxT5YHcz5ZOyi6+bYCqi
 h/I28xrbf9MfSqFtbFbwqHKYRZ+DEkPEAVg8/qkJbH1al0xBVIAUdZoaxZ7lAAzZDJ59
 LhPitZeyo6ztQGy//CL6CDwaEFL2ETyb5NbIvwZ8pCYrGoZxqbezJYnySvaVa+v3DQ4L
 4rrSzUIn5SOGfhhYFXkuDm8v3sKBZTJpHRuAvbghoBHh9Ag9gL57fRHNltACclA4PKQG
 iWpFz4ndmLen/p9WzpYjOnsURewKW+8R8drQ9zTKG6+fXj+FXXM3aadn7MpQbJ6w6q7S
 axbA==
X-Gm-Message-State: AC+VfDyshkU32UG6vX+PyDyb0qSIV2OYfYZfb4EWGb7ejc/BZnoW9KqU
 kmUXBT8PUizYAcul4QyFlooNnQ==
X-Google-Smtp-Source: ACHHUZ4An8N93KNttIkDEg95kOa0os1fM8bISo57wWgd27lbpv8dT/gg0gviUKDQnepBfNN1PxN0cQ==
X-Received: by 2002:a05:6512:247:b0:4e9:9e45:3470 with SMTP id
 b7-20020a056512024700b004e99e453470mr36318lfo.3.1685399951314; 
 Mon, 29 May 2023 15:39:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j28-20020ac2551c000000b004f27cf63a03sm128312lfk.299.2023.05.29.15.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:39:10 -0700 (PDT)
Message-ID: <d52b384f-9853-3921-d4f2-5aedb7ef4c61@linaro.org>
Date: Tue, 30 May 2023 01:39:10 +0300
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
 <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
 <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
 <oxgtbj7qmsdvz5gl4bud64jedmhdmvphjfge7uy6uwulefqfsa@pleslv2zgwbp>
 <ebc3ff33-6e4f-b107-33c6-f35b03307058@linaro.org>
 <v3ac2ihqjce7vxcsjnm7ett2vc6wb4hb3bb6x4widd55eintw7@fgkyipbbl2ei>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <v3ac2ihqjce7vxcsjnm7ett2vc6wb4hb3bb6x4widd55eintw7@fgkyipbbl2ei>
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
 ~postmarketos/upstreaming@lists.sr.ht, neil.armstrong@linaro.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 01:37, Marijn Suijten wrote:
> On 2023-05-30 01:18:40, Dmitry Baryshkov wrote:
> <snip>
>>>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>>>>> +    if (ret < 0) {
>>>>>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>
>>>>>> My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() part?
>>>>>
>>>>>
>>>>> No, prepare is called before the video stream is started and when display is still in LPM mode and the mode hasn't been set.
>>>>>
>>>>
>>>> Yes, that's my point. Shouldn't we enable the panel _after_ starting the stream?
>>>
>>> I have never investigated what it takes to split these functions, but
>>> some of these panels do show some corruption at startup which may be
>>> circumvented by powering the panel on after starting the video stream?
>>>
>>> I'm just not sure where to make the split: downstream does describe a
>>> qcom,mdss-dsi-on-command and qcom,mdss-dsi-post-panel-on-command, where
>>> the latter only contains set_display_on() (not exit_sleep_mode()).
>>> It is documented like:
>>>
>>>       same as "qcom,mdss-dsi-on-command" except commands are sent after
>>>       displaying an image."
>>>
>>> So this seems like the right way to split them up, I'll test this out on
>>> all submitted panel drivers.
>>
>> Interesting enough, Neil suggested that sending all the commands during
>> pre_enable() is the correct sequence (especially for VIDEO mode panels),
>> since not all DSI hosts can send commands after switching to the VIDEO mode.
> 
> Note that all these panels and Driver-ICs are command-mode, and/or
> programmed to run in command-mode, so there shouldn't be any notion of a
> VIDEO stream (any command-mode frame is just an "arbitrary command" as
> far as I understood).

Yes, from the data stream point of view. I was talking about the DSI 
host being able to send arbitrary commands or not after enabling the 
video/cmd stream.

> 
> - Marijn

-- 
With best wishes
Dmitry

