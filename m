Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D797C4083
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF3210E186;
	Tue, 10 Oct 2023 20:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E6010E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 20:01:47 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c3c661f1a8so54722821fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696968106; x=1697572906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXX99+sRerDKMbWnSh/67eMjmbNfBWKGv387Abrjh24=;
 b=hXGbk3MjHn4Udbteg/9sG0w5rynJ2vqrxg9FoiNHDhuZYMYJFnnAC1gJtadNW4OCbl
 ikSp+bKWKAtt8llZwaietxWGM5Au12kK6fo81M5CR+9u90HiRm9ri4iRI7CiMQwfmqaA
 yDzTgb9m2AQ7R9O+j7lsK/PPAzfsH21Ajb9NDDg09SlR5D7rEDEr8aw0VlUAuWZcH93M
 ZH/9sK1vPMbfcfmrVGLpXHV4UcXgUsAb78RNDdzsyDisBSX+tMcEl+B79KM8+hGzoxoQ
 8qYSSfm796Q5vwIzHGl9he3ezY/VwinSo3Ru87+YLtdIk0AzZK4YTNSzZevq2i/X6rd+
 DiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696968106; x=1697572906;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXX99+sRerDKMbWnSh/67eMjmbNfBWKGv387Abrjh24=;
 b=UCJDKhwRDnke6Y8lBE4uULk02VkLFTRltjEZFFLcnGAwVMQ9Z3JDlx+gn4nqK2vJM+
 Dva7dHTS1nzd0FFeehl+0SY21mV+cGa9xzP544tProjL5LjCZ0mE8puoblLnf4VrbcyC
 V+s11i6fVzILeCpgyRflAOEQsBHe+NiiT0xDuyzcZL4CfHg28DPcfotSZriZ1Ua4L/Ae
 pfOKmXEHx0PIt9Nfv6dXXZHTvMrH/U38KBn7Pqa4qOs19JWjouFHiSiuBjSyow1UwfVj
 mWe5J1H2Mdc5gz1HaMepp4/obICbudrn5KTbJyIuYibguNNMIU0Qnl1b6qxSznuapyal
 gOKA==
X-Gm-Message-State: AOJu0Yzj6iCabgMsWDchqF2PpRjWz4PC2MY5w7kyuA/b2rPJnJc/bgUZ
 0XSfTGxQCHn91/w9ieDrDZQEGw==
X-Google-Smtp-Source: AGHT+IES3FOwekUeUGnjvqsmKjGckDU98IL22Hd2kvjiIaEQqJaS4k4NQC94gT8gK/ckEx1HG4UMWQ==
X-Received: by 2002:a2e:870f:0:b0:2b6:da1e:d063 with SMTP id
 m15-20020a2e870f000000b002b6da1ed063mr15571978lji.45.1696968105737; 
 Tue, 10 Oct 2023 13:01:45 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 d17-20020a2e3311000000b002bcb9956a69sm2575632ljc.41.2023.10.10.13.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:01:45 -0700 (PDT)
Message-ID: <f8ecba86-2cce-48db-bf56-7d4ab2a1ef39@linaro.org>
Date: Tue, 10 Oct 2023 22:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sdm670: add display subsystem
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin
 <liushixin2@huawei.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231009233337.485054-8-mailingradian@gmail.com>
 <20231009233337.485054-14-mailingradian@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231009233337.485054-14-mailingradian@gmail.com>
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



On 10/10/23 01:33, Richard Acayan wrote:
> The Snapdragon 670 has a display subsystem for controlling and
> outputting to the display. Add support for it in the device tree.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
[...]

> +			interconnects = <&mmss_noc MASTER_MDP_PORT0 0 &mem_noc SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_MDP_PORT1 0 &mem_noc SLAVE_EBI_CH0 0>;
0 -> QCOM_ICC_TAG_ALWAYS (dt-bindings/interconnect/qcom,icc.h)

> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x880 0x8>,
> +				 <&apps_smmu 0xc80 0x8>;
> +
> +			status = "disabled";
status after the block below, please

and similarly below

Konrad
