Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC38A4BC993
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 18:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38810E143;
	Sat, 19 Feb 2022 17:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0EA10E143
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 17:48:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o6so8758633ljp.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WRNvBC6o9UGsbku3xFPijsy2+ZDFIPtWNh5a7I/Btf8=;
 b=TGbo6yCdYGD93/pxAGhyvvLgjH8XJVMuefXHswz4bP1zr+75mmibPV0fnY76r5UpNU
 y0muNB1nQVsn/u7CtcDcB6RX/RJ3c+ZtiNjOyLJbmyuqCq36ediJN4rJr0WglLPwfD3u
 xEDJnMgsUsVL3uy/LXM2l1UIEPzsVKUFv6g7mSj0EaUYUJnUJe4nGbrQpoT4CFjuAFuq
 Q06Y3/xx9wCBw5cmlkzdvR2NUyZph6PXeR4PQsmrZ8DY/0p3bYXb+rs6HwTFPuLAhmUy
 pGMReD+zLCz2keV7tSi3Vu4OZPeZnPvBevY2uOSjVOjm9Vw/wP9KdGBrxBocI8+4jF0y
 ANXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WRNvBC6o9UGsbku3xFPijsy2+ZDFIPtWNh5a7I/Btf8=;
 b=TcMfSWzyVdNLdLlCKbBQTc4/H80beHZEfnbtq5iKseTIGv7hUGUfGJWnxW7D3QJrEZ
 2ipIPVbJY5h4VevbfsVjlALBDXU1611x9346jU9rqyDtzX0Oh4A0Kq1YsEuJKnll8Hbr
 hipvFgTYvl1OmoUritgkr+0/Zq53pllj8LYkQemrwdOdR9VSlpI+hTCk55BKsdYt5x1j
 yy35KXmHJCByhX7HEPAfl8ef2NNhVFDWye+VxjXuYBDXdE/MN9fx+A+3SARoWGRpQFgn
 NuOFoJD21c4kNwqmFA1+hFxBMBVEcBiQpQvZfmv5ly8lQzhK89yrhsRW7Kr3HD3zIquX
 lXwQ==
X-Gm-Message-State: AOAM533OD/dsyKcEL2tevSUmxJ6x0p8vJuD+1HGvQ8Lt19DaQZxdUpmd
 2tKwzsnpCOCHhsr+azvSsOQ=
X-Google-Smtp-Source: ABdhPJz/BRt4yZ6Y5LNb+KZh4UnLJk9a9nacbUYT258c5HxaK4pyq7Kl19rqtEU4LLu69ggLTlSMMQ==
X-Received: by 2002:a2e:8682:0:b0:246:2c86:8d19 with SMTP id
 l2-20020a2e8682000000b002462c868d19mr3745142lji.329.1645292883313; 
 Sat, 19 Feb 2022 09:48:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id q8sm624249lfo.220.2022.02.19.09.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 09:48:02 -0800 (PST)
Message-ID: <149d4794-90fd-cde3-9d59-39e6488db679@gmail.com>
Date: Sat, 19 Feb 2022 20:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/9] gpu: host1x: Add context device management code
Content-Language: en-US
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-4-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220218113952.3077606-4-mperttunen@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.02.2022 14:39, Mikko Perttunen пишет:
...
> +/*
> + * Due to an issue with T194 NVENC, only 38 bits can be used.
> + * Anyway, 256GiB of IOVA ought to be enough for anyone.
> + */
> +static dma_addr_t context_device_dma_mask = DMA_BIT_MASK(38);

s/dma_addr_t/u64/ ? Apparently you should get compilation warning on ARM32.

https://elixir.bootlin.com/linux/v5.17-rc4/source/include/linux/device.h#L524

> +int host1x_context_list_init(struct host1x *host1x)
> +{
> +	struct host1x_context_list *cdl = &host1x->context_list;
> +	struct host1x_context *ctx;
> +	struct device_node *node;
> +	int index;

Nitpick: unsigned int

...
> +del_devices:
> +	while (--index >= 0)

Nitpick: while (index--)

...
> +void host1x_context_list_free(struct host1x_context_list *cdl)
> +{
> +	int i;

Nitpick: unsigned int

