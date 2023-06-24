Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FB73CA30
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBEF10E18F;
	Sat, 24 Jun 2023 09:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F51B10E18D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:31:23 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-98bcc533490so169226666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687599081; x=1690191081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
 b=gc9/259HB7eikMHCQoNfzHBy/dycbEU/NjOFFnU8PbxsvPGyfNqoAKoAttafP2LK3K
 o8T887iu1nUWr8WHUlorPc2GkgFZqr90iFjwHQhPBsi2sF1sSxGB52kj4CmKlPDCq8BM
 9LbSM1ZwP1UK8Rl3mgeAq+IsMhGGArCApiHtotYKsX4U4up0ZEe9AnGqGORSAJmafl5M
 bpyubo+oVuadRCq3PFmiBKS/XJP3UBqd8FG+l06PHSS6AjgDQvzgQ7NXRzAqxLt8Hqy8
 JzWDz4sBifpXB99IaCL4BLgAR8765gFH3HZmDw32SGCMnXXJ3TcvvNyXRHLH6L50/stk
 fFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687599081; x=1690191081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
 b=jNnPVzf3mup3PpzdoLAL1Zon5GphH86dh9Q/nu8PZ0xMgpWT0ExgkJgxr7Ao5UHcVN
 yeXoAMITac4D3zxpfyN8i6/0KPhZrs5efgM7glyub14ddfqH1cvGwOW9IBYS0Z6h4COV
 XRRhns32PzZd0uijncbOEeOefsCps2YIUujGghtLW8gNcccv8Vum9l5okjMHSLyUBzqW
 lLnQf/rCV8014O2jtaX3+wZrO4/ZIoXwLlhBeQhkVzfmcaP3jxoVTchFDtiDIz1WX1DM
 llm5Izcfcl1Jq426jI7k3915j23ZTZBPsCr0AmihwbQKNjf/cOmDHosQ9axhzUh02y7k
 fbFQ==
X-Gm-Message-State: AC+VfDzdZKhGTnzZt/KrBew9vnlVSvzjf1u7O4KNQwQzl4L5hOTSYBKw
 Ay7xvb99omzdt9rYHeZV2YPR6g==
X-Google-Smtp-Source: ACHHUZ7LC+7hcCDvBte5xgktiTToiRBYnv91b8Sj+cbLeoDMK97jXgfSs6kpS0Rkuj/xi6REicP9TQ==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id
 wg2-20020a17090705c200b0097455a2cb0bmr21160376ejb.55.1687599081475; 
 Sat, 24 Jun 2023 02:31:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a170906229a00b00986bf50fe7asm699359eja.60.2023.06.24.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:31:20 -0700 (PDT)
Message-ID: <0747247e-22ac-f798-6d95-9cd14fb24cb1@linaro.org>
Date: Sat, 24 Jun 2023 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/15] dt-bindings: display/msm: Add SM6125 MDSS
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document the SM6125 MDSS.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

