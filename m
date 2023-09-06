Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B54793A5B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26A10E5FC;
	Wed,  6 Sep 2023 10:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F710E5FC;
 Wed,  6 Sep 2023 10:50:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99de884ad25so544119466b.3; 
 Wed, 06 Sep 2023 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693997437; x=1694602237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPk6ISCbpC/CANW4MjLpjXtvg/rj6Md91X1eJZ3mRGw=;
 b=K9iTodjT63sbj5YmRBg6givoK7SfuuguYA1mpOcXf2l1r736e4f51z9R8zLHxOSeqI
 aFJIaa1QaSW7RYB4cd4qOvQR1iG+MT97V+IqbD0TPHS6R3OKjEmegGozQLzHrZaOOSn0
 iNhx9/TebdFBKBegJBImMXfoPF5eqmTm9gr8YSaLHuxL6W6QPAZFWwYflyFRksbph9Dw
 z3Lfimq9sZfBSJHxC7Djs5vAX00oCgkTMAUViWJduFFHdfJzBWIAHla7caKLIubW550Y
 W4gUmEdmPfDJ5aw+LVO/r1vpuQvAsLR6pkWeLTNBYm6xsECL/RLf7cjc/ayMHgMXmZv3
 fV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693997437; x=1694602237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPk6ISCbpC/CANW4MjLpjXtvg/rj6Md91X1eJZ3mRGw=;
 b=XNSk9e9T+tbSGSvW5oP4d7bxDgCgUygYs2pXpJcqUWmtyOavp18az1f3hzPcu7yjBs
 bhCdNA8g+xTeH97uUs+Zv9wG7qapuKmhCEswZJmK2YBJ/+4JiknlQxqoojXFYO0cuU9L
 RwcXGnjxhgGZRw6YBBLeIt5CpUYPY9XHX9N6ItSYhnMPWszCSmlIJIMP7734bq1eP7uv
 xJCsWSY1F//xMrXupikVX9Mmt+mLLQDiDSyJVb0WhJhdCByZMbMk3m77rOxkJgit8iap
 ZCUO+btCRsM2PFQ+hCFhGJqqtUGsv74r/wFxM10LGgI+pnyeMiW1NJ5eBt3tg2KFb3EC
 tn9Q==
X-Gm-Message-State: AOJu0Yyrqki0uEglfJ9NZSUUVfJT8BPu4CCMeRjX8xW8ZT2QG+4s2O/R
 /CfoR08XW+ya4df0mS3SG8A=
X-Google-Smtp-Source: AGHT+IFk9TQYmwQo+qVqsWZZOhkdOtC/LJqkg8MfHz53csekPCdvAFo5iqnoSkWLn7w1U6kezNBPxQ==
X-Received: by 2002:a17:906:4ad1:b0:99c:55ac:3a61 with SMTP id
 u17-20020a1709064ad100b0099c55ac3a61mr1964920ejt.56.1693997436639; 
 Wed, 06 Sep 2023 03:50:36 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.97.6])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm8880526ejb.199.2023.09.06.03.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 03:50:33 -0700 (PDT)
Message-ID: <4df435a0-dd9b-121a-8820-e331bb8a046f@gmail.com>
Date: Wed, 6 Sep 2023 12:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <873b331a-d0ce-658c-6daa-02bf816e92d1@linux.dev>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <873b331a-d0ce-658c-6daa-02bf816e92d1@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.23 um 12:31 schrieb Sui Jingfeng:
> Hi,
>
> On 2023/9/6 14:45, Christian König wrote:
>>> Firmware framebuffer device already get killed by the 
>>> drm_aperture_remove_conflicting_pci_framebuffers()
>>> function (or its siblings). So, this series is definitely not to 
>>> interact with the firmware framebuffer
>>> (or more intelligent framebuffer drivers).  It is for user space 
>>> program, such as X server and Wayland
>>> compositor. Its for Linux user or drm drivers testers, which allow 
>>> them to direct graphic display server
>>> using right hardware of interested as primary video card.
>>>
>>> Also, I believe that X server and Wayland compositor are the best 
>>> test examples.
>>> If a specific DRM driver can't work with X server as a primary,
>>> then there probably have something wrong.
>>>
>>>
>>>> But what's the use case for overriding this setting?
>>>>
>>>
>>> On a specific machine with multiple GPUs mounted,
>>> only the primary graphics get POST-ed (initialized) by the firmware.
>>> Therefore, the DRM drivers for the rest video cards, have to choose to
>>> work without the prerequisite setups done by firmware, This is 
>>> called as POST.
>>
>> Well, you don't seem to understand the background here. This is 
>> perfectly normal behavior.
>>
>> Secondary cards are posted after loading the appropriate DRM driver. 
>> At least for amdgpu this is done by calling the appropriate functions 
>> in the BIOS. 
>
>
> Well, thanks for you tell me this. You know more than me and 
> definitely have a better understanding.
>
> Are you telling me that the POST function for AMDGPU reside in the BIOS?
> The kernel call into the BIOS?

Yes, exactly that.

> Does the BIOS here refer to the UEFI runtime or ATOM BIOS or something 
> else?

On dGPUs it's the VBIOS on a flashrom on the board, for iGPUs (APUs as 
AMD calls them) it's part of the system BIOS.

UEFI is actually just a small subsystem in the system BIOS which 
replaced the old interface used between system BIOS, video BIOS and 
operating system.

>
> But the POST function for the drm ast, reside in the kernel space (in 
> other word, in ast.ko).
> Is this statement correct?

I don't know the ast driver well enough to answer that, but I assume 
they just read the BIOS and execute the appropriate functions.

>
> I means that for ASpeed BMC chip, if the firmware not POST the display 
> controller.
> Then we have to POST it at the kernel space before doing various 
> modeset option.
> We can only POST this chip by directly operate the various registers.
> Am I correct for the judgement about ast drm driver?

Well POST just means Power On Self Test, but what you mean is 
initializing the hardware.

Some drivers can of course initialize the hardware without the help of 
the BIOS, but I don't think AST can do that. As far as I know it's a 
relatively simple driver.

BTW firmware is not the same as the BIOS (which runs the POST), firmware 
usually refers to something run on microcontrollers inside the ASIC 
while the (system or video) BIOS runs on the host CPU.

Regards,
Christian.

>
> Thanks for your reviews.
>

