Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD97218F2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 19:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7D10E092;
	Sun,  4 Jun 2023 17:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E920310E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 17:57:40 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-977c89c47bdso227754266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685901457; x=1688493457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ls45VQQIUyzoH7noNjdXrCaXMXOXQFDg/zHramtLqdM=;
 b=PvmReiyAK7QRh5JN2sHHbdpCwbBfOriS3FNHDYsIkTUaaqQ/L8+FihSC4I2Wz5VIjm
 McYw/UsoCBp8WiMimkT7v+mK/I7Whr0XS7PwrqsSZvRQfv6iNkEvfWmLvCfHCCSiPLP+
 Qlb04qpALQJlQ1XY0y416zyf6SNFc21DjT73r9fSNULXwApEWk+gqsgZrEHlLY50VRvI
 FSsZHJmjSA6oxiTtv0ezbmj3MMIFO8p3PQysQX9paW6TlY+JVR0rCRd6tj9W/kPvkcSI
 gt1ZSAj+4jHMlrgIcXzL8EkZZu5ANo7IuK4VNpzWz+bsH/GXiTQubRMRUiB13kuoSYIl
 WXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685901457; x=1688493457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ls45VQQIUyzoH7noNjdXrCaXMXOXQFDg/zHramtLqdM=;
 b=Lff3Nz5L0R4aeXfMMUQMJzeXF/7kTH8+Y+L+yR+PhnpNyV4fQo6ViYHq05EufYlFY1
 68mmVnQrdGEuqgN6EsbWrZKHZVa2uvtCOWBvyKQU4tYBZh2vC9eTTj6PlIgTO7p9LboC
 ROfhLmxLDe1dmaZsgiDkXDwwkONOPwy2FFFsqM6bMEU5cNd/9XS5Kzd6d80zLbJfstUH
 K7DQXjxgpY1pk3+4kVbkeO7LG6mj7mzhlloFbzJTGN+zH2xUq4gUiPn1RnJGZ7ttw33J
 3Mde7em1lA1n9D9z6YE7VwLM8BLn2vIdtyh7JVLQAFj02pmdIHphB7v/9SlvPw2FDVv9
 k6Fg==
X-Gm-Message-State: AC+VfDztJCWnpfEjgUti4DnyilIpXDG1KCCW2Xuysm/c15xPL9k6JiB2
 3GkxWlcXrWltyJ4c85ElMqs0hQ==
X-Google-Smtp-Source: ACHHUZ7ZTbEOAIM4tY91C54D0FYjxaN4oqFmOFXsAHhex4sytDP6QvuKaoBFbxk10faqOQdXZp6Xaw==
X-Received: by 2002:a17:906:fe45:b0:96f:f046:9a92 with SMTP id
 wz5-20020a170906fe4500b0096ff0469a92mr4579876ejb.37.1685901457150; 
 Sun, 04 Jun 2023 10:57:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 bj21-20020a170906b05500b009661484e84esm3294252ejb.191.2023.06.04.10.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 10:57:36 -0700 (PDT)
Message-ID: <f33106d5-ea0c-131c-f615-a8df4da58990@linaro.org>
Date: Sun, 4 Jun 2023 19:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-3-998b4d2f7dd1@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-3-998b4d2f7dd1@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 09:46, Konrad Dybcio wrote:
> SC7180, SM6350 and SM6375 use a rather similar hw setup for DPU, with
> the main exception being that the last one requires an additional
> throttle clock.
> 
> It is not well understood yet, but failing to toggle it on makes the
> display hardware stall and not output any frames.
> 
> Document SM6350 and SM6375 DPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

