Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05F26C3E7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 16:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBE489264;
	Wed, 16 Sep 2020 14:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3D89264
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:54:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k15so7238508wrn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZU9QUGLKYmVQE4Jarmg25884dOZMPraKSRpqpbHmZw=;
 b=qiskC9AHQnvHNw5aUBpNpG1Kjkz0URHoQKnjUuUvpBRdzVBFxZ9Z08uQfBCBOb79o8
 QVmrXN/4aC1o0xfp1K7oT4MNbwHBOfCzezeEJLIYEUqjdzfr0YTaJN3BPsRQpfnjI/jk
 Qi5a02Z0ereqESbev+LdTKQnsdtADu4qtmklp/+lzoJQrH4MMZa09nyT28OqB+3i3VHo
 Um+en+jYcnLb5CHslyoVCGsXzCEoCl+Hi3oEsbAiN7Hy8N1AwobeG4vStxcIvJpRG9uD
 jf7TeX/WulTLUqQ6qqD37POsLqo3MdFiNZIKzpQCn/EBvqNlyAiNsnTEX23GYaEXbFe9
 5Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YZU9QUGLKYmVQE4Jarmg25884dOZMPraKSRpqpbHmZw=;
 b=r2c1tTRmCIVcRBVORxy8aDDTnoGor0BoKEIvEJZfUHUI9C5dDOlMPMgxEBLYImlkGl
 1aWbWjIjA7yHkiyNj7nxf8ZWkur7X7Vagecnef7AhWpp9CL9Rzs1HQNyCGWy2gvjxkZu
 zCc5pHxUCuDMe0bG7KjXKGqT4LN0kLNZKYvF3lJsaJQuzMSCZeH+UW9ljiuPD+uR3ojm
 I6nEnywltF5t64zfJ+D1LYgZijY+4G6S7XRhxfp1uGtCGZznrJJ/lzTAmxxHCoKLDegt
 k1UpREB6AhqjHQfCmrYI+C7PqJ7c1B67MckCPOLXN8K8VOAPHS6GfwzoR87tnMvthUFe
 v/lQ==
X-Gm-Message-State: AOAM530tj3QZ7WyjRdil5UK0IJ/I+wnqLQEEs0vKdDEKPLcKnZ+YaqsY
 C1dm6LuutS5wyIiftICVE2XI1A==
X-Google-Smtp-Source: ABdhPJwJMjp1sRuJHiMcw2GRuHuAIFRtg0P4pZd34bf2zw6iHoQCZkWZ4luW9h2PxV0Ck1zAWL5olg==
X-Received: by 2002:adf:f011:: with SMTP id j17mr3440342wro.276.1600268083957; 
 Wed, 16 Sep 2020 07:54:43 -0700 (PDT)
Received: from [192.168.1.23] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id b84sm6165379wmd.0.2020.09.16.07.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 07:54:43 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, khilman@baylibre.com, jbrunet@baylibre.com
References: <cover.1600213517.git.robin.murphy@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
Date: Wed, 16 Sep 2020 16:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1600213517.git.robin.murphy@arm.com>
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 16/09/2020 01:51, Robin Murphy wrote:
> Hi all,
> 
> I polished up my original proof-of-concept a little while back, but now
> that I've got my hands on my Juno again I've been able to actually test
> it to my satisfaction, so here are proper patches!

I tested on the Kkadas VIM3, and yes it fixes the random FAULTS I have *without*:
[  152.417127] panfrost ffe40000.gpu: gpu sched timeout, js=0, config=0x7300, status=0x58, head=0x3091400, tail=0x3091400, sched_job=000000004d83c2d7
[  152.530928] panfrost ffe40000.gpu: js fault, js=1, status=INSTR_INVALID_ENC, head=0x30913c0, tail=0x30913c0
[  152.539797] panfrost ffe40000.gpu: gpu sched timeout, js=1, config=0x7300, status=0x51, head=0x30913c0, tail=0x30913c0, sched_job=0000000038cecaf6
[  156.943505] panfrost ffe40000.gpu: js fault, js=0, status=TILE_RANGE_FAULT, head=0x3091400, tail=0x3091400

but, with this patchset, I get the following fps with kmscube:
Rendered 97 frames in 2.016291 sec (48.108145 fps)
Rendered 206 frames in 4.016723 sec (51.285584 fps)
Rendered 316 frames in 6.017208 sec (52.516052 fps)
Rendered 430 frames in 8.017456 sec (53.632975 fps)

but when I resurrect my BROKEN_NS patchset (simply disabling shareability), I get:
Rendered 120 frames in 2.000143 sec (59.995724 fps)
Rendered 241 frames in 4.016760 sec (59.998605 fps)
Rendered 362 frames in 6.033443 sec (59.998911 fps)
Rendered 482 frames in 8.033531 sec (59.998522 fps)

So I get a performance regression with the dma-coherent approach, even if it's
clearly the cleaner.

So:
Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

> 
> It probably makes sense for patches #1 and #2 to stay together and both
> go via drm-misc, provided Will's OK with that.
> 
> Robin.
> 
> 
> Robin Murphy (3):
>   iommu/io-pgtable-arm: Support coherency for Mali LPAE
>   drm/panfrost: Support cache-coherent integrations
>   arm64: dts: meson: Describe G12b GPU as coherent
> 
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++++
>  drivers/gpu/drm/panfrost/panfrost_device.h  | 1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 2 ++
>  drivers/gpu/drm/panfrost/panfrost_gem.c     | 2 ++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     | 1 +
>  drivers/iommu/io-pgtable-arm.c              | 5 ++++-
>  6 files changed, 14 insertions(+), 1 deletion(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
