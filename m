Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF94B237A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDF010EA82;
	Fri, 11 Feb 2022 10:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7610EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644576018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr2p39qO1PszvSAuu6FevETTuy4phR00cC1/L7uwXE4=;
 b=G7PwqOYUy/ZmJ6LnfmMFbhU6dIuKBhMwvczlIfzQ6/Sialw3HqerfC3uP7eg/Lropg3RwI
 J5mlwJoidAjy3L3RIjsPGYb9Vib6+dVURYwahO28HuYo4CGZ+Byvf7dR6Z+CCJqvraksk0
 WrCZ2b6aKvpHXhubVa7vXOIYp5SefCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-yxDKeSLSNumUOW7qY9nrDw-1; Fri, 11 Feb 2022 05:40:17 -0500
X-MC-Unique: yxDKeSLSNumUOW7qY9nrDw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso2213751wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 02:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rr2p39qO1PszvSAuu6FevETTuy4phR00cC1/L7uwXE4=;
 b=in7ihVgfOIWFBBGSuPTxs8J+RQAWiM3l//OyDw2/zMUNlfP4j7s4+QApAcF6tPVkMh
 ZoJRh68O6Ig92gJFgQ8hqzT5k8cmYNtxGvXLFLSVy9uJygb+FUOrCUETlamM/SVTaQRm
 CJbsVI9Qu7VeVVOvPct+GXtGJ5uYuXNHZyimvRvvepiO3TA3mAGyeWYQOZN8dv7YP3Gu
 nVlgsVokixM47ganRZBz96WfVvGPTz2qzrw/5A6vEyhY1s1UZyfiKSyQRemr1wF9tJ1Y
 FXW1p59CuVEozI+YuCgEAuvIn2QDaj/IJSjk4Xp9QNY0bnqAnRZKOjMcR9jtdjeTs316
 0BBw==
X-Gm-Message-State: AOAM530Hm9C7AcNHUXoA+5FW9UOuXyHPe2Q5V01/TdIfaSEg8oFf1rGv
 olzwmRD9wPlirr2RwOUmLkbfuHP5JAcwt4DtnsS2r1SKL02ff2kitya5NmiGUQ2h2o46WH39SeS
 fefv7XfqK4xAraLMgPAqsAZlxJgsy
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr849154wrl.599.1644576014927; 
 Fri, 11 Feb 2022 02:40:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFwUlqoA2Q/hc1lootDkLF4/JkL1kUKbH/6LwiUXn6iAC9iHdzV840Do6ORLJXrajVa5H83A==
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr849134wrl.599.1644576014664; 
 Fri, 11 Feb 2022 02:40:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m6sm24340579wrw.54.2022.02.11.02.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 02:40:14 -0800 (PST)
Message-ID: <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
Date: Fri, 11 Feb 2022 11:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgY6OqN+guBlt/ED@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

On 2/11/22 11:28, Andy Shevchenko wrote:
> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:
>> Pull the per-line conversion logic into a separate helper function.
>>
>> This will allow to do line-by-line conversion in other helpers that
>> convert to a gray8 format.
> 
> ...
> 
>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
>> +{
>> +	unsigned int x;
>> +
>> +	for (x = 0; x < pixels; x++) {
>> +		u8 r = (*src & 0x00ff0000) >> 16;
>> +		u8 g = (*src & 0x0000ff00) >> 8;
>> +		u8 b =  *src & 0x000000ff;
>> +
>> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
>> +		*dst++ = (3 * r + 6 * g + b) / 10;
>> +		src++;
>> +	}
> 
> Can be done as
> 
> 	while (pixels--) {
> 		...
> 	}
> 
> or
> 
> 	do {
> 		...
> 	} while (--pixels);
> 

I don't see why a while loop would be an improvement here TBH.

In any case, I just pulled the line conversion logic as a separate
function with minimal code changes since doing that should be in a
separate patch.

Feel free to post a patch if you want to change that while loop.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

