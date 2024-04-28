Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5188B4AA0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13310FA7B;
	Sun, 28 Apr 2024 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HgsaGzFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31BA10F9A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 03:43:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5f415fd71f8so2790021a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 20:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714275791; x=1714880591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cF3gFSsAF8/xhEBnIsSjdFtkiMowyOcPJ+4xKxqvds8=;
 b=HgsaGzFj7e0S1D61pMCLsiwk+0F+JJgLQyssF3XKFY/0G6N7eUIn8PtF1Dk40dKfdg
 1qvUtfmFELj0X2g+Q3uAwe8GJq28WQ/ZAGHad4C8nraCIdJWPHFFFer0VfUv+yjTEbmg
 4wArDkoH7U9PsELDb+43/9u3GXpS4sTSV7ueWS449csPp/locl2hk4Oh31I6XGMLNO2b
 wc9XWZQB6zlVEZqLv0kp+U/seIva8scdZHVMRbSJNYmM20xyEsOaS0rbclLqgrSvkWD/
 wcuCIbIdpgOW6HP8YWMrfPV1TV/Qy/IFjRbmRSycpk9YOIuJhls+3AImq/Db0/ZCO6Dc
 cdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714275791; x=1714880591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cF3gFSsAF8/xhEBnIsSjdFtkiMowyOcPJ+4xKxqvds8=;
 b=hA0/Ot31uxT+DN8rn1fVSuIkK6BNFxTFvvlourfgTkPfAiPctzaGjeLM7y9ETgqD12
 bGMVXD8y0uwEqLTTfFhRpJ3kKJ3U5IyP4YdNDmyvZVAzqaWs0HTWpd9KceghS7w19Mlq
 dE3McnbhE9ClUJik3P4g5pOZNbmV5aukjPCJr0eaS3slOnsvUL+fmZD4P+Rx0Bkvc+ck
 v5ImxTjVPO0fY9ABVZSJNwbzOSeU5013iM4QwmsctKvHnOV9OL2HIsKutrwD+iS75lnU
 jSHxJChEo1Qq8wLtZC0aQXGepRpfAvm5kLf07CqFP4pWI2WbRTa1iCU5VqednF3kir+q
 PuEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrTj0rz9e7ViKkPhhWbVRODoMcrTciwAWfa1i+5NoBBdY4Tr/XRoJdxb0Kskd45K7ZwBeErEVzRaMjdGGY139oR8JzTaMlZnSwsLFF5/Iu
X-Gm-Message-State: AOJu0Yw8HdPf5G/gQ0NqwnObedKLU9G6XRfYHWr99Pdciulb71ocdiHp
 hwNeBCTXGC2FH1l2cA6uL1TWvyQNs2h+s1eHDt433d/kwuKkTEhgM5/pvIqDCwc=
X-Google-Smtp-Source: AGHT+IH8mJdZTclWb62UvmTjNjCFpNOr+GkX5xNCJ3l7df3vwRT//5dtC2idHbg5/5JmAE8+hAlxkQ==
X-Received: by 2002:a17:90a:e641:b0:2ab:257c:4747 with SMTP id
 ep1-20020a17090ae64100b002ab257c4747mr6214969pjb.6.1714275790697; 
 Sat, 27 Apr 2024 20:43:10 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
 by smtp.gmail.com with ESMTPSA id
 gb23-20020a17090b061700b002b15a672805sm354415pjb.23.2024.04.27.20.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 20:43:10 -0700 (PDT)
Message-ID: <c69021e6-2397-4cae-a640-9a3b6ce2e404@gmail.com>
Date: Sun, 28 Apr 2024 11:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sm8550: Update EAS properties
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
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
 <20240424-ayn-odin2-initial-v1-7-e0aa05c991fd@gmail.com>
 <99f51564-df99-4f06-9419-1eaa9501f27d@nexus-software.ie>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <99f51564-df99-4f06-9419-1eaa9501f27d@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

On 2024/4/25 6:45, Bryan O'Donoghue wrote:
> On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
>> From: Xilin Wu <wuxilin123@gmail.com>
>>
>> The original values provided by Qualcomm appear to be quite
>> inaccurate. Specifically, some heavy gaming tasks could be
>> improperly assigned to the A510 cores by the scheduler, resulting
>> in a CPU bottleneck. This update to the EAS properties aims to
>> enhance the user experience across various scenarios.
>>
>> The power numbers were obtained using a Type-C power meter, which
>> was directly connected to the battery connector on the AYN Odin 2
>> motherboard, acting as a fake battery.
>>
>> It should be noted that the A715 cores seem less efficient than the
>> A710 cores. Therefore, an average value has been assigned to them,
>> considering that the A715 and A710 cores share a single cpufreq
>> domain.
>>
>> Cortex-A510 cores:
>> 441 kHz, 564 mV, 43 mW, 350 Cx
>> 556 kHz, 580 mV, 59 mW, 346 Cx
>> 672 kHz, 592 mV, 71 mW, 312 Cx
>> 787 kHz, 604 mV, 83 mW, 290 Cx
>> 902 kHz, 608 mV, 96 mW, 288 Cx
>> 1017 kHz, 624 mV, 107 mW, 264 Cx
>> 1113 kHz, 636 mV, 117 mW, 252 Cx
>> 1228 kHz, 652 mV, 130 mW, 240 Cx
>> 1344 kHz, 668 mV, 146 mW, 235 Cx
>> 1459 kHz, 688 mV, 155 mW, 214 Cx
>> 1555 kHz, 704 mV, 166 mW, 205 Cx
>> 1670 kHz, 724 mV, 178 mW, 192 Cx
>> 1785 kHz, 744 mV, 197 mW, 189 Cx
>> 1900 kHz, 764 mV, 221 mW, 190 Cx
>> 2016 kHz, 784 mV, 243 mW, 188 Cx
>> Your dynamic-power-coefficient for cpu 1: 251
> 
> This looks pretty convincing and like good work.
> 
> A few questions and suggestions for your commit log.
> 
> I'd really love to know more about how you ran this test. What values 
> exactly does your power meter give you?
> 
> How did you lock the core to a specific CPU frequency ?
> 
> Maybe also give the equation to calculate Pdyn in the commit log.
> 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1500974575-2244-1-git-send-email-wxt@rock-chips.com/#20763985
> 
> ---
> bod

The power meter accepts a fixed 4 volts input, and outputs to the 
battery connector on the board. It is also connected to a computer for 
data recording, including voltage and current.

The CPU frequency pinning and Pdyn calculation is done by a script on 
the list: [1]. I just removed the power measuring part since it was done 
on the computer with the meter.

I will improve the commit log in v2.

[1] 
https://lore.kernel.org/all/CAD=FV=U1FP0e3_AVHpauUUZtD-5X3XCwh5aT9fH_8S_FFML2Uw@mail.gmail.com/

-- 
Thanks,
Xilin Wu

