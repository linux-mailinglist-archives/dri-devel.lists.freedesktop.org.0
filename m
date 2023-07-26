Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8D7634F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 13:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5706A10E45D;
	Wed, 26 Jul 2023 11:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63110E463
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:30:01 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5221e487e08so6498385a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690370999; x=1690975799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
 b=T5Oly7FluqjUGaa3lMgD/oPQ2J+nYChOgoHh0jYspY5uXfnE5MYT68UsCB3SjoGnFQ
 FppOWSh1MMLtLlGVIhLDk80CzltGf8n0bY7LbZRLYLaCBZDOqOZ1HtmVYMQnHzseWQzX
 v4w1WbDM/bozmL701yPTBbu6Ixc2TBHPJdHGhfqc6T9O1T/Qa1N43ddjF25ap/TZnj7y
 5hk3yJUQlIFxnRWT4FNF242L13jbB7r1iEGB5w+kTDi/te5hlCGLKFxTkNjC23DSJdfA
 6gRlLeuyAOh7mpG+mGiCeuxaWY71tVSERdRQ3u6jpvurjUHVpuwxU1y8CbGt9pDVVYYi
 QpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690370999; x=1690975799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
 b=YueyhoMGXjwetiVPHhx+ewukaQcjeV6cE1KFB3qX917q5lcVSV8qRgER7A7obsy3Mj
 GdIsaB5vRH9rnSfw1ecOrHCAHeIKJw5OWqZI981gYyyu00WdDSIf6N/KgA00qF8c3rQ1
 LoZxska96OOQ1zH3WhqtuEKnpO9tAzZkzrXHfq/qy1LyZhmTRJiyQBIPuiZRwpdyZS2M
 NmQb9m3L0mtqlCC6kb89x/3iTOkSrYAkEcQyZJ+SmL/uPne/d3Aj9XhEQyRLc8BjYd0R
 VF71fokPnFVjJ0QInlVQ3WYNIZZRsSd2mzNIOzCn55RqxhKFPnfv7nvL1OOAMi/iH+lk
 J2Ow==
X-Gm-Message-State: ABy/qLaGkdc5hcIhW2PVZHlJiS6RXfWzai+jVOfMlfh6IjSv1VF/kwVo
 xPrW9ZtoRwXoRDypDKfOWtoueA==
X-Google-Smtp-Source: APBJJlGhsZALbMTZop+J6WRH+YKEaAOscUT56bRny+XG/qT9JQFYAWirvKrTQSzu9bEF7f9tZf78gw==
X-Received: by 2002:aa7:dcca:0:b0:522:4de8:f3e2 with SMTP id
 w10-20020aa7dcca000000b005224de8f3e2mr1563220edu.22.1690370999558; 
 Wed, 26 Jul 2023 04:29:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 b9-20020aa7c6c9000000b0051d9ee1c9d3sm8686862eds.84.2023.07.26.04.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 04:29:58 -0700 (PDT)
Message-ID: <3ef4f91f-0afd-0246-4f8a-210aedb0b94c@linaro.org>
Date: Wed, 26 Jul 2023 13:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash
 memory region as reserved
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
 <20230713165238.2814849-2-amit.pundir@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713165238.2814849-2-amit.pundir@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/07/2023 18:52, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---

I think your commit msg misses describing the actual problem, impact to
users and finally cc-stable.

Best regards,
Krzysztof

