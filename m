Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB094BC9A1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 18:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825AD10E190;
	Sat, 19 Feb 2022 17:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA4910E190
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 17:54:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d23so11115573lfv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aoZkz4UcqkbcbdkBIaYothPTAVInA8f47sKV7OByCA8=;
 b=V05F1qg9f4nbiwXkgAbj6ZupT1vhyiVl+oRG2Cb72we2lGfczwVY5Hrsq7P5izsqOX
 Jzh5Xj+Gwz6iNZ2fw601ehpiQ+HttwigtxD5rOh2KVkMMnaFIQ6eOQpVT3RBZe8nT+1S
 3RtcX5CTCmsgG88DqViob+rNiEN6HGEcaaRmNvUyhLGZiLwv7jcaRgIGQfCLvy/sKMPp
 Z4DtHnEzaP7/oGctss4mUdtZ7ucRZv2phgcJBBoqIgc68C6qig8bdTiPZJy5tLB5vJvb
 dPjcJPN9hXsMvugSHTwQgtFfAOJEdNIxR5fOtKAlEdPFAyXr2lAtUizSi/gfJMgcbg4s
 bLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aoZkz4UcqkbcbdkBIaYothPTAVInA8f47sKV7OByCA8=;
 b=POmISY8YGFfzsUDIUVx/4UZRVPb65ifBDEr4rurM4Bf4ZEeGjCF+aq4ItBagCh2sQq
 xxrLVuv/iOosvre0T4z4S3OUfOuFQjg1ZgWDXzKphrxU03ZOo2ij2eWF2SXVnPFK1Y1C
 Qlfrcp76XTDJdw1bZHcdcBRHJSm7kroHE6qJSoU5a5+BvGhjOuDjeOvOfn1DEcp/QE52
 rSxbycx0hoDFzoQ3+X/oR9MMxvNDzDuggPsW97/biPRd/v1UfwrneNyNmXBQL23JThkR
 6874Z2HYO6obBJJ2f5QPY9cw2pVwb3ohk6YiahmE1/u7+l3HcfXwOSbq2Qc29S5aDMkw
 l5Gg==
X-Gm-Message-State: AOAM533O/CldUcjM9pwdaphVuSc59NaxzTBuCHPcocdg02CN3nwTT3qP
 ZHpuhU21NNAxi1LPVfS/68Q=
X-Google-Smtp-Source: ABdhPJyZm5rpdUuzDAVCO59dU5XnbDOQjopGFqtKzdhrYSb/gAp9nQZmNiw36/eNkNYap3Bi46Jbbg==
X-Received: by 2002:a05:6512:220b:b0:42a:1481:a977 with SMTP id
 h11-20020a056512220b00b0042a1481a977mr8836563lfu.293.1645293267754; 
 Sat, 19 Feb 2022 09:54:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id f19sm390690lfh.264.2022.02.19.09.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 09:54:27 -0800 (PST)
Message-ID: <1c97bbb5-ba0b-742c-2a21-8abf195b9e6d@gmail.com>
Date: Sat, 19 Feb 2022 20:54:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/9] gpu: host1x: Add context bus
Content-Language: en-US
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-3-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220218113952.3077606-3-mperttunen@nvidia.com>
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
> +config TEGRA_HOST1X_CONTEXT_BUS
> +	bool
> +
>  config TEGRA_HOST1X
>  	tristate "NVIDIA Tegra host1x driver"
>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>  	select DMA_SHARED_BUFFER
> +	select TEGRA_HOST1X_CONTEXT_BUS

What is the point of TEGRA_HOST1X_CONTEXT_BUS if it's selected
unconditionally?
