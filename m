Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0AB1911FA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5DF6E492;
	Tue, 24 Mar 2020 13:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0F86E492
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:50:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200324135016euoutp01bda1aac97406f9350386ffec671dd1ec~-Qa_WUqCj0390803908euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:50:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200324135016euoutp01bda1aac97406f9350386ffec671dd1ec~-Qa_WUqCj0390803908euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585057816;
 bh=CO6Q5YxaFJM13/GXn2w+f7Ptm3wnmYAz8/fZSrHINXg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Odq5XzkTTForQnaa3WqVNooRbjH7Xnzd0hrf4YwrQdDb2gZfHkbRw86g1Hz9f6Gnw
 +wFz/nzrMkx6wh50d0FCzHLMj/6IjPExoMpHXvW40dYDwc14uqgj+MnhJXV+p5o8pO
 G1PrpEx505d02IlXjQVpS/f0ZZjvMh+i21MCfTc0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200324135016eucas1p2cdc9ccdb5fa434d4773c3bef895e82f7~-Qa_ORT470764107641eucas1p2j;
 Tue, 24 Mar 2020 13:50:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3E.C8.60698.8101A7E5; Tue, 24
 Mar 2020 13:50:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200324135015eucas1p1b1a42eae32e4f3b2358cde82caf29b57~-Qa98Myyl0616006160eucas1p1m;
 Tue, 24 Mar 2020 13:50:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200324135015eusmtrp1866ae5ce1110f83be343eb91a7c4134b~-Qa97orGR2944629446eusmtrp1t;
 Tue, 24 Mar 2020 13:50:15 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-21-5e7a10183c4c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 02.B7.08375.7101A7E5; Tue, 24
 Mar 2020 13:50:15 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200324135015eusmtip20c5deec7609d3b74812af0d1a0e7758e~-Qa9oEsWW0442804428eusmtip2D;
 Tue, 24 Mar 2020 13:50:15 +0000 (GMT)
Subject: Re: [PATCH v3] video: fbdev: vesafb: add missed release_region
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <ede1ba08-3fd0-20f1-1641-461e89734316@samsung.com>
Date: Tue, 24 Mar 2020 14:50:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANhBUQ1JV3drHn-HO2urK-Q7yUNtLhk09UuBG7F=qV7Lid=0ww@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djPc7oSAlVxBnufsVpc+fqezWL2oZfM
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcxWWTkpqTWZZapG+XwJWxY/YNtoL1UhUX
 991jb2C8L9zFyMkhIWAi0bZjB0sXIxeHkMAKRonVr+awQThfGCWezJnODOF8ZpRYdaoXqIwD
 rGXPu3KI+HJGiYmrJ0N1vGWUuD9jMzPIXGEBd4lZk0ESnBwiAuoSn3ftZAexmQXSJTbNOggW
 ZxOwkpjYvooRxOYVsJO4/PoJWJxFQFXiXOcrsHpRgQiJTw8Os0LUCEqcnPmEBcTmFAiUODP7
 JRvETHGJW0/mM0HY8hLb384Bu1pCoJtdYvWem0wQj7pI/Lr8C8oWlnh1fAs7hC0jcXpyDwtE
 wzpGib8dL6C6tzNKLJ/8jw2iylrizrlfbCD/MwtoSqzfpQ8RdpTYM+syOyRY+CRuvBWEOIJP
 YtI2UNCBhHklOtqEIKrVJDYs28AGs7Zr50rmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW5
 6anFxnmp5XrFibnFpXnpesn5uZsYgSnl9L/jX3cw7vuTdIhRgINRiYdX42FlnBBrYllxZe4h
 RgkOZiUR3s2pFXFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJx
 cEo1MB5SDN50+bSU7vL05P8qwgt/Z7ad7/6+ZkJl3dHWG/IK705/ZVx0hI33sfqdFr3Ynw+f
 uT94V7NZefWdVqnkvQGO1lu4f83gTeCq+rZtbfS5yK+vzs15fkJwM6NnrX/uqXWzOJrvRutM
 ZTG9Gr8x5EP4nCI27h0czMJuyY9NfTuX9iwNXXLjr6USS3FGoqEWc1FxIgCXlc38JQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7riAlVxBlN69S2ufH3PZjH70Etm
 ixN9H1gtLu+aw+bA4rFz1l12j/vdx5k8Pm+SC2CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAz
 MrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvYMfsGW8F6qYqL++6xNzDeF+5i5OCQEDCR2POu
 vIuRk0NIYCmjxKF+G4iwjMTx9WUgYQkBYYk/17rYuhi5gEpeM0p8X36VCSQhLOAuMWvyZDYQ
 W0RAXeLzrp3sIDazQLrExG1HmSAaOpkk5hw5xQiSYBOwkpjYvgrM5hWwk7j8+glYM4uAqsS5
 zldgzaICERKHd8yCqhGUODnzCQuIzSkQKHFm9ks2iAXqEn/mXWKGsMUlbj2ZzwRhy0tsfzuH
 eQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgfGz7djPzTsY
 L20MPsQowMGoxMOr8bAyTog1say4MvcQowQHs5II7+bUijgh3pTEyqrUovz4otKc1OJDjKZA
 z01klhJNzgfGdl5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsaM
 M7NYDGzlp3DEHqnuW3mQ4bnq5+CCkOgdDomzjrysKlm5vYtpce0X7aS5ot1LEqt6HewUFzm7
 WD7+/dholansOv/S3IwojYNu191e2LiYxfxlf/A7i8n34utm1/idOT84nB27k/K3Lby8eGHB
 mh3hcpukzCbM/ykgUb9If0F7/fw//qba6kosxRmJhlrMRcWJAFLdO4+1AgAA
