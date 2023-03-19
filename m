Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7006BFF97
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 07:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3F410E027;
	Sun, 19 Mar 2023 06:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417610E027
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 06:36:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id t14so9044975ljd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679207783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZWIx9U6pneRg2Ew/6L/XNCQb7yH+hTum0rQo8LW28Y=;
 b=ozXCkQYxbJCx4hxt+FWW20al0Wlzi9pE13I093kv+oZhfu2y1HOVRL6a5K+UIi2AmS
 2CJ/asWtGuQA1PrgqzMaLCSitnmmysK2r3PBVhKOvfrEI3roI7mVzYcXWoXhksgtZc1g
 F1m74Whfpyc0CrieqBboECACL8bjFcZihYLYZe7zP+4oefY4synp0US5IZei30+KIgzH
 bJrAuGPF66ooCsZvo8ay0A+uI2N0T4mig9oOx5e4E5jLYHI4Mc1i8tm86OWB8Pw+xEAP
 4H0sPLcGZLgjwgr1YijAPxoL/tOqUwH+Xmb3Ahm1gg+yBhPRKjP4W6zIBqpmwFfI89T3
 v7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679207783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZWIx9U6pneRg2Ew/6L/XNCQb7yH+hTum0rQo8LW28Y=;
 b=N5AF0keB/sYIAKBt5paqmcYGqq2fgpaUGNQiY4bjtlcC/3Y1W5vnFXLplmRcmdeaqZ
 DE+hVxQgmriGFcm2cl7erBn+Exmgzfd2w5KN8BhOFrft5EWTXr0Q4S2BIsflj3cbRc/X
 PMJ2sh4hduPMpf6xzPmJ7MNMOX2RK/keF0rpDb/WUwbCfGqpaRsW5qph31HZ5No1jDg3
 bMK1OKDxmuzW9cHjKn7ykg144NSf41sWlqt2PfGJqLUw2yvmpPsoU4ODOdpvSpw+D2Sr
 /0z6xgLPIyr48kdxvpwceU1Pmx0s+iywbYbOtla0uoiJk14LPQVlnB7UWVGMxwmT2Pw1
 6uzg==
X-Gm-Message-State: AO0yUKVXCWK0rQccEyceqTyP8Tp7w4c9qs2weHTkhT4F+mLm5MnkFlCJ
 RckWLW8+RkhDXUY/T0DKStc=
X-Google-Smtp-Source: AK7set/qckqThQaZftTP+TnEDek292O/hhYo6YRpJBNT4zPkusuvtckI4Mw/GR7MZhDeYUzhu94Plg==
X-Received: by 2002:a2e:bea0:0:b0:295:9d9c:24aa with SMTP id
 a32-20020a2ebea0000000b002959d9c24aamr6231418ljr.11.1679207782735; 
 Sat, 18 Mar 2023 23:36:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a2e3a19000000b00295b2e08b9dsm1141880lja.116.2023.03.18.23.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Mar 2023 23:36:22 -0700 (PDT)
Message-ID: <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
Date: Sun, 19 Mar 2023 08:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
To: Maxime Ripard <maxime@cerno.tech>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20230317150916.a3xrh25ywe5k77yp@houat>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime & All

First of all - I am sorry. During the last minute rebase I accidentally 
dropped the header file from this series. Will fix that for v5. (Also 
the build bot pointed this mistake).

On 3/17/23 17:09, Maxime Ripard wrote:
> Hi Matti,
> 
> On Fri, Mar 17, 2023 at 04:42:25PM +0200, Matti Vaittinen wrote:
>> The creation of a dummy device in order to test managed interfaces is a
>> generally useful test feature. The drm test helpers
>> test_kunit_helper_alloc_device() and test_kunit_helper_free_device()
>> are doing exactly this. It makes no sense that each and every component
>> which intends to be testing managed interfaces will create similar
>> helpers.
>>
>> Move these functions to place where it is more obvious they can be used
>> also by other subsystems but drm.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> Please note that there's something similat ongoing in the CCF:
>> https://lore.kernel.org/all/20230302013822.1808711-1-sboyd@kernel.org/
>>
>> I do like the simplicity of these DRM-originated helpers so I think
>> they're worth. I do equally like the Stephen's idea of having the
>> "dummy platform device" related helpers under drivers/base and the
>> header being in include/kunit/platform_device.h which is similar to real
>> platform device under include/linux/platform_device.h - so, in the end
>> of the day I hope Stephen's changes as well as the changes this patch
>> introduces to end up in those files. This, however, will require some
>> co-operation to avoid conflicts.
> 
> I think you would have an easier time if you just copied and renamed
> them into the kunit folder as an preparation series.

Yes. That would simplify the syncing between the trees. It slightly bugs 
me to add dublicate code in kernel-but the clean-up series for DRM users 
could be prepared at the same time. It would be even possible to just 
change the drm-helper to be a wrapper for the generic one - and leave 
the callers intact - although it leaves some seemingly unnecessary 
"onion code" there.

> That way, you wouldn't have to coordinate DRM, CCF and IIO, you'd just
> create new helpers that can be reused/converted to by everyone eventually

Yes. Thanks - I think I may go with this approach for the v5 :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

