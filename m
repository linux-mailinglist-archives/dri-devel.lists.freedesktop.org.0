Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B436828E2B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 20:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26610E009;
	Tue,  9 Jan 2024 19:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B55910E009
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 19:52:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e4f71288bso10939555e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704829951; x=1705434751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H8e7BIQ+0Uh9OOAYCo0/STP+HvJzJz6KC9y4zPITais=;
 b=vE+SERoVqeln4qPeVEmeXJOkMr90XNil67FFbP01WFz8sZ7aNFJ2s37WFvado26Xhs
 ga3aaZ46nw1B1SkV2We03wmE3jwyXp7Tv2Ksw+iJfOdMtPmDs48JvOSRfjvvPFxcQr8t
 J7sNPg3onxhTSbzJ0cDWnG7jwBQQNrj5oO5r2xbwlXz5NElBSxmawM1N6hC62rfRkE7j
 f67MQF+tZIPRegeXfm1ntx03mIEDJ9FXRrv5D21b+RlbqJVSvPt+9m24q2NaO2WdgLNy
 XyByGPUO9Yrp6swkjygNOf8F90AZQcW/BkG1uVVgDAm5jl5HpYOepYNy2jHKyHO2yDHL
 lyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704829951; x=1705434751;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H8e7BIQ+0Uh9OOAYCo0/STP+HvJzJz6KC9y4zPITais=;
 b=e7muQC7CmIO23PKsu634Y8GtAi+WH8bZu0N+D1xmheWvdp4w44AZGuRKpfHUbPtnVE
 fbjHfyqe7rU39wGxwY83uDDkr3uQhr4OmCXhGBv+JB1VzW9v0EknKuL9P5yvrjI6ia3q
 CpG7w+qeSYS+O4kPAjgxYPWAGI+sNNihNo1/7Uahs0UaWwEG3KTm5L35NAljAlUZMbzc
 IMbZWn+nQMhpkCOSNVBpikaYoUmu9ke2HJn9wbaOVWa2H+DPED5QChy8xXdPgV7YqQ8E
 nUioirBwjUCj7wKVU7MCEikgB8WYzmDsi/BRBN8xCPYoDjeegTIN88CSBmf8NFrbRGiG
 3gTA==
X-Gm-Message-State: AOJu0YzWmdlmA5mVGEzOY4UoPaPiJVqMdbvRoSBX6FVNcE/LhGXIVzJp
 XMobymF16QU/zhV9R/7GXZZ7eAuIwS3RXA==
X-Google-Smtp-Source: AGHT+IHmaMSsPHOeRys+SN1gCkDvhPPnnU4xw5om3zeZ1uZJmbZ6bUKv8I/7qxajZHyxo4zm+o/bmQ==
X-Received: by 2002:a05:600c:511e:b0:40e:5320:2582 with SMTP id
 o30-20020a05600c511e00b0040e53202582mr212877wms.107.1704829951588; 
 Tue, 09 Jan 2024 11:52:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6801000000b00336be33649csm3193258wru.9.2024.01.09.11.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 11:52:30 -0800 (PST)
Message-ID: <f1710a31-6729-4a97-afcb-518cb99b9346@linaro.org>
Date: Tue, 9 Jan 2024 20:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-2-afd@ti.com>
 <11e3afae-76a7-4ebb-82ac-3dca040710dc@linaro.org>
 <d0c242ef-bb8f-49d9-bbb0-7922db2c322a@ti.com>
 <d584255f-87ee-48a7-869d-e2a0b40a52b4@linaro.org>
 <61b0c6c7-e5ad-4cbf-a020-230d96d43d3e@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <61b0c6c7-e5ad-4cbf-a020-230d96d43d3e@ti.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2024 20:33, Andrew Davis wrote:
> On 1/9/24 1:17 PM, Krzysztof Kozlowski wrote:
>> On 09/01/2024 20:04, Andrew Davis wrote:
>>> On 1/9/24 12:59 PM, Krzysztof Kozlowski wrote:
>>>> On 09/01/2024 18:19, Andrew Davis wrote:
>>>>> This binding will be used for GPUs starting from Series6 (Rogue)
>>>>> and later. A different binding document will describe Series5.
>>>>> With that the name "img,powervr" is too generic, rename to
>>>>> "img,powervr-rogue" to avoid confusion.
>>>>>
>>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>>>> Reviewed-by: Frank Binns <frank.binns@imgtec.com>
>>>>> ---
>>>>
>>>> Why do you send new version while we still talk about previous?
>>>>
>>>> Please implement feedback from v1 (and this is v2, so next is v3) or
>>>> keep discussing.
>>>>
>>>
>>> I agreed with everything you said in the last round (RFC v2) and
>>> made all requested changes. Did I miss something in this version?
>>
>> The recommendation is that naming of the file matches generic compatible
>> and your file has only one generic compatible. Therefore I don't
>> understand why you claimed there are multiple compatibles.
>>
> 
> I said "There are (or will be) multiple compatible strings", the rest

OK.

> are on the way. So I didn't want to make this file less generic when
> other bindings are almost ready.
> 
> Frank, can you help here, I'm assuming you have "img,img-bxs" and
> "img,img-8xe" bindings staged for upstreaming somewhere; you'll be
> putting those in this same file, right?
> 

That's fine then.

Best regards,
Krzysztof

