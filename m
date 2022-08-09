Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90E58E114
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 22:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E91A35B1;
	Tue,  9 Aug 2022 20:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D459A32B5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 20:28:49 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id d8so5022872qkk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UpXMC/V8M8QihfWkqTWCB5zvVrjz+AxLa5N2dvMw970=;
 b=cZWs5L/J24PYbWzfRLF9EM2tOTAmWhQ4wLrOnP80PyvZShEwjh75wvGsJ4tBG/wPJ7
 zaEp5r7leeFfsaEnyiMzbwcYlQ8Z8xKDfbl1g3exZTndOBbju9Ha4bkTGJU6Z5Htu9Qp
 Cbb0+ra9bRbFSZf9Ws0fIk+sgpdu8z/QRGd4pB3o4+5eyH3C70ir9hnwCZ4dm5Z+2F37
 mnBnBFda5BZNRQEhb8ei2fjUEY0RUmVG03BjpWcVzShurVxL/mLZXkIqfzHjk1dtKsb9
 2Qc5B6iVjR+2P6waP6AOGyIl5RA+a67w/hXvQaYP42Prm/Zsz6Wq9oEblG0SOvWX96Gt
 w9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UpXMC/V8M8QihfWkqTWCB5zvVrjz+AxLa5N2dvMw970=;
 b=v+2xnd1SNpSbEV75oy0FF7YYYfxsBu39GQ/T0K+aibe+p6da0hcPMlDFYFbVyiUGaV
 SkFTNXUWeXF73Bhrd5sczNK8y1/1R5rN6toKpEp/lrGLk56qTRUKIKcp7jkcUwiNWeoe
 TyPwY9wbQMx40YqlYwOT+0UXcOIQlZUPhHw2gJA+ty7eCs4gJk4ltnk7GZPlN5mMoyed
 4xMVbS/fi01PNyLNiTjX9NzgDlcGDYByRyPL+K1nTjQhKt+QlcmZk6it05l5u9ldT+jK
 8M8P3bHk523glBGTXy0aWihsaKZYaD//Moi68BOhbMkt8NCUH93pyciy3PDBEWqGnPy/
 Ty0A==
X-Gm-Message-State: ACgBeo2pluitp65cPQ6cPo+f2JUxAFdWKgRtA1RjmOndMS7d9bnNBApM
 g+qyNwRxCrkmnmWFcha3JI8=
X-Google-Smtp-Source: AA6agR5TMMyqQV5MM2nuG1oOce2I+NFaannOYZiQISIuSKo+YkFjFHRohMDUUmYn/Fxr4SH7cCydCw==
X-Received: by 2002:a05:620a:1a97:b0:6b8:8aa2:7f23 with SMTP id
 bl23-20020a05620a1a9700b006b88aa27f23mr18691812qkb.286.1660076928391; 
 Tue, 09 Aug 2022 13:28:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 bn42-20020a05620a2aea00b006b5e296452csm11515032qkb.54.2022.08.09.13.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 13:28:46 -0700 (PDT)
Message-ID: <01b9847a-d418-ac7c-4c75-606b7ec8ffae@gmail.com>
Date: Tue, 9 Aug 2022 13:28:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>, Maxime Ripard
 <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <0692c98b-0776-0878-56eb-3c876ea98eb8@i2se.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <0692c98b-0776-0878-56eb-3c876ea98eb8@i2se.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hallo Stefan,

On 8/9/22 13:16, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 05.08.22 um 01:11 schrieb Florian Fainelli:
>> On 6/13/22 07:47, Maxime Ripard wrote:
>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>
>>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>>> attached to the HDMI block, handled in Linux through runtime_pm.
>>>
>>> That power domain is shared with the VEC block, so even if we put our
>>> runtime_pm reference in the HDMI driver it would keep being on. If the
>>> VEC is disabled though, the power domain would be disabled and we would
>>> lose any initialization done in our bind implementation.
>>>
>>> That initialization involves calling the reset function and initializing
>>> the CEC registers.
>>>
>>> Let's move the initialization to our runtime_resume implementation so
>>> that we initialize everything properly if we ever need to.
>>>
>>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to 
>>> runtime_pm")
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> After seeing the same warning as Stefan reported in the link below, 
>> but on the Raspberry Pi 4B:
>>
>> https://www.spinics.net/lists/dri-devel/msg354170.html
>>
>> a separate bisection effort led me to this commit, before is fine, 
>> after produces 4 warnings during boot, see attached log.
> Which config do you use (multi_v7_defconfig + LPAE or arm64/defconfig)?

This was actually bcm2835_defconfig copied over to arch/arm64/configs/ 
and slightly modified to enable PCIe, here is it:

https://gist.github.com/481999edc11b823d0c3e87ecf1693d26

>>
>> Is there a fix that we can try that would also cover the Raspberry Pi 
>> 4B? Is it possible that this series precipitates the problem:
>>
>> https://www.spinics.net/lists/arm-kernel/msg984638.html
> 
> I don't think this is related because this is a different driver.
> 
> Best regards
> 


-- 
Florian
