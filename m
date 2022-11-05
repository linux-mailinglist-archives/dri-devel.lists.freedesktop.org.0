Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5161D8A3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597EA10E106;
	Sat,  5 Nov 2022 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906B10E106
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 08:12:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z18so10597429edb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Nov 2022 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bsgs5v64dtrb9BK/zWIG40Cs+14Xzy/n1UZhAs2SA7Y=;
 b=Hpkuv3FuzjPSSr0s6F44u38vgcNHlm+qRMjeYeN7DIsx21Rsy9qLhJ5oEBuE8cQ/7f
 gOpz2Bj3B67JNdQamqt+Ozf3edx8hu0xz2RHktD9bpO+nylhjuNAMYwnNwIo6b8qnozZ
 fg+ig/rNBELojRZmBxz/AFPKmosHpIsdl3Ju11XgzLo3q5iaKErlZ2h+34ofKgjDmYMx
 u2/wfAHx5OKbtXlQlZ6UHEX9imLI/gmldPXHirM2E3tNxpKd9wKRRnpSDehfprqIsuRW
 iIw7B+dKVDa8x/owDtPwtAVGd1JZmZFj1TbtOAEO2j4z80eTYAYboWNN9dEvDbq0JYlh
 ivww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsgs5v64dtrb9BK/zWIG40Cs+14Xzy/n1UZhAs2SA7Y=;
 b=TJDtEZcba45rTnObZb8rwE4gWpgfk6mHqyIUUtA+wDy8hc++zrfFu0oc60K2vm7QHI
 E0mHt4MECuAuIn+AhrxqQiHHLTG5UN7nCpNSokfXoXNd0utuk+GoG/v65/f8C0Fm5tWj
 3GVz97T4bd+G6yAvG8uNWWF4Soes3jHf+b2/3nB2mf2KqOs43Wkv4l9JfZ6UW5dfqhy2
 sCDR5pJk/dcC3Aig3Oa6GiI+bTGYovTzRt1ZkSgP517PCYGUNcfZNmiWbAR9s4CzNTz3
 /tsLyyc10dNDcCUGuVVKaIGbio54MStcm9gT5IheUNTTnuXer3k3yNMZeiRximcH/mw3
 I4sQ==
X-Gm-Message-State: ACrzQf2HJ7r/UueYMI1lzikmsRnnCKFbs4nnKCr24wyfF0XJdQz4Diin
 fkJYQi/pTLXcUymkaPITbBM=
X-Google-Smtp-Source: AMsMyM7fGIPxzSTLIQa+n/MHhyw5CshqI5Un4z11aCmNOAlJoBCo/++l8HBiFLG3r6/zKNcOCfRZrQ==
X-Received: by 2002:aa7:c956:0:b0:43b:206d:c283 with SMTP id
 h22-20020aa7c956000000b0043b206dc283mr39516948edt.381.1667635959118; 
 Sat, 05 Nov 2022 01:12:39 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:9819:17f5:ee0c:a9e6?
 ([2a02:908:1256:79a0:9819:17f5:ee0c:a9e6])
 by smtp.gmail.com with ESMTPSA id
 cm21-20020a0564020c9500b00461a6997c5dsm804192edb.83.2022.11.05.01.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 01:12:38 -0700 (PDT)
Message-ID: <d50ea531-c5cf-81d5-9cc5-0ab92b39232d@gmail.com>
Date: Sat, 5 Nov 2022 09:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Linaro-mm-sig] Re: [RFC][PATCH v3 12/33] timers: dma-buf: Use
 timer_shutdown_sync() before freeing timer
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221104054053.431922658@goodmis.org>
 <20221104054914.085569465@goodmis.org>
 <20221104015444.57f73efb@rorschach.local.home>
 <d916e29d-d098-c3f3-940a-37be6772ecb5@amd.com>
 <20221104145804.4ec8404e@rorschach.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221104145804.4ec8404e@rorschach.local.home>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.11.22 um 19:58 schrieb Steven Rostedt:
> On Fri, 4 Nov 2022 08:15:53 +0100
> Christian König <christian.koenig@amd.com> wrote:
>
>>> index fb6e0a6ae2c9..5d3e7b503501 100644
>>> --- a/drivers/dma-buf/st-dma-fence.c
>>> +++ b/drivers/dma-buf/st-dma-fence.c
>>> @@ -412,7 +412,7 @@ static int test_wait_timeout(void *arg)
>>>    
>>>    	err = 0;
>>>    err_free:
>>> -	del_timer_sync(&wt.timer);
>>> +	timer_shutdown_sync(&wt.timer);
>> Mhm, what exactly is the benefit of renaming the function?
>>
>> Not that I'm against the change, but my thinking is more if there are
>> more functions which don't re-arm the time than those which do that then
>> why not forbid it in general?
> Timers are more often re-armed then not. I had to look for the
> locations where del_timer*() was called just before freeing, and other
> locations where they are freed later.
>
> I didn't rename del_timer_sync() to timer_shutdown_sync(), this version
> renamed the new "del_timer_shutdown()" to "timer_shutdown_sync()".
>
> Maybe I'm just confused at what you are asking.

No, that explains it a bit better. I was just wondering what exactly the 
different to del_timer_sync() is.

Maybe shorten the summary in the cover letter a bit. The history how 
this change came to be is not as interesting as why we are changing 
something.

Regards,
Christian.

>
> -- Steve
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

