Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26D4F3D43
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 21:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6910EE68;
	Tue,  5 Apr 2022 19:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6232510EE68
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 19:06:03 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so162110otq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EIujCWCO2qQ5eWdacFN0Ll7BkI4EHwmpjNfOsdNp9II=;
 b=n6rT9gMpI0mrMk0VOC0llsGh5LauXwFU8NDiigQYPBMvu/3VJxxAx04UPP7i3nan+q
 l1hErJpUSjSSKo3xiaSTX2jlZiURighCYFMWe/FKFbs03hvA8v00jpELnc0rnWR5I2C3
 LFg7pZA3yb7AUp05x5TvFYeUp8KmWX/OMSjfZpmAJXETn9CXOJdGjPplBbVaacOw4SPF
 pmFR/K6XbCpMmgwnuJrhSGDVmN3GWSyI0fxNmV4cL8p/8Ba0MP458NPOd/wgwAuuh9Ok
 uu31W0cqyw8cWK26NCovYLG+wZN+5Uj8BnyIgJ8x7X9nN7aqtKaRVb+V3a32TS163PRU
 J4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EIujCWCO2qQ5eWdacFN0Ll7BkI4EHwmpjNfOsdNp9II=;
 b=3NA97jpuk5VPdqH1V3h6fW3gwmtVtNBtjNdnmWo7UushkpFIe87q4R1AQ+T4qsUowr
 2liXdHiPCD31cRdQjOcW0v5GMSmRFuZ8fz77OXx7lyZbfgHbGLl8JjUdgsR40eebI+UN
 1FpSWzZyFLpT0htEw8H66wza9boLkHDji1IW7k27BFUSZyFitIBghzZPxwaxGHp2ks2s
 r/AyBS5+PDl4ELxx4HnwJvrbpRUa6T49YfBjyXDWTtSdyuZAW8ssGfCXu/whaVztx+J1
 zao7Ai/IEY2269n3tOo7E+Wld//5EcfIiM+4u5Gc7CgF5trhgpka9QtZNENph3CaZpxf
 U5wg==
X-Gm-Message-State: AOAM530qB4T5ZqcR7TiyOHCqq1n51kxhIMN/GV0RHk6Y39vxMcWrIp0I
 9wM1na1PPqfNKhfwAApPQ8c=
X-Google-Smtp-Source: ABdhPJx/KY9pg/A4x4Gsc9X+JfRPB0+ekI5B0VPl1I9Of0gQ0rpxTkEccApWrTUO8CyW0SChVl0MMA==
X-Received: by 2002:a9d:6a84:0:b0:5cd:ad64:a50 with SMTP id
 l4-20020a9d6a84000000b005cdad640a50mr1795994otq.114.1649185561636; 
 Tue, 05 Apr 2022 12:06:01 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f4:7cc:26a1:e446:de76:c0b8?
 ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a4a6247000000b00324e9bf46adsm5426843oog.41.2022.04.05.12.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 12:06:01 -0700 (PDT)
Message-ID: <8234e944-d554-74dc-074c-3849e1e88c2d@gmail.com>
Date: Tue, 5 Apr 2022 16:05:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/9] drm: drm_atomic_helper: Add a new helper to deal
 with the writeback connector validation
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-5-igormtorrente@gmail.com>
 <3a8413fd-d048-cffe-1600-a0af6544c9f2@riseup.net>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <3a8413fd-d048-cffe-1600-a0af6544c9f2@riseup.net>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,

On 4/5/22 11:21, André Almeida wrote:
> Às 17:45 de 04/04/22, Igor Torrente escreveu:
>> Add a helper function to validate the connector configuration receive in
> 
> Maybe it should be "received"
> 
>> the encoder atomic_check by the drivers.
>>
>> So the drivers don't need do these common validations themselves.
> 
> "don't need do" -> "don't need to do"

Thanks, I will fix them too.

---
Igor Torrente
