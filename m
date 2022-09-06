Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7125AF31A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24D110E71D;
	Tue,  6 Sep 2022 17:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702810E71D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:50:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z6so18508705lfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PlneHbhh81xts+BhwSSO/bVYfamT6d9aGmPbAoBs+Vc=;
 b=oU8zne1PuAsGYTK92vBce5Sl3SAp4gnqtlqz7Dnz5qyx2mq6rB1Acs2o9mrdyalbyo
 jdFajEVxePigd0oL58M2dpQ1B5CQvLRnDTOgjhXY4GNLRBSNuKDVaR20EluRS2JVviNt
 WgHpCuo6EMnyZb3UzD2wCPkw9xngn5Ena7wTzvWr/pkScoO2VdASwDZqc5OiSeJ9t7kQ
 yehgAdUkhNUNcT1/rhE5RL6xv4WCtfPs/oHdegVKj2sdbTLqnOqiiX9/kZ1EXA2UhrA4
 J9QW3ud3vgKmcGnqqjgzxBQpHYE66ejwuoI3s5+KWnWsHnwoxUZ5AUCLKc0uFtiavzqs
 wK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PlneHbhh81xts+BhwSSO/bVYfamT6d9aGmPbAoBs+Vc=;
 b=gZRMGV1t7/FIuBtVSwIHzwa+yEpBrq2xMJuLhuEaTvVJ3adyQhNSIHDo8ur4MDpGhU
 hkem8wpgYLGcE19bxHmeSnCXZBsqVaEvR1ERGwM97c4MdxMez1Qw7DyL9+tQ/iEzMSy+
 L5Ld+6R3Kf+wyxs3mVrxNuv6kV6+8Sy9HUU/CIiZ7a/FCyPeH9PJiPy+IW3YuiT0AX1c
 F+IURVcO8T8bfS8M+Md9NNOqSoy3Fm0XOlg0Q+vjKAcIAwfQ9+4gBX8HyigC8ka8Y8b9
 LJvow20A1b1U+nIGzoYFjTbFMr1sRCox2scmI54PHVzYRZOKqMKRUBoPQ596IeR1Uczq
 o0bQ==
X-Gm-Message-State: ACgBeo2AjnDhrtqLUwoiKPVr+GNZrx9EajPZPJUEQSgHXW+XTVs3qU+v
 E4f+gKIs5IXuLaApRt9EMDBDnA==
X-Google-Smtp-Source: AA6agR4eNuH4iEsDzOrIOC2WXOhHLUljsfP8KbsWI1cXvuZNk0fYC7d8Jv8zbKtdt4PMuM4bIeaD5g==
X-Received: by 2002:a05:6512:1507:b0:492:b9ae:5d51 with SMTP id
 bq7-20020a056512150700b00492b9ae5d51mr17554595lfb.14.1662486605258; 
 Tue, 06 Sep 2022 10:50:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05651238c100b00492cfecf1c0sm1873604lft.245.2022.09.06.10.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 10:50:04 -0700 (PDT)
Message-ID: <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
Date: Tue, 6 Sep 2022 19:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
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

On 06/09/2022 15:28, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Hi all,
> 
> this series adds support for the HW video decoder, NVDEC,
> on Tegra234 (Orin). The main change is a switch from Falcon
> to RISC-V for the internal microcontroller, which brings along
> a change in how the engine is booted. Otherwise it is backwards
> compatible with earlier versions.

You need to describe the dependencies, otherwise I would be free to go
with applying memory controllers part.

Best regards,
Krzysztof
