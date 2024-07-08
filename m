Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440092A0B2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6810E0FE;
	Mon,  8 Jul 2024 11:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vSAcs/6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC42010E133
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:07:12 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so715115f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1720436831; x=1721041631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
 b=vSAcs/6ZvAmFlbwxIE13UuXqBt1DPYCAbgde/TOlnzw+pJYe0v8fcRlnyFUkiNMSOX
 2Rx+HpnMPwT5SLITCQKBYhqb+U5UjL7k3ODD9yjGsctzu5igbX1ZijxxJwSjH1UyvlwV
 I9tQ4XqJkNQVjBVGxiQXb84I+wy0nJAzuxDHuWrsXzn4JxHE2njB7Ysw2MoqqHc7JgqA
 VMdouDqTLD/SHGYiE65C2+d7FyV+zqB0pFRieu1sYPwK1deAp0NkRqkGTcyeqq6y457k
 yBcts4A0GKDZUKPDJ4hdQ3sVp0UoHNY6oFtQAwIYFsV3it9RK69Bf/WDtVer1b5Fe5Oo
 OGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720436831; x=1721041631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
 b=R8szDSZwl20+xnlz5cWoub+FjzPm/8rv6e436RRyTn9jaS/AQ8ZEgyNlLPB6+833SQ
 peGm6RcO2d66G9jZQAtrrzE3i31tdrWmiK6IT9ZYtCIjRDp8pbeTFmJ9b3y0eP/cvYm5
 IrAt1WNbgACHCr0Wdu6d/FPQOBKUDKimjeoNk4VtcLa1508mFpJQdr9ZmvVfcbbpuYpw
 hMioYjKuio3K4ge7oeWFSG+7Ho4kytL8Pf+d1kFuQRepfbLWhOg+17bctuRx+p+nrNbr
 PD2R/HS63kIRjJfws6ul54QvOAcx5mf4NIS4CbR5bYXpcTFSY76TYLLeY1+jspU1jvhF
 cA4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMgtQgyjjgJ42ixTRplKsT+dNaJ6IlC010RancWDoRXYcNtmo0eqm6Vk2ewg5A23xs2r5SGASwOF7khUWTuus1bLumD0duABNOnv1L1q8T
X-Gm-Message-State: AOJu0YxyO3Yc3d3Y7Liet4fvXVNCxEYO83sNz/Q3RBUnF5j2tm+J2bfU
 iFCOzuOvfAfQP+eB9q/s0ntlwwUo7P4QnmROAJ50TCkWFoVznBQGJFieDcVexTE=
X-Google-Smtp-Source: AGHT+IEKYdET8KfBw3aNCJckmIjDHRgLhPCL/RlwhYnD8BvFqsYWoobXZB0e3p/fZkpFRo2ReXBUAg==
X-Received: by 2002:adf:f548:0:b0:366:ec2c:8648 with SMTP id
 ffacd0b85a97d-3679dd66b0emr7705422f8f.43.1720436830645; 
 Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679ac6d60dsm10918074f8f.39.2024.07.08.04.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Message-ID: <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
Date: Mon, 8 Jul 2024 13:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2024 16:34, Dmitry Baryshkov wrote:

> On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
>
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> Ported from the downstream driver.
> 
> Please write some sensible commit message.

Here's an attempt at expanding the commit message:

"""
This code adds support for the HDMI PHY block in the MSM8998.
It is a copy & paste of the vendor driver downstream:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/clk/msm/mdss/mdss-hdmi-pll-8998.c
"""


>>  drivers/gpu/drm/msm/Makefile                   |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>>  6 files changed, 893 insertions(+)
> 
> - Missing changelog

- Rebase onto v6.10
- Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
- Add copyright attribution
- Remove all dead/debug/temporary code

> - Missing a pointer to bindings. Ideally bindings should come together with the driver.

"qcom,hdmi-phy-8998" is defined in "HDMI TX support in msm8998" series (Acked by Rob Herring & Vinod Koul)

> I'm not going to check the math, but it looks pretty close to what we
> have for msm8996.

What is the consequence of this?


>> +static const char * const hdmi_phy_8998_reg_names[] = {
>> +	"vdda-pll",
>> +	"vdda-phy",
> 
> Unless you have a strong reason to, please use vcca and vddio here, so
> that we don't have unnecessary conditionals in schema.

The vendor code uses vddio & vcca for msm8996;
vdda-pll & vdda-phy for msm8998.

Which is vcca? Which is vddio?

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-mdss-pll.dtsi
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-mdss-pll.dtsi#L121-172

Regards

