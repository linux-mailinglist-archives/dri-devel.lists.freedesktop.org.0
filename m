Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9885F38E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04C510E8B1;
	Thu, 22 Feb 2024 08:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vIp23bh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7598A10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:55:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-512be9194b7so4634867e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 00:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592133; x=1709196933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
 b=vIp23bh/oQHy02YuFE5we01egJAmOr2R6ULXBCABwq2/k3U6xOt7EzpthPEtGghs1Q
 5kHRI4MO6TkidoJS+NXDm5PPc1LOLuy9SEnaDppmGj9nAU9Zi2nBNsa3evhau9j52cbX
 O3B/0zqmS0gX+smrY8sUmLm9FaX5GzBkEvhd8Mz8YY5lALYVP4WiSBnfvjzXQM67ZlXO
 oR8Ay5XsATuR/TaVSseYaihzpK4WlMn1srhXnWmS6SQEymEQtqGaoEdzgHFy6EHoSgeC
 DYye00oyVLIFCJAXTrWIICcHAmxYo558UCGTkq1ysoF58olKKvBBsFAvSxicat09RJDa
 Ltog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592133; x=1709196933;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
 b=ZVoQ9Es0/+VsyNJKJ9v5VFIpYihyZneR9SVQZdXO3lEdmvFgYe/V++LNBj2dDn7WuY
 n0AJuwgn96opbEQw0jbLIlHWEzwevV8l5oqcUL0JjI2u66XE2aci3EP+3D2c2j/YR1yG
 oSUaUc+NYedhT3rDksUQMjlQIYEnwpGBz5EvebThhW2Sm4yhnTdq2mJ25qJBtPZw8a4o
 Ye7v0dmiNrPhIVmTyx6RcZ9ZtCIW/SIyG9soH6nYPeSpRfrzi5WFwb6KTrlRiH2lcLDd
 845ufyUB7MLqGvoRmpKK1JGt1sC8fZ7Xn29C3++X+BmJ+ntWniNGfdzXOjm6Pr1aqyf5
 /+9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXki3uc53DhAU67ayCm1ez59MTdnrsKAWGyKB9EOeDH0wHgAR99ucfMrJ3ejnJCG34qYJXB5j36e0Vwzq/yGqzCk19hP3K+Qs3aAsXeiMyz
X-Gm-Message-State: AOJu0YzFGo914BMUQwHZwDEBH7woDptbb5NnpLI63VZzYlgjS754Y112
 XNDcYxnjz57pwYlEoOprdLMKmg+cTP2LDd0KDzjv94tXvQ3HRFCp97FBj5UPuA0=
X-Google-Smtp-Source: AGHT+IEtIiogO1qg0DsIHuHZDJdmbDgFoql2wOjjQ0dHxEtTw/GBno7cWP1Jf8NhMK0pYXBLxrLr8w==
X-Received: by 2002:a05:6512:128b:b0:512:d8fa:a0f2 with SMTP id
 u11-20020a056512128b00b00512d8faa0f2mr1752378lfs.22.1708592133207; 
 Thu, 22 Feb 2024 00:55:33 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:55:32 -0800 (PST)
Message-ID: <dcbf0e04-0252-4cda-be1e-ee4c707017f7@linaro.org>
Date: Thu, 22 Feb 2024 09:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
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



On 2/22/24 00:19, Bjorn Andersson wrote:
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
> 
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
