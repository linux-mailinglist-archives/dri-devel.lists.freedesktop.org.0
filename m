Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11E6B9FF7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 20:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D7C10E1DA;
	Tue, 14 Mar 2023 19:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EE810E1DA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 19:48:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x13so19350840edd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678823283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZD3zckyQZWvplvlXVnSPBziJb37x7ZxPChIy7trN/1Q=;
 b=wSzEvcxGyX83038ZycV44iXNEslzvCK7PBf6/7j7g+/tooB7tbc/w8eWp68nHrKdAe
 6WXRS/NNHoGomifjp+7ofiJSRgNq05PF3hLP8PXje8SonemrCFKs+3ksRSdMfLpU9Lb4
 rCGC2ddJGApH9UzXqdHm9p3PfYFmEO/qM7qY/bVlPzxfIoD5L8635I41eW5afCcFKaRP
 ONnBBWBPBw8WtGbxztVW8bJyQrY7gZs3CWqcrGOfs/ySUVPh5Jjno0cFpgLMuMtJ1TX4
 d0uI89yh4u8FQU1ieeqpFYIs0I+w1fPtHGJrNEDNCfHVmCsrzv9FErZtGlIFkATjlhrA
 vtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678823283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZD3zckyQZWvplvlXVnSPBziJb37x7ZxPChIy7trN/1Q=;
 b=XkhY83/28R+WLRYZf8EWqWEMEGXYWEBDNzNWzNh0tOTPZL3D5DZGwwhG+j5/xA4puA
 yVuJ5ZddHZR5IJKHvcrdMSH2OKDM1zALErEOuG0k1P7Oh+Mi5n+9ZlKfZBjv9PothpL1
 IKDzeVuqFXJazJnoX4F1gyV+HA60J6xPVXX3moXCcCVkcaVxhEijRLer1Tp+NBfhiUBw
 9fqF7PgX6DTWQEpCEHIXQsK6P2uqcW/SuRP2p2kAD1O3aSCR6YQFcxP9suh1hfTDf/PG
 QICoqjNmDBqcJP4EdN640HjSLdJPcHf+a3T9yopaFZASnHk7B5CqCeDK8m4Z7dpVa2Kc
 Wj5A==
X-Gm-Message-State: AO0yUKUtlxAl89PTl8r/DmJyQoGtwnpCCEQAYk+idUxc2tbg8BIOvF7U
 B/Ii6sg0LUMkW5k6dNRXz99wRQ==
X-Google-Smtp-Source: AK7set+0TR8DrYzzVV9JTZ2by1wDIYSgRuV+phFSkAc8QfOiSVLRDyV2soyHd4jmn/m3rMYYGoA2pA==
X-Received: by 2002:aa7:de96:0:b0:4fa:ac78:7f2a with SMTP id
 j22-20020aa7de96000000b004faac787f2amr207216edv.41.1678823283655; 
 Tue, 14 Mar 2023 12:48:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af?
 ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170906709500b009268d94c9dasm1519530ejk.152.2023.03.14.12.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 12:48:03 -0700 (PDT)
Message-ID: <84e70393-9137-faa0-0e55-f9d89ab5cafb@linaro.org>
Date: Tue, 14 Mar 2023 20:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add compatible for
 Starry 2081101QFH032011-53G
Content-Language: en-US
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com
References: <20230314085034.6380-1-zhouruihai@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314085034.6380-1-zhouruihai@huaqin.corp-partner.google.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 09:50, Ruihai Zhou wrote:
> The STARRY 2081101QFH032011-53G is a 10.1" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

