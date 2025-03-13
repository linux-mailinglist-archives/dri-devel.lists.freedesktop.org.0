Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FE7A5F445
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DE210E87B;
	Thu, 13 Mar 2025 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FKu/JJlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0D9E10E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=XucCiIwmgnKrM+4X4lFNl57ZLjITn7kJphhA+Oj0LjQ=;
 b=FKu/JJlCSsx2cRdDGef0GLwb6mxLObMPMA12ZaiCUQHVWAKegBfP6ovXqGLdjo
 GLuGTwyH/re9WudpbX/nHXCbxC0JQrwMYInndM6ezcrIS0jiGLqJUguqqxPicaOP
 eNZTcG4GrgKk1S6u7Qe8NWn8dHJbK7OUAmd2zBczhZl2Q=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wBnh_qTztJnXiYgRg--.5166S2; 
 Thu, 13 Mar 2025 20:24:53 +0800 (CST)
Message-ID: <f6011b3e-97f1-8ead-b9a8-933a015c59ad@163.com>
Date: Thu, 13 Mar 2025 20:24:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] fbcon: Register sysfs groups through device_add_group
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250311112856.1020095-1-oushixiong1025@163.com>
 <20250312173916-23dd381c-2111-413f-8b90-6bda1faaf3d5@linutronix.de>
Content-Language: en-US
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <20250312173916-23dd381c-2111-413f-8b90-6bda1faaf3d5@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnh_qTztJnXiYgRg--.5166S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1UKr4DJF4DJw4fXw4xWFg_yoWruFyUpr
 WDJayYgFW5GrnrWr4avw4DXwnIg3yvk34fJrs7Kw1fK3Z7Aasaqa48JFyUCa4FyF97GF1x
 J34Dtry8CFWv9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOtxDUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxsPD2fSyBB-lAAAs+
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


在 2025/3/13 00:47, Thomas Weißschuh 写道:
> Hi,
>
> On Tue, Mar 11, 2025 at 07:28:55PM +0800, oushixiong1025@163.com wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> Use device_add_group() to simplify creation and removal.
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 48 +++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 07d127110ca4..51c3e8a5a092 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -3159,7 +3159,7 @@ static const struct consw fb_con = {
>>   	.con_debug_leave	= fbcon_debug_leave,
>>   };
>>   
>> -static ssize_t store_rotate(struct device *device,
>> +static ssize_t rotate_store(struct device *device,
>>   			    struct device_attribute *attr, const char *buf,
>>   			    size_t count)
>>   {
>> @@ -3181,7 +3181,7 @@ static ssize_t store_rotate(struct device *device,
>>   	return count;
>>   }
>>   
>> -static ssize_t store_rotate_all(struct device *device,
>> +static ssize_t rotate_all_store(struct device *device,
>>   				struct device_attribute *attr,const char *buf,
>>   				size_t count)
>>   {
>> @@ -3203,7 +3203,7 @@ static ssize_t store_rotate_all(struct device *device,
>>   	return count;
>>   }
>>   
>> -static ssize_t show_rotate(struct device *device,
>> +static ssize_t rotate_show(struct device *device,
>>   			   struct device_attribute *attr,char *buf)
>>   {
>>   	struct fb_info *info;
>> @@ -3222,7 +3222,7 @@ static ssize_t show_rotate(struct device *device,
>>   	return sysfs_emit(buf, "%d\n", rotate);
>>   }
>>   
>> -static ssize_t show_cursor_blink(struct device *device,
>> +static ssize_t cursor_blink_show(struct device *device,
>>   				 struct device_attribute *attr, char *buf)
>>   {
>>   	struct fb_info *info;
>> @@ -3247,7 +3247,7 @@ static ssize_t show_cursor_blink(struct device *device,
>>   	return sysfs_emit(buf, "%d\n", blink);
>>   }
>>   
>> -static ssize_t store_cursor_blink(struct device *device,
>> +static ssize_t cursor_blink_store(struct device *device,
>>   				  struct device_attribute *attr,
>>   				  const char *buf, size_t count)
>>   {
>> @@ -3281,32 +3281,30 @@ static ssize_t store_cursor_blink(struct device *device,
>>   	return count;
>>   }
>>   
>> -static struct device_attribute device_attrs[] = {
>> -	__ATTR(rotate, S_IRUGO|S_IWUSR, show_rotate, store_rotate),
>> -	__ATTR(rotate_all, S_IWUSR, NULL, store_rotate_all),
>> -	__ATTR(cursor_blink, S_IRUGO|S_IWUSR, show_cursor_blink,
>> -	       store_cursor_blink),
>> +static DEVICE_ATTR_RW(rotate);
>> +static DEVICE_ATTR_WO(rotate_all);
>> +static DEVICE_ATTR_RW(cursor_blink);
>> +
>> +static struct attribute *fbcon_device_attrs[] = {
>> +	&dev_attr_rotate.attr,
>> +	&dev_attr_rotate_all.attr,
>> +	&dev_attr_cursor_blink.attr,
>> +	NULL,
> No trailing commas after sentinel values.
>
>> +};
>> +
>> +static const struct attribute_group fbcon_device_attr_group = {
>> +	.attrs		= fbcon_device_attrs,
>>   };
>>   
>>   static int fbcon_init_device(void)
>>   {
>> -	int i, error = 0;
>> +	int ret;
>>   
>>   	fbcon_has_sysfs = 1;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(device_attrs); i++) {
>> -		error = device_create_file(fbcon_device, &device_attrs[i]);
>> -
>> -		if (error)
>> -			break;
>> -	}
>> -
>> -	if (error) {
>> -		while (--i >= 0)
>> -			device_remove_file(fbcon_device, &device_attrs[i]);
>> -
>> +	ret = device_add_group(fbcon_device, &fbcon_device_attr_group);
>> +	if (ret)
>>   		fbcon_has_sysfs = 0;
>> -	}
>>   
>>   	return 0;
>>   }
>> @@ -3389,11 +3387,9 @@ void __init fb_console_init(void)
>>   
>>   static void __exit fbcon_deinit_device(void)
>>   {
>> -	int i;
>>   
>>   	if (fbcon_has_sysfs) {
>> -		for (i = 0; i < ARRAY_SIZE(device_attrs); i++)
>> -			device_remove_file(fbcon_device, &device_attrs[i]);
>> +		device_remove_group(fb_info->dev, &fbcon_device_attr_group);
> Please at least compile-test your changes before submission.
>
>>   
>>   		fbcon_has_sysfs = 0;
>>   	}
> All of this can be simplified even more:
>
> * fbcon_deinit_device() can be removed easily, as the attributes are
>    automatically removed when the device is destroyed.
> * Using device_create_with_groups() the device core will take complete care of
>    the attribute lifecycle, also allowing to remove fbcon_init_device()

Thanks for your advice, I will fix and refactor this code in the next patch.

Thanks and Regards,
Shixiong Ou.

>
> Thomas

