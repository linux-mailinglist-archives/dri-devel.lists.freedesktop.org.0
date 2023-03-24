Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA576C85A7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C010E19C;
	Fri, 24 Mar 2023 19:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845410E19C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:13:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o7so2821750wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679685200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wDkUXRm6ebBc/QHvz8cNntbon0PvzQ0AKnhQ2g7v5QA=;
 b=rooZAbRs2MFRJmiyw+SXReNh5WT1x8mEzMt14Bke64nSL7GDOGC+bbvjDW7K5GiVCT
 S7solNiEwVIk509smEZzokLht2sB6pDN614z/HcVs7KTMahyKyKpI2Nj2+sK5t2+WthW
 Tzdd7p0p/fAFEsBJDnIuLGXFq+yRxxsIs2Rp7NbfKKL02wQHoE9ZJbMGoBm/jFB6Jdq9
 peNmE8zjqXILzRM9XObFaNbDh0SStjpKqIbNHhBg08pbvu8/+A6+8fWPvsJ3UT9V6CuY
 ERMSZXGDohg7QP192lyoGs9mwA70895/dvF04FCA28cOz3gpz5szx7c2E0bdMCtKDd/n
 FhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679685200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wDkUXRm6ebBc/QHvz8cNntbon0PvzQ0AKnhQ2g7v5QA=;
 b=J9gKPHcx2F4LU2yL48e1EsEfyh3HOEIi9CPrfj7Yix9vt1Z5c6mo+zOJNFNpq0/SwI
 DzVXjEflp5kR0J3MX/OLy9MYk4zIXouuUrjJZw+kBHPeD0p83ROMBpKHltw1ehtJYN6B
 6yLYvn5DHSbVyJpDK+YFblRpGmk4a1UVyJV8ICF9YJfMnM2bNNA5oCG8/7u8qZSjm0oJ
 h62CE0j3RCyYTXL/In2faKAsq87udm68rYaciW4CLBL+UPQs33Ks9RHWcYRH8cmY9J2h
 n4lsNlE+AkfdnORsOOzGbUlxmq+SbaySaWXb5+CYfXkzAY11RQPF71unkgLknm+e1wui
 08Og==
X-Gm-Message-State: AAQBX9eXyuIvImT6vOvV7Sa5NLxRUxt1FwDUocrr16ylHGVxKa7Kzlxe
 GlwhfVxjuLYq5fQBsxD7wn+YSw==
X-Google-Smtp-Source: AKy350YHCF5U9GYrRAZFMNkr/n6h0lYGicNAZN7Hv0BODu2wqpIsKo8emK19gJHVRUVjHbfF+4Lv9w==
X-Received: by 2002:a5d:538a:0:b0:2cf:f454:95d2 with SMTP id
 d10-20020a5d538a000000b002cff45495d2mr2808206wrv.12.1679685200010; 
 Fri, 24 Mar 2023 12:13:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:537:dd40:8b9b:575d?
 ([2a01:e0a:982:cbb0:537:dd40:8b9b:575d])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002cfe687fc7asm18883280wru.67.2023.03.24.12.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:13:19 -0700 (PDT)
Message-ID: <fb2d333e-c459-f394-a299-533083b83596@linaro.org>
Date: Fri, 24 Mar 2023 20:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/panel-edp: Add B133UAN01.0 edp panel entry
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230324165909.131831-1-vkoul@kernel.org>
 <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 24/03/2023 à 18:04, Doug Anderson a écrit :
> Hi,
> 
> On Fri, Mar 24, 2023 at 9:59 AM Vinod Koul <vkoul@kernel.org> wrote:
>>
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> This panel is found in Lenovo Flex 5G laptop, so add the entry for it
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...assuming nothing distracts me, I'll plan to land this Monday to
> drm-misc-next.

If you get distracted, I'll apply it!

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
