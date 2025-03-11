Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACECA5BA24
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1942910E104;
	Tue, 11 Mar 2025 07:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Aial+nO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A63B10E104
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=T+nEAcVgdWXpw1h1GUtHc8qOgTf3PIgbErKLx/i6IKI=;
 b=Aial+nO323EJNbsJZq3UX2wEEH2MPHjU79y58wkfS2c1BmC62a/CcjteRosKBd
 UrI63uczYTXOkRdKTjJ9h++rBCvb/70A3MCW3Awp2sxy5wihUGcKmKwg7HxDFuLt
 cqHscGd4Rc8uuXGlkNYlxgJ4D40nmdjAtVFh4xsX6iMLU=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDXf4rJ6s9nMn6xRw--.33271S2; 
 Tue, 11 Mar 2025 15:48:26 +0800 (CST)
Message-ID: <503d5b4c-4fc8-a971-0745-617f49022fe8@163.com>
Date: Tue, 11 Mar 2025 15:48:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] fbdev: fsl-diu-fb: add missing device_remove_file()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Timur Tabi <timur@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250309081607.27784-1-oushixiong1025@163.com>
 <0a15e04f-bd6d-4c2b-a8e1-708880fa433c@gmx.de>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <0a15e04f-bd6d-4c2b-a8e1-708880fa433c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXf4rJ6s9nMn6xRw--.33271S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF48CFyxKF1rGFWxXw1rXrb_yoW8CryrpF
 WxXay5KrWDtr1UGwnFgw4xu3WYqw4Iy34xZryIkay3Wr909FyDXas5GF18Ca9YvrWkC3Wa
 va4UtryY9F9rWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR6BTOUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwEND2fP5d9gcgAAsg
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

Yeah, you are right, but I believe it would be better to retain the checks.
Anyway, I have submitted the V3 patch which has dropped the checks.


Thanks and Regards,
Shixiong Ou.

在 2025/3/10 03:42, Helge Deller 写道:
> On 3/9/25 09:16, Shixiong Ou wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> Call device_remove_file() when driver remove.
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>> v1->v2:
>>     add has_sysfs_attrs flag.
>>
>>   drivers/video/fbdev/fsl-diu-fb.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/fsl-diu-fb.c 
>> b/drivers/video/fbdev/fsl-diu-fb.c
>> index 5ac8201c3533..57f7fe6a4c76 100644
>> --- a/drivers/video/fbdev/fsl-diu-fb.c
>> +++ b/drivers/video/fbdev/fsl-diu-fb.c
>> @@ -384,6 +384,7 @@ struct fsl_diu_data {
>>       __le16 next_cursor[MAX_CURS * MAX_CURS] __aligned(32);
>>       uint8_t edid_data[EDID_LENGTH];
>>       bool has_edid;
>> +    bool has_dev_attr;
>>   } __aligned(32);
>>
>>   /* Determine the DMA address of a member of the fsl_diu_data 
>> structure */
>> @@ -1809,6 +1810,7 @@ static int fsl_diu_probe(struct platform_device 
>> *pdev)
>>               data->dev_attr.attr.name);
>>       }
>>
>> +    data->has_dev_attr = true;
>>       dev_set_drvdata(&pdev->dev, data);
>>       return 0;
>>
>> @@ -1827,6 +1829,10 @@ static void fsl_diu_remove(struct 
>> platform_device *pdev)
>>       int i;
>>
>>       data = dev_get_drvdata(&pdev->dev);
>> +
>> +    if (data->has_dev_attr)
>
> Looking at other drivers (e.g. drivers/net/can/usb/esd_usb.c) it seems
> that device_remove_file() is ok even if it's not fully initialized...
>
> I think you can drop those extra checks.
>
> Helge
>
>
>> + device_remove_file(&pdev->dev, &data->dev_attr);
>> +
>>       disable_lcdc(&data->fsl_diu_info[0]);
>>
>>       free_irq(data->irq, data->diu_reg);

