Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91B73C9DF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4081910E0E8;
	Sat, 24 Jun 2023 09:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CAB10E0E8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:10:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso15643666b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597816; x=1690189816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
 b=jc1Auh5tqvnIULQo0SinoF4pptEI9CJAL3uA1jKLnlNGiTWufhWrhahGAE+h32L1xx
 hCwdO7h3Vmv1b34q5rAjJbBMrkdAJ8jeyZmjvO+/pFLJkS4CYb8abNyKpQxPGX5ienRW
 PIJMAwGBAxWfsdY4eyp40JyXmD5mVqTuA7AjloZ2sTj1+fTYOyn35xzG2+XOl0lDTdlS
 QPyfGp/MBw3L4SDMqlLRDP9AJH7so7ie6Vil1QYZyTe6pApxQk8F1CZiR60hS7V1esSW
 za+FT3/7dbx3jXeTCm+xsyV8y0gAot6PpCd97/OoF2RdV9kXALgQsFE8fatD+p/d2bEU
 4+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597816; x=1690189816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
 b=NtcDiRY6QUYTZI2KAz77A5HyRlHGQBBUc+/2IfXK3G5aeo7ydSvI3iS9SUK28BeCE7
 BeS+hbz4ubIAIsvkTlofuZlF5NVyogYYw7HKysRdER0S3Pjujmk6WYQp2I/iceobbe+I
 P0kQebTP39nwghGJkikXX3iMTwdPqg37kfB860y/UB8BeWt60yMp7MkU0s1ANMWa/W0G
 GT0ym0qUTS0IDDBU0+zWLkm1mnMGEffcl3xomlN3iFwjCKB5XWrdQUB4EzK3k2TsJ7o4
 FXYf9qshGJKp8KUpQko7GsCvXJ2C06Cm4wg4GIrtvl/4U7VqlHxr6iPo6BE/D0IJ9SmH
 TiAg==
X-Gm-Message-State: AC+VfDwBkWsyADp4gD09LVsmA9kEtb/d8nF8J/EjfE2LyoVRcEKrqca4
 B8QoZcYKb/ZWPPgPMwPIRK3Q+w==
X-Google-Smtp-Source: ACHHUZ4pqNge7JwaJVBPQcyWNxciyTTsdI3G9ALVxmbefnkvykz7tn8SBKrUteVDofWtt9OCuMQg/g==
X-Received: by 2002:a17:907:7628:b0:98e:a54:42e3 with SMTP id
 jy8-20020a170907762800b0098e0a5442e3mr173662ejc.54.1687597816650; 
 Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b0051a4361f3efsm455606edt.61.2023.06.24.02.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Message-ID: <0aefd7ef-a877-2501-1db9-d2c14c6ffdb8@linaro.org>
Date: Sat, 24 Jun 2023 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/15] dt-bindings: clock: qcom,dispcc-sm6125: Allow
 power-domains property
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
 <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
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
> On SM6125 the dispcc block is gated behind VDDCX: allow this domain to
> be configured.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 5 +++++
>  1 file changed, 5 insertions(+)



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