X-CMS-MailID: 20200324135015eucas1p1b1a42eae32e4f3b2358cde82caf29b57
X-Msg-Generator: CA
X-RootMTR: 20200310023550eucas1p10797f834d7dc16f634cf644011462393
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310023550eucas1p10797f834d7dc16f634cf644011462393
References: <CGME20200310023550eucas1p10797f834d7dc16f634cf644011462393@eucas1p1.samsung.com>
 <20200310023536.13622-1-hslester96@gmail.com>
 <1f5e6f52-c638-f73e-cf9d-88eb641a010d@samsung.com>
 <CANhBUQ1JV3drHn-HO2urK-Q7yUNtLhk09UuBG7F=qV7Lid=0ww@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/20 2:35 PM, Chuhong Yuan wrote:
> On Fri, Mar 20, 2020 at 8:01 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>
>>
>> On 3/10/20 3:35 AM, Chuhong Yuan wrote:
>>> The driver forgets to free the I/O region in remove and probe
>>> failure.
>>> Add the missed calls to fix it.
>>>
>>> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>>> ---
>>> Changes in v3:
>>>   - Revise the commit message.
>>>   - Add an error handler to suit the "goto error" before request_region().
>>>   - Revise the order of operations in remove.
>>>
>>>  drivers/video/fbdev/vesafb.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
>>> index a1fe24ea869b..c7bc9ace47d4 100644
>>> --- a/drivers/video/fbdev/vesafb.c
>>> +++ b/drivers/video/fbdev/vesafb.c
>>> @@ -439,7 +439,7 @@ static int vesafb_probe(struct platform_device *dev)
>>>                      "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
>>>                       vesafb_fix.smem_len, vesafb_fix.smem_start);
>>>               err = -EIO;
>>> -             goto err;
>>> +             goto err_release_region;
>>>       }
>>>
>>>       printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
>>> @@ -458,15 +458,17 @@ static int vesafb_probe(struct platform_device *dev)
>>>
>>>       if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>>>               err = -ENOMEM;
>>> -             goto err;
>>> +             goto err_release_region;
>>>       }
>>>       if (register_framebuffer(info)<0) {
>>>               err = -EINVAL;
>>>               fb_dealloc_cmap(&info->cmap);
>>> -             goto err;
>>> +             goto err_release_region;
>>>       }
>>>       fb_info(info, "%s frame buffer device\n", info->fix.id);
>>>       return 0;
>>> +err_release_region:
>>> +     release_region(0x3c0, 32);
>>
>> This is incorrect.
>>
>> The cleanup order should be the reverse of the probing order.
>>
>> Also request_region() return value is not checked by the driver
>> (there is a comment that it can fail and is optional):
>>
>>         /* request failure does not faze us, as vgacon probably has this
>>          * region already (FIXME) */
>>         request_region(0x3c0, 32, "vesafb");
>>
>> so what would happen in such case? It seems that unconditionally
>> doing the release will result in freeing the I/O region owned by
>> the other driver (vgacon)..
>>
> 
> Maybe we can add a field to represent whether the request succeeds?
> request_region() returns source *, we can store it and check whether
> it is null when
> we are going to call release_region().

Yes, this is a preferred approach. 

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>>  err:
>>>       arch_phys_wc_del(par->wc_cookie);
>>>       if (info->screen_base)
>>> @@ -481,6 +483,7 @@ static int vesafb_remove(struct platform_device *pdev)
>>>       struct fb_info *info = platform_get_drvdata(pdev);
>>>
>>>       unregister_framebuffer(info);
>>> +     release_region(0x3c0, 32);
>>>       framebuffer_release(info);
>>>
>>>       return 0;
>>>
>>
>> Best regards,
>> --
>> Bartlomiej Zolnierkiewicz
>> Samsung R&D Institute Poland
>> Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
