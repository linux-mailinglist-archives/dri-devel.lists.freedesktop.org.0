Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BBA76486
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 12:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173C810E3C2;
	Mon, 31 Mar 2025 10:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BlC5KMHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7D10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 10:49:14 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso8361136a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743418153; x=1744022953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c0QEkigxnrAsvdwQl3dGicqkYGDNN3IH7OubpsJnt9k=;
 b=BlC5KMHtayShQkpBPGiHkGkSEymyer+0a3ii5r1qRwm1bBlDfEKet0EDOt5fFgxzL8
 vTubDHC+IVcwkDNVihKAHaVnCucUE2LTSFhSbyNL+5l4w4XcJe3u3OL05x0AjpT6ZSKd
 RBNJXyNd1AaSJWKLEeA4cbOgQewI8KLhWhMEkNEQy01zVzUG4KCGWtqBOeoBKxbsuzag
 QDUMFdw4h2avYHxfO40GDVInAwcRSPF6dgxJpR7qKAv3P79QTqw3JtmnfSEa0dDvHuOx
 SyiWf2xD98UfHPFI7GrV1GkylOBTQi0rq2CaVGSwbj1qwMGhpGjnQvfWSbf7WxbwpTla
 /uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743418153; x=1744022953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c0QEkigxnrAsvdwQl3dGicqkYGDNN3IH7OubpsJnt9k=;
 b=ZEcavoXPUocdNN3FSjZgpVEnjhQsUxzrz6YAJtQ55NNikZdtq5UIGI2qAg4cKptTi4
 6eJb0/fzop36WVnBAnftCJUONT66Vu6z/FR0e1pRKejJEpF3rRjxfxWkmZeVG/zyYs/v
 6PEIsVq2hKbaVSpea4w0tBlPwxp8NmsyOWspWwtbYzI1EsIcg9oIp1GsMNQFBzXwSGNu
 8KvcUMLZyCtYGtjYtdhiaECV164wsuTx7M3fZuV1o23h+fn2a1E1RPzdYllTyMOahXUz
 aQCYN+XVmh48bwgEC1AyQ4v0/wDQOMS2oKVkKCoff0tZull6RJaObclG+s4lIKUhUuVL
 3V7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN036SlpDNGmXr58WceyPMW8mGcOlGsfWr/wheTJ7t0dOBMkhsp3C+Hln3egb4jCcg4C5mDC25Baw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/dwlgtnS52C58/9uX32xiNq3pHj3bl6yDViuxazzaswZWMpcx
 DQYDGXxpmVBr1S+3Ma+lA9m+QQnyblEGMVq/mBKnKM1vayEUtLOl
X-Gm-Gg: ASbGncsYD6MyiuSdxj2xew0RYOwvcHpsj5lMZM3almb86e3mqLtoH5ZYhoNJji/toux
 GmEDmUvpwj+nS3dfIysJm8jjl2Vpow/EqPrDvtu4VcSn2DTUVKRxb8aVJ6FBTgTpl+B2WCnIyUv
 6PY7bh5Flh9vWDonjrN/IWJeYVGH92tEIo6HFnvomTZ3+yRcnE1mci8ZBxjj9zsIkDG5M9LdUn1
 NbkjX3LfhUzrUgQOV/RZqOxPdFkjtbB6Zwc92RX/OoqCZgqNZzweHlxeFNW52c2c4QRCvREyHTj
 XK/6+Sxov3YEOG/9mga4cx/sGm+0VZAa0dQpGrQ43TnIWx+Mz0yvfPLhlyZwrHi2UI1qCffCBYW
 BYqEQrWulbgnOC9ELtIk4cw==
X-Google-Smtp-Source: AGHT+IExNc31c41BbISsW9XpDeKOepiJ5uHzTczSJT3omja3K34U2u+1pGMGZbNe8NadyH+bzVIGmA==
X-Received: by 2002:a05:6402:27d0:b0:5e0:4276:c39e with SMTP id
 4fb4d7f45d1cf-5edfdbff01emr7562443a12.30.1743418152945; 
 Mon, 31 Mar 2025 03:49:12 -0700 (PDT)
