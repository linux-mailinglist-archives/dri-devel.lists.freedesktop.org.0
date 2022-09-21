Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FF5BF7AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6041310E8A2;
	Wed, 21 Sep 2022 07:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84E10E8A2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:28:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a3so7728450lfk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2s5lxGbf4cvyY0Y4pz0pmATsk4vxoVx5/GPuUckLOdk=;
 b=LuHeP+1tR0AIDRsBxb1Ekcmt+YHYmYvl477n9lTq3EbygeOzZMSO4QZ73Mp0FwrMd5
 Op/InV2JCc2lG2J49qqG3H0a2IWx226hi66gfjmPQkm+AOIWssTJe5+8XOk78Xp9Jhwi
 TqREd5ju/xYEe5rVad7x7Q3vPRskOZ1RK+LeVfdzxw1u2eIpVAvkUcbz8AkhaIa+lwEF
 gcCcCzVLt6RmYYjGFI+TL+ifvvP4KD73c3Du7wL7p4DSzO5bwkIr9v2CAEypDdoauqsX
 FMJMwq/0A8Ln0LIdIZgqppfACoc4QEIoZzXbWvAf3GEXkp38KEJGRQTcmfgvk/pHsIEP
 ixVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2s5lxGbf4cvyY0Y4pz0pmATsk4vxoVx5/GPuUckLOdk=;
 b=A5P9q840lhstJofNc2SD8zZdAKuww9wQVMs2f+nFLNkCHcn84UkrTS67zgiXqap5FC
 O2I2naiF61gSSV65hhFDJWvoqH2jswWTs3vR5/ChD4zNjUaiux3yD/ftc6LCZtnBWwvY
 5C79B02Dp2MZhoCSYd99zFFyJhF8RHP3X+rvGB8pyp+o1/7H91ttJTGGVdbFCXTgJWDi
 XYr/a8DZOrKDd9BDtgXZLfb90kkQV3EEA2MXl/pKib4J6H2xqo4ZbFc0AkqlbNkWVSwy
 ZHfPuUpyYutdph5fILljsKO8Cn29KvHP54jMATfvU6GLfL/P4XVVoHmKN6pprxyARhoF
 v8Xg==
X-Gm-Message-State: ACrzQf1sJ8/dxTP1pbcU10izd9QbH2ykXKI8vT2dIzcvPEtv95HTXVYu
 MrTEnScNzgc8mYwNu/sAyjp1xA==
X-Google-Smtp-Source: AMsMyM73JuF+jdQrmITpzImiIu0l/sXxcecWmqzRuEoqbuqa584VPSacsh+E32Lv3H5uLCcB1uhA+w==
X-Received: by 2002:a05:6512:15a5:b0:49a:84f4:9284 with SMTP id
 bp37-20020a05651215a500b0049a84f49284mr10659192lfb.477.1663745294807; 
 Wed, 21 Sep 2022 00:28:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 6-20020a2e1546000000b0025e4dcc48b1sm320173ljv.19.2022.09.21.00.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 00:28:14 -0700 (PDT)
Message-ID: <b257ec4b-fb59-9118-0efb-abf87ea54695@linaro.org>
Date: Wed, 21 Sep 2022 09:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
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
> ---
> v2:
> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>   is always 64 bits where this runs, but it avoids warnings in
>   compile test.
> ---
>  drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>  drivers/memory/tegra/tegra234.c |  5 +++++
>  include/soc/tegra/mc.h          | 11 +++++++++++

I still need here Thierry's ack.

Best regards,
Krzysztof
