Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2B654080
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7A710E15A;
	Thu, 22 Dec 2022 11:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF7F10E51D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:57:48 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q2so1662210ljp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDC5xCKfkDa/LgM6w3krjqzwgZw98EUeXEhxRPwXjAY=;
 b=HySmqpo4d05os5Aqbd0yTRiPgZA40Rqz86blpJG8oF9ARciWS77jnz/uqGywbxaXU1
 FYobQi+TsRrrMzIKDoBM7lf1ePuixuJFkYsDuHMyMXLT4YE/6rLJMVnT/ngjp72CaoI4
 HVgkUnuCKbrnTvxVwiZjZIKlTXdCFCqQRNvHFqvWLhu8fnkDLED3d97oMJn518g45wpH
 4T0ptVE5Kg9pYO2UCGe6DafpKb9/12fb93EoWAbpHtVuvDb54KJ+xk3m/1DwRtTu5efd
 QMh3qOkjBS7yeIdboDA23WwrDVSRLXVYI9k4iyKyjFXGGeS32W8AL3xK7LL6XnvMjow3
 aqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDC5xCKfkDa/LgM6w3krjqzwgZw98EUeXEhxRPwXjAY=;
 b=JOZuHF3hOBJjiMr0UWc6Mc1OdyEadO4j6BKm2NkqFQ12mJOR5+e8xVPVPnZTAQh/Xk
 z5JsvJahceeLxg2kvtcH4MFbzy+vecnAWBK83Cs9cJ/GoBC8hXUorA9zlGaYOWy1kX8v
 NgVvPtESkEHKfbWsaXbrVAVWr6Q/kbJyORAUDagiirA6cFNog7wFzZCB5RGAOv6Z8cdm
 Xsz5PP4P7ATxS5JlOgieDZ6Eo7hFPC+5NG/XA2ond6MtgwcRGp1KCL8ccUECtEb9X6zn
 HI72lQrhHpqKZoO9p8du3KFFvKbc4kKOBC35E042xZ7CS1CCY9g3eZ7b/uC10qR/t8YS
 3lXA==
X-Gm-Message-State: AFqh2kpKRoqZZ0fGh6NNWCAsxniv4WCotcwOpg/7PLVDj+QBYxiWCLYH
 JUc+oz3hl0A2bXoGJY9GqZU2xQ==
X-Google-Smtp-Source: AMrXdXuDLZCR1aKFnCjSyyj+uMWF/mFNPNJjQEVkOD6wR4u7x2Pirb7Qf2RMA8Cwez0TSlfJOHFB+g==
X-Received: by 2002:a2e:a26c:0:b0:277:4a25:7ccd with SMTP id
 k12-20020a2ea26c000000b002774a257ccdmr1461554ljm.53.1671710266657; 
 Thu, 22 Dec 2022 03:57:46 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 17-20020a2eb951000000b002777a07f48esm29267ljs.12.2022.12.22.03.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:57:46 -0800 (PST)
Message-ID: <0193f5fd-6f79-3c56-d16f-465119d3d3db@linaro.org>
Date: Thu, 22 Dec 2022 12:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/21] dt-bindings: display/msm: Update MDSS dsi compat
 strings
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-11-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-11-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Same concerns about bisectability.

Best regards,
Krzysztof

