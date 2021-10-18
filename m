Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F24325E6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDB46EA4E;
	Mon, 18 Oct 2021 18:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7236EA4E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 18:06:00 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id l20so6253717vkm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7rsgdN3VduQajPPoeQmc0fDRx+p/oE/XICMQOKXr/tk=;
 b=TC888OHBgaGtnkb+WMRqmEZYH8SnoLHnLVWZykP9DKGJt9+KJWGRShlbdPfslJ104W
 IQnalU6wgKqRyicT/KsU/i7y5wa+TOckEzEmyipZl6YG7ebAox8strzC208B7/jZEWw9
 gjGBDZQrOrAHLVeL8yvGkw5+BiPKjHVYDgtoVl/mtcJGjE7hsrCdt57RqVRZ6SRo+4dS
 tuFM0hg/cNBhFvCG55zjb5XyayzDYhl0RqlhwTyrko6X+I9h293F7TCqd9zWSEZNY/Re
 u6WZ1YzNOqZoNcMTeElvDMYm0KXMRKVmKeWkfAu2gWSE4BXjskwoBiT8+5FEsu8uQrWm
 w+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7rsgdN3VduQajPPoeQmc0fDRx+p/oE/XICMQOKXr/tk=;
 b=us6FMBMXYEzbnPyl2UT9ttyeoZ2YN8clDyhiFP/JjWVlcNcCI7fK3zU2u3WtzB7SiY
 /YXGLSvjC0lRPJJGzjjCvRNUNmaw7fhRYNDDNFzktbXDblIKbejxsGz0eMKjyoZ78zJf
 6XqhBy8p7SbpHzpgp+JP2Yut879ZvQ0jdSbM0ednQh5lZboiC6jkdm5GYymhnoTLSoqz
 G5afySiR9mTsvQa+KZgAsq370wicw2MNny/qp+pvEfZqaGRqF0bkDvU7fIOjg/ReeF1b
 WhDR/RiONg1nubydkpfM3ahZvtL7xgSAyuc99xCNIskzn2d51btHQ/8wCyPWiwAHi+gx
 HJtg==
X-Gm-Message-State: AOAM530rvRNjHP3Fsbjzwu6+cRcxXRMSV/DyX99q4WMnhYM5rct2qowg
 +ovR2dRKWs4nZ2ByS8Q+yP0=
X-Google-Smtp-Source: ABdhPJzGyA1a9icdmXkB74CZWuefdbd1BYiEk0TU+WkXTbIOknhJJ7uR3ZtWg0URRVcgXrkrq+yZXw==
X-Received: by 2002:a1f:b417:: with SMTP id d23mr26227711vkf.8.1634580359679; 
 Mon, 18 Oct 2021 11:05:59 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc?
 ([2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc])
 by smtp.gmail.com with ESMTPSA id 71sm9154484uao.13.2021.10.18.11.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:05:59 -0700 (PDT)
Subject: Re: [PATCH 0/6] Refactor the vkms to accept new formats
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211018105333.5f1bf9fe@eldfell>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <2202889c-b865-124f-1035-35fd66d10a0c@gmail.com>
Date: Mon, 18 Oct 2021 15:05:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018105333.5f1bf9fe@eldfell>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

Hi pq,

On 10/18/21 4:53 AM, Pekka Paalanen wrote:
> On Tue,  5 Oct 2021 17:16:31 -0300
> Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> 
>> XRGB to ARGB behavior
>> =================
>> During the development, I decided to always fill the alpha channel of
>> the output pixel whenever the conversion from a format without an alpha
>> channel to ARGB16161616 is necessary. Therefore, I ignore the value
>> received from the XRGB and overwrite the value with 0xFFFF.
>>
>> My question is, is this behavior acceptable?
> 
> Hi,
> 
> that is the expected behaviour. X channel values must never affect
> anything on screen, hence they must never affect other channels'
> values. You are free to completely ignore X channel values, and if your
> output buffer has X channel, then you are free to write (or not write,
> unless for security reasons) whatever into it.
> 

Great!! And thanks!!!

> 
> Thanks,
> pq
> 
>>
>> [1] https://lists.freedesktop.org/archives/igt-dev/2021-October/036125.html
>>
>> Igor Matheus Andrade Torrente (6):
>>    drm: vkms: Replace the deprecated drm_mode_config_init
>>    drm: vkms: Alloc the compose frame using vzalloc
>>    drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>>      DRM_FORMAT_MAX_PLANES
>>    drm: vkms: Add fb information to `vkms_writeback_job`
>>    drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to accept multiple
>>      formats
>>    drm: vkms: Refactor the plane composer to accept new formats
>>
>>   drivers/gpu/drm/vkms/vkms_composer.c  | 275 ++++++++++++++------------
>>   drivers/gpu/drm/vkms/vkms_drv.c       |   5 +-
>>   drivers/gpu/drm/vkms/vkms_drv.h       |  12 +-
>>   drivers/gpu/drm/vkms/vkms_formats.h   | 125 ++++++++++++
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  27 ++-
>>   5 files changed, 304 insertions(+), 140 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>>
> 
