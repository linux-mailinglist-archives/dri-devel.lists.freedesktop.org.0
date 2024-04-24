Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABB8B1386
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D2A10E6D3;
	Wed, 24 Apr 2024 19:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=classfun.cn header.i=@classfun.cn header.b="GfMxPo1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 632 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 19:20:12 UTC
Received: from classfun.cn (unknown [129.204.178.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52CBD10F0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 19:20:12 +0000 (UTC)
Received: from [192.168.0.160] (unknown [220.162.71.180])
 (Authenticated sender: bigfoot)
 by classfun.cn (Postfix) with ESMTPSA id AF86178910;
 Thu, 25 Apr 2024 03:09:35 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn AF86178910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
 s=default; t=1713985778;
 bh=d/BoO25/KtfZ3Yh1f6DO8rsPKA20e+M+yd8Hwd1i7sM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GfMxPo1XfOXfDQ7tKPi5Kk481vMw2IlAjpyvrroy769NxFg1EA0DsOn/WYuqw3zN5
 W61ibhG4x40Jst5zrp5Jfa+8rW639Rposs1+kkIMSYuylvWFzViZeOfvkMV/FHYpSr
 ns4KqQAOybwyR/zWU3rmcujhxBr76QFzLGk1VI78=
Message-ID: <478366f4-cc4f-4343-99c4-87827159b10b@classfun.cn>
Date: Thu, 25 Apr 2024 03:09:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, wuxilin123@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <17d36836-67cb-4d5a-a8b4-ecf1517a0020@linaro.org>
Content-Language: en-US
From: BigfootACA <bigfoot@classfun.cn>
Autocrypt: addr=bigfoot@classfun.cn; keydata=
 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
In-Reply-To: <17d36836-67cb-4d5a-a8b4-ecf1517a0020@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Apr 2024 19:28:22 +0000
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

On 24/4/2024 23:55, Bryan O'Donoghue wrote:
> On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
>> From: Junhao Xie <bigfoot@classfun.cn>
>>
>> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
>>
>> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
>> ---
>>   drivers/pwm/Kconfig      |  10 ++
>>   drivers/pwm/Makefile     |   1 +
>>   drivers/pwm/pwm-sn3112.c | 336 +++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 347 insertions(+)
[...]
> 
> CHECK: Prefer kernel type 'u8' over 'uint8_t'
> #145: FILE: drivers/pwm/pwm-sn3112.c:91:
> +                  uint8_t val, bool write)
> 

I'll fix the commit and resend v2 later, thanks for your reply!
