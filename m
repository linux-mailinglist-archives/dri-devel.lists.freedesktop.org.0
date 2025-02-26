Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D031A4536E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579D510E835;
	Wed, 26 Feb 2025 02:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ncPmtl3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5503310E835
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 02:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 From; bh=t4M/BGXUS6ST6WvO8ZFmW0n/bzf+po4t224uCWIWtUU=; b=ncPmtl3
 Y6adixXZYlcd2MGHAwXnB9ui1YllNDUOrPJVNdTzQCPJAbOxi5vB2UUJ3iCwlstq
 Hk/lpZ1Oc2yNhlIuZXeCuNaD0LACG90O5rOhNFDpo6IyP/8BQ9RHPeUYnSiVwzCz
 Y2DmQQ5SwColZOtI8ktWS6wU+4dFp1wFvM6k=
Received: from [10.42.20.80] (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgCnWZYIgr5nou4XBA--.22370S2;
 Wed, 26 Feb 2025 10:52:59 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------KOpXOmj5NlMOkL14yG4wxTQg"
Message-ID: <9ec1ac6c-903e-9605-e8ad-3e555db4625c@163.com>
Date: Wed, 26 Feb 2025 10:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
Content-Language: en-US
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250220085358.232883-1-oushixiong1025@163.com>
 <Z72bMsXmoQv1UVv0@bart.dudau.co.uk>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <Z72bMsXmoQv1UVv0@bart.dudau.co.uk>
X-CM-TRANSID: PygvCgCnWZYIgr5nou4XBA--.22370S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1kZFy3CrW3Xw4DtFy7ZFb_yoW5XF4rpa
 1DJ3WYqryDK3Way39rAa1UuFyrGws7Ww47GrW5uw13u343AF18KF98JFWqyrZrJFWSkF1a
 q3Z7Wry7uFn3Kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-4SwUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxAAD2e+eIPh+wAAsE
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

This is a multi-part message in MIME format.
--------------KOpXOmj5NlMOkL14yG4wxTQg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello,

In my opinion, the corresponding error handling has already been 
implemented in
sysfs_create_group(), so we do not need to call sysfs_remove_group() if 
sysfs_create_group() fails.


Thanks and Regards,
Shixiong Ou.


在 2025/2/25 18:28, Liviu Dudau 写道:
> Hello,
>
> Replying from my personal email as the corporate system seems to have blackholed your emails
> while I was on holiday.
>
> Can you tell me more why you think that if sysfs_create_group() fails we should not call
> sysfs_remove_group()? After all, we don't know how far sysfs_create_group() has progressed before
> it encountered an error, so we still need to do some cleanup.
>
> Best regards,
> Liviu
>
> On Thu, Feb 20, 2025 at 04:53:58PM +0800,oushixiong1025@163.com  wrote:
>> From: Shixiong Ou<oushixiong@kylinos.cn>
>>
>> [WHY] If the call to sysfs_create_group() fails, there is
>>        no need to call function sysfs_remove_group().
>>
>> [HOW] Add a condition check before removing sysfs attribute.
>>
>> Signed-off-by: Shixiong Ou<oushixiong@kylinos.cn>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 7 ++++++-
>>   drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 ++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
>> index 5ba62e637a61..7d646f978640 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
>> @@ -259,6 +259,8 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>>   		goto err_cleanup;
>>   	}
>>   
>> +	mdev->sysfs_attr_enabled = true;
>> +
>>   	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
>>   
>>   	komeda_debugfs_init(mdev);
>> @@ -278,7 +280,10 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>>   	const struct komeda_dev_funcs *funcs = mdev->funcs;
>>   	int i;
>>   
>> -	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
>> +	if (mdev->sysfs_attr_enabled) {
>> +		sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
>> +		mdev->sysfs_attr_enabled = false;
>> +	}
>>   
>>   	debugfs_remove_recursive(mdev->debugfs_root);
>>   
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
>> index 5b536f0cb548..af087540325c 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
>> @@ -216,6 +216,8 @@ struct komeda_dev {
>>   #define KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT BIT(8)
>>   	/* Disable rate limiting of event prints (normally one per commit) */
>>   #define KOMEDA_DEV_PRINT_DISABLE_RATELIMIT BIT(12)
>> +
>> +	bool sysfs_attr_enabled;
>>   };
>>   
>>   static inline bool
>> -- 
>> 2.17.1
>>
--------------KOpXOmj5NlMOkL14yG4wxTQg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="DejaVu Sans Mono"><br>
      </font></p>
    <p><font face="DejaVu Sans Mono">Hello,</font></p>
    <p><font face="DejaVu Sans Mono">In my opinion, the corresponding
        error handling has already been implemented in </font><br>
      sysfs_create_group()<font face="DejaVu Sans Mono">, so </font>we
      do not need to call sysfs_remove_group() if sysfs_create_group()
      fails.</p>
    <p><font face="DejaVu Sans Mono"></font></p>
    <p><font face="DejaVu Sans Mono"><br>
      </font></p>
    <p>Thanks and Regards,<br>
      Shixiong Ou.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/2/25 18:28, Liviu Dudau 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:Z72bMsXmoQv1UVv0@bart.dudau.co.uk">
      <pre class="moz-quote-pre" wrap="">Hello,

Replying from my personal email as the corporate system seems to have blackholed your emails
while I was on holiday.

Can you tell me more why you think that if sysfs_create_group() fails we should not call
sysfs_remove_group()? After all, we don't know how far sysfs_create_group() has progressed before
it encountered an error, so we still need to do some cleanup.

Best regards,
Liviu

On Thu, Feb 20, 2025 at 04:53:58PM +0800, <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>

[WHY] If the call to sysfs_create_group() fails, there is
      no need to call function sysfs_remove_group().

[HOW] Add a condition check before removing sysfs attribute.

Signed-off-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 7 ++++++-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 5ba62e637a61..7d646f978640 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -259,6 +259,8 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 		goto err_cleanup;
 	}
 
+	mdev-&gt;sysfs_attr_enabled = true;
+
 	mdev-&gt;err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
 
 	komeda_debugfs_init(mdev);
@@ -278,7 +280,10 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 	const struct komeda_dev_funcs *funcs = mdev-&gt;funcs;
 	int i;
 
-	sysfs_remove_group(&amp;dev-&gt;kobj, &amp;komeda_sysfs_attr_group);
+	if (mdev-&gt;sysfs_attr_enabled) {
+		sysfs_remove_group(&amp;dev-&gt;kobj, &amp;komeda_sysfs_attr_group);
+		mdev-&gt;sysfs_attr_enabled = false;
+	}
 
 	debugfs_remove_recursive(mdev-&gt;debugfs_root);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index 5b536f0cb548..af087540325c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -216,6 +216,8 @@ struct komeda_dev {
 #define KOMEDA_DEV_PRINT_DUMP_STATE_ON_EVENT BIT(8)
 	/* Disable rate limiting of event prints (normally one per commit) */
 #define KOMEDA_DEV_PRINT_DISABLE_RATELIMIT BIT(12)
+
+	bool sysfs_attr_enabled;
 };
 
 static inline bool
-- 
2.17.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------KOpXOmj5NlMOkL14yG4wxTQg--

