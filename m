Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013056C6581
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C485210E47B;
	Thu, 23 Mar 2023 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529110E47B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:45:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ek18so84509828edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679568335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tq6QV0T2QuMiBeTwNKrfy9XVXbGyETq6GZV8IjifkTY=;
 b=W9iJQ1zvbslESUn+HDNxQz7mfG2hpVUOfLaO37SWS2w3Kq50+j3PYxbScBYZWJHW4e
 VovBoKyOkfS+eqFXLWt+TQvERf56bxEBe4UF+m1LZ1/n8hy2zepEEYRN55y1ZT2QcExB
 eETCYi2v7beKRXrFw4PJHYr+t5QICazSg0RM/HWYaFXFj4MyEKLuBqdjsRmGwDmot2JM
 YFnzzQ20Xr8wFaLWPR8b8DeHgiyIP4hR5GlKiEe9r/Esughw121jlKq6p2/PnR/Qr8YJ
 DCUplY223oj5jCW4RXjOXdT095JeIr9oocUiO+JT49Ul5K4AdGwrAFOMQIYB+dmgnqyl
 wgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679568335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tq6QV0T2QuMiBeTwNKrfy9XVXbGyETq6GZV8IjifkTY=;
 b=qeWfKxBkY5HJNP3BdsF88/VFCOJ+EX3mWSd2yLMka6SlNnosaklLOp/5RfSbus+E+q
 enW1QiFGnUYB+MpcrL11dcX5B1BElHkiOKTTLDlwPfBamAAkMbwvPOlu0Lhq3fP3izPn
 rSz2iJRzGW4tAORei1B06WvtkG1SqCduXlAOaIeJRrgN+AAqMBs1hZ2vZugb98ujRCcg
 PnyihOOL3UgN/iy/MsDgcu2gwMc4U4Q55beQNGuPTuBMjVJ2eEYnQsfWVaL3HdnKsDnL
 lQ5XuadpQc5bf4civTbVk1MxTu7OFI1wfQ/zaONzs8qVKockwLq8CczhZwLts4HR939T
 eijA==
X-Gm-Message-State: AO0yUKUy0fGSC7r64z6BhvGEMfVxfX+kQWBR/i2CENiELUiRdZf1dydZ
 sQkZy5K0BW1Rye/+9ezZtfZjww==
X-Google-Smtp-Source: AK7set98AbYVaYnQxkE1U3xGqebYCRyFOaoDLZK/hwFB2qETYdzrLfp9F17dgw77BhG0tpLkRvJu4Q==
X-Received: by 2002:a17:906:480c:b0:931:73d:4cc3 with SMTP id
 w12-20020a170906480c00b00931073d4cc3mr8721654ejq.11.1679568335113; 
 Thu, 23 Mar 2023 03:45:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170906b30700b0092f500c5936sm8487181ejz.201.2023.03.23.03.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:45:34 -0700 (PDT)
Message-ID: <64bed73e-5bfc-577b-dae3-0bed4afd02c8@linaro.org>
Date: Thu, 23 Mar 2023 11:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/8] dt-bindings: mfd: qcom,spmi-pmic: document pm8450 pmic
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 11:25, Neil Armstrong wrote:
> Add a compatible for PM8450, commonly found with SM8450.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Already sent:
https://lore.kernel.org/linux-arm-msm/20230306112129.3687744-1-dmitry.baryshkov@linaro.org/


Best regards,
Krzysztof

