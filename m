Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF76C170E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE7410E1AA;
	Mon, 20 Mar 2023 15:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EED788FF9;
 Mon, 20 Mar 2023 15:11:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so2630112wmq.4; 
 Mon, 20 Mar 2023 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679325068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MLgEcD7VZWnRzPue4t1I8Ce61Fq3oPAt515XripkCT8=;
 b=NoHhRK3XhC+HLWncv8nY8O8ib6xkc3TJy1KT6qlsqwlGLv3wBhX8EcqeeTvj1Dxe22
 qcnoFhLPWDVYxtaVOUlvEfOP5yBEf5wDcCcIkq+x9ubFL5pioNrFpqA4oZOWTTIqKFMI
 gSL0b2qg3IALL6Nr0DgduBwjw/6q08NiseLdEkFFXp4xDnLu8oq6Hy62ORTn9Jje+Nes
 aGRgCPIrYpG1I4tXZhCRh9Xxxeeq609Qqcv0V4X6eA7qYSnBPuGF4Cr5pZBQ9vJnIIS0
 Rxpjq97PlpgiITzW+FqvOd4lpiRCucSiIjHLAlWF66Y/7ih6jic/fVpTUF9jescpkdB0
 Bg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLgEcD7VZWnRzPue4t1I8Ce61Fq3oPAt515XripkCT8=;
 b=a0LcdyzCGQ4X4Gud9nNzvq9E41za0aNXTMjfzB0FI4n2w+FEgMNqzZ4q422pc88l8Y
 c80z2Hx8hocqbg3lQJapv/Wn/uMg+P6FqhKUmRIgI4qJd4vB/xU3uD/y36ERYMyf5efY
 tM2SrytrI4nQOJ/V94niLdl6R5pPl19122mgHownk4AvyNhtmNjtcc6ieti6DX25fn7q
 ncXJOcnctwX8ayKw5wPsbJWr1rSD1js/l0gEUclCqxoUhg5ZgDesFjOOFc8RkqtWMstn
 24/6m9+eK5cX2BRHFyNFDr0UmZ1XNQc/MNe6kgC5zUMBU0K3bJewXdm+kEfWjDVHmyz0
 PhyA==
X-Gm-Message-State: AO0yUKUlWzBjWhgZtidlKfOcrWsG50p7mA7lfDlq01zfpGyJMPlLAg5a
 b9MagDc5hbO/O/yAJJGouQs=
X-Google-Smtp-Source: AK7set9fyPmBsRfEGrBWwXHswRDAyKzUCUF/5eV4NBF7I37DY6LbeQ+qWNpHgqir+Awhph/CYZToSg==
X-Received: by 2002:a05:600c:3491:b0:3eb:2e19:ff3a with SMTP id
 a17-20020a05600c349100b003eb2e19ff3amr31824143wmq.7.1679325067714; 
 Mon, 20 Mar 2023 08:11:07 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:fae3:596:f1a7:6853?
 ([2a02:908:1256:79a0:fae3:596:f1a7:6853])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b003ee11ac2288sm1542346wmo.21.2023.03.20.08.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:11:06 -0700 (PDT)
Message-ID: <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
Date: Mon, 20 Mar 2023 16:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.23 um 10:20 schrieb Thomas Zimmermann:
> Hi Christian
>
> Am 17.03.23 um 09:53 schrieb Christian König:
>> Am 16.03.23 um 10:37 schrieb Thomas Zimmermann:
>>> Convert radeon's fbdev code to drm_client. Replaces the current
>>> ad-hoc integration. The conversion includes a number of cleanups.
>>> Only build fbdev support if the config option has been set.
>>
>> I'm torn apart on that. On the one hand it looks like a really nice 
>> cleanup on the other hand we don't really want to touch radeon any more.
>
> It's a driver in the upstream kernel. You have to expect at least some 
> changes.

Some changes is not the problem, but we need a justification to change 
something. Just that it's nice to have won't do it without extensive 
testing.

>
>>
>> Alex what do you think? Is that worth the risk of breaking stuff?
>
> Moving all fbdev emulation to struct drm_client is required for new 
> in-kernel DRM clients, such as a DRM kernel logger or a boot splash.

Well that's a rather good justification. I suggest to add that to the 
cover-letter.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Christian.
>>
>>>
>>> Thomas Zimmermann (10):
>>>    drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
>>>    drm/radeon: Improve fbdev object-test helper
>>>    drm/radeon: Remove struct radeon_fbdev
>>>    drm/radeon: Remove test for !screen_base in fbdev probing
>>>    drm/radeon: Move fbdev object helpers before struct fb_ops et al
>>>    drm/radeon: Fix coding style in fbdev emulation
>>>    drm/radeon: Move fbdev cleanup code into fb_destroy callback
>>>    drm/radeon: Correctly clean up failed display probing
>>>    drm/radeon: Implement client-based fbdev emulation
>>>    drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
>>>
>>>   drivers/gpu/drm/radeon/Makefile         |   3 +-
>>>   drivers/gpu/drm/radeon/radeon.h         |   2 +
>>>   drivers/gpu/drm/radeon/radeon_display.c |   4 -
>>>   drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
>>>   drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
>>>   drivers/gpu/drm/radeon/radeon_fb.c      | 400 ----------------------
>>>   drivers/gpu/drm/radeon/radeon_fbdev.c   | 422 
>>> ++++++++++++++++++++++++
>>>   drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
>>>   drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
>>>   drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
>>>   10 files changed, 464 insertions(+), 433 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
>>>   create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
>>>
>>>
>>> base-commit: ec0708e846b819c8d5b642de42448a87d7526564
>>
>

