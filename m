Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A68B0EDF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7310E53F;
	Wed, 24 Apr 2024 15:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nvEn82Cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4D610E816
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:43:59 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a52223e004dso948566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713973438; x=1714578238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VNhQouszyO4G6x+Wog6/QhRAtYiInd0o+cfFBd5MkXo=;
 b=nvEn82Cu8yB/Id98Z4QPUr14et5MocxP1W8k/PwLOOesAbhK7vCMTey0PYA88jO3ph
 OCbTzZPuPgaNKO5UTOvgGt/6ARLFRBzJ10hANuvHJrxA0NFXzhz9RnyJsOyBdXIaGOlK
 CnwdRpF37LRx5wU0GdCzrRfESroj9hCw2fD6Llk6Sk3DIrd3CtfPQFN8crhDZdRIwqmW
 hfgyrXflIULpmQnJOIN496cjBPwvAbQoPa0orz3iAWwhMN7/JAWYawzaJ4tTWRYyIHTH
 3/iEbocCCsmzHNwUic5l+cEGBRbhaCbMeniXfJB9zlBUoe1whmLzvzd+JEW6ZsmrXAkj
 cGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713973438; x=1714578238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VNhQouszyO4G6x+Wog6/QhRAtYiInd0o+cfFBd5MkXo=;
 b=NlS74uexghPff2OqvntRZYx+n2CxgUVLxpemzHnheA+G+Dia7wI07gjKRcLYhL5w9P
 dUrUnMLxZ8z9yCuEpDeDf9YTCdE98gIEiJGP2AXytJVkkm3w3oPcOf0+AMtF4FwP3MWt
 HvGauIPO0FsPPBOdNoiYATYZZLdBaN+fYB6wrYcY9R3BWL1ZFTab6TPK+3AAJruL72bB
 7kAkEZNJvCku5psFA1sjC4j8i9oGZnU/BAHs7TDEwpUPS9YRONopGK4FrACzQVIIGtLo
 6tjeQkQdAx4Psqw7hLv4m2PfDIU/PACk1Em2e/xM0iNpLIhyavbqT46g9XGERwj0ICAP
 gGcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4p0/V2ZvNfHAC39A10mFlw/wdkH/qyVz3/E4Y59ReUBaYez1klBJxp+Z87R5KbY0KDUUyYSO2CaXJKgUCsy0AnzGcBH0vANAnrVbaLgXn
X-Gm-Message-State: AOJu0YyygFEac9OihtEEDY1gW8MdwR1fSpxdJhriMENexDe1sLWGPhKW
 v1DGti01PTv67iBnvmiHXxTmVx9cNXhyitRXdQ++f+/xha+IQNlt0pxWhJJuUCA=
X-Google-Smtp-Source: AGHT+IGbXGrpnubvU3fB+twJxorCJaNpth47KfqOPWrUQ5JuHE+TeN75cbmD+qlTh6lLqPPbiQHdkA==
X-Received: by 2002:a17:906:a996:b0:a58:8662:1f06 with SMTP id
 jr22-20020a170906a99600b00a5886621f06mr2463128ejb.56.1713973437807; 
 Wed, 24 Apr 2024 08:43:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a170906090900b00a55b05c4598sm4459714ejd.133.2024.04.24.08.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 08:43:57 -0700 (PDT)
Message-ID: <aad0e811-28ff-4bbc-b5fa-691701d35f01@linaro.org>
Date: Wed, 24 Apr 2024 16:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dt-bindings: arm: qcom: Add AYN Odin 2
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-9-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240424-ayn-odin2-initial-v1-9-e0aa05c991fd@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> This documents AYN Odin 2 which is a gaming handheld by AYN based on
> the QCS8550 SoC.
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 090fc5fda9b0..8e991f2bd9d8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1003,6 +1003,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - ayn,odin2
>                 - qcom,qcs8550-aim300-aiot
>             - const: qcom,qcs8550-aim300
>             - const: qcom,qcs8550
> 

Doesn't apply to -next

Patch failed at 0009 dt-bindings: arm: qcom: Add AYN Odin 2
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: Documentation/devicetree/bindings/arm/qcom.yaml:1003
error: Documentation/devicetree/bindings/arm/qcom.yaml: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

