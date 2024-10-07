Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D44992608
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7317D10E312;
	Mon,  7 Oct 2024 07:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ShifBP9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793F310E31B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728286054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cw2WEIesKZP7kRBN9ihX4z0j8EU2ju/lqZ4x9HFRnko=;
 b=ShifBP9sP/0cJqS7bQEJxEQx9kbZ0Gw74pOFrghWWNUgVkrdkgjuQEb/FqNOAjpr5NHmBp
 cKbbc+V/PJKF5GwH9WIfszjt0+5IYyFaOcwSK8+smtljET1j+o+ftuKdQiLP9vR530Gbb3
 0i/ch02jrksLJlZgohboM1/NrvyXpeQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-xbTOYy2aPjSM0dY_z-EwFQ-1; Mon, 07 Oct 2024 03:27:33 -0400
X-MC-Unique: xbTOYy2aPjSM0dY_z-EwFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37ce12c2f36so2581435f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 00:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728286052; x=1728890852;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cw2WEIesKZP7kRBN9ihX4z0j8EU2ju/lqZ4x9HFRnko=;
 b=w32q1EdQ/xN+nzbHI+MdJ+QgIQODX+Gkijq58l7JfADtov2dXYtztIDn8zi/Rg9VbM
 0cPT9OGbHCmVWHA84UzM+HOgxJ+k7QSYqEKiV5LT6W0WRr4NfQDhddo3jIr1R4FPqlqr
 YVnh2ikMvdkD9pYfKA804f9ahAppw5g7U5GAnlsyQ46Tjk22OtarFjgUJPpm3xttczLA
 IkbfUDHwtT/MKEvk069AOujGCiPCbMwODzNZRrJzPDIjaAvlUF2TktdmD/Duu+peqRqB
 8nRpDOcEXoioGonQEgNyTkqjlExcmRTmta7RvKYrY54oCcuot9SV4gEHUTEBZ3DojUu8
 L13g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhRjU39+lpIncgXggVWfwNQcOI4FoOoG7v1ZNg84Zc4erbUIRjhvYQ2g0/sHjjB6cvDTQHJskgZCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysz18/Y0GsQV1kM9iOSRPqwcFurXymg++pHNHImeRByhNynCvq
 MjYvGfUwTUeMLF0yENJ6e4mFsh+wnh/vTe8ZvK/ni60vzaY9+clPZo3+4LbNiJ3auZgS1QFVsBp
 vyPbQTkknGNrQjzz90ayU8bc+bSLzY7jy4w4omdJcSY9Y8rBo6SdYbs5ieX4WTWZNbg==
X-Received: by 2002:adf:fb4f:0:b0:37c:d261:3c6e with SMTP id
 ffacd0b85a97d-37d0e6bb9ebmr6279621f8f.10.1728286051795; 
 Mon, 07 Oct 2024 00:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtq8JWHTMkBnHAxco/hSRyF3Kw8hFWJ++hg1DsVE0Of3iNQ06+04BW/YAH9dSwMbiGx1lSvg==
X-Received: by 2002:adf:fb4f:0:b0:37c:d261:3c6e with SMTP id
 ffacd0b85a97d-37d0e6bb9ebmr6279601f8f.10.1728286051342; 
 Mon, 07 Oct 2024 00:27:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1690f0b2sm5064405f8f.9.2024.10.07.00.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 00:27:30 -0700 (PDT)
Message-ID: <d328299b-40c2-4e63-a3b9-c83feb1ca168@redhat.com>
Date: Mon, 7 Oct 2024 09:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Caleb Connolly <caleb.connolly@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240910070733.156127-1-jfalempe@redhat.com>
 <782f6c32-73ed-4e58-ae10-ff2d486b499c@linaro.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <782f6c32-73ed-4e58-ae10-ff2d486b499c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2024 00:40, Caleb Connolly wrote:
> Hi Jocelyn,
> 
> On 10/09/2024 08:56, Jocelyn Falempe wrote:
>> drm_log is a simple logger that uses the drm_client API to print the 
>> kmsg boot log on the screen.
>> This is not a full replacement to fbcon, as it will only print the kmsg.
>> It will never handle user input, or a terminal because this is better 
>> done in userspace.
> 
> 
> I tried this out on the OnePlus 6 (Qualcomm SDM845/freedreno) and it 
> looks great :D
> 
> Here's a demo for kicks:
> 
> https://people.linaro.org/~caleb.connolly/drm_log_oneplus6.mp4

Thanks, it's a really nice demo!
For high-resolution screen, I will add integer scaling soon, so that 
should be a bit easier to read, without requiring huge fonts.

-- 

Jocelyn


> 
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org> # freedreno/dsi
> 
> Kind regards,
>>
>> If you're curious on how it looks like, I've put a small demo here:
>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>
>> Design decisions:
>>    * It uses the drm_client API, so it should work on all drm drivers 
>> from the start.
>>    * It doesn't scroll the message, that way it doesn't need to redraw 
>> the whole screen for each new message.
>>      It also means it doesn't have to keep drawn messages in memory, 
>> to redraw them when scrolling.
>>    * drm_log can only be built-in (and drm must be built-in too).
>>      The reason is that, if you build it as a module, then a userspace 
>> application will be more appropriate than this module.
>>    * It uses the new non-blocking console API, so it should work well 
>> with PREEMPT_RT
>> v2:
>>   * Use vmap_local() api, with that change, I've tested it 
>> successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>>   * Stop drawing when the drm_master is taken. This avoid wasting CPU 
>> cycle if the buffer is not visible.
>>   * Use deferred probe. Only do the probe the first time there is a 
>> log to draw. With this, if you boot with quiet, drm_log won't do any 
>> modeset.
>>   * Add color support for the timestamp prefix, like what dmesg does.
>>   * Add build dependency on  disabling the fbdev emulation, as they 
>> are both drm_client, and there is no way to choose which one gets the 
>> focus.
>>
>> v3:
>>   * Remove the work thread and circular buffer, and use the new 
>> write_thread() console API.
>>   * Register a console for each drm driver.
>>
>> Thanks and best regards,
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Move drawing functions to drm_draw
>>    drm/log: Introduce a new boot logger to draw the kmsg on the screen
>>    drm/log: Do not draw if drm_master is taken
>>    drm/log: Color the timestamp, to improve readability
>>
>>   drivers/gpu/drm/Kconfig     |  19 ++
>>   drivers/gpu/drm/Makefile    |   3 +
>>   drivers/gpu/drm/drm_draw.c  | 216 ++++++++++++++++++++
>>   drivers/gpu/drm/drm_draw.h  |  56 ++++++
>>   drivers/gpu/drm/drm_drv.c   |   2 +
>>   drivers/gpu/drm/drm_log.c   | 391 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_log.h   |  11 +
>>   drivers/gpu/drm/drm_panic.c | 247 +++--------------------
>>   8 files changed, 721 insertions(+), 224 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_draw.c
>>   create mode 100644 drivers/gpu/drm/drm_draw.h
>>   create mode 100644 drivers/gpu/drm/drm_log.c
>>   create mode 100644 drivers/gpu/drm/drm_log.h
>>
>>
>> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> 