Received: from [192.168.1.18] (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17e0042sm5472225a12.80.2025.03.31.03.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 03:49:12 -0700 (PDT)
Message-ID: <edf101e3-c638-45fa-8f5d-48247b9e0c9d@gmail.com>
Date: Mon, 31 Mar 2025 12:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panfrost: Add PM runtime flags
To: Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-2-simons.philippe@gmail.com>
 <20250327123628.3d33c68e@donnerap.manchester.arm.com>
 <d102aa1b-61cf-4dcc-851e-fc56adf9fab8@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <d102aa1b-61cf-4dcc-851e-fc56adf9fab8@arm.com>
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


On 3/31/25 12:32, Steven Price wrote:
> On 27/03/2025 12:36, Andre Przywara wrote:
>> On Thu, 13 Mar 2025 00:23:18 +0100
>> Philippe Simons <simons.philippe@gmail.com> wrote:
>>
>> Hi Rob, Boris, Steven,
>>
>>> When the GPU is the only device attached to a single power domain,
>>> core genpd disable and enable it when gpu enter and leave runtime suspend.
>>>
>>> Some power-domain requires a sequence before disabled,
>>> and the reverse when enabled.
>>>
>>> Add PM flags for CLK and RST, and implement in
>>> panfrost_device_runtime_suspend/resume.
>> So some Mali configuration and integration manual I am looking at says
>> that this sequence should be always observed, as the powerdown sequence
>> would include disabling the clocks first, then asserting the reset, then
>> turning the power switches off (and the inverse sequence on powerup).
>>
>> So should we make this unconditional, not depending on implementation
>> specific flags?
> I think you're right, this probably should be unconditional. My only
> reservation is that "it works" currently and we'd need to test this
> doesn't cause regressions on existing platforms. So unless someone with
> a reasonable board farm is able to do that testing I think this solution
> is reasonable. So:

Should I merge both flags together then ? something like GPU_PM_RT ?

>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
>> And also I am wondering if panfrost_device_init() gets this wrong as well?
>> As I see it enabling clock first, then reset, then pm_domain, where it
>> should be exactly the opposite?
> I agree, that looks very wrong - the power needs to be enabled before
> reset is deasserted. I'm somewhat surprised we've got away with that.
> Fancy writing a patch? ;)
>
> Steve
>
>> Cheers,
>> Andre
>>
>>> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>>> ---
>>>   drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
>>>   drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
>>>   2 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> index a45e4addcc19..189ad2ad2b32 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> @@ -406,11 +406,38 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>>   static int panfrost_device_runtime_resume(struct device *dev)
>>>   {
>>>   	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT)) {
>>> +		ret = reset_control_deassert(pfdev->rstc);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>> +		ret = clk_enable(pfdev->clock);
>>> +		if (ret)
>>> +			goto err_clk;
>>> +
>>> +		if (pfdev->bus_clock) {
>>> +			ret = clk_enable(pfdev->bus_clock);
>>> +			if (ret)
>>> +				goto err_bus_clk;
>>> +		}
>>> +	}
>>>   
>>>   	panfrost_device_reset(pfdev);
>>>   	panfrost_devfreq_resume(pfdev);
>>>   
>>>   	return 0;
>>> +
>>> +err_bus_clk:
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS))
>>> +		clk_disable(pfdev->clock);
>>> +err_clk:
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>> +		reset_control_assert(pfdev->rstc);
>>> +	return ret;
>>>   }
>>>   
>>>   static int panfrost_device_runtime_suspend(struct device *dev)
>>> @@ -426,6 +453,16 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>>>   	panfrost_gpu_suspend_irq(pfdev);
>>>   	panfrost_gpu_power_off(pfdev);
>>>   
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>> +		if (pfdev->bus_clock)
>>> +			clk_disable(pfdev->bus_clock);
>>> +
>>> +		clk_disable(pfdev->clock);
>>> +	}
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>> +		reset_control_assert(pfdev->rstc);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> index cffcb0ac7c11..f372d4819262 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> @@ -36,10 +36,14 @@ enum panfrost_drv_comp_bits {
>>>    * enum panfrost_gpu_pm - Supported kernel power management features
>>>    * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>>>    * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
>>> + * @GPU_PM_RT_CLK_DIS: Allow disabling clocks during system runtime suspend
>>> + * @GPU_PM_RST_ASRT: Allow asserting the reset control during runtime suspend
>>>    */
>>>   enum panfrost_gpu_pm {
>>>   	GPU_PM_CLK_DIS,
>>>   	GPU_PM_VREG_OFF,
>>> +	GPU_PM_RT_CLK_DIS,
>>> +	GPU_PM_RT_RST_ASRT
>>>   };
>>>   
>>>   struct panfrost_features {
