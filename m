Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6446397FF
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AAD10E17A;
	Sat, 26 Nov 2022 19:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023110E17A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:04:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id n1so4002932ljg.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TyzwzT+WwrFM+CjpxBOrQdYctaWDznQ/WphWUZdPKsE=;
 b=n3nGOfkJIEMRNu8dMrJylxK8dzsUovN1mC5QFI3zH5t+97fR/wumj6LMMVM6+4tkBe
 jOYlQ2hlJl1VLwtPTv2z/q7E8VW73XihCAsLWlEV4xiLcCS8pCJefjd8hAdUjwE8TLC/
 vAR6LBXalz/tV4Rs7X9J5Hql7rBYy+1Ii3ZLes5v8dEyGjcGwjBZwGQQdzeo3CvQno/Z
 9eyYfEVKFZGrk4HfsLkCxMx4gqq+0e9++MUWFFk+ldbahSEfDr377gar1g7a+h43BkoB
 KMsicWCZWwuZp3h15mwp0G9EbXTitYnqV11GImesDkm90fWU7kSSFi+IoGgDv6AxGco/
 HgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyzwzT+WwrFM+CjpxBOrQdYctaWDznQ/WphWUZdPKsE=;
 b=mslbRt2h5zE07qB8u0pk01b5OSgrd70xSk2gSq+2RKiFMS+pxnIjhzLYcziopMIF3F
 AdrSkJOFOfhlTZ8VWzBwglql1DpuTwzmwmV3FPm33r+LuNvrB3DX/igX1f8dUql+7b5A
 qdcjZU9qsfkpquOQF5t1gb2CIoi1asPLuC+KLCISsi0sCAhv6+nN3ORchw4+Sb99v+Kb
 4QX39WgfZomI2baBNWCIHClQNaPIl8QlLr0OHrZ4A8TPTTEZkQzxUSJClv9PlCg/Qxdw
 +rwOX86H9WY4MTVD3+XHGQRZxQ40hUVOKW6ULRFF+gNUzZfYJrQxjuBUP+B0gbP48GmK
 S47Q==
X-Gm-Message-State: ANoB5pn1Kkf5d15n0c9VAtHUQigm7OKn1/Gn7P5OYje5BVTCETU/vMvr
 ceCPh1tKSw/tF1wBz6HhvVLmMA==
X-Google-Smtp-Source: AA0mqf5hYsw/4JWIgSJ6mGIhPRCDka2xGpUjs6SqX0VHzgleUdx0I+5zjhfK7HRUzLuORnTrW//xiw==
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id
 i28-20020a2ea37c000000b0026e0093980dmr15258413ljn.488.1669489459446; 
 Sat, 26 Nov 2022 11:04:19 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 4-20020ac25f44000000b00492b494c4e8sm1002101lfz.298.2022.11.26.11.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:04:19 -0800 (PST)
Message-ID: <65824eed-d988-2de6-5fd1-380aec116d13@linaro.org>
Date: Sat, 26 Nov 2022 21:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sdm845: Add compat
 qcom,sdm845-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-18-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-18-bryan.odonoghue@linaro.org>
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
> Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm845 against the yaml documentation.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

