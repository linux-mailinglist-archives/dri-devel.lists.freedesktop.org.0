Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB89AF5BA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 01:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5537E10E3EF;
	Thu, 24 Oct 2024 23:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N89X9AQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8910E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 23:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729811503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXZPkdgMHHyVt8CVaW2aG/NmyoMp0u0Qd43+yE4rMWI=;
 b=N89X9AQE6MVPGRWZS4jVJ1G5NQKOd7mfmW1VrBXI5K10izIifCgBjtiLdaohNO426PEiDY
 bTy1GjlBhy7azNJ7g6aoFNOyOCkE2FDPOrWa7PbNRoSOO5mMetHpAqg9B3DmbB3/d984SJ
 PzmdClBSlgaIjTh+U88w/CRhvLTwGTA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-tzB9wSwXNs-oJriYc7SaeQ-1; Thu, 24 Oct 2024 19:11:42 -0400
X-MC-Unique: tzB9wSwXNs-oJriYc7SaeQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4315d98a873so10084955e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729811501; x=1730416301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rXZPkdgMHHyVt8CVaW2aG/NmyoMp0u0Qd43+yE4rMWI=;
 b=ONaz/yCpOlaMQT+abfIaGls6vO16PP6r6Xa/7ISWu932gNVo2O3iSM/EDpofyUPiFU
 gXkIwZV8LuRRt/mSsL9zhLgdqmVBdEy86MqY8DBNfl86HXZRADc1PpV8YJC16QODKvyx
 /tEuD3QiDYpyMZafpDUiSeCv8hRcKSTECazmxfeb4/exrWcdhxFenH2PBS2bvZJMveL4
 99C+L/t5J2V4OzHVXV3T2sD2cuOROWput7MHd5Db+KKDGN8oEM9IearbnqL0QGg84I4t
 ShKaIa+urv1OXqe+EeQn2ZNhWLpG7Z8nEBxcZFsjGkvijhJRbgxWmVE0Xk39inQCbAvT
 o5SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUCGbY7CXlLf/xMDwdnkA9sJ6fP39v25V2xQmqiqZt4WkeKSxXShA4HFs/108hF+42Ta6VkbUC7xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhu8Vqm82hcTisd0x0cOD21EqLvkczVpFAHtJJSBFdR5OZCPAT
 C9GJRy2xnOj1mTJe1tYsuu37RtbzjhWX1yPKSStn9K+efv/2UcQAUuC8j4pVvZHDAxw9jUdExNy
 pzA+Wkr5P/irZRL9e6XubqCaYXDawB8/GKfkudnvQCyjNkHUpV8OFtAz77jIbgis6Gw==
X-Received: by 2002:a05:600c:1d87:b0:42f:8ac6:4f34 with SMTP id
 5b1f17b1804b1-431841ab121mr53037175e9.35.1729811501373; 
 Thu, 24 Oct 2024 16:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+Uu0As6KH+ZIsHke5UWCWSFkansh16nnjINSzANHlGC9c9STJlej8pHJDvU1tjgd3Tt4/RQ==
X-Received: by 2002:a05:600c:1d87:b0:42f:8ac6:4f34 with SMTP id
 5b1f17b1804b1-431841ab121mr53037065e9.35.1729811500949; 
 Thu, 24 Oct 2024 16:11:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b566f11sm30877365e9.20.2024.10.24.16.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 16:11:39 -0700 (PDT)
Message-ID: <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
Date: Fri, 25 Oct 2024 01:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
To: Petr Mladek <pmladek@suse.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
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

On 24/10/2024 16:34, Petr Mladek wrote:
> On Wed 2024-10-23 14:00:13, Jocelyn Falempe wrote:
>> The console is already suspended in printk.c.
> 
> Does this mean that drm_log_client_suspend() is called
> after suspend_console(), please?

