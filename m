Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261F593392
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 18:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B716CE4E7;
	Mon, 15 Aug 2022 16:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E406CE4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 16:53:05 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b2so5921534qkh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Ca5bhtx3a2wclC0QMv8WKb3qLmGTDNtJ6yijFkZ/Gyg=;
 b=WIAx1xf8+dgsn8Ft/ucwTcNkyDnkEk3OU6PhyZmLeOqCFFJy+UibslPtCYTSrnZI4E
 IU4dhnTrgAqkSqDHbJPj5dgBY+3r4opZv2k+VGI6aQBRn22aO1BUGj6Q8WegjSaEkzMz
 jAB3yHvThB7EdZ8f4k7/HiJ7NSDdKlqlByWO37UQ8dhPXjDZP+AKAeEJJ1yGJbC3j/zX
 eS6oXYqla40LKpgem31++4qpK83m0nqWmeEjlTrQolgR79BzyaDELqHhRy04Igg8n09/
 EOvzoA3GTOVpTTWUxrKwQlBLFM0mX6mdCdZrrPUMVLeEcRQiSHF992maZ7fUS6LMNvut
 oh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ca5bhtx3a2wclC0QMv8WKb3qLmGTDNtJ6yijFkZ/Gyg=;
 b=lkb7csj79+nE5m5MEEnyzYnxnD59lZBWzQsmusD0uSSghlrCC5eWCkrQ9nFAEMzW9+
 GKubF2BJ75rXqOhtfHjJEAHuOI7f/7+wJxW8TQ6+bRLJjIgfk1IUyqGhnv2BZLZ+mXG3
 J6jsP7mPCQIItxCbcLJpRapN8RBOBf39o6HXEMiebthFZU2cFSly6txLZr/zDe0PVV/f
 PyyLs0mm3EyyVf8pX2hlNGk0gFK/cNWYP+TG1WMoQ/Ozu4sOcJnImwqLwTDB7ftl49aC
 vb6YQp4GpkPUaWl3oqgU/6BLlqnN2w8QtiQh57i1kSAG/LHHWbCW68Vtk6ZV4PgGBuh0
 Vp8A==
X-Gm-Message-State: ACgBeo04+Q0j/jgUZPXQwUTeNOLFVkdzNdsgVFHbaNfkZDVgcFfYw3GV
 vE9rrzwCqXkTAZi+ahNPiY8=
X-Google-Smtp-Source: AA6agR79y9ice2MpPT1JmvuoKzzqgoPS09YIxD6rO/HKNgh9A66vNMNY9XKrGEHiFVWTqMDKhyLwwQ==
X-Received: by 2002:a05:620a:1357:b0:6ba:e661:f91a with SMTP id
 c23-20020a05620a135700b006bae661f91amr9519903qkl.744.1660582384034; 
 Mon, 15 Aug 2022 09:53:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 dt2-20020a05620a478200b006b93b61bc74sm9652869qkb.9.2022.08.15.09.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:53:03 -0700 (PDT)
Message-ID: <129cc9c4-b99f-cff4-bd16-093441e39a66@gmail.com>
Date: Mon, 15 Aug 2022 09:52:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Stefan Wahren <stefan.wahren@i2se.com>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
 <abc70ec9-cf6a-3057-0d80-65a3cb81ea2b@i2se.com>
 <20220815141253.ku5tlwien4lipqn6@houat>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815141253.ku5tlwien4lipqn6@houat>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 07:12, Maxime Ripard wrote:
> On Wed, Aug 10, 2022 at 10:33:48PM +0200, Stefan Wahren wrote:
>> Hi Florian,
>>
>> Am 09.08.22 um 21:02 schrieb Florian Fainelli:
>>> On 8/4/22 16:11, Florian Fainelli wrote:
>>>> On 6/13/22 07:47, Maxime Ripard wrote:
>>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>>
>>>>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>>>>> attached to the HDMI block, handled in Linux through runtime_pm.
>>>>>
>>>>> That power domain is shared with the VEC block, so even if we put our
>>>>> runtime_pm reference in the HDMI driver it would keep being on. If the
>>>>> VEC is disabled though, the power domain would be disabled and we would
>>>>> lose any initialization done in our bind implementation.
>>>>>
>>>>> That initialization involves calling the reset function and
>>>>> initializing
>>>>> the CEC registers.
>>>>>
>>>>> Let's move the initialization to our runtime_resume implementation so
>>>>> that we initialize everything properly if we ever need to.
>>>>>
>>>>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable
>>>>> to runtime_pm")
>>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>
>>>> After seeing the same warning as Stefan reported in the link below,
>>>> but on the Raspberry Pi 4B:
>>>>
>>>> https://www.spinics.net/lists/dri-devel/msg354170.html
>>>>
>>>> a separate bisection effort led me to this commit, before is fine,
>>>> after produces 4 warnings during boot, see attached log.
>>>>
>>>> Is there a fix that we can try that would also cover the Raspberry
>>>> Pi 4B? Is it possible that this series precipitates the problem:
>>>>
>>>> https://www.spinics.net/lists/arm-kernel/msg984638.html
>>>
>>> Maxime, Dave, anything you would want me to try? Still seeing these
>>> warnings with net-next-6.0-11220-g15205c2829ca
>>
>> At first this issue doesn't occur in Linux 5.19. So it's something new. I
>> was able to reproduce with todays linux-next, but interestingly it doesn't
>> occur in drm-misc-next.
> 
> Yeah, it should be fixed by
> https://lore.kernel.org/all/20220629123510.1915022-38-maxime@cerno.tech/
> https://lore.kernel.org/all/20220629123510.1915022-39-maxime@cerno.tech/
> 
> Both patches apparently didn't make the cut for the merge window, if it
> works for you we can always queue them in drm-misc-fixes

Both of these patches eliminate the warning, I don't have a good set-up 
yet for ensuring that HDMI/V3dD is functional however:

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
