Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEF9586C7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 14:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388210E761;
	Tue, 20 Aug 2024 12:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="F33okWmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059B710E761
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 12:18:51 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-710bdddb95cso3144258b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 05:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724156330; x=1724761130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dxAcxGclIuOwfMb41R48bF4I8HWomP5VfYX9t0ZCnsA=;
 b=F33okWmkmZ6zSINpiLdwnHaDpYo67YwOe5oU27FzK/ZXhcG6AzJOr1/jHmtFqTnCE+
 b2gPPS80+aMJ2fMCMqQ1o/Q00f4bQCIrOZJEm4MB83UZB2prkyP5R2Ja3oWDZTGn/5IE
 1pG3+D/bCbVgNu0uoga0t8s+63CgD2mrSPXIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724156330; x=1724761130;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxAcxGclIuOwfMb41R48bF4I8HWomP5VfYX9t0ZCnsA=;
 b=bcw/17z+ljyagCsVq2LtsboKy04E54qsM7PIrkQ7dhb3DutLuXYD7+IZRtn/etxipF
 29uOrsH/tglxOXfzjHmkWsvkmhKyN8QIB4X4/OWA1fal/xgWmgR0s19A+3l9mFsY8vtu
 CZjb45yY07eEMGdcYVlUo/OLVIzDlwhn/FbFt0y46KW62RbiNrrIVwthFrsj5lXXtIdh
 YTk/2dsVo7om6vYpNchTw9jfgmZ0yrT8/S/IwNNRmRe1hqrsif9kSw16rogdav0UPSL9
 EMhwFRQxdMz3zOw0FuWuA0wyG6tiStpHE2HlGiMEdagXgqA15FuyQI0vYnnFoLlQrYAf
 ucTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNUQXmh6N2oe5TpcGcmCwegPnHHDxxHFUOPzt0TNzY/CGY3drt/ymxv/LVIJrM2OZvjmgfZidR1/IWrT5bbMMS9gRlFsEbsShxYXqYF+j1
X-Gm-Message-State: AOJu0YzdUO5CCCRUC0zkOOZP2sTdItK4JqmWf4qxCifnHD7SbnMC2tz2
 QdF64ksu+A1HHVIp3QUiYu1IjOy+gfhTZLUZihMV9BH+w2Q9rwTTchRwsYoHPw==
X-Google-Smtp-Source: AGHT+IEaftbPHnk5gj6LEhcatbaYAbzJyPyHa/VXh1Qov58HvRrDUW/6ESy2CXTKfuohmz6Oo+xhoQ==
X-Received: by 2002:a05:6a20:6f8a:b0:1c0:eba5:e192 with SMTP id
 adf61e73a8af0-1c904fb8e21mr14179130637.27.1724156330370; 
 Tue, 20 Aug 2024 05:18:50 -0700 (PDT)
Received: from ?IPV6:2401:4900:5611:cde:9119:bcc9:db94:3510?
 ([2401:4900:5611:cde:9119:bcc9:db94:3510])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b6365998sm9309672a12.80.2024.08.20.05.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 05:18:49 -0700 (PDT)
Message-ID: <1899ea6f-b734-4748-aa00-d7049d553994@chromium.org>
Date: Tue, 20 Aug 2024 17:48:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240820080659.2136906-1-rohiagar@chromium.org>
 <20240820080659.2136906-2-rohiagar@chromium.org>
 <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/08/24 4:40 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 08:06:57AM +0000, Rohit Agarwal wrote:
>> Add power domain binding to the mediatek DPI controller.
> Why? Who needs it? Why all devices suddenly have it (IOW, why is it not
> constrained anyhow per variant)?
>
Ok, my intent was to introduce only for this particular variant.
Let me constrain it to this particular compatible.

Thanks,
Rohit.
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
>>   1 file changed, 3 insertions(+)
> Best regards,
> Krzysztof
>
