Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AF162986B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 13:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620010E3CE;
	Tue, 15 Nov 2022 12:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246CB10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 12:16:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bp15so24056434lfb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 04:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
 b=tR3w+a+JPTo0vZAk4sSj/mNTKv+ZhOTcOtCx2+3qEkMteQ3XTVzYbbKnLZLDmXNQZm
 EpWwiKYR7wHiNnFffVMVMw6i/SIXUy6yohd81DoWzdGvds6PL3NO/qTsBfqLMYhwbcPv
 +sLgujjc/1qTpymQnm2VbB4NjDWm6oZP7PTKtPAGtlgIFU1P3IotJ+Yg720TvfvWK5LY
 So997eksu3gD1Yrl5CpB2+flKWypWap7lE2wGRgW5DGu26fYiFHytTfTK5NYRcUtI4Rt
 OndCqUCzEim7UJBrC8EzWWZ93vwXJ8uYvAvn6KlHwiXbfEJU14Zda6YMkqNoUA5y05u3
 YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
 b=Xjtz+ctmxXLXmLM577jg5Cq6KpaNB10JrprdsSztmV40Emz/7jL79DQ6CSFs+/vYUh
 YedYCZsX2DKMG8uIh3s5iKhvMkSJP6tSAv7wsqTF/pBAa7bdzWRX76eY6TRz/2CcSZYz
 NJXcxhUPXFXl2ZyZYt6/0zdzcfZzaci+/RYXVOC8ZL559i3u1zZybPM/NbmrwRGxN91V
 6cb8X/3AdAFE+tzouFKEdpmV783j0/p9JvUvtHKmY3ZOnZrwf7Q7zr3c1EX7MT38fp4i
 GQf7x35kJRhcnj9eOMCZM+CzFwCFv5b89CVwaA00cSw5N+CR4bSsFnOzbWlsT+ZyAOw4
 /XXQ==
X-Gm-Message-State: ANoB5pm7EPYl3xIm7vwxPTFDSO/gFfhQAcUWPshAnsd5SgYuhOs7oVCa
 uCuA6N2Q3kHCBRJjtNsvey4T3A==
X-Google-Smtp-Source: AA0mqf7VWxyl1RZKscxhjDznC/kqYEwrVwdbg5fIWlrY+D8kHURt5sGT6UffK1OwKrikT7PXoa0dPA==
X-Received: by 2002:ac2:47ea:0:b0:4b4:1324:6ed3 with SMTP id
 b10-20020ac247ea000000b004b413246ed3mr5262252lfp.19.1668514585345; 
 Tue, 15 Nov 2022 04:16:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a2eb80b000000b0026dc7b59d8esm2482225ljo.22.2022.11.15.04.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:16:24 -0800 (PST)
Message-ID: <35bb9f38-d89b-77c6-a546-f575da5a79f5@linaro.org>
Date: Tue, 15 Nov 2022 13:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/23] ARM: dts: tegra20: add label to nvidia,tegra20-vi
 node
Content-Language: en-US
To: luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-4-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-4-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Adding unused labels is not useful at all.

Best regards,
Krzysztof

