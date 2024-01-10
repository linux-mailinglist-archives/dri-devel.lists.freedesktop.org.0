Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB31829F75
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893C10E610;
	Wed, 10 Jan 2024 17:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A0810E610
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 17:42:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e766937ddso5058098e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704908535; x=1705513335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
 b=Hf0ZOpEuincHgfZ4XWYQ8iHUBWOqBPmY3XWQxiBoFAR27IMDzs1hqfX9bvIZiALZIr
 ANieaaa11bp4rwA9mIiCFn823tyVRPukNDwCyKMHcgzwBgSmNAhclO5Ud53d6cXKIUzc
 uXFT+IYHXp68Yshw3qbVqFiViuL+b9jAaZP7jTd0H6Ad6DbiUyhqvQYC+nd8bM8zopUG
 Yv9EUkWo1Esxol+z/B6hjp//NXohEPvfAZa1AlRi3C03Or1g71zM6Z8TcLMD/rSQfOml
 Oq2b/vuhMoMp6kPuAFOXQkh/F2b45LatDraoVk4QuYaVaPUZXMq+lTLqS86TB0zPIMrk
 qDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704908535; x=1705513335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
 b=McKWY7lP9XksYF/UYnHOUaIR65POhXZgBqzOjMdo3gpC63ig4pX82tHH5D6RqKBFRB
 Na20y1hX/CItF7a3pHqm7QtncfHkRxZPq+SoxWti2ZNgA17ecFzRpVcu00Ym+HxjzF45
 X6MhWbbp07rp7QDQJ99WDBnSnI5Q+q3uS/Y2csiY7Tdob4aRn31O9/CSNiCUbO4hyfIh
 BUE4DM3XLwkrNU5QY0yJXtfEeRfhYiJXjDwJob3zOxqpyh86TZQFCXaiB5BMetj5kNQC
 R8P5qZybjiwq8deLUKc7pqlPkGKdSsUlkPG7LoDmguDqlAGdO4qRbLaphI+mXukYWONm
 LVhQ==
X-Gm-Message-State: AOJu0YxiIClExAA+jhMWMMblOJLArXc+iLDoe7wMfpK6Hd4+JMoXtpl2
 O1LWj0RbRCkPjQdC7lDMGjm3NAS45TbgTw==
X-Google-Smtp-Source: AGHT+IHT1prjATADHPcha+6hRVeVajAEKA9n2RxWsP2L6hY0yEyK/iXNVOuhwOgvmCbXJi+mqMHvqw==
X-Received: by 2002:a05:6512:128c:b0:50e:30a8:4c8e with SMTP id
 u12-20020a056512128c00b0050e30a84c8emr682347lfs.43.1704908535603; 
 Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Message-ID: <2d200f5f-37a5-408d-9ca9-3137ec717647@linaro.org>
Date: Wed, 10 Jan 2024 18:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/10/24 16:14, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PM6150L isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
