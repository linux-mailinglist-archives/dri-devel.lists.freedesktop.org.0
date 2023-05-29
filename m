Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6F7151C1
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4966910E2FD;
	Mon, 29 May 2023 22:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7DF10E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:20:20 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af316b4515so38032591fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685398819; x=1687990819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=USqTtpZDzyEPrsHSC9jFOSH+OQLok+CQPPy4QrEEqFA=;
 b=jEpgLgtV7r99HbSXnV1kD5IeD32rh8mN8wROSgew7n4EJf9kNaykVP5/nS17RfXUqa
 PkPdw2vEqJJdNi3M1xdh4pDcKfwSQgLJxmIVwIWhmCqwjxV5Fzoe6K/uJIF6X/kG/+1T
 Xfyp9HmnfA/yxham5hSpvZiqALfsdUV9XZz13n5bK4bKn5TXwEaJna6nQ1VSosKQpwRi
 vfN86iCYXae4u5aP/Zj38WnJGfcVVP8165/k56eIkfRpAGtaF0U3GIOMHi6eUgCOGfFP
 5pDiiRJkDUwvkUs3nfZMDqu/g59zTYU5fdSkMyzjw4k0dJISXL00801nCm5rdMAhz5aC
 wdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398819; x=1687990819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=USqTtpZDzyEPrsHSC9jFOSH+OQLok+CQPPy4QrEEqFA=;
 b=IwReOl3HP8NzbUYlsdlRImrfNTai9YkU5R3us/tmhfDmBvK2KRhyNqjrB1/7c82BsW
 ltJwUNhdyU8k626RTjxvf8192FHlns95Xj2SZc81KB9jcxcbhCjrXMp1lnoLMlJu7DsV
 ftISvNp1uxVJB+YavNbZggwWx8L0pI3wijSNFD+q9kBtiOGb2DobU6ISwWPKBgQ/HK51
 9AljHiKcnUHcBLzJ0CCB5zqSiyAO84ZEIeKmHu2nWXOEmPAM7AgtOCG98ueDkMpI5FdS
 evKwZWtXqV9VPChCH9VeU4U4Z2ZXFPhwsZYl5lMuhbC8ChEBNqbRZDVJWHhuv1rlvSyu
 ou3w==
X-Gm-Message-State: AC+VfDwDZ5HDiCljF5rvL3XKBGMrdCmXyUb14FeDMngitZAqTVpw8bom
 yFJ8FzeLdvoZDz1Nl3W2kRrw8A==
X-Google-Smtp-Source: ACHHUZ6QPLFeKcQ4ZS9i2gxp9ZfFi+7aj7bRNJOGHEhaqjPDrylDtjNPIO8RJ2v8iV9DqrvR298gCg==
X-Received: by 2002:a2e:b0fc:0:b0:2a8:b37c:17f0 with SMTP id
 h28-20020a2eb0fc000000b002a8b37c17f0mr4931553ljl.4.1685398818715; 
 Mon, 29 May 2023 15:20:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a2e9852000000b002af15f2a735sm2609555ljj.111.2023.05.29.15.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:20:18 -0700 (PDT)
Message-ID: <66d0c903-5b79-68d4-8303-76c4846770d8@linaro.org>
Date: Tue, 30 May 2023 01:20:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver for
 Sony Xperia 5 / 10 II
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
 <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org>
 <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
 <CAA8EJppniEh3cFpi=AdK-i=KZcd=tzpPru0W4Vq9LJjJL8q=qQ@mail.gmail.com>
 <bz7kqcdxnrbt2lzaykgxnviusrksu5txng3ngietj6rb3mhmsx@qwbann5px44w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bz7kqcdxnrbt2lzaykgxnviusrksu5txng3ngietj6rb3mhmsx@qwbann5px44w>
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

