Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A16397CD
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C2210E15A;
	Sat, 26 Nov 2022 18:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0910E159
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r12so11564984lfp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=er4AsguWaCVLCPaCC8qHTQyTFYIRisL3iymu/a9XzeQ=;
 b=ma5RLRn8Rh9XM0IxVM5st+yHs8WdgVUKclfDsiDkq7eCkuATcELlG4VRGdzLo6sm2G
 uFtosykVKUoP4njrClBqVsgTvm7z3pLioXR3CcH5ru/XfsSOG1REtZCqH0rHUIkgFXnk
 Tem5scUEc4VNmR+aXB6CUikIFneyL8TlYNccGnZaf140Cpi1tZKxmK+tLc4ReHPUo/nl
 NlIIjv5t+Cxbm+JJP+K9XMCESmvTeLSyjxLGRbOm0/EM6sO0gaCUEKjfCpWCb0mvvq6Q
 qgKuvev5v5fgxlKJvqQhSJY5DVYkEqPqqQwXxoGnAOIsCXNQ8iJIrIMlOiBZakoNyTxc
 h/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=er4AsguWaCVLCPaCC8qHTQyTFYIRisL3iymu/a9XzeQ=;
 b=Ury58kr4IY6UrLiFSvIU/nAGd1b9AAfAxpcknZfW8uikvdJdU/DRNDGEDWX4nlWb3C
 NiuLYOI7WypOYfMtlqZgaZZj9k6cKt1muRxOg1TLHtkmVlQe5qGqefgY5jKQ2alxMFHP
 DwaklVZ3ZWxlareUk6hKKbW0v68kIIjmH/mjZYxUHWzbTJpozPWY4byxJh1fHeJPlszd
 W7YM7QiGjQHKciIiaXBZ6HYhlIUVloXPmPJ1xfqIrQySMdnY8XN1gs3MeYSG+cnBCfXB
 J0exZwWdnlrPZSI2iOdlUreHoXQRa48EbJH8cMIXGX017Y+WUq7u7RICH0GR5F8EzC6r
 DWpg==
X-Gm-Message-State: ANoB5plngJUkRNTaa035YHZu1VfxW7/AlyPnihEF4cxd/sbdulu53hch
 QM3T3KzjRf0WRO8zpFv/tf6qBg==
X-Google-Smtp-Source: AA0mqf7iPaJzB/3B4H5X+5nP1/A2zhsLLWNvT+/MERr3nL41JIjU/Ao9sKFPloBHutd/jbipKRPIJQ==
X-Received: by 2002:ac2:4216:0:b0:4b4:a5b5:1a04 with SMTP id
 y22-20020ac24216000000b004b4a5b51a04mr14515913lfh.142.1669489148415; 
 Sat, 26 Nov 2022 10:59:08 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 x41-20020a2ea9a9000000b0027781448499sm732306ljq.85.2022.11.26.10.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:59:08 -0800 (PST)
Message-ID: <cbc3b4a9-e199-3a72-e4d8-e65bfa9c7e43@linaro.org>
Date: Sat, 26 Nov 2022 20:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 10/18] ARM: dts: qcom: msm8974: Add compat
 qcom,msm8974-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-11-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-11-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8974 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

