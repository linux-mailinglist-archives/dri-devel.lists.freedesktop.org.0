Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890B7D4BDA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85E10E309;
	Tue, 24 Oct 2023 09:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605710E309
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:21:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso33413285e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698139303; x=1698744103;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHLz8PPjT5hmB2yN6aVrR9CV+tu/9PbMfn39Dru7aRI=;
 b=eGEYwy/VfwEWCmZdWd5f81gw1FVAP8WVSYE3kaY4loVzFPVrwbl7wsIjaVofrg6vxB
 pFkwJOKulDs2eOaDa844U8FbiFEZWPg1DkNq9c6lRoyrydlUvbPsp1PkrVctx3GKbnVx
 uEXWdWBH/H2xA1L54fOzowUdE/RiYXtwK5S2bO8AquJvrkX/jByHD/FmupNRFp4vFh3k
 Xd0/DppDvbFxzIQq00jEabcF87o60jIcD14VK94jIAGEzX0hOK1ZOgnvUeHXnCs6V72k
 hEVMKShAykPhYzZamJVXKjuXE0yQ0j80fzue6NzXyIf3HiLeJh73HHslgBJSuFt37Q7u
 F1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698139303; x=1698744103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHLz8PPjT5hmB2yN6aVrR9CV+tu/9PbMfn39Dru7aRI=;
 b=NcTc6gRJePaOLsAD7rLBBE55GL2PvTlSUfqzK8CrXGmKnvFSJyn+t89mpBTEfdG07u
 J4b1GQ0k/pdDDCPRLZ1Zima1Xvl5D38T6gP61ibyuyABumtF1EE7xvPMDxQM6jlnOCgC
 EnVRCqfgyqKZABVy1XhOO9HRXHHfmeH+F2lJPXHNJOTp8jVZE/vceQRPPIP+VdsjoKmK
 Vjcfp2VUX4X/dn86ee7bUhcsiL34RA0PIbQYem0a1rRWY2tHupp0DRIwFKHY8n+hR6cv
 asIoXyCeGX1o0X7naWXss/ceQydDwfGpzJbqQO3x1lohTXy+H+E3QMD4kBH6JjhD1B00
 sL5g==
X-Gm-Message-State: AOJu0YzR2uH8zYPK+JWD1V7tsgM5sZ9g3CPYLcs0qn4eNOMDdBYOjdRo
 bK7PEuut7Wbp9VRkdvhWuu7lhw==
X-Google-Smtp-Source: AGHT+IGmTE7S8Bn22t6axk51MnY+srHjcF3lXhxJM8aBvQIoNaSPW1U6i8mvZVzOD+mypNBfwpseVw==
X-Received: by 2002:a05:600c:3b99:b0:407:5ad0:ab5b with SMTP id
 n25-20020a05600c3b9900b004075ad0ab5bmr9181918wms.8.1698139303217; 
 Tue, 24 Oct 2023 02:21:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c46d300b0040836519dd9sm11523045wmo.25.2023.10.24.02.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 02:21:42 -0700 (PDT)
Message-ID: <ec7c16ef-5878-488c-af7e-10138783f726@baylibre.com>
Date: Tue, 24 Oct 2023 11:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] dt-bindings: pwm: add power-domains property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
 <20231023-oppose-tamper-36d526ece102@spud>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-oppose-tamper-36d526ece102@spud>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Conor

On 23/10/2023 19:38, Conor Dooley wrote:
> Yo,
> 
> On Mon, Oct 23, 2023 at 04:40:11PM +0200, Alexandre Mergnat wrote:
>> According to the Mediatek datasheet, the display PWM block has a power
>> domain.
> 
> Datasheet for which soc? The mt8173? Is it valid for all devices in this
> binding?

I can't verify for other SoC. Then, I fix the commit message
and remove the example changes.

> 
> Cheers,
> Conor.
> 
>>

..snip..

>> -- 
>> 2.25.1
>>

-- 
Regards,
Alexandre
