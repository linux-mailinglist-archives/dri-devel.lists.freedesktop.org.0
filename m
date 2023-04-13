Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5EF6E084E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1123210EA4C;
	Thu, 13 Apr 2023 07:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3210EA4C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:55:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id q23so25746958ejz.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681372507; x=1683964507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2dDPTo7pAbw38LoN+sVNvkK7XTKAxdrh79eGZjH2+lY=;
 b=Ejrj4R/7xT2a4RYe1Y5T3Rn5KiIwqcfdkD9P5InRpKjPemJx6sQLujgw+qPNi3G70W
 7XUu2f7xAgln3LNKY1dqSmJ0KqJKJbC3KIimV5WiO7DMdnEqfmkMWiAUy54XEtg+/qgs
 9QhWihYI1B4LlFadoA4BVAkmwgIxchPvHsLvktExzF9YwiAxfnEGcWBrCrkhqgEA1qSh
 W7B8HlC6bwb6Ih39FJMODjSVaNwsxPI5CwCyWvcmXmQFdAaSleuPyywY0X7HiMv2PpIh
 0kUGBrv5ZJ49p/UiX6ChfmcATbGl7boAb8dElXFBITzgP7oZWMkC1Ymh/RfgcvWijP2z
 PnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681372507; x=1683964507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2dDPTo7pAbw38LoN+sVNvkK7XTKAxdrh79eGZjH2+lY=;
 b=P0J8rUCVDnNFlp2ZHAgliWOpR06ojSwPQxgEho08KUp5d3pf8eI5bAFJgK5zqWC7pX
 Szb0HKw36ZhAWnurbOmJgxb/c12+VayWnwZ28csD8cu9jEET0dD69YPh+kndu6OpNe5D
 QwspJaN0sNPfxWI6fDL84rfoWo0VYs6ebY/u1fpXuClawVQp/Ks9o3O4iByk21xQ6bLx
 YoRSFNzGsYb4or+BtuM2A5YxJdXbgH/C+42NbgvzGwpBuY7qW2UMKaK8QlPVvDFHG210
 dXY/DgIn2e3x3NWFT4gYLxhmtPwvMBl7YrfbQ2mwE7IaXxf1tz1GKqgNJyNVxrdC+B+U
 aXRA==
X-Gm-Message-State: AAQBX9ebYzMShrHm44ITRcEuz6dZv1TgvMljq0VD5WWplX6isH6DsqPC
 YMWxVTVzzBdQ2IJCu9XoTAxMlmCIFXDaHiQ1KFA=
X-Google-Smtp-Source: AKy350ae1oc34Oyo141xL/55tTpu3GLXnkGlh4IkaGPDqJ6dAQ+jgJtHGhDS5ZdMRwOG6ZGU7zZGNQ==
X-Received: by 2002:a17:907:d306:b0:94d:7e31:e338 with SMTP id
 vg6-20020a170907d30600b0094d7e31e338mr1730607ejc.52.1681372506860; 
 Thu, 13 Apr 2023 00:55:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7?
 ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
 by smtp.gmail.com with ESMTPSA id
 dn19-20020a17090794d300b0094a6a7a56c0sm602189ejc.18.2023.04.13.00.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 00:55:06 -0700 (PDT)
Message-ID: <003e1ff0-591f-3959-ccf9-9fa84cbcc4c4@linaro.org>
Date: Thu, 13 Apr 2023 09:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
References: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
 <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
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
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 06:06, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

