Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3F95C4A0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 07:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B666910EB5A;
	Fri, 23 Aug 2024 05:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jypyoXKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823F010EB5A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 05:10:33 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7c691c8f8dcso1115890a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 22:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724389833; x=1724994633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wN8gOGozgTRHYua5nqn1vSL/fYA2BgScIc4AbKs4NtE=;
 b=jypyoXKg8fGiQjjaSzvSEoFAUtesiFCDDrUnkfUBGX/HCIdE2ZDc+OOyj2R6Mkq1d6
 yXaN/YqVppjbbJ+oFjYXLY1YpYotIiopHQRLw/P8IPrfPgSD7uuLaQRnUFko8hng0PzM
 kAFnFO2k/QFSeqHZbeKaQvMR9qqsP8d0h+r/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724389833; x=1724994633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wN8gOGozgTRHYua5nqn1vSL/fYA2BgScIc4AbKs4NtE=;
 b=cPfC+OYgYx7THI0a8H2DCeQTg+BIcweBnAWZCpgIcF0NaW4wmwBdIJYfa5pTNs2k5v
 GwcTkZqILP/EphEPStxWRgPpaVM6pn/mQ7TT2HylKlzWoH5FgEC56APuZ/vJeM6husev
 UKepCpvd+pXTmlWfpOFTIL1rcCtUdvGpij+HfPLHyVvGTk/iG8cQXrSB+mOaQjcoWmJq
 mwJvZIUYapADps5+DiGkm9+3Ezj8uQV4wWrGbYZ7rxyMghutWlrT9JVM2UQquC4JRWOp
 FR23kkx9X5zsKhteD9JbAbPN2X4NtP6kG63niXAgG1T0jx3uY6X26o79vo47tlCUpAxO
 dZUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtZv8fq3cQal0cA/F9rqebzzS520ia6PNIKw5AkplmdWHSkLYPclShEeQKsMJA0UGr8+LSJlZ+7lQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxub42fzgb3/qsz4nLEygQcfL0JEkasj/rwSYUH1xDvK2tlzxEJ
 GBjT1eLaWkAi9YTBaK6bsMZtfR/n3cjkP3la4gY2XqXGqvgUl/96PTp5k3IJJA==
X-Google-Smtp-Source: AGHT+IGg4uq6MI3y/JbYEI8jxZWGx3L02gsDpQuY7H9ymAL/QzcibgLlO8pq6VpSjkyB/mVihZCNtA==
X-Received: by 2002:a17:90a:fd82:b0:2d3:cbf8:9083 with SMTP id
 98e67ed59e1d1-2d646d37f30mr955978a91.26.1724389832777; 
 Thu, 22 Aug 2024 22:10:32 -0700 (PDT)
Received: from [192.168.0.105] ([103.163.98.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613b1f0d5sm2889947a91.55.2024.08.22.22.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 22:10:32 -0700 (PDT)
Message-ID: <776af05b-6855-4006-a3b7-804c5414cb41@chromium.org>
Date: Fri, 23 Aug 2024 10:40:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8186: Add svs node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-4-rohiagar@chromium.org>
 <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/08/24 9:36 PM, Nícolas F. R. A. Prado wrote:
> On Thu, Aug 22, 2024 at 06:46:50AM +0000, Rohit Agarwal wrote:
>> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
>>
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> index e27c69ec8bdd..a51f3d8ce745 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> @@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		svs: svs@1100b000 {
> There's already another node at address 1100b000:
>
> 		lvts: thermal-sensor@1100b000
>
> You should set the starting address of the SVS to 1100bc00 and decrease the
> iospace for lvts to avoid intersection. See this commit for a similar change on
> mt8195:
> https://lore.kernel.org/all/20231121125044.78642-21-angelogioacchino.delregno@collabora.com/
Sure. Will update this according to the reference.

Thanks,
Rohit.
