Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD8644E8FF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4926EB6B;
	Fri, 12 Nov 2021 14:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6DE6EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:32:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e9so18891401ljl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jt2s5eE/KZv2f777KX1QTyz+OLPwPl/PkMsoEbWrCGs=;
 b=i23UwZ6HE1MO8waAeRtHPEn5k2yNK9USGUt+trHLji3BvDimp03/SrKGm5JUcuPans
 V2/TQzharlHbqb+MaQ1aMV27Gs8R3tAuLPvDAjlf/zDn20Fbec0kYackzhXzZLqy8xn9
 aKXx/PgK0jKx1h/u7Wym5icG4tk83l0fRUIOBrGhQgv/KOoNf4W+SwqcmBWdaoEUpDeD
 EOQQbi+V7qBN2WeS2dUcCBnvlxlHnlJ6YTJWP0TxpLJp9L8HZaKDePAwt9caVX2rmlro
 K7Cf9DvOJ5Om9RDx7yiHFE1+L9udwpYmvO4rC29zzz8XQ0/qmvrn3wH/gZsH0UTAVs4P
 Vopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jt2s5eE/KZv2f777KX1QTyz+OLPwPl/PkMsoEbWrCGs=;
 b=6hDTXgWVuo859CUvgPGslD8jHJ1Xy+AHObm8QUNsAHr1E4pCLwCBZeZ4wLnyRkOowQ
 Grq3IoP+LWEfI41q2u4U9azfBMOPdwaYVlendVNffgQ0XtUwWJKppKlVvCmhFaO5uh5N
 H866V8UiIGUFycdBMbwx5RCbnhcSt16xDH8RgyfWoAJaVSSt+d26bNqmHNTUruBZdPeL
 p71Xwn4YriRzXaOdLoNQgfa6RZ3yhSmnXu0MwJpbBu8Ybe9BPzBrOd2BraiOEcNdc/2Q
 1LXZixERSV9minTaC2WKBc1Ds4SXFpA6WgKXa2lwgjRk0CbeD9ZR0oEn6voIY288hk4l
 AU7w==
X-Gm-Message-State: AOAM532SUG2Ss3TtG59paVYPD7ZyxQhxlJjt4ltyGzNCtiTqTe9UFx4I
 oET/FveCb9AIJRY77za2Dm0=
X-Google-Smtp-Source: ABdhPJxBQ423Ld/XMxX+l3TnJVKv96QnKYPBK0REIsPD1NSxn+CW9FihZYNXZBK1woVGv7zwysv0DA==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr15560272ljn.201.1636727564749; 
 Fri, 12 Nov 2021 06:32:44 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru.
 [79.139.177.117])
 by smtp.googlemail.com with ESMTPSA id bn3sm573660ljb.7.2021.11.12.06.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 06:32:44 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
 <YY5HfUUSmnr6qQSU@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
Date: Fri, 12 Nov 2021 17:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YY5HfUUSmnr6qQSU@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

12.11.2021 13:52, Thierry Reding пишет:
> On Tue, Nov 09, 2021 at 05:39:02PM +0300, Dmitry Osipenko wrote:
>> 09.11.2021 17:17, Dmitry Osipenko пишет:
>>> 09.11.2021 17:08, Dmitry Osipenko пишет:
>>>>> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
>>>>> +{
>>>>> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);
>>>> And platform_unregister_drivers() should be moved here.
>>>>
>>>
>>> Nah, that should cause deadlock. This ad-hoc is too lame.
>>
>> Actually, there is no problem here as I see now. The host1x driver
>> populates DT nodes after host1x_register() [1], meaning that Host1x DRM
>> will be always inited first.
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/host1x/dev.c#L475
>>
>> Still I'm not a fan of the ad-hoc solution.
> 
> Could we not fix this by making the panel "hot-pluggable"? I don't think
> there's anything inherent to the driver that would prevent doing so. The
> original reason for why things are as intertwined as they are now is
> because back at the time deferred framebuffer creation didn't exist. In
> fact I added deferred framebuffer support with Daniel's help precisely
> to fix a similar issue for things like HDMI and DP.

I don't understand what do you mean by "hot-pluggable", panel is static.
Please either clarify more or type the patch.

Keep in mind that fix should be simple and portable because stable
kernels are wrecked.

> With HDMI and DP it's slightly less critical, because a lack of mode
> support would've created a 1024x768 framebuffer, which most HDMI/DP
> monitors support. However, with panels we need to ensure that the exact
> mode from the panel is used to create the framebuffer, so it can only be
> created when the panel is available.
> 
> But, given that deferred framebuffer creation works now (which allows
> the framebuffer console to show up at the preferred resolution for HDMI
> and DP), even if a monitor is attached only after the driver has probed
> already, we should be able to make something like that work with panels
> as well.

BTW, I see now that DPAUX I2C transfer helper may access
aux->drm_device. Hence v1 patch isn't correct anyways.

For now I'll try to test more the ad-hoc variant with Thomas and send it
as v2 if we won't have a better solution.
