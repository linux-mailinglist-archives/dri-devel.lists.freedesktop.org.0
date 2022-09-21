Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49E5BF7A2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3F710E8B4;
	Wed, 21 Sep 2022 07:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4C10E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:26:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i26so7698446lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MnSWHO+RfIeNaFDFqzwfoinv6Rc5CwKZJPD6zpABsuA=;
 b=oGeYxT8aHwJywwRm9eJhQOM9sgCnqevsJOBHoKUDP0+7PklEDRAvCLaJe/vz6zR1d6
 y4f2oxBEvIhXfqhHO7uQ9YnXtNXBCIboI0eQFWaq4TyaYVFZvfqjWGwQ7VyK8ocoRNA8
 7peHkg3H5So8Obcb5qU/Dez9PuyDebutxrlc5xQ33SPuP/4Stg5Zk7C5otypLXlN7NGZ
 qyMS7nTrzlJ63Tbl7Gx79PvRkjxfOJNoND1Rl77PZH6bouqlScCNb2ga3k7w6V3oMUaN
 axbLtlfUzULYO1Fge3E/pkyBDcJ3il+gBPdtHwOEGS3rowWsAFEzxqpFNaZNWZ8t5bkd
 Z2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MnSWHO+RfIeNaFDFqzwfoinv6Rc5CwKZJPD6zpABsuA=;
 b=pNwSSHqcg0WZg/UpjWa4XbKtiRh2QZc0hcHbXgU42K04STDbzCkbtHEGH9/l9ZVbzp
 5Z07HRipX/1ej5DLQZl/V3N8TFG7LgTZp5E4F9MhJUY4CxOgWozPhzUdDv8sqhV2uvdr
 hz/Jqpk91vLmAiT0Hidy4eE/CgNJvU55kHRKPrHH/9H0myMmuskaXZFsjSAbNkqaNucS
 b4SpQdxQnBVy4Qm+DNJFD8BaTda0t+WXaFt61YjLCKhhs6lTvB/FYrtX+7JW5mszpfHT
 jUMOtV/wfd5+kB7XIWjMO1s16GwzmIe6AsJCkvFDI2Rn545K529nYzKiFIPdjcG7bOSu
 rXtQ==
X-Gm-Message-State: ACrzQf0C05PEsjXJD0Mi6JsFzAyXu/BefYQEI/d7g/9dS41MrtQxERaN
 iDGa0AQbKnR6F1wD/Bo+ZuU8dA==
X-Google-Smtp-Source: AMsMyM7FEIha/kn5S4kD/G/mfgRfoNfCWlTclJDQXi2ZBv8md5pqDwyGpYTNn55ERJ4Gzh4WeZqDjA==
X-Received: by 2002:a05:6512:3ba1:b0:498:f547:866b with SMTP id
 g33-20020a0565123ba100b00498f547866bmr9174722lfv.653.1663745169086; 
 Wed, 21 Sep 2022 00:26:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d9-20020a196b09000000b004999c243331sm315377lfa.141.2022.09.21.00.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 00:26:08 -0700 (PDT)
Message-ID: <89d925ea-f550-6903-1c24-b320ae5a82c0@linaro.org>
Date: Wed, 21 Sep 2022 09:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2022 10:11, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> v3:
> * Updated patch 3 based on comments
> 
> v2:
> * Updated patches 1,3 based on comments
> * Added Acked-by to patch 2
> 
> Original message:
> 
> Hi all,
> 
> this series adds support for the HW video decoder, NVDEC,
> on Tegra234 (Orin). The main change is a switch from Falcon
> to RISC-V for the internal microcontroller, which brings along
> a change in how the engine is booted. Otherwise it is backwards
> compatible with earlier versions.

I asked you to describe the dependencies and patch merging strategy.
It's still not here, so I assume there are no and I am taking patches
relevant to me.

Best regards,
Krzysztof
