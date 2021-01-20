Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD82FCEE6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 12:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADF86E182;
	Wed, 20 Jan 2021 11:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8096E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611141371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SH3cllGy47s4uG7KKFq5cbuIDOd88jk3S+0uW2/kAA=;
 b=ErPGGirxnEDzfp9ierjDLgwlp+MXCC4XDpDI7oSM4DTb/P4FYiA8xe+vtd8BtJ/r6TPG/t
 UUVMMsVk1vJJ50xstWNMZ3xKN9E8w1QpnVuUWmEb8G2BS43kwChczRzbGta5og8rjgx1Sm
 0eUT2EXhLf03PVqv6KdYrJlU3gYObBc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-TFhwAjvcP7if3-_T4kr2_Q-1; Wed, 20 Jan 2021 06:16:06 -0500
X-MC-Unique: TFhwAjvcP7if3-_T4kr2_Q-1
Received: by mail-ed1-f69.google.com with SMTP id r4so1633350eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 03:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0SH3cllGy47s4uG7KKFq5cbuIDOd88jk3S+0uW2/kAA=;
 b=lujjL5H+Bj8PVa9FaQoFgb5NkVCjxk5wg04BHoK5qXOeZdsR2k0OuJo6KmlnF+jUao
 XYBag6qON1T9aVmfRB/gweD7yN6RFRrfhqq1fMEKUVTacfmA5o/n0c8chziFbXRHw0PS
 iByLNKqX+I68/QRTiDSoySksEsN5ano5MInCVa7T6xuLQJnE0OkMj4ehWU3Kz156yZPy
 M6FkvhaSCRQIEOgZ1922KyZr+UjwIyzBwQ/UkmrhD5CzIzPlTVfDHXpYFetk9wxUDfb8
 Q71zV8WSc2Z/HlESYuiOOZB3ARcnzho44A0SBrXm6Usna4AIebdBklnjPMy0w2NWX8d/
 Sx7Q==
X-Gm-Message-State: AOAM5334hUj0shM4/LXFFxueyK0IHjIvMXgTQRW4EIRQkO8tp56w3TSk
 0oJyCaKbTzgrYYaq5kQT3bA3WJ+3gmauUXlzNjVDYUS4al0vrMHHddvMsan5CEzp34U4friohS2
 SMEHpVp5P4DJocV6WLxNR0EhD+iSK4bj+J7X51R8rdHHh50cjifZYmJ2fpEP5kJqzhPL821VdhR
 gzm+PZ
X-Received: by 2002:a05:6402:b6f:: with SMTP id
 cb15mr6813590edb.277.1611141365235; 
 Wed, 20 Jan 2021 03:16:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF2jPpquEnV42x9rBfnay/MufY16FX0dQBH+/yFA2JSgaTGzzyq/yUsEFfmDEcT9RdGF+T3w==
X-Received: by 2002:a05:6402:b6f:: with SMTP id
 cb15mr6813578edb.277.1611141365064; 
 Wed, 20 Jan 2021 03:16:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id k16sm747754ejd.78.2021.01.20.03.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 03:16:03 -0800 (PST)
Subject: Re: [PATCH] video: fbdev: simplefb: Fix info message during probe
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201228183934.1117012-1-pbrobinson@gmail.com>
 <b00bd27c-70b5-9ef1-85a1-11e733af78da@redhat.com>
 <X/c/OwqdMtmqzOZq@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1acc822f-b7a5-b0be-5533-32528080850a@redhat.com>
Date: Wed, 20 Jan 2021 12:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X/c/OwqdMtmqzOZq@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/7/21 6:04 PM, Daniel Vetter wrote:
> Hi Hans,
> 
> On Tue, Dec 29, 2020 at 02:02:30PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 12/28/20 7:39 PM, Peter Robinson wrote:
>>> The info message was showing the mapped address for the framebuffer. To avoid
>>> security problems, all virtual addresses are converted to __ptrval__, so
>>> the message has pointless information:
>>>
>>> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes, mapped to 0x(____ptrval____)
>>>
>>> Drop the extraneous bits to clean up the message:
>>>
>>> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Since you have commit rights for drm-misc I'm assuming you're also going
> to push this one?

I knew there was some discussion about using drm-misc for drivers/video/fbdev stuff
but I missed that it was decided to go ahead with that.

Good to know that this is handled through drm-misc now.

I've pushed this patch to drm-misc-next.

Regards,

Hans



>>> ---
>>>  drivers/video/fbdev/simplefb.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>>> index 533a047d07a2..62f0ded70681 100644
>>> --- a/drivers/video/fbdev/simplefb.c
>>> +++ b/drivers/video/fbdev/simplefb.c
>>> @@ -477,9 +477,8 @@ static int simplefb_probe(struct platform_device *pdev)
>>>  	simplefb_clocks_enable(par, pdev);
>>>  	simplefb_regulators_enable(par, pdev);
>>>  
>>> -	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
>>> -			     info->fix.smem_start, info->fix.smem_len,
>>> -			     info->screen_base);
>>> +	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes\n",
>>> +			     info->fix.smem_start, info->fix.smem_len);
>>>  	dev_info(&pdev->dev, "format=%s, mode=%dx%dx%d, linelength=%d\n",
>>>  			     params.format->name,
>>>  			     info->var.xres, info->var.yres,
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
