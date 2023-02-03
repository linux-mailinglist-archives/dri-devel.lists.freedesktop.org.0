Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E8689B37
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3010E7A6;
	Fri,  3 Feb 2023 14:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5F10E7A5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 14:12:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v10so5283216edi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54zdl1tRuHVK3aF6AZOHZOpUGyh9nh8JsKMJAcUFHTg=;
 b=haenjJLu3SMXpiI575MBFq3SyWjaRgpGdgugDM2E8Gl/xZUQ9cu4Q4HYLsxz0tka+u
 GDRHlBfylQcoBU/XEfV1nRu8XdOJfpOh9ajkMlrh08XYGfUWL0MOVscytFYbwbz3boif
 tQnK4oq9w6iTC5EBXN3tBvFyNSWe1pmRZtrV2Pb4CVjKtmBvfpFgZKj/fKfN69pz8Vfl
 zS8pyYHVY64VaY6H11uyrKVRLTBnrBteJGUzN7coFXtazPWue22pz42rmaAXZV1O+ikQ
 eEYLa8jL7UqAls1TltGhxlgQkiF9Sc7u6+7gvOhRa7UAqbztOvsN6zPIWrjkNbeNOFoB
 iuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=54zdl1tRuHVK3aF6AZOHZOpUGyh9nh8JsKMJAcUFHTg=;
 b=MdJDo1jThVhYD+7zY4ny+oNQcnLE0+GvATL30qFnIM5TffcSyXfGv+YPvI22BOMWV1
 cJLr2gx1+bYVpMZ8B1YhuuXPHBrLFTqogbuxObFgTNgWquKNzEye7fSps2JiEf7L6y1w
 6jpHYfrXy79HNZMEmTPkwXe147Qbhu36L8z/v52PLCd1OdvFOF1DowDAqpfjR/UPUU4+
 p1nCrjkuo5gNWDPVsH5xOu+VFYprSvHyi4S3/8BMROm2ZifBiVIZZ9jlRHv4fkecmBMu
 KI6sGaJsjppXBSDROy0iDVIT+ln5fMxxjhlfIJ3N6C6NaghQvUCJHX89HNdx4bE++D58
 Tjpg==
X-Gm-Message-State: AO0yUKXroK5dYwlNJbtJEO7urwxxlRhjoB7sD+R6CLgYEEOQ5TtlCjii
 ATvGvcta9vYVohb3xkbo/0N7hQ==
X-Google-Smtp-Source: AK7set/ve4XzE3pF30+4jOvyrtX3hH7oCcZ8r/IJTnbchN8fLFAPNYqIPw/1e98czw/LvCF66HD2nw==
X-Received: by 2002:a50:ed8d:0:b0:49e:a107:268e with SMTP id
 h13-20020a50ed8d000000b0049ea107268emr10632611edr.3.1675433569631; 
 Fri, 03 Feb 2023 06:12:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 en14-20020a056402528e00b0049622a61f8fsm1191829edb.30.2023.02.03.06.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 06:12:49 -0800 (PST)
Message-ID: <3626303d-714c-bf99-699a-b4dda283dc2e@linaro.org>
Date: Fri, 3 Feb 2023 16:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
 <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
 <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
 <2de00884-fcc3-7658-811f-9844dea6f5e7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2de00884-fcc3-7658-811f-9844dea6f5e7@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2023 21:15, Abhinav Kumar wrote:
> 
> 
> On 2/2/2023 10:55 AM, Dmitry Baryshkov wrote:
>> Hi Abhinav,
>>
>> On Thu, 2 Feb 2023 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
>>>> dpu_hw_sspp_setup_rects() programs only source and destination
>>>> rectangles.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Sorry but once again, I dont see a response to my comment
>>>
>>> https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313
>>>
>>> So let me repeat that here:
>>>
>>> "This separation is logically correct, but there is another codepath
>>> using this.
>>>
>>> _dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.
>>>
>>> So for solid fill, I presume that stride getting programmed is 0 as
>>> there is no buffer to fetch from.
>>
>> Could you please verify with the HW team what should be the correct
>> stride programming for the solid fill? I'll have to check what is
>> being programmed ATM.
>>
> 
> Sure, I can check but in the _dpu_plane_color_fill() method the 
> pipe_cfg->layout is not filled up so it should be a 0 stride.

Actually I think we should call setup_sourceaddress for the color-filled 
planes too. Otherwise the SSPP's adddress registers can point to the 
memory regions which are no longer mapped/available.

-- 
With best wishes
Dmitry

