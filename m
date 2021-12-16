Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE1C477468
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DD9112283;
	Thu, 16 Dec 2021 14:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A21112280
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:24:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id v15so38866239ljc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3te9pe7rOJHos3EuPgW4pF2bDr58GHICUC52sb6TTQw=;
 b=igVil4d7hecRf/ZlSHkjGruHgf+4OOe4/KwyAc3HNyI/F2/EASnbWlmBW1xTb9kyIf
 LCsjrURmGl04f3eT9XO2PC7S7qc7QHJF7vXVdsW221Oir2aAxMMhWcEDjv3yX9WDczqV
 ZDS/IvjvPnck+FzEw10c7WJJf3Hs1whJzcS4oMZEwL83kIugA95UTue+8vljF7orSw/F
 W1pN26OniH5nNBEyrLvvldgEsL7ZcXLfrgZgfW/+EJCzdM179Fnek2baPlSqDFWaJuu5
 R2hxrJEuFfzP88gWkIzimlDjZBs6i7mip18yIbHvCl3zFmfzJdLvHKsnANZ9IEim+FqC
 +aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3te9pe7rOJHos3EuPgW4pF2bDr58GHICUC52sb6TTQw=;
 b=mrK2PeEatPMoNcDA8uOakIpYJEu+FY9nKJAIQHhVkiLaeDSoGTAHvOdKZ+c4Apkf/V
 6ixfoyrn662vpieVhHN5v/FTH7PLXKh9X7qrZMFFlQjPSV1JuqlJGS+b4bvLdEJ+PUF6
 kQiaAKhJfONtpKMyKxpTmW16m/+5iNCWwkFnLhJtfcYwBgT/saw0keG+7rYsUWfA2Led
 6dFePZY5yVyc34QntZqjNb96vZvpZo8K11XyZyKmbSv8nQqH2JxpGTcWzmWJvaB89FWU
 4EWMk2eRQpcKDPOKvZWaLLINYJnkrcvp40CdanHkrMaov9H8afKqiCdFMFvzzPF9Yqe4
 d+9Q==
X-Gm-Message-State: AOAM533O2MMqyId5wry0G75g2rlUAYSHDIoLS2FfpzEnLuPJXCPn4g+Y
 DWwYVdnrtM+1kmm2EwGn/tlxDT+6Im8=
X-Google-Smtp-Source: ABdhPJyZgc6J3PJapwYvBcgEEKZ/Jerd++aLCQoky0Jcr64DLrgfwsKC+jhHtu9KLPZdgvdP4/NUvA==
X-Received: by 2002:a2e:948:: with SMTP id 69mr15645160ljj.82.1639664692137;
 Thu, 16 Dec 2021 06:24:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id a12sm896315lfk.227.2021.12.16.06.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:24:51 -0800 (PST)
Subject: Re: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-21-digetx@gmail.com> <YbtDNbdJqCGTaMNs@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7cc2693f-df2d-b3ca-5336-4815d98a67cb@gmail.com>
Date: Thu, 16 Dec 2021 17:24:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtDNbdJqCGTaMNs@orome>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 16:46, Thierry Reding пишет:
> On Sat, Dec 04, 2021 at 05:37:23PM +0300, Dmitry Osipenko wrote:
>> Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
>> Tegra20 devices.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>> index 72cbe32d0c1d..dde228bcbbff 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -186,7 +186,7 @@ rgb {
>>  			};
>>  		};
>>  
>> -		hdmi@54280000 {
>> +		tegra_hdmi: hdmi@54280000 {
>>  			compatible = "nvidia,tegra20-hdmi";
>>  			reg = <0x54280000 0x00040000>;
>>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>> @@ -1063,4 +1063,24 @@ pmu {
>>  		interrupt-affinity = <&{/cpus/cpu@0}>,
>>  				     <&{/cpus/cpu@1}>;
>>  	};
>> +
>> +	sound-hdmi {
>> +		compatible = "simple-audio-card";
>> +		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		simple-audio-card,dai-link@0 {
>> +			reg = <0>;
>> +
>> +			cpu {
>> +				sound-dai = <&tegra_spdif>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&tegra_hdmi>;
>> +			};
>> +		};
>> +	};
> 
> Should this be status = "disabled" and then only enabled for platforms
> that actually enable HDMI?

Assuming that HDMI node is disabled, we assume that the card won't be
initialized. It won't be a problem to restructure this card in DT later
on if we will have any other use-cases than we currently have, but this
is unlikely to happen in practice.
