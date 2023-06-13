Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19C72EAB4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E9910E3D9;
	Tue, 13 Jun 2023 18:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153C10E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:19:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977d55ac17bso1029823766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686680344; x=1689272344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Si+/shvcqkKwITehsz3jlcMUh+hjsQ3DO0PDy+Kywt8=;
 b=EersYtXU6f0gNYm8ge0XLuS++K+5LXpzYjQ8c1p/Am+DEGDIfsoGeXhM+HnG7Z+Q1a
 OLGkaRUuReTRokMWoSfQTm0+cuDbM0jK2wy58LvfMXf6415/CDVrc0FxHnjpL3VUJ9CJ
 pmo8L0AjhzACJ9aUKZSTX4nH9eZIPaDk07niXhg+879+9DglHPcibGAQCfIKiPJ+VLj7
 pQ7rHDdvG+a2/+YEVU8vIKnsj14Q+w3TcVs3MqWQsKtYoL4YeOCGRseAWTyRci658bsr
 1i2k0TzfB49uZ+PYQ3ITrfC3AEMFaPJ8fSh7Zd685KrIwPTTCmi5yC5PMk/JVb9mbQzJ
 X+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686680344; x=1689272344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Si+/shvcqkKwITehsz3jlcMUh+hjsQ3DO0PDy+Kywt8=;
 b=i1Y8chsNEXbEzQPvzFXLMxY3oqy5cO4VW4lluaw6xP0DSWGvPmWyZr/JgZcUScXbly
 3J4WleFtnVAKT82jpJxRs2mR6yVUC51FfOiusiq7SBFnrjnoUGjQSI7z9OQnjEx+msbw
 uYs8YcpdjOfKW286Nn8Wa9q0uyGimF1focGPjQCNqxnn1Utdt2PGg5+CM3zlLR2vkBeU
 NjXh2f+zTM0qXsxqy4j2wETUTY/sxl7bdPbG0Qyd84R+AVGCiBlFrng5FZQBECp4QvQN
 2toaLrZ7jAeTmPZ3WzfiLEqOXWbMlslnfhx2J6Sq2qZKehPwINGEPYmNGQ3+J/elY1q4
 ot3Q==
X-Gm-Message-State: AC+VfDwhPSrhCAte5Gy22Il8Vzfrqj2lyJ+8BtDcal7kJupvDFnMzxx4
 xWBqa+goqVU0ZhaY+7ozJaXzbQ==
X-Google-Smtp-Source: ACHHUZ4kVz0Z2WClJ/sNF3p1W8w4qbF9ieyg0usT2Tb34YdPcuyYzGAMkhmYVkR6qKHAKM2296Y8vA==
X-Received: by 2002:a17:907:9449:b0:97d:ee82:920a with SMTP id
 dl9-20020a170907944900b0097dee82920amr10869194ejc.74.1686680343677; 
 Tue, 13 Jun 2023 11:19:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 jt5-20020a170906dfc500b0097462d8dc04sm6993158ejc.100.2023.06.13.11.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 11:19:03 -0700 (PDT)
Message-ID: <44b6cbbf-1fbf-cf2c-a035-5a7c6dd504de@linaro.org>
Date: Tue, 13 Jun 2023 20:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 1/2] dt-bindings: display: ti, am65x-dss: Add am625 dss
 compatible
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230608163734.2578-1-a-bhatia1@ti.com>
 <20230608163734.2578-2-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608163734.2578-2-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 18:37, Aradhya Bhatia wrote:
> The DSS controller on TI's AM625 SoC is an update from that on TI's
> AM65X SoC. The former has an additional OLDI TX on its first video port
> that helps output cloned video or WUXGA (1920x1200@60fps) resolution
> video output over a dual-link mode to reduce the required OLDI clock
> output.
> 
> The second video port is same from AM65x DSS and it outputs DPI video
> data. It can support 2K resolutions @ 60fps, independently.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