On 29/05/2023 23:58, Marijn Suijten wrote:
> On 2023-05-23 01:56:46, Dmitry Baryshkov wrote:
>> On Tue, 23 May 2023 at 01:32, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> On 2023-05-22 04:19:45, Dmitry Baryshkov wrote:
>>>> On 22/05/2023 00:23, Marijn Suijten wrote:
>>>>> This SOFEF01-M Display-IC driver supports two modes with different
>>>>> compatibles to differentiate between slightly different physical sizes
>>>>> (panels) found on the Xperia 5 (6.1") and 10 II (6.0").
>>>>>
>>>>> It is currently also used to hardcode significantly higher fake porches
>>>>> for the Xperia 5, which are unused in transfers due to this being a
>>>>> command-mode panel but do have an effect on the clock rates set by
>>>>> dsi_host.c.  Without higher clock rates this panel fails to achieve
>>>>> 60fps and has significant tearing artifacts, while the same calculated
>>>>> clock rate works perfectly fine on the Xperia 10 II.
>>>
>>> <snip>
>>>
>>>>> +/* Sony Xperia 5 (kumano bahamut) */
>>>>> +static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
>>>>> +   /*
>>>>> +    * WARNING: These massive porches are wrong/useless for CMDmode
>>>>> +    * (and not defined in downstream DTS) but necessary to bump dsi
>>>>> +    * clocks higher, so that we can achieve proper 60fps without tearing.
>>>>> +    */
>>>>> +   .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
>>>>> +   .hdisplay = 1080,
>>>>> +   .hsync_start = 1080 + 156,
>>>>> +   .hsync_end = 1080 + 156 + 8,
>>>>> +   .htotal = 1080 + 156 + 8 + 8,
>>>>> +   .vdisplay = 2520,
>>>>> +   .vsync_start = 2520 + 2393,
>>>>> +   .vsync_end = 2520 + 2393 + 8,
>>>>> +   .vtotal = 2520 + 2393 + 8 + 8,
>>>>> +   .width_mm = 61,
>>>>> +   .height_mm = 142,
>>>>> +};
>>>>> +
>>>>> +/* Sony Xperia 10 II (seine pdx201) */
>>>>> +static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
>>>>> +   .clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
>>>>> +   .hdisplay = 1080,
>>>>> +   .hsync_start = 1080 + 8,
>>>>> +   .hsync_end = 1080 + 8 + 8,
>>>>> +   .htotal = 1080 + 8 + 8 + 8,
>>>>> +   .vdisplay = 2520,
>>>>> +   .vsync_start = 2520 + 8,
>>>>> +   .vsync_end = 2520 + 8 + 8,
>>>>> +   .vtotal = 2520 + 8 + 8 + 8,
>>>>> +   .width_mm = 60,
>>>>> +   .height_mm = 139,
>>>>> +};
>>>>> +
>>>>> +static const struct of_device_id samsung_sofef01_m_of_match[] = {
>>>>> +   { .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
>>>>> +   { .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
>>>>
>>>> Are there really two panels? Can we use one mode for both usecases?
>>>
>>> See the commit description where I explained exactly this: the panels
>>> have different dimensions (6.1" vs 6.0", hence different DPI) and I also
>>> abuse this to hack in higher clock rates via fake porches.
>>>
>>> I just ended up on a scary website that supposedly contains the panel
>>> names:
>>>
>>> - Xperia 5 (bahamut, 6.1"): AMB609TC01
>>> - Xperia 10 II (pdx201, 6.0"): AMS597UT01
>>
>> Great! From the patch description it was not obvious if those are two
>> different panels or a single panel with slight difference in the glass
>> cover. With these names in place (well, with two distinct names in
>> place) it makes sense.
> 
> For completeness: keep the current single file but embed these panel
> names as suffix (eg. `samsung,sofef-01-m-am[bs]...`) to the compatible
> (and document these more explicitly elsewhere)?

Where do the sofef parts of the name come from? Glancing at other 
panels, I'd expect something simpler. Maybe:

samsung,sofef01m-amb60...

> 
> - Marijn
> 
>>
>> -- 
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

