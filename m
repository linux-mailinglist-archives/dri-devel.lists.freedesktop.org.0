Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3910944D77
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 15:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEB610E924;
	Thu,  1 Aug 2024 13:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cq9+AXpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F8110E924
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722520336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hd+rnQJd3iP+kYdmOOscahOzGscif18AjgksANysyBg=;
 b=cq9+AXpy7GIHo5vivoeYgdpdF36rBoE4HG+V/UwH/mXkTVkP1TxzlYDwD14DOVYqPWuAtN
 GLNvGBgwAJQnRVyOv5KB6UEklBgoiWytSO/al3K/gPzt8jyG2Rx6TURF9qYzkvVn52zARB
 lJgLFIFmRmgp4JZtrqCqwNHGwlCmtIE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-TZyoWq4ZM1elwdEYp-Pnwg-1; Thu, 01 Aug 2024 09:52:15 -0400
X-MC-Unique: TZyoWq4ZM1elwdEYp-Pnwg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3679ab94cdbso3297318f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 06:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722520334; x=1723125134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hd+rnQJd3iP+kYdmOOscahOzGscif18AjgksANysyBg=;
 b=mSFY8kQx9OSR1QeQaQgX6cRF0DkZrEfvVtQ1cTLetkMKrWgcGpW/Skpfouo5miQwBP
 y9gs3oy7249MIF7epfrq+Jwja2MpTG/HfWn2SaWLn46+uUPThemS6NcdQbjL5h+je+W2
 LmADHm4hFV7qNGNlKeDn/7o+DwJl/0jtl9YKUv8sI2sk1lKMtLwXzDSqYg/mPwqBkoZI
 +YsimCW5PuqKxmT/VDuGofbTqkeDE+3Ve+ZoUmC2soFOP5NonpMnZ26usQHG3vZKCXwU
 58lgzMAVv8/kw5s46qFL5gbwPHl3v59zyAlFpVb2r2+u11hoYk3NKc9wS+yjp5Hhb2pC
 +tKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+HkuJrR8XwJbHmhVgEHiGNrNm0G1hk4ImvxxsnpxEukHNzA2hCjqKRhj8L5W50r1G//RdoQz8QdXyb/iG8HWofanSr7IipbM53RqHA3bW
X-Gm-Message-State: AOJu0YwX2/WsVfTe3S2RWPMUqITDSYYA8IwMWwQRcuwcNSXk5MR8OgQT
 g/zQtjWKw9Idyo9qjGHTSVgD0HOdhRdTB55s8Jb+DvpmPDzNIVCtlLlC14cT8rpgVBz6R0Jpyap
 iku0vrpU01UKFdqaQt9e6tI0OvaYyFEr6Nio+wQzNkOokR+X9XbF66a8mPA72aWI5/g==
X-Received: by 2002:adf:fa4a:0:b0:367:9d82:8370 with SMTP id
 ffacd0b85a97d-36baaf56d69mr1478952f8f.45.1722520334253; 
 Thu, 01 Aug 2024 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm12m+Y9C9l9phe/+0YdpfEMjw0LYrQqwMVj1Q67GpYNuD/k/eIOyJsQ3IN0oM9cnpLl+0Vg==
X-Received: by 2002:adf:fa4a:0:b0:367:9d82:8370 with SMTP id
 ffacd0b85a97d-36baaf56d69mr1478927f8f.45.1722520333690; 
 Thu, 01 Aug 2024 06:52:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36857db6sm19546600f8f.73.2024.08.01.06.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 06:52:13 -0700 (PDT)
Message-ID: <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
Date: Thu, 1 Aug 2024 15:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: John Ogness <john.ogness@linutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87o76czfb2.fsf@jogness.linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/08/2024 12:51, John Ogness wrote:
> On 2024-08-01, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>   * It uses a circular buffer so the console->write() callback is very
>>     quick, and will never stall.
>>   * Drawing is done asynchronously using a workqueue.
> 
> For CON_NBCON, neither of the above points are necessary. You can draw
> directly from the write_thread() callback. See below:
> 
>> +static bool drm_log_work_draw(void)
>> +{
>> +	unsigned int len;
>> +	char buf[512];
>> +
>> +	len = drm_log_buf_read(buf, sizeof(buf));
>> +	if (len)
>> +		drm_log_draw_all(buf, len);
>> +	return len != 0;
>> +}
> 
> For CON_NBCON, this is essentially your write_thread() callback:
> 
> void drm_log_write_thread(struct console *con,
> 			  struct nbcon_write_context *wctxt)
> {
> 	drm_log_draw_all(wctxt->outbuf, wctxt->len);
> }
> 
> You cannot implement a write_atomic() callback because the console must
> be able to print directly in NMI context and must not defer. But
> write_atomic() is optional, so you should be fine there.
> 
> Disclaimer: Only in PREEMPT_RT patchset at the moment.

Thanks, so that means the circular buffer and workqueue are only 
necessary until write_thread() is merged in mainline. It will be a nice 
simplification.
I think I can also register one console for each drm driver, which will 
simplify drm_log even further. (currently it would mean having a 
circular buffer and work function for each driver which is a bit too much).
Do you know if there is a chance to have write_thread() in 6.12 or 6.13 ?

> 
> John Ogness >

Best regards

-- 

Jocelyn

