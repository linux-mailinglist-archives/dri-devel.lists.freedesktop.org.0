Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6566BD52
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF1E10E3D9;
	Mon, 16 Jan 2023 11:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791610E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:56:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id tz11so3128798ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
 b=KlD4i9oGhDhDd3KNbQdH9lF+HOJ/AgqpYZwD/CxAPxWpNrMus2+Dd2lWHHX3PACOVi
 uSA9AT1Bv5i4od2dOHIZNXmidte7lLnV+aIivtunzTzfpwhhTm86p8W2vIYI0kAQhNGM
 gp3i31Q6G1aYgAa4RgRmZwYD1sBAHTD0L3Z87z/nb8dbRcZkZPnopllFyhXV922NYUbO
 ZwH+lB/4eNI4X/lX/Ndg4g3hsBTN1McmPXf4InhrdQib+HszshPdXhAKCkxl6vCKMyUm
 rCz9TiCePsv7GDdMqwhwivB6bP8QvinljsQpYHaqKHwV2XgByrDS/u1LtIlbtWGi6pGq
 tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
 b=y7nZkJFi0de11uj9o2E1WKn/14OefALMD54bkqO6scxEFD9Wn06u/N2EOZV74CCZ+O
 TBLOTrfR2Ssh5YJ+B2JYyfQTYBzk6eAUuwvq1bxQQc9ZITf4VESlQOhvhotFnG2XAM0P
 6vBLI+Qmo4E3JtlD5pBTRH0NHT0QDRLhWsK0meeOTIcRtNr1Xsn/Yec2vXeio4XbUBvn
 SH1LJOMpduZODmdSsGThDWlr85w+D4DC04NpUjMXg2aQ1gOcual/HQC9FZUKU9nv/4Gk
 wFCPBYJneJRDrwAs4HRuZL08aX0S+fVTb++HgNvpPvuB47ilVbeF+HcOiURzEenwBTtb
 boPg==
X-Gm-Message-State: AFqh2kps6i9pstH4UgKyrnNFU/XIIwnst2lYMrieGwX7ms0LahObl9Ol
 nAGMsP9S/g3A5rJCnm/VvoBvbw==
X-Google-Smtp-Source: AMrXdXtPorQ/tIX0rgBIsJ9j1MJAYlH9dZoCXDU0vp+XdYqCRbho82nhjJOkeWYy5DpmT4mQb8oQCQ==
X-Received: by 2002:a17:906:7193:b0:870:d9a:9ebb with SMTP id
 h19-20020a170906719300b008700d9a9ebbmr4434354ejk.38.1673870170238; 
 Mon, 16 Jan 2023 03:56:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ad7-20020a170907258700b0084bfd0a117bsm11906977ejc.16.2023.01.16.03.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 03:56:09 -0800 (PST)
Message-ID: <6312bc6d-684b-1b01-411c-4c316e754edf@linaro.org>
Date: Mon, 16 Jan 2023 12:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 12:51, Konrad Dybcio wrote:
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

