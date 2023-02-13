Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C9694DB3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 18:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50410E0D3;
	Mon, 13 Feb 2023 17:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE2910E644
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 17:07:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a2so12981518wrd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2InQIExYmP5Jgqnc5AiUW3/d2IV4ctPWBKAcygB36v4=;
 b=D21IBKd5duKNwSZD2lHnVwMweGSumv4jTyAqy03/XwI8B796iqCUO8aE1pFXpyk6Aa
 qJXtcld4Li+Z8PzdSbHDoYR28unCTtepqvBlN9UlvIsQYFQQ5/QkhvsC9S9qIdwcJm2I
 lF6vLSFEbHmIOXFlg7FtYJUZwXq1wMgDs3hU2uvAU20qBQC1NFyG9uwoDmX8lndaM7WS
 3wmSDXdctqtwL/rupvBCfI6uphuzDTCcK6aP234JVsfOu2AI6BDslLDXIlzFomJgh+Ra
 RrU32Jm4vUV0Mt3vMYRpvc68T+eBqtFIpTwNoOXqRAJrkPnqiVMXmfPvTmmQTBaMfYcQ
 +bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2InQIExYmP5Jgqnc5AiUW3/d2IV4ctPWBKAcygB36v4=;
 b=DvR5aFxTeUcHRDub9eGLpSUQFB181zxmQRtJqygJpPNCaInu3Fvi115smYlVR8I9dl
 WRdoKYGGdCSbniyI6bwQF4019CsDiT4uVjiK2HL96ArLahHMI8ob0/iPKz0cPzSLUiHj
 YUYcJqO3zhcZhOvF0okQloI+GoAvSwZFFtMn3gRnz1isPnYFmtKpQ2fg4ft2YWclPt83
 PmG9NCRVou5jF3t/ZX5zsIaDPFpmKqtuYmWLnMUZK4ecBmkus6Jz2623FPUMdxZ2vVqZ
 MLRfPQwDMC+9MfTIS6sL93/eEXjVGLdLLfkYpBrbO03C1raW+l0cjPyMov5Ztee427cJ
 fTgA==
X-Gm-Message-State: AO0yUKU6+2m0GFqJcsZY7A3Cei1pmBcQ0Pz8vjpFPVnVCeF2uLR5F4Gp
 vFeZNSohd5G8FbnjSSBaCTlGcw==
X-Google-Smtp-Source: AK7set8f8iVV15Q5bQ7Ofj85okM/P5EZ0M3GD/i8DQmT3Fhlf9NzOVveTl8eioF4PukoueqHH8l2DA==
X-Received: by 2002:a05:6000:1369:b0:2c5:4c32:92c5 with SMTP id
 q9-20020a056000136900b002c54c3292c5mr8649659wrz.25.1676308059660; 
 Mon, 13 Feb 2023 09:07:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b00241fab5a296sm11030147wro.40.2023.02.13.09.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:07:39 -0800 (PST)
Message-ID: <9c53ccd6-ea38-82bf-2284-d606fb2293f2@linaro.org>
Date: Mon, 13 Feb 2023 18:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: sitronix, st7701: Add
 Elida KD50T048A Panel
To: Maya Matuszczyk <maccraft123mc@gmail.com>, heiko@sntech.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230213153816.213526-1-maccraft123mc@gmail.com>
 <20230213153816.213526-2-maccraft123mc@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213153816.213526-2-maccraft123mc@gmail.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 16:38, Maya Matuszczyk wrote:
> Add compatible for 854x480 Elida KD50T048A panel, found in Odroid Go Super
> and Odroid Go Ultra
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

