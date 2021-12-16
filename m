Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC54774F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB94112455;
	Thu, 16 Dec 2021 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B460112455
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:50:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b22so5556565lfb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YF1YEVRPu5rfTUvbjqvshziJmK/i7RZrcuqF9EviPFE=;
 b=c6aWx4pFU21YvYKT7WKhT3TP+Zle5ry7TK+CVS4HweA+FXs1pxYaow9ljDJYv2k8cA
 La/+h0Bb+/nCVzZkC7buFdT2opj3wh4Ut4GDoc2nzsUUkgsSQAGfRLNS3RyRNbglP+Bv
 yUN5EycVq8k8PXWbH9NrX1Lmy0eAS7Y/cliJPKPpQ60rWPZEHew0qS6ugT+Em2Y3+HMV
 S9L/5EMiF6XXuG0XABWvPruoFD7TeTBCLflzBzxjU5zYaLRtuJr3vfl+OcnG6zACWv6W
 6N2Jbvf+D2ZSAJtZwEqRWrednWhcOqr0BcM8D1uNPWa2CZ8cZ2min8Dgm/LD1FIV7KXT
 cVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YF1YEVRPu5rfTUvbjqvshziJmK/i7RZrcuqF9EviPFE=;
 b=0o/1ECSWP8nI6leo7mRFp+4kshDiWxINJFFCCtAlGfkkxUCfgJGmdN0SKoJYzXLSOV
 vIM2AH6mJiAQwofcEKLtMHmH8OUfCUBPwuMiqY/cpZbYMWttxrGM38wxf5fcU+m9TL92
 pCBGvaJh/7HOka+MawSkJAXUfyvfJMKsCG6T3FmzM4eJfP5dODnedPHjphoqeFUYUl7E
 go6FzN0CKExKSIy9ntjvAsFHneMJFGJec5c0EVsbb42WFxs2lhDay68Hq+JNZPVfYqol
 VZeK1YEZuffgpXdaR8jfCQFPOXzchtXIDb8aEhXXBQVqQJ3rjrdz282x2Z+OGJqCarBo
 /paw==
X-Gm-Message-State: AOAM530uFpSMOlB9Mu4nr3WD4oHO7HPh7mW5O2yoRp5KEDm1kHd/fZ5T
 wSTSC6fs0IB6zxA6L2mNXMs=
X-Google-Smtp-Source: ABdhPJw4JeMKBF6U7PfzAg+7LQ04cGggHkVQWdtCDVMNaGu4piAmC5F2+ePgJI2Eu6bSBGC+Nd4cDA==
X-Received: by 2002:a05:6512:ac4:: with SMTP id
 n4mr14415460lfu.352.1639666254527; 
 Thu, 16 Dec 2021 06:50:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id f35sm906222lfv.98.2021.12.16.06.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:50:54 -0800 (PST)
Subject: Re: [PATCH v3] dt-bindings: display: tegra: Convert to json-schema
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20211216142012.1479213-1-thierry.reding@gmail.com>
 <c935b4d2-984b-e08f-6125-0ce390519b45@gmail.com>
Message-ID: <4e87231d-5df2-d0cf-eb49-e37d2172784d@gmail.com>
Date: Thu, 16 Dec 2021 17:50:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c935b4d2-984b-e08f-6125-0ce390519b45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 17:48, Dmitry Osipenko пишет:
> 16.12.2021 17:20, Thierry Reding пишет:
>> +  resets:
>> +    description: Must contain an entry for each entry in reset-names. See
>> +      ../reset/reset.txt for details.
>> +
>> +  reset-names:
>> +    items:
>> +      - const: host1x
> 
> Could you please add the optional memory controller reset to all
> bindings or are you going to do it later on?
> 
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-8-digetx@gmail.com/
> 
> Ideally, you should add the MC reset to each binding, so we won't ever
> have to add them once again later on.
> 

Although, the MC resets addition should be a separate patch.

I also assume that you'll resolve the merge conflict of the host1x
binding by yourself in the tegra tree.
