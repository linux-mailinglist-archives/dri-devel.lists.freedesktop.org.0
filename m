Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151C95E4F91
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 20:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02C210E4F6;
	Wed, 21 Sep 2022 18:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8F10E4F6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 18:37:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id g20so6881596ljg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=21yo/o9B1Z///KQURij6FTrdwpuSR6f9Iw+FckBY2pQ=;
 b=scx5aDinqwOzyktx9EfIUAeNOHk77EkF6br4UcMXBuVwtoxL9iYFi8xijVRCpHvPV9
 F7MTHj9+nQr5Qn0WPkx8Rtx1szwHU78eK7p7AxgbblziBHJxioaz3RnNszdowlC+iVvs
 I4HKglXBuw/40CeoXtNAye4gvB84iHMZpwzxnJD0VPDz7EjxINsV0EJP4RFNEURGHWBc
 Bj3G7xztwKJwVeMwPGJzAZyvlEtVeydENF+4Oxhy2evgKC3rD2H2yY6R6PuQmJ0747K2
 PQ9NB/hn8JOuKmantMPWAh5Jb6HeKBQuoqZAs289cwEOoodh8gNpoqmO3clxM25sGAg7
 QJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=21yo/o9B1Z///KQURij6FTrdwpuSR6f9Iw+FckBY2pQ=;
 b=Ax7OyJPfdHG72GA54Wh22Ggzz99T9MnaGL4eDZOoneB6bW+lvrehEZi0ovm7ULLcCP
 xXzF0prPtF6m27S5B6i/nmUxhrkquut2euZO/aV+0oxdouTz0h+Xu2y7bWk9j7w2buiZ
 TcmzM14HZb/v1E+yIZXcHzhrMMsOUOoRX4134FticXPdw5ICUiC+JFq9iTa7WfewtyZi
 Or7JYNSpeldIxiKITEG5CI19aqhXc0L9S5dz2XxdjBTBGtJhA/URXffidQT7ZP0cTfkn
 tqVq1UkQ/BqumOHPD8boXEro6fF7ox0HzYf8IIYce+rnDMcQTO/Og7htlWIBfHRweCAu
 ljAA==
X-Gm-Message-State: ACrzQf0GOfydUvvCN71vTWBX3iBzg2g7C3OiAwB5fQ1Y0EyqAw7K4mbf
 XmHd3kGpj1meoVD87BYp3Ph2WA==
X-Google-Smtp-Source: AMsMyM62wnzWt6Vp8mUjb+gIZEsui3L9hXgPsI7/JmBOT8VcKQ2uhobjPCK+P25klFmqdlSyfydITA==
X-Received: by 2002:a05:651c:1951:b0:26c:6215:1e92 with SMTP id
 bs17-20020a05651c195100b0026c62151e92mr2540306ljb.240.1663785439395; 
 Wed, 21 Sep 2022 11:37:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b004979ec19387sm532855lfo.305.2022.09.21.11.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 11:37:18 -0700 (PDT)
Message-ID: <8cb14446-01ec-255a-5bf6-e16098628f60@linaro.org>
Date: Wed, 21 Sep 2022 20:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920081203.3237744-2-cyndis@kapsi.fi>
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
> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
> has been loaded by a bootloader. When booting NVDEC, we need to tell it
> the address of this firmware, which we can determine by checking the
> starting address of the carveout. As such, add an MC API to query the
> bounds of carveouts, and add related information on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

