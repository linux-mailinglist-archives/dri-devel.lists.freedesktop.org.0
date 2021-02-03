Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7F30D7A1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8296E2E1;
	Wed,  3 Feb 2021 10:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A816E2E1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612348564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEB7xBqwhyPOWn31cidRiNIM5Aa2KdyDpLu2IJ8+dfE=;
 b=QLHgPVoPnxW3uKN0Qlp8nBFKUQsMsAfPw2FjYtq3X1MEs9KtXYnPGIFOAS3PtXB9cQxJjB
 ipmSLHQ5KKKEEKJSsWEcg1GytUX6aUS9ij3YjY5VpC5J1lWjj/MU9xgdbrdyHeSRF9es0f
 HTiANNvFUnSlc7k0IeXGd9qAc+xkjCY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-47fZVstnPXG-zAiw3sJpRQ-1; Wed, 03 Feb 2021 05:36:02 -0500
X-MC-Unique: 47fZVstnPXG-zAiw3sJpRQ-1
Received: by mail-ej1-f70.google.com with SMTP id d15so11670200ejc.21
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fEB7xBqwhyPOWn31cidRiNIM5Aa2KdyDpLu2IJ8+dfE=;
 b=aCZTqmyoy3caLih34xr9/sJ4MWFxRVitHSSZK4MZsOPVbM9Ay2nVY5Sc4gAcxKdIYt
 y4d4v/UekA50pvYdvsRx2xxVLpnIayM9Ntryunwb12kg4s+EFqxqPbULxDvVwxNhUWrz
 GWM72tRs4cKYz4S6MwS6VQyepEnZ9Lkf2lu6wdlzYnPzWHYyVs4S0wQXVtX+TDrq6MjE
 ZOFNSDsy/uzozo2zF8omcTwt2jbncodo6mN8/cwspAMQH+elfbewA9AHMfu9q6bRQwP5
 gERltDzrwdxPVMTRQBaDewrpNAD4uNDUz1pRKTNnvtH3EaNGPKoEXkXLXC8lLHiuSErt
 2REg==
X-Gm-Message-State: AOAM532WW7H8ebfJNGkCL9V2NjYkBkW12dXsx6riquOjmqaLh8ysO9A1
 2xmNc+wgpRh6gb0ZfqFyOFkGh0k4hroYX6+33QZ0OJDRGrVfwnIqof6KVdOX7gz2RzOnshyokII
 Iwf//UoKUdMs01xBvBkVZ+KiYSFuV
X-Received: by 2002:a17:907:10c1:: with SMTP id
 rv1mr2694248ejb.74.1612348561147; 
 Wed, 03 Feb 2021 02:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqwfeuaQQcjcQ8kmMpA9bMjScyF6z1WqjDALhpwWfWpqmNI4F1sKUnQiqj4uSlF2824+0Cdg==
X-Received: by 2002:a17:907:10c1:: with SMTP id
 rv1mr2694227ejb.74.1612348561015; 
 Wed, 03 Feb 2021 02:36:01 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id e9sm655746edk.66.2021.02.03.02.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 02:36:00 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
 <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
Date: Wed, 3 Feb 2021 11:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Gross <mgross@linux.intel.com>,
 linux-watchdog@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/3/21 10:54 AM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
>>> Hi guys,
>>>
>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>> immutable branch with a given tag, please pull to yours subsystems.
>>>
>>> (All changes are tagged by the respective maintainers)
> 
>> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
>> these 2 could be merged independently.
>>
>> Anyways I just did a test-merge and there is no conflict, so everything is ok.
>>
>> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
>> before the merge-window.
>>
>> I'm going to hold off on doing that for a bit for now in case one of the other
>> subsys maintainers has any objections.
> 
> Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?

I was going through all pending pdx86 stuff yesterday to prep for the upcoming
merge-window. I was doing so in FIFO order and I ran out of steam just as I got
to this pull-req.

So today is a new day and after sending out a fixes pull-req for 5.11 this is
(was) the first thing on my list.

I've merged this into my review-hans now (and I will push it to for-next soon).

I did one last check of all the commits after merging, and I found one small
issue.

The "gpio: msic: Remove driver for deprecated platform" commit forgets to
drop the Makefile line for the msic driver:

obj-$(CONFIG_GPIO_MSIC)                 += gpio-msic.o

This is not a reason to redo the entire branch, but it would be good if you
can do a follow up patch to fix this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
