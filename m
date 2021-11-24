Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03F45CB21
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 18:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2C06E914;
	Wed, 24 Nov 2021 17:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778E6E914
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 17:36:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id l22so9247704lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZIcn+RRc9Rps+7b0T+IyJm79uMUpyF3YvcCN2OC7l9Y=;
 b=FLBSX0+olXTOAlp7C+knSf/7drnIn7H/UX7TDK9AoSp4PkuSj60LVuYkKMnjcC9YY3
 ikWuFdLfD1kbuzClK7j2r8uE52m0ciCo0F41wb7XU00orL14Q13pQk+6d+pyM7vdO2QK
 LYUIqSIXIslxr1QmFi4Bl0ADQeiZ5m+/BOBB6vDflgHIEMsk0Q88DdJUo3wVEYI8Pr5Z
 sXvAtuyUfl3+J0677+KUwo73hWKLP5dVAe3qav01Qm9WaXlqZU7Qi87kYoIB9qdRIWxe
 kKTxqqpAJ0WWNVIjLM+Cf5/IG4PS+Rx6faWvmZ4/OGrH5fC0tZn54q+Z8fHjDwt1vOnd
 kYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZIcn+RRc9Rps+7b0T+IyJm79uMUpyF3YvcCN2OC7l9Y=;
 b=kQZ0p5QNymPs6wwaBJwRhP+btC+wGLTjqrWMFtCC9AlPZnhZnYRV8LbZSXsOSd11R7
 v5lCXU1FpvTYh7E0T9tqkT33W04IWOo+fe9/BPp8gwSdQOBEhn4bzi6oCZ9/haI5gGsm
 x17yJC6vxnztoyeawzQfSjWxrNol6Uj0qEORWeOsJTsCW/y61CSVGZCbyQRD5dgd8fn8
 kAYy/NxNFIVgf68Z/QHgQkAfmOA7z2XSQ/gCApMrkVbsIUfhm+g8NTWSjXYAs5lLOtQA
 32GAtK3ypKIXG/nKeCtHpHBKPRUmw0feS7oQuqonRfwMYTx0sZ2943i8+6fgp535sd+E
 dONw==
X-Gm-Message-State: AOAM5313UX/Wj07kJ2aVPSNsCOhixSDErD5o68ci/aQTyUsgHu7ohG0O
 4oD5wXJRLNyx74cUo33Ud8s=
X-Google-Smtp-Source: ABdhPJxrgNz+71paDdUUv/N7my06bflGW6cF8iV2RywOAz26KaDrmDsPh/ZBuabbAUbFBAGdMU59uQ==
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr16884188lfu.204.1637775417014; 
 Wed, 24 Nov 2021 09:36:57 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id e14sm42342ljn.78.2021.11.24.09.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:36:56 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
 <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
 <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e455d008-9389-b15b-b2d1-b2193cbd77c7@gmail.com>
Date: Wed, 24 Nov 2021 20:36:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24.11.2021 19:47, Arnd Bergmann пишет:
> On Wed, Nov 24, 2021 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 23.11.2021 01:21, Arnd Bergmann пишет:
>>
>> The commit message is correct, however you could remove even more code
>> here. But there is no need to make a v3 just because this patch because
>> I already prepared patchset that revives this S/PDIF driver and enables
>> HDMI audio on Tegra20. I'll take care of cleaning up the whole code of
>> this driver.
> 
> Ok, perfect, thanks for taking a closer look as well.
> 
>>
>> -       dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>> -       if (!dmareq) {
>> -               dev_err(&pdev->dev, "No DMA resource\n");
>> -               return -ENODEV;
>> -       }
>> -
> 
> Right, I think I considered doing this at some point as well, not sure
> why I left it in for the version I posted. Passing the IORESOURCE_DMA
> values is clearly wrong by itself and needs to be removed, though
> it's not obvious what the correct way of requesting the DMA channel
> is for this driver either, without a DT binding or users.

Yes, it's indeed not obvious.
