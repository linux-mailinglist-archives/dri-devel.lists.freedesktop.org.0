Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1C7634EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 13:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A502210E461;
	Wed, 26 Jul 2023 11:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E17710E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:29:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51ff0e3d8c1so9455335a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690370966; x=1690975766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/+qs7g1gY1JEPTRBZFLaASNIU4sFMJxs/L0tYvhMjY=;
 b=LMOTOExY/Ce2QY2Gt8va7AB1wsxRDCK59KI0IIXoXQ4umPJtpsNtQIaFxj0I79btPg
 /w+x3huP2IS7bkIy/8oyamDSwNo9DhuMf67w8IufA1znp8QofXt6EMKTUXFFaa28hWYv
 KrzNlThQEt3QLwH4NSd9cgucLag+9SvS1hr6112LjOrCQ7VrQGK62TSNo5amOQSf8Kt1
 PBBbIkJ3xci+fMPCxnswDal15zmHGeQsEgn6OEQOlhDaNTGJ/jpneDx+ZpQghYccJO4c
 rNnAfwE6jshbRiJNmXGjXYE1YWdyvGXIkkkTOYprxM6KGaJ7wTFhALdvJAUaTcJ9/+K4
 oj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690370966; x=1690975766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/+qs7g1gY1JEPTRBZFLaASNIU4sFMJxs/L0tYvhMjY=;
 b=iDlr6OUpgIz+yO3EMyW1DaWTM4mlekSZJy+Wl2pAW3uCmktvCQFM7OMVnGvxdzklx4
 nCLyAU6iQkyCQamRpsxfOnTsY105zo4sUb2svLtnuxgReJKfE164DXKld5+Iu32JMM6Z
 hqO84dj+uuYn0azznUbir02ElQnKBbrMZn75jrDfuhCXPDKMbBye4E6lMSkDGvwq3R+9
 i3aYMTR2gChNBYBTBc+zgnzFq25RF/FAH4g3oSFSWCTAi2bzWVkk49i6kmMOcspjW6Z0
 IBK2xV6f62ptOUu4H8R4fc1TZ0Enoyg+POb3lFoqvSwUXMqWBb3Ts8vgwIVBdwDx42AP
 z79Q==
X-Gm-Message-State: ABy/qLZDgsNSkeZuZ8zgVcO+pScN5lyK1Bj8cqJKOpCQdn7XaoYucapQ
 8r0ZYdsCZF7DdkMvmmf2Wv7hLg==
X-Google-Smtp-Source: APBJJlFXaiNUU2g8AEtAdBi80dzeE4xS5unNsLEWeVyMmrC1zd+jJ/UWtOksRH2QuqpxDrlxqiew1A==
X-Received: by 2002:aa7:d9c9:0:b0:522:4d16:752 with SMTP id
 v9-20020aa7d9c9000000b005224d160752mr1298800eds.21.1690370965884; 
 Wed, 26 Jul 2023 04:29:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a056402114800b0051dd16f7e50sm8626244edw.44.2023.07.26.04.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 04:29:25 -0700 (PDT)
Message-ID: <43b4b62d-edea-c571-4f80-b0d4be78e527@linaro.org>
Date: Wed, 26 Jul 2023 13:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] dt-bindings: display/msm: mdss-common: add
 memory-region property
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713165238.2814849-1-amit.pundir@linaro.org>
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
> Add and document the reserved memory region property in the
> mdss-common schema.
> 
> For now (sdm845-db845c), it points to a framebuffer memory
> region reserved by the bootloader for splash screen.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

