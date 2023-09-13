Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A079E024
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5E810E314;
	Wed, 13 Sep 2023 06:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5172D10E314
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 06:39:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-402d0eda361so75210145e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694587187; x=1695191987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
 b=wscP30SYDKdqedf21K01XTkFo37CddmnCV6OzSzyzn9rRxWQlcs8sJm+7tLHKqHFKz
 PRWDb8mwsJvNm8yjsjiO0UUlQf2JUGE2gM3c8+3acBG05XG2ft5fpr1d9JkJbK0sKugb
 paU3DrzzSRp9OVRSn3blMrzhTvIN9LeVdVaR2tMRjt8ItYvLlOEjGTkmh/GNm/F5cgpi
 ABAP7WC5u6DqmYrUBdIKXx8ZLmN8cF1gTV2uSf8ZEI3Y6lws4RtaoEKZPfap7/Ailqx3
 9IIfuuamGPR+KFZZwGqfKXXKRWC9VwQgPwxSVRyO1gGge5Ib4tvC51IB3VrY0MfQG9g9
 Aemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694587187; x=1695191987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ui5s5Cw3xC0m/jtp0PhZyzY/A5ADu0VxxFvthfKrY8=;
 b=CMTztElm/OR51YHqIxXOZfdHwquzDWMJfICFFTfV1pMY3v/SnyjrcCRb/nZrVkXYmo
 w0VtWjI9Ni91gInT3whtr2yCOJHkCXGTiVWQxQDIIzlpJ9I8ZRruMq6ECXq5aO3xmdc1
 tFAcImU65MmuO8omn4eHWKpIsCJRb6Js7giw9h1bRak28CvWJZQnNbzlVqMebexZ2/oH
 zmz+FmM7rnqfLiYD9VB8cdhtK6iiRpI4XbXk0CAIteGCR9LaXefJFfvDl18MglvHKAtS
 5ARTET2UObID8InMMg3NQkx6F6A7waK1apm/j0b1K23zmx/MVweK6pG5AWL1iSWpm4ZU
 ZkBA==
X-Gm-Message-State: AOJu0YxZCqfttdw0oo+PPpgOM5MT/mfvaziKbU6435vtlQHyGSydy5BG
 rQJafKUu9LGN5S41Po6otq5F8w==
X-Google-Smtp-Source: AGHT+IHpyTen6GH7mcHEV/WC6XNcsNT7DRMaLYEEzm02K25SO6aZuYQOgCFKRJV53h8rKbJzYw1Rxg==
X-Received: by 2002:adf:d08d:0:b0:313:f94f:3b15 with SMTP id
 y13-20020adfd08d000000b00313f94f3b15mr1260361wrh.2.1694587187637; 
 Tue, 12 Sep 2023 23:39:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d598f000000b0031fba0a746bsm3589496wri.9.2023.09.12.23.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 23:39:46 -0700 (PDT)
Message-ID: <85a43c63-9e79-09c3-ac3e-6974547655e0@linaro.org>
Date: Wed, 13 Sep 2023 08:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
 <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
 <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2023 04:08, Moudy Ho (何宗原) wrote:

>> This does not make any sense and such mess at v5 is confusing.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> 
> Apologize for the confusion caused by the improper separation of
> patches.
> This occurred because I misunderstood the new warning message
> "DT_SPLIT_BINDING_PATCH: DT binding docs and includes shoulde be a
> separate patch" that I received after running 'checkpatch.pl'.

Yes, separate patch. Patch.

Best regards,
Krzysztof

