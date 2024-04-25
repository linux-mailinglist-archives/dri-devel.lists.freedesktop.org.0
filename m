Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DC8B1B61
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ED011A1F8;
	Thu, 25 Apr 2024 07:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=classfun.cn header.i=@classfun.cn header.b="Mw9l+DQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from classfun.cn (unknown [129.204.178.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F98211A1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:03:42 +0000 (UTC)
Received: from [192.168.0.160] (unknown [220.162.71.180])
 (Authenticated sender: bigfoot)
 by classfun.cn (Postfix) with ESMTPSA id 307D47884E;
 Thu, 25 Apr 2024 15:03:34 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 307D47884E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
 s=default; t=1714028621;
 bh=AK6H6ldj7P6o3ylZtkoQ2LgaK1xemeiTHMq/b0TWzZ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mw9l+DQLqALMOuzPxOwtAs8Ei8HWtDRIVwlLfwiIxuAOIMulvYMGjL97sRQkUX2f7
 P0zBR7KErF6JpaPlGxnE58dmX1t8AuaLimoTX1Z1VoDVWB/P7Wt97EGVFRhY1k4JwZ
 ABlvaV6mfnMOtRWJBVjWdLbkXXrA/050jgmkDxOE=
Message-ID: <ae845812-681e-4033-99b1-e761d2288a08@classfun.cn>
Date: Thu, 25 Apr 2024 15:03:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Xilin Wu <wuxilin123@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <rzxzqgx65m7yo2btzh5dzcxuqquszujdvffq2dippdak2qdx7c@g77efrhjyure>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <rzxzqgx65m7yo2btzh5dzcxuqquszujdvffq2dippdak2qdx7c@g77efrhjyure>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2024/4/25 14:02, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Apr 24, 2024 at 11:29:07PM +0800, Xilin Wu via B4 Relay wrote:
>> From: Junhao Xie <bigfoot@classfun.cn>
>>
>> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
>>
[...]
>> +MODULE_LICENSE("GPL");
> 
> Best regards
> Uwe
> 

Thank you for your reply! I will fix them and resend this commit.

This is the link of datasheet for SI-EN SN3112, but it is written in Chinese:
https://datasheetspdf.com/pdf-down/S/N/3/SN3112-12-SI-EN.pdf