To be honest, I wasn't able to tell which one is called first, and if 
the order is enforced (I didn't check if drivers can be suspended in 
parallel, or if it's all sequential)..

I then checked if it's possible to suspend the console, but didn't found 
an easy API to do so, so I went with this lazy patch, just ensuring 
we're not writing to a suspended graphic driver.

> 
> By other words, does it mean that "dlog->suspended == true" is set
> only when CON_SUSPENDED is already set in the related con->flags?
> 8
>> Just make sure we don't write to the framebuffer while the graphic
>> driver is suspended.
>> It may lose a few messages between graphic suspend and console
>> suspend.
> 
> The messages should not get lost when the console is properly
> suspended by suspend_console(), set CON_SUSPENDED.
> 
> Or maybe, I do not understand it correctly. Maybe you want to say
> that it should work correctly even without this patch. And this
> patch creates just a safeguard to make sure that nothing wrong
> happens even when suspend_console() was not called from some
> reasons.

I mean that with this patch if the console is suspended after the 
graphic driver, then the message between the suspend of the graphic 
driver and the suspend of the console won't be drawn. I don't see that 
as a big problem, if you debug suspend/resume with drm_log, and the 
screen goes blank, you won't see much anyway. And using dmesg when the 
system is resumed, would have all the messages.

Without this patch, it may crash if the framebuffer is no more 
accessible, and drm_log tries to draw a new line on it.
> 
> 
> Note: I tried to check the order by reading the code. But
>        drm_log_client_suspend() was called via too many layers.
>        And I was not able to find where exactly it was called,
>        for example, from hibernate() in kernel/power/hibernate.c
> 
> 
>> --- a/drivers/gpu/drm/drm_log.c
>> +++ b/drivers/gpu/drm/drm_log.c
>> @@ -310,10 +311,32 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
>>   	return 0;
>>   }
>>   
>> +static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
>> +{
>> +	struct drm_log *dlog = client_to_drm_log(client);
>> +
>> +	mutex_lock(&dlog->lock);
>> +	dlog->suspended = true;
>> +	mutex_unlock(&dlog->lock);
> 
> It might also be possible to explicitly set the CON_SUSPENDED flag
> here to be always on the safe side. We could create variant of
> suspend_console() just for one console. Something like:
> 
> void suspend_one_console(struct console *con)
> {
> 	struct console *con;
> 
> 	if (!console_suspend_enabled)
> 		return;
> 
> 	pr_info("Suspending console(%s) (use no_console_suspend to debug)\n");
> 	pr_flush(1000, true);
> 
> 	console_list_lock();
> 	if (con && console_is_registered_locked(con))
> 		console_srcu_write_flags(con, con->flags | CON_SUSPENDED);
> 	console_list_unlock();
> 
> 	/*
> 	 * Ensure that all SRCU list walks have completed. All printing
> 	 * contexts must be able to see that they are suspended so that it
> 	 * is guaranteed that all printing has stopped when this function
> 	 * completes.
> 	 */
> 	synchronize_srcu(&console_srcu);
> }
> 
> and call here:
> 
> 	suspend_one_console(dlog->con);
> 
> 
> But this is not needed when the console is already supposed to be
> disabled here. If this is the case then it might be better
> to just check and warn when it does not happen. Something like:
> 
> void assert_console_suspended(struct console *con)
> {
> 	int cookie;
> 
> 	cookie = console_srcu_read_lock();
> 
> 	/* Do not care about unregistered console */
> 	if (!con || hlist_unhashed_lockless(&con->node))
> 		goto out;
> 
> 	if (WARN_ON_ONCE(!(console_srcu_read_flags(con) & CON_SUSPENDED)))
> 		pr_flush(1000, true);
> out:
> 	console_srcu_read_unlock(cookie);
> }
> 
>> +	return 0;
>> +}
> 
> 

Thanks for this two suggestions, this is really what I was looking for.
I will run some tests on real hardware, to see which one is suspended first.

Best regards,

-- 

Jocelyn

> Best Regards,
> Petr
> 
> PS: I have vacation the following week and might not be able to
>      follow the discussion before I am back.
> 

