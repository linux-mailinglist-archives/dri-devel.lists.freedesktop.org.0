Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3E9CDF9F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 14:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9A10E09D;
	Fri, 15 Nov 2024 13:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bnrMyOgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD2B10E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 13:12:33 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-720c2db824eso1654153b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731676353; x=1732281153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LGEvwwkAr2aRQ6piezavR8P7IeH13bFGESYh7zT6n3Q=;
 b=bnrMyOgU8swa4FlWZ6vJsV3+afREIUEHgvVnth9J11SyzjwSZinQyfkZDi4P2Ub6q8
 4TAk6t5zvMQtXK3rWQPzLqRqiHOMiMFpJewmS5lCfWPt8VeeRLrQz+GyogZXAo3ZTf1S
 lq0X+1zTwgWK9iKyWlQ3gl54KKl21pDdLlT+yFK6RgVuvZxsBpqIr8vKPOxwMXz3F678
 j8QXFNvus9KJU+bfWhA5w1ojD3rjiCdw7zCKmmWTbPO2fmXNT/pNIDGgnSZ8RZ7DIyzR
 Qaurlch7q83bZCPm4SibHCA3/UcrDg11qjjRX4hxBzR/Ys1n41koLVtTVlLAVgdFQZWs
 wn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731676353; x=1732281153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGEvwwkAr2aRQ6piezavR8P7IeH13bFGESYh7zT6n3Q=;
 b=nRfKNdpTTUtJ0pUXF5Iv7wCK1+Y8akU3I1R91mrqDi9Tagi/SOYvmGtC1l3sBET+GT
 1e4QtDppuRllvf4gGVcAcrZQ8/JyvEmj5tff7K4o14IIB0AMZ3PLO36dlej77EPotVSG
 ozwFO1bzS+DnW2kPDc6jCYAJB9LfrrZv8dQrT9vAu0TT/TMvQ9P4Arh1ukshmoSyPq1X
 dueWC388dnOU7PnEdSa2WhM3hRJxraP+FxbpH5e0312fuFYF6qWJKDs+FN35Evb/5Xs+
 pXf5HlhME3YQDB3C2DLGleY0lcJpsZWo4xSMNqMOMlidPW0sY07YcFb0NIGmBwJdx6jD
 RcRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjXMYiy8JLEenAQbW0FRAHhyjD9PDhDVKC88EKV1t7XeOwst0cNnN+s3gKgWyXomKJ2FzfTjeHcR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymrkOtrZkkwxA4yy1ZpPr8uZIAjp0xWqLU44dUoRlwda/Qy0vU
 eKTm9LNLa9q68mA8saspPNpI211p4zsMqygYVXhIRpUshfYdqC6pvQfodw==
X-Google-Smtp-Source: AGHT+IHiKmEPUcAwcTE7fjNZOdCEXpjeKSD795z8uynKB32CMsSboNyZ64DeBwOHh2qCU3Qne8r25Q==
X-Received: by 2002:a17:90b:1e0d:b0:2e9:5004:2502 with SMTP id
 98e67ed59e1d1-2ea154f7469mr2960960a91.13.1731676353255; 
 Fri, 15 Nov 2024 05:12:33 -0800 (PST)
Received: from ?IPV6:2409:40c0:48:969e:e221:9e2d:e416:1b41?
 ([2409:40c0:48:969e:e221:9e2d:e416:1b41])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea06ef6a7esm2734394a91.4.2024.11.15.05.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 05:12:32 -0800 (PST)
Message-ID: <333658df-a767-437f-9566-857e8ff5867f@gmail.com>
Date: Fri, 15 Nov 2024 18:42:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: metronomefb: Fix buffer overflow in
 load_waveform()
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241112202825.17322-1-surajsonawane0215@gmail.com>
 <7de29a8c-3325-4654-8afd-81f3f9a8d113@gmx.de>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <7de29a8c-3325-4654-8afd-81f3f9a8d113@gmx.de>
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

On 14/11/24 20:13, Helge Deller wrote:
> On 11/12/24 21:28, Suraj Sonawane wrote:
>> Fix an error detected by the Smatch tool:
>>
>> drivers/video/fbdev/metronomefb.c:220 load_waveform() error:
>> buffer overflow 'wfm_hdr->stuff2a' 2 <= 4
>> drivers/video/fbdev/metronomefb.c:220 load_waveform() error:
>> buffer overflow 'wfm_hdr->stuff2a' 2 <= 4
>>
>> The access to wfm_hdr->stuff2a in the loop can lead to a buffer
>> overflow if stuff2a is not large enough. To fix this, a check was
>> added to ensure that stuff2a has sufficient space before accessing
>> it. This prevents the overflow and improves the safety of the code.
>>
>> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
>> ---
>>   drivers/video/fbdev/metronomefb.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/metronomefb.c 
>> b/drivers/video/fbdev/metronomefb.c
>> index 6f0942c6e..9da55cef2 100644
>> --- a/drivers/video/fbdev/metronomefb.c
>> +++ b/drivers/video/fbdev/metronomefb.c
>> @@ -210,6 +210,12 @@ static int load_waveform(u8 *mem, size_t size, 
>> int m, int t,
>>       }
>>       wfm_hdr->mc += 1;
>>       wfm_hdr->trc += 1;
>> +
>> +    if (sizeof(wfm_hdr->stuff2a) < 5) {
>> +        dev_err(dev, "Error: insufficient space in stuff2a\n");
>> +        return -EINVAL;
>> +    }
>> +
>>       for (i = 0; i < 5; i++) {
>>           if (*(wfm_hdr->stuff2a + i) != 0) {
>>               dev_err(dev, "Error: unexpected value in padding\n");
> 
> That patch is completely wrong.
> There is
> /* the waveform structure that is coming from userspace firmware */
> struct waveform_hdr {
>          ....
>          u8 stuff2a[2];
>          u8 stuff2b[3];
> 
> So, I *believe* the for-next loop wants to walk acrosss stuff2a and 
> stuff2b,
> which have 5 entries together. So, basically the original code isn't nice
> but still correct.
> Your "sizeof()" check will always be false and is the wrong patch.
> 
> If at all, I think the stuff2a and stuff 2b arrays should be joined.
> Something like
>          u8 stuff2[5]; /* this is actually 2-entry stuff2a and 3-entry 
> stuff2b */
> But again, I don't know much about this driver.
> 
> Helge

Thank you for the brief feedback. I see your point regarding stuff2a and 
stuff2b. I’ll study this approach and revise the patch if I find it to 
be the correct solution.

Best regards,
Suraj Sonawane
