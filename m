Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE29C1E7D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F97D10E004;
	Fri,  8 Nov 2024 13:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E2o0MRoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156010E004
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731073875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp8SJubjIWH+oVfx1SD15EsWPj+A+X3WXtE5LpvL0uw=;
 b=E2o0MRoCefi8+QsoN01A2wP5HC+X6BLtFHbB/xclIC4xh8jo+l28man/LfURrqIK5pmb8r
 teLtBLqk7rp3MiyFOHSFZ0Bwpg1mmpT66dhQluaU3pteT8Xx93N0jzZ+4i9HJZA5EEEiDq
 /u1mjHiTijH+Sy76TaEdMIKaqiaOCek=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-srK7J2EpO2uubzuiAc0fWA-1; Fri, 08 Nov 2024 08:51:13 -0500
X-MC-Unique: srK7J2EpO2uubzuiAc0fWA-1
X-Mimecast-MFC-AGG-ID: srK7J2EpO2uubzuiAc0fWA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37d59ad50f3so1079794f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 05:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731073873; x=1731678673;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yp8SJubjIWH+oVfx1SD15EsWPj+A+X3WXtE5LpvL0uw=;
 b=pokAmGrpyAVKIGCM89QXJky6GkZRQeR3wyoOyCqURuM2bFAuS3IR4EihswLIAuBkOn
 US4t2Ywv6ZFuA2FZq+RUKTKMDDzOcw5MqXgG2PLaoCI5v+rnZFAm4cYCnMe70LnvwDA9
 BcL/LjvXt4EsJdo1Y5kGC7asS7vNyY39K72/nrThZv9scWV2ehA0GtmzifrY8SSIT71F
 DpiTEk8fGGfRUuvtRmjwVJ6SaiavGmoGyUnss1L0RguQicIg6vYvHNKQr/AZpcUiXcP5
 zyiVg2+eyR15O4YCmCjlzJQtrrx5fVnAwCd/PxSl5FTkrPYQRsU34SnuS0SnhotwZtC1
 OWIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuAYVDS7H8eVpwcOt9m5Tat5q9XR2lX3n9E8LkJL69Bzo7J8zxqbmGjlYBvvKYU4ZJqSDQbqUiqcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyas78wP+kAx4knGZem5PlT4/rt9kdt1Fue5hOvQAO+g2SATGHK
 pq7y7ES09X7asxrEuuwlO78eKNUSR7B041ixtXdPCFFpPs7Ukt1bBlx+MXXllwTIUFQH7ZTe++f
 3rNVPQ9o9riu5mjpZo4MA3BclLaoyWwyvG25ssdh9735XW9GI64dTkPc2fhVK5QuAJA==
X-Received: by 2002:a05:6000:2c1:b0:37d:238:983 with SMTP id
 ffacd0b85a97d-381f186b4b2mr2561692f8f.22.1731073872692; 
 Fri, 08 Nov 2024 05:51:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENvW2FgJtPvIKuRbi0KyPUG9rv/vqab1/mYic3C0qWXI0kyF7AfWRiOO2/18ksKytc9TWKvA==
X-Received: by 2002:a05:6000:2c1:b0:37d:238:983 with SMTP id
 ffacd0b85a97d-381f186b4b2mr2561662f8f.22.1731073872298; 
 Fri, 08 Nov 2024 05:51:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04111sm4903154f8f.92.2024.11.08.05.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 05:51:11 -0800 (PST)
Message-ID: <bb6f5ff1-71c1-4b1b-a618-7f72310598f2@redhat.com>
Date: Fri, 8 Nov 2024 14:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] drm/log: Do not draw if drm_master is taken
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241108082025.1004653-1-jfalempe@redhat.com>
 <20241108082025.1004653-5-jfalempe@redhat.com>
 <5e19d9d4-7533-4a59-a665-cfc4a8195293@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5e19d9d4-7533-4a59-a665-cfc4a8195293@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 46Cp-3vcyBor4Rh2RMjqJjiTuyB_khdfuzBiHC8M9WE_1731073873
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

On 08/11/2024 14:33, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.11.24 um 09:10 schrieb Jocelyn Falempe:
>> When userspace takes drm_master, the drm_client buffer is no more
>> visible, so drm_log shouldn't waste CPU cycle to draw on it.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_log.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
>> index 376ee173d99d9..226e206e8b6a3 100644
>> --- a/drivers/gpu/drm/drm_log.c
>> +++ b/drivers/gpu/drm/drm_log.c
>> @@ -18,6 +18,7 @@
>>   #include <drm/drm_print.h>
>>   #include "drm_draw.h"
>> +#include "drm_internal.h"
>>   #include "drm_log.h"
>>   MODULE_AUTHOR("Jocelyn Falempe");
>> @@ -308,8 +309,13 @@ static void drm_log_write_thread(struct console 
>> *con, struct nbcon_write_context
>>       if (!dlog->probed)
>>           drm_log_init_client(dlog);
>> -    for (i = 0; i < dlog->n_scanout; i++)
>> -        drm_log_draw_kmsg_record(&dlog->scanout[i], wctxt->outbuf, 
>> wctxt->len);
>> +    /* Check that we are still the master before drawing */
>> +    if (drm_master_internal_acquire(dlog->client.dev)) {
> 
> Just a note: it would be better to track this state in the client code 
> and handle these locks automatically. But it's ok for now. It would 
> require an overhaul of the fbdev helpers as well.
> 
>> +        drm_master_internal_release(dlog->client.dev);
> 
> Don't you have to release after drawing?

I'm not sure, the drawing code will only call 
drm_client_buffer_vmap_local() / unmap
and drm_client_framebuffer_flush(), and they don't require the master 
lock to be taken. I think master lock is needed only for modesetting.

Also the dlog->lock is taken by the console thread, so there are no race 
conditions with the drm_client callbacks (hotplug/suspend/resume).

> 
> Best regards
> Thomas
> 
> 
>> +
>> +        for (i = 0; i < dlog->n_scanout; i++)
>> +            drm_log_draw_kmsg_record(&dlog->scanout[i], wctxt- 
>> >outbuf, wctxt->len);
>> +    }
>>   }
>>   static void drm_log_lock(struct console *con, unsigned long *flags)
> 

