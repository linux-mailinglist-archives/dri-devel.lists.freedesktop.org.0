Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0A6C65B5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9420910EA79;
	Thu, 23 Mar 2023 10:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98310EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:51:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cn12so38885651edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679568696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djtaE/vDO9AshUny6zh2qbJYY96TbEf/QaEy8Z7dISo=;
 b=SRYru7BV5FR7ta8lPrUIXW94emfeyPMudi/J/EMfbkFNYjvxPuuuCtIgIjTFppzt5J
 h47JOMbYqxJEhXHDRhoDQZOi5LsuHzIa9xib2kjIEWEwzFDcQiinKOl6DhVxf2dlkUqk
 cl2UiDVdkqTl3m4NONc0sYA4ZkpCf3KLz92O44Roa8oBCtRKjQKzHRwmd32u4h3jxMZF
 AL44QCRcffkl+m18R1qNfbTMqd/NtCF04/yWSwKsF+ndBVZy1CHlUBeAccJmObux8Ql/
 C91+8cHII8qrIIHnAA2R7Fmhi+ArI40unMmf8XVfCT/GB92O3kRBWbPhZFI54L18KOGb
 YwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679568696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djtaE/vDO9AshUny6zh2qbJYY96TbEf/QaEy8Z7dISo=;
 b=CLghFeJyQKccwyDMyA3iDkihD2QNmYOWx8Rkp66ZCAi3kORJa6V9MEgO6ayVT2nPmd
 VEs/pGz3HnCTB2flSsuFq94M2W4TgzkH/iBTu1WwtnzN2clt82Zw2z4jElMJdQgdH1RL
 1a3+SGSM86Pd7PoIgwqd0K0SJkfeyCHXVuzpnBpN8jhXUfE0vlyqhqOk3FOUZ9jr64yl
 tDx0KBN4TzkHIKcIQntm/XWl6WFMVDJ7X5MvJse1H/iU1R++fbx6gznouIbxH+T6uW2N
 p7Nf7+T3jWoU5XXIEj9ChICwotLYDGEhZIc2/kZKziAgNPeoYLav/nSz70r7WaEXZ1ys
 WH3g==
X-Gm-Message-State: AAQBX9cJgvC8Rtv77AUY2aMgDBQs90z10gBlZQ4N4lSl1lV9AQisD9Rh
 /OQVpM6Ss2quHgIyue6VZz53cQ==
X-Google-Smtp-Source: AKy350Yzr6pk7HTLyfZ07cA6Ohdh8rwBb3p/inRxryeP80LTyCA3RyLKk49pTM05/lxqV+Y/sTkmKw==
X-Received: by 2002:aa7:d38f:0:b0:502:1299:5fa5 with SMTP id
 x15-20020aa7d38f000000b0050212995fa5mr1174047edq.16.1679568696138; 
 Thu, 23 Mar 2023 03:51:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 q30-20020a50aa9e000000b004fadc041e13sm8999033edc.42.2023.03.23.03.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:51:35 -0700 (PDT)
Message-ID: <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Date: Thu, 23 Mar 2023 11:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sm8450: remove invalid properties
 in cluster-sleep nodes
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
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
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
> Fixes the following DT bindings check error:
> domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'
> domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'

I don't get from the commit msg why these properties are not correct
here. The idle states allow them, so maybe something is missing in the
binding? At least commit msg should explain this.

Best regards,
Krzysztof

