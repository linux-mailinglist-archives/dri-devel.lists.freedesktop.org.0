Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93706397A0
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF9510E12F;
	Sat, 26 Nov 2022 18:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AD710E12F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:19:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5so5692039wmo.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0UpjTTETtcSExqVmm1nTB2R+TP2i/F9nDJvJKCWlEeQ=;
 b=jmpZk8cQQ0XIRmafKBM1hhNj7pmRKA+uirP3diyah5m5z5rFNQ3FggLgUBB5AxmjR4
 jG8XepfVssxY6aq+GeyKUat8leOEqUwcgx5UlPU6tfGFfcyRLIKrW9wSSTVZpNu97W8w
 rHjaaUQfHDp6EDRL1vuz3FXaoddRN/eo/llfF2ltdkZnAeES5ieOLj0XEwpHCqI3hh4y
 4vs2sLhltdlpXV21bALKRbH+u1UZfAn8XD83FL3gjq8ATv2vrbqR8daZCVuKcjLMKcfU
 XYjI6Ijz97d8PNX+HKWVmJnI9UaKvbjCVI+GU8ssH38sy1Fgzs80I7Fd4f86B6z7iYTJ
 pxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UpjTTETtcSExqVmm1nTB2R+TP2i/F9nDJvJKCWlEeQ=;
 b=SvsBdyXdoeEqmtRKKO5wFuwDhpZWtYhsyto/tKXWTRkGDPpcDAb/ol20sZR/FO/fXW
 yX2JKyw7uo34vVdmeObvbjxdaB7LV+huj2WBgSF/T4AoTyAVquqOlePFTlcVm5XYUOg7
 1IMOsf23nnSZ9EKXlQawVGgttxrYtZdLanhFh0RwZMYaiDd/BWUcK5017ea7W28EEJrh
 ZMYqpC0mPdvpVv9+JjivHWgpZ1KVO4AEZG197UC2U2Bf5ZB9niYIthaeVtFrXCScEV8J
 gMzPC6ETH1yqiKaEy3RnxY3cP86lHMoqaKCCv9gGr90lQFwMXM1dfjDnB7pTA+GJZ920
 U2bw==
X-Gm-Message-State: ANoB5pkSBBRCukZ0LPungOfYYZkDdURgCYoYZCHunMFD4RiGUukyb3EJ
 O7E/f1xOmD47RSFTHNK7QZg7TA==
X-Google-Smtp-Source: AA0mqf7DFQ52pc1pbxMSQa3Nosikz/19JF/XJr/nS+Jgk2bxsKO1XcBU4NIn87IbIMkHrB1/D5heCA==
X-Received: by 2002:a1c:7909:0:b0:3c6:f83e:d1b3 with SMTP id
 l9-20020a1c7909000000b003c6f83ed1b3mr19426534wme.190.1669486782495; 
 Sat, 26 Nov 2022 10:19:42 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 i17-20020adfe491000000b0022da3977ec5sm6412847wrm.113.2022.11.26.10.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:19:42 -0800 (PST)
Message-ID: <5f218d90-6582-9fa6-7cca-b243bb863f55@linaro.org>
Date: Sat, 26 Nov 2022 18:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 08/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-9-bryan.odonoghue@linaro.org>
 <b3a9f5e2-56ca-b112-e0f5-563404dcb05e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b3a9f5e2-56ca-b112-e0f5-563404dcb05e@linaro.org>
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
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/11/2022 14:46, Krzysztof Kozlowski wrote:
> 1. vdd->VDD

Hmm.

I honestly didn't pick that up from your previous comment but, np.

---
bod

