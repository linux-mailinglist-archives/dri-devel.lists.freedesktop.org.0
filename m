Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F564E984
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 11:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E3A10E0F9;
	Fri, 16 Dec 2022 10:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4010E0F9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 10:35:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g7so2832365lfv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 02:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0yptAXedl2pzYbpHJGSCo7EhOMQi3T8iPKefbr2uqc=;
 b=qsiypkVP61ohjDcde8f5g/4SQh/oAJNoScwEgP3Rv8EeRjzz9+LMiDNN88Rt5oJNM0
 Rsv2S/TYMvb7YC6gcAFiXX709u+bItlhyfEpxsPnDs8PXX1OpaH1a2CHRSfs/4cHFHTZ
 3QID1o8OYaZc/PfohyOziC4jICM0EwA8BWIPuUH8EK9c5ld3o/1Jvs68zgRaHcqHa6Sf
 2M3nFxfgbHc/Rdi6R5upHP9zU7M7zTv9n2xsThIeHTkMd2mj42eS0YxRtRpu46NlokY7
 djgBKq39E4l7clMVYpXk2GQ/Mtil5DUdc+zeUkXeDBB9btZLZIj8kpv/o9YimzB/JJSD
 R2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0yptAXedl2pzYbpHJGSCo7EhOMQi3T8iPKefbr2uqc=;
 b=OnemdIGPZsJwht0Z1iszK8zccD9o3aVQsJfp5QmgVjEjmbPfEBCoyT4AZ+8yf6wxmf
 xAUP5rQmNJsIZZMGUVWXqTjc6SfD9B0tHi2gTiMleVIjapBzaLtqiQ+Pcqqy/8hTRFZ8
 9HzZx6E3uT8WJ3jSGI6/nISVjtR6WTZBHUCTMzyns+51y4ks6vs1nH0Mu2lTDbVOkQ7f
 JM6HtMRIQI6ap1/p1iybIew1bFUxKf0hlj1Ffeu0WA5Kn+T9nh47VBAb2ZuYh+V8gtLg
 /e9gaS8cuyKIlbgUvwHmoaQN8WboTocYBAa+QVlCCYb85Ndm3+7Uh21X9MpN+K6eB7xD
 BgcQ==
X-Gm-Message-State: ANoB5pmGbVT34REohXDai/yGLcPPjDdq/AmxSq1RpfU9IGR50VU7lPiO
 CpFbnyvbgDQ1S4jAM4DVDNk0gQ==
X-Google-Smtp-Source: AA0mqf7KujWonci3YuJEjvtd7JyFGVm/ZvKiman8Ue42tzcnB4UCGM+zIc8G0kwsrw0GqeKQOgs+ww==
X-Received: by 2002:a05:6512:3b22:b0:4b6:fae9:c9bc with SMTP id
 f34-20020a0565123b2200b004b6fae9c9bcmr5601272lfv.4.1671186909644; 
 Fri, 16 Dec 2022 02:35:09 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a056512325300b004b577877286sm185959lfr.50.2022.12.16.02.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 02:35:09 -0800 (PST)
Message-ID: <f04febfd-8f0f-f349-3407-e0c3a07c9648@linaro.org>
Date: Fri, 16 Dec 2022 11:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Content-Language: en-US
To: Christophe Branchereau <cbranchereau@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221214114142.204041-1-cbranchereau@gmail.com>
 <20221214114142.204041-3-cbranchereau@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214114142.204041-3-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 12:41, Christophe Branchereau wrote:
> From: Paul Cercueil <paul@crapouillou.net>
> 
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> new file mode 100644
> index 000000000000..6c099eb63434
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD panel
> +
> +description: |
> +  The panel must obey the rules for a SPI slave device as specified in
> +  spi/spi-controller.yaml

Drop such description - it's obvious from referencing the schema below.
No need to open-write it in each binding. OTOH, you could describe here
the hardware more.

With adjusted description:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

