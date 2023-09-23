Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D117AC43D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6410E071;
	Sat, 23 Sep 2023 18:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55B910E071
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:02:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50308217223so6183541e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492135; x=1696096935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2+w/hIMeCdP5XObJabV3a0a034s6znbmDpY5rWOZME=;
 b=XRIc8EKj/B1mYxnsKmg6wBeCyZzUxBf9v2kB4QAlksQmEbqXV+jpJ309XeO5n7D/fS
 BETKfrS4nsh0A63h0n/94z3wEMNs3ojWbqjof2eXv08+u19oaudL5vjmaW3qQgTCzcR3
 fkAmo0vC+XKSopvfMxkoF5kOI8jQ3PHCuxHz/GDYh84A/v1HklxyBV515h5TzRP5OkgW
 xaRj6oYcR7OpDIiCFUgUg7raBtjs3WXub749AeribsfFj9obbM9GqHb5Wj3V0LeMbSJC
 wwjD77DoiEibiCO0gxyF5WqMNa25gOx6HCwV70vK30giELGx+Ozr79j3FsWfPB+VWnLE
 OmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492135; x=1696096935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2+w/hIMeCdP5XObJabV3a0a034s6znbmDpY5rWOZME=;
 b=gwBafHqHuUamaqrCv8FmXVnPaqt3/43r3lH9BYH8J4397XtH1Li/QXmWvG8r17sITP
 ehSOdDEM9ZfL3IYP8L9jba6z3DPMEc2+84B6M7NUiECv937vrtVycWb/xGbXzw348eRU
 3qoj1iILNl07/qp+NBnOdZKpSJsGslFDUb5TrJaIWrv+KZGQzmN7e/cvl1RBV/oPKfx1
 d6nqJEyPBOhz4Ikqalrz9Vs0+sS/mLOHtk5iM70dGnTZmxH2RCghJeLuoF6XFk+P0ltW
 9qmyOTFiclhkzSiQAAav7P7+Ob+XWhSE0WFSpbDE0osrquO9oBKXoQHFHdxY3BIT6vQW
 dYEw==
X-Gm-Message-State: AOJu0YwZc268BbQTEWPlBSgInZ0Vq64uehY7eBRwL21Fnm01Aqb0ulMG
 5+cpsOB6r51jqGN2OCCLuUwtnA==
X-Google-Smtp-Source: AGHT+IE9QFZHI8Y6so7/mo4x5KEZ3eDde8p0i5eSPhIKMUzOwbXushpkR+BjNRjB7kVP3w1OZaAbjA==
X-Received: by 2002:a05:6512:3415:b0:503:3756:9ff1 with SMTP id
 i21-20020a056512341500b0050337569ff1mr2078800lfr.49.1695492134868; 
 Sat, 23 Sep 2023 11:02:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 cb9-20020a0564020b6900b00533ec6c617asm132069edb.54.2023.09.23.11.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:02:14 -0700 (PDT)
Message-ID: <797fc698-54d2-4848-3a4d-43ca631eb96d@linaro.org>
Date: Sat, 23 Sep 2023 20:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-4-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-4-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> GCE has specific purpose registers, abbreviated as SPR.
> Client can us SPR to store data or programs.
> 
> In CMDQ driver, it allows client to STORE or LOAD data into SPR.
> The value stored in SPR will be cleared after reset GCE HW thread.
> 
> There are 4 SPR (register index 0 - 3) in every GCE HW thread.
> SPR is thread-independent and HW secure protected.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  include/linux/soc/mediatek/mtk-cmdq.h | 5 +++++

There is no user of this... Why do you add unused defines?

Best regards,
Krzysztof

