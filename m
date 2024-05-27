Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B68CF9AD
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A8610E3A9;
	Mon, 27 May 2024 07:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzZ0+Lkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDB10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:02:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-354e0d4db6cso3068391f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716793378; x=1717398178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhTDv/X2MzeaoxY9UlTupOqZ4dzoGfDZJ1jJv+dJqEs=;
 b=dzZ0+LkkOYTErBpDq3KS6Qk+ozJBf2YnvoEbJuCSrJaI65Uco2O3mTLsPbYYkYwhg0
 YROkNfVXCDg0OM1w6ZNM2mqRvwxeVM7pZDOyi6ul5e6SkZFLhLV1oSpuDZEdL+PBzOd0
 iqBeb5LNbI60fXI/N4S7zf4nZkCJjXEsfaCFdm3LnsdKCKWnADsGK+YeVtWzihXR3pIV
 NXcYhYep0OR5zzy5wHmnKZI7n8b0EzKbrMBGLfLEFDmtzAzpcya1a1gdBtawc0ikrXRG
 EjZWxDVX5XdJ6aarLCAJLNPZXehgD48o/LYknt+r7gXfaxVAbHh7vVK5A3sr218bMLfx
 pNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716793378; x=1717398178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhTDv/X2MzeaoxY9UlTupOqZ4dzoGfDZJ1jJv+dJqEs=;
 b=jqrDkrAy7zhojHS2IdGbva5YoMHocS81HFWTRrFGW3II1OT1BlyaYhbbVIsopQctr1
 8L/7UzLW5KWNeSxM5lf5hxbiD118V9Mld4W06nv55NpRA6YIBlpsZZK8ovXN0GHZP/5q
 7g85q7qllDgG66mRjeLsD31HF4Knhl1eRoF91EMIE2BLKgL4SqNNaxw/SwrutIT12Qlz
 0n4yh21q4/kA/pxWXgC3JRCCnlY2TyrkXIHn1d9VQNNKcxpHi6Hbn4E9X7DbnFmaA9W9
 m/9tpCBWEnl+GUGY5d2QuCOkfZFu7V1yIcGaQOqZKPHxGJGmxjrWYaVaebQa/qwzTSvT
 KQiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhKXfgjk31SGqZ/R2DmUw/e+yHyQyck3K8wWzEruJOZ3AHMAs1QYsxwVJ0woBaSxhwsQQ/t/E1fyclazgnL9N6G/JbKWNF2JVxaYOJZg2B
X-Gm-Message-State: AOJu0Ywk8+jtnSU8lTn/y6WviIWBxRBUcpDJcVCvF16d1+T0V/JedEds
 yr4nCTt+oltsJGsTtXexdVqmRvrn/6WquXHpUH4QW3aooe4cQBBZ
X-Google-Smtp-Source: AGHT+IFMEQcPgs6+ChlvQyh9qDP2U9NYMEM8C1RNoY8/vGGrII0iOFxxNC1K3BaB2DJMg89FFSCHqA==
X-Received: by 2002:a5d:4d85:0:b0:354:ed11:a20a with SMTP id
 ffacd0b85a97d-354f75a0adbmr10598776f8f.29.1716793377308; 
 Mon, 27 May 2024 00:02:57 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08aba8sm8089705f8f.42.2024.05.27.00.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 00:02:56 -0700 (PDT)
Message-ID: <0b04b587-77a4-4ac4-8b15-6cde0f0c5f5a@gmail.com>
Date: Mon, 27 May 2024 09:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw-sync: don't enable IRQ from
 sync_print_obj()
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian Konig <christian.koenig@amd.com>, Sean Paul
 <seanpaul@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <0000000000000946190610bf7bd5@google.com>
 <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
 <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
 <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
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

Am 24.05.24 um 15:26 schrieb Tetsuo Handa:
> On 2024/05/07 22:09, Christian König wrote:
>> Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
>>> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
>>> known context") by error replaced spin_unlock_irqrestore() with
>>> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
>>> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
>>> inconsistent lock state warning.
>>>
>>> Use plain spin_{lock,unlock}() for sync_print_obj(), for
>>> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>>>
>>> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
>>> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
>>> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thank you. Who can take this patch?

I pushed it to drm-misc-fixes.

Thanks,
Christian.

>
>>> ---
>>>    drivers/dma-buf/sync_debug.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>>> index 101394f16930..237bce21d1e7 100644
>>> --- a/drivers/dma-buf/sync_debug.c
>>> +++ b/drivers/dma-buf/sync_debug.c
>>> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>>>          seq_printf(s, "%s: %d\n", obj->name, obj->value);
>>>    -    spin_lock_irq(&obj->lock);
>>> +    spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>>>        list_for_each(pos, &obj->pt_list) {
>>>            struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>>>            sync_print_fence(s, &pt->base, false);
>>>        }
>>> -    spin_unlock_irq(&obj->lock);
>>> +    spin_unlock(&obj->lock);
>>>    }
>>>      static void sync_print_sync_file(struct seq_file *s,

