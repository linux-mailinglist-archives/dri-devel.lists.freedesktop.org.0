Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9FE6C658E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014E710EA75;
	Thu, 23 Mar 2023 10:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F416910EA75
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:47:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ek18so84526556edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679568442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
 b=Dtslf0444+9v58G4yE+r0N4jTKSFCxfgxadg83fFpxNHJ4ac4nlxy0bFQDZh3eNAKB
 6WssITCbUrDgO1As33oV9qKLdQbyrHIJ2/gRtUdUK8XNctG/tWxxNfnYwi9XdL67Rwz2
 jN5zgGK5gewqPRnTYvHYAntqZ1Mrs6KMySeUgtH1R0O51kUmgjC5iviB4XcBg1oXkJ4C
 wsPdAy3FmmaFAuFdsxIiH2CG84/CHpAs1LMRnB5QWHwBtoXNosOoPlLukKgM+rmy+rJ4
 VrJPlkZfxEfp7h9c067CxWlfsxIXgtjVtA8ANFGhrqOP7GyVkLgwoh2y61aQiFLP4vgB
 YbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679568442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
 b=ptG2fJtXa9xGtNiYiktgQBbrvLttpcPOWdsTOVsgGc+MWSJPOsv89is96Kra6cN4KH
 NlfK3fw3C+UO4oYYukq8nu17Woe+KRVnNBSq9fAIUOl/BW06Qlj/KijiguMmARBP0Vy9
 MZUVOq+i0MmhP7H7RxB5L3Utd76g0LNz9rYla85V0h2GPO2nhqA4iVryK6y58HlEV6xS
 qsgAkH9qQwpteI3SogOuTn9LBSzkyHyb64yfNvmtnFZTezTLlHWgkm/c0a4tGfkKZ0qa
 D6d/74T+9kzC7jxpHb59TGeaQfYm87tQBjpIJjGIiKjHv3p6JwWCrKUR97Kob3Eobs40
 NLCw==
X-Gm-Message-State: AO0yUKVyiHOzMz1Zfc8/86EpaM0Mt+xXfloHfbOO9x8341q39L0JJND6
 OEKmfQ+fwUeOerZK2HtowSzPuw==
X-Google-Smtp-Source: AK7set+syZHTlqpATJV5H45QwNgqlRP+3WJYWaGjq6Y6tMtvCBdNqC47gy0P9OOBSjJ/vCiMdvKECQ==
X-Received: by 2002:a17:906:9457:b0:930:a74:52bb with SMTP id
 z23-20020a170906945700b009300a7452bbmr5414585ejx.14.1679568442296; 
 Thu, 23 Mar 2023 03:47:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906b29200b008c607dd7cefsm8484887ejz.79.2023.03.23.03.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:47:21 -0700 (PDT)
Message-ID: <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Date: Thu, 23 Mar 2023 11:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
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
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
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
> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
> 
> The implementation was checked and this npl clock isn't used for the VA macro.
> 

This does not look correct. DTS looks good, you miss some patches in
your tree.

Best regards,
Krzysztof

