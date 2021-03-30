Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52CD34F2E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 23:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75C6E984;
	Tue, 30 Mar 2021 21:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352576E984
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 21:14:42 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id g15so17335211qkl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ggozfWBPW8IuLIjloW6WSrwVHoKc5x/0lF7TLz027Y=;
 b=vOri9Y+PBjDsorPl7YPFn8uYnFAt2bbwsF1irc/UoeCWg2FuGAdfhAmAryiWLbwGfP
 8M58Ydu/8nmNIQZaelGmUC+1PwKtGx/U3S58yFNQYQR8+S7fxKOL6j43RFKSz6szPcxf
 XgnGXQjJRLLXz8x4Vx8ThJpjB37S3//llCWahX/nc81rmmrDQjKFL2/ldUdWYSaz5FoL
 MJhdcD4a26Z5pT0WThRfN9bssZv2xJE2A0KuyNzfd8N+51UI/iF4q9Ldplkya1yqsnA4
 CFdt8s9V9XYeXKr5b1pbWKRcq19TLStc9Rew6TF2GLruCKfKBuIdCvEHPM1SzUxfks1f
 uajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+ggozfWBPW8IuLIjloW6WSrwVHoKc5x/0lF7TLz027Y=;
 b=TzGjKwZFBUGEKCq0W1Y9Z7lI2R+R0Ev26fMLLJQBxexqoThOBJi7/KVKAGzVdLyTOt
 qq0Pk5Q6FSmn4emZovLGFKTrZIXLre77SlE84fjRyLjypTCMjYfn9NlV7AVE1E3oDSdX
 l4OSsfEf3GdB5WJyhZ1p5a4VcmO6Apad2Rk80oTp/7JnL/Qdw5TxfSEUxYxp9wuYjSD6
 hcOB71hJPxAGBfjTRhco9Jz4cFor8k+V7YbWeR+Hqv5wIGRX0ahgGUiV0rNQNBKmIZrs
 0PWce3D1T8rPTNuoY951/VnNqk0GbSnoxRbREwhZ2yG0bwyB3sLeC9dYSOlXHtQM0Ui3
 JVmQ==
X-Gm-Message-State: AOAM532kJE8kWt8cGQ++cckHYrSN4UEDGeOPmA+Z0e/Y83zN7+0L1MGc
 ktMRR/+RoH0INE0Z2qgA0zY=
X-Google-Smtp-Source: ABdhPJwbD+N/GjB0AlKqJVMu0SfsvPdMs9oaHoiPjFBTbDnbbPd1HJfEWQMejjZPYQPo+ef3Vr0RGw==
X-Received: by 2002:a05:620a:2158:: with SMTP id
 m24mr231264qkm.306.1617138881199; 
 Tue, 30 Mar 2021 14:14:41 -0700 (PDT)
Received: from Gentoo ([143.244.44.215])
 by smtp.gmail.com with ESMTPSA id x21sm16567967qkj.25.2021.03.30.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:14:40 -0700 (PDT)
Date: Wed, 31 Mar 2021 02:44:22 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 24/30] Kconfig: Change Synopsys to Synopsis
Message-ID: <YGOUrpsQzrIPEHIU@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1262e9e62498f961e5172205e66a9ef7c6f0f69d.1616971780.git.unixbhaskar@gmail.com>
 <8f80fb1b-b2d0-b66a-24b0-bd92dc6cd4b6@arm.com>
MIME-Version: 1.0
In-Reply-To: <8f80fb1b-b2d0-b66a-24b0-bd92dc6cd4b6@arm.com>
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
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Content-Type: multipart/mixed; boundary="===============1122108031=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1122108031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZkHisyvIHxtmch2f"
Content-Disposition: inline


--ZkHisyvIHxtmch2f
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 12:43 Tue 30 Mar 2021, Robin Murphy wrote:
>On 2021-03-29 00:53, Bhaskar Chowdhury wrote:
>> s/Synopsys/Synopsis/  .....two different places.
>
>Erm, that is definitely not a typo... :/
>

>> ..and for some unknown reason it introduce a empty line deleted and added
>> back.
>
>Presumably your editor is configured to trim trailing whitespace on save.
>
>Furthermore, there are several instances in the other patches where your
>"corrections" are grammatically incorrect, I'm not sure what the deal is
>with patch #14, and you've also used the wrong subsystem name (it should
>be "dmaengine"). It's great to want to clean things up, but please pay a
>bit of care and attention to what you're actually doing.


Thank you so much, I shall be more careful.
>
>Robin.
>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>   drivers/dma/Kconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index 0c2827fd8c19..30e8cc26f43b 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -170,15 +170,15 @@ config DMA_SUN6I
>>   	  Support for the DMA engine first found in Allwinner A31 SoCs.
>>
>>   config DW_AXI_DMAC
>> -	tristate "Synopsys DesignWare AXI DMA support"
>> +	tristate "Synopsis DesignWare AXI DMA support"
>>   	depends on OF || COMPILE_TEST
>>   	depends on HAS_IOMEM
>>   	select DMA_ENGINE
>>   	select DMA_VIRTUAL_CHANNELS
>>   	help
>> -	  Enable support for Synopsys DesignWare AXI DMA controller.
>> +	  Enable support for Synopsis DesignWare AXI DMA controller.
>>   	  NOTE: This driver wasn't tested on 64 bit platform because
>> -	  of lack 64 bit platform with Synopsys DW AXI DMAC.
>> +	  of lack 64 bit platform with Synopsis DW AXI DMAC.
>>
>>   config EP93XX_DMA
>>   	bool "Cirrus Logic EP93xx DMA support"
>> @@ -394,7 +394,7 @@ config MOXART_DMA
>>   	select DMA_VIRTUAL_CHANNELS
>>   	help
>>   	  Enable support for the MOXA ART SoC DMA controller.
>> -
>> +
>>   	  Say Y here if you enabled MMP ADMA, otherwise say N.
>>
>>   config MPC512X_DMA
>> --
>> 2.26.3
>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>

--ZkHisyvIHxtmch2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBjlK0ACgkQsjqdtxFL
KRV/Awf/WgJ4kZNXg13Lymj81qWKh0xQChcPR1byavkwRKFeyk4mIQDv4/V33f03
x8lKJRgdvwchbQrJXtz1HkobUN2Yx2wQ8aprpF+kOiv0brN8c7TE92xf7dxnjL7T
3SSjbN44aYkmCCyV/Em37qXQi4/WrhZbP70K2P89e++Xsjb/rElNBwlmQzyjx0Jt
KIiXNgr5vFaqJOtwrMFOwDqparI5v70FJjHSTjZMHPPJTiIuYwMSl4r57ABV2s+7
jXyj1J6ePWL0sfX8h4eo2sBFtcuirP8NZMJbHw4lA0JG8FE6nBDAiFohWucgPBdo
8vzWlWSOOWJTt5N84XfYEPiJB1caGg==
=WK+C
-----END PGP SIGNATURE-----

--ZkHisyvIHxtmch2f--

--===============1122108031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1122108031==--
