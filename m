Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32411989FC4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 12:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1125D10E2E0;
	Mon, 30 Sep 2024 10:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e3DDNj1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74210E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 10:49:27 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so496311fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727693365; x=1728298165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pk/IQpIx4DLxA97Vmksb4CkAHqJEUEqnzzR2CFO7sSg=;
 b=e3DDNj1X1UKOEc9zbT5OD362rtwM1tLBTXQmqsopLKeXtuXlDRIqQ23aAG/3GXW8Uh
 8elDNpYUda83Omag5k6UuGhoXwqVfXIQA1nWKsXFKLMZctVBSA+u6zEqUvDoLzUTA4Xd
 Sc0djce2ameNvV7iPKqdowp2t5j83Lu3c1pvYJqdOV9AORFiJtMnOAsCSlLoYSFNaKVA
 bQiuekKZygIVtT0Xc6eFoR/+YBS5oclljHsDa0+Ddzv4P7v96mUaMIwnr8EZ6p2ZFKNz
 oSnhpPPDhEab1GsiFF7AVt9/E4+ZO4mtFNjTBp36jsbDcIvhOcDwLOFNM3fmq2VSVCUA
 YNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727693365; x=1728298165;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pk/IQpIx4DLxA97Vmksb4CkAHqJEUEqnzzR2CFO7sSg=;
 b=Y2AP1kg2KRh0SxQWd5imEPx4CD1+yU3apg9q33RomWK+DUtTrCRpL6T3jU4RhvBS27
 EDYnY6h2hM4XIuvebq2R2ZI0mQsI2HyLIWNvOPRQUJpMVAywv3CfpA743avS4P0lge1+
 CexOatfKcPh3UP2WDDo7VvsJ3TC/b3szB18m2WLmCcdJ2JvW30dVPBjuqLINMiS1opz8
 NLZweQF++DI7MZRVmox702fesoy58fqfBf0xCxg1VDLMxBgGhPPKyw/HZXA7JLnIyy2y
 Or+RFeZILIvSabDBLqIbNo2LwLkX/eKonyqp9WGdVou+T5nmtE7D6rDq1HYjpvJ8zuG4
 4e9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXiC6fTjFMkG4wpzgDrqjr1IhDfTEki7o0UhftSJnu8DRa60Lpav69WvhKbe5kgs2sfuLBLNjUDA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdfqmR5Cwgj+U2z2HPDIMnWD7lbe3hP4rQlhvPYFWr4opuoKz2
 vXgBarPOnHEbu3rrjzbc74H1HeD4sITI/waZuvog3Y5tM9hJAcaP
X-Google-Smtp-Source: AGHT+IFf1gfVDmVdgT5Gqz79a4XQfbR/AzMoTvjxkaezwPn50cFdyqvSyRqbr7tXvKFJft6oKtZxXQ==
X-Received: by 2002:a05:651c:198e:b0:2fa:d49d:45ae with SMTP id
 38308e7fff4ca-2fad49d48e9mr8769971fa.8.1727693364762; 
 Mon, 30 Sep 2024 03:49:24 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a43d:aa00:b1de:cfd2:c01d:61dd?
 (dynamic-2a02-3100-a43d-aa00-b1de-cfd2-c01d-61dd.310.pool.telefonica.de.
 [2a02:3100:a43d:aa00:b1de:cfd2:c01d:61dd])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a93c27776a1sm514789866b.8.2024.09.30.03.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 03:49:24 -0700 (PDT)
Message-ID: <72ee3be1-f4bb-48bf-970b-740f272a174c@gmail.com>
Date: Mon, 30 Sep 2024 12:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sysfs: Remove version attribute
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
 <zqgp5une7apdgiytnhkrqz7ec2zrb5lsxzwwjvtcvs3mke3bns@tplkxi2isud4>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <zqgp5une7apdgiytnhkrqz7ec2zrb5lsxzwwjvtcvs3mke3bns@tplkxi2isud4>
Content-Type: text/plain; charset=UTF-8
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

On 22.09.2024 16:55, Dmitry Baryshkov wrote:
> On Sun, Sep 08, 2024 at 02:08:58PM GMT, Heiner Kallweit wrote:
>> This undocumented attribute returns a version string which hasn't been
>> changed for ages. libdrm doesn't use it and I also found no other user.
>> So I think we can remove it.
> 
> This file is a part of the ABI. Commit 82d5e73f6b79 ("drm: drop obsolete
> drm_core.h") replaced variable string with the fixed value that we
> currently have, but at the same it clearly documented that the file is
> being preserved for the sake of binary compatibility.
> 
The drm version attribute is documented neither under Documentation/gpu
nor under Documentation/ABI. So do we really have to consider it
part of the ABI? And are you aware of any actual user of this attribute?

The author of 82d5e73f6b79 wasn't sure either, and therefore didn't
dare to drop the attribute (8 yrs ago). He didn't make any statement that
the attribute is actually used.

6.12-rc1 is just out, so we could drop the attribute in linux-next and
would have several weeks before the next merge window to find out
whether anybody complains.

>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_sysfs.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index fb3bbb6ad..49e5faf11 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -126,8 +126,6 @@ static const struct component_ops typec_connector_ops = {
>>  	.unbind = typec_connector_unbind,
>>  };
>>  
>> -static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>> -
>>  /**
>>   * drm_sysfs_init - initialize sysfs helpers
>>   *
>> @@ -140,19 +138,10 @@ static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>>   */
>>  int drm_sysfs_init(void)
>>  {
>> -	int err;
>> -
>>  	drm_class = class_create("drm");
>>  	if (IS_ERR(drm_class))
>>  		return PTR_ERR(drm_class);
>>  
>> -	err = class_create_file(drm_class, &class_attr_version.attr);
>> -	if (err) {
>> -		class_destroy(drm_class);
>> -		drm_class = NULL;
>> -		return err;
>> -	}
>> -
>>  	drm_class->devnode = drm_devnode;
>>  
>>  	drm_sysfs_acpi_register();
>> @@ -169,7 +158,6 @@ void drm_sysfs_destroy(void)
>>  	if (IS_ERR_OR_NULL(drm_class))
>>  		return;
>>  	drm_sysfs_acpi_unregister();
>> -	class_remove_file(drm_class, &class_attr_version.attr);
>>  	class_destroy(drm_class);
>>  	drm_class = NULL;
>>  }
>> -- 
>> 2.46.0
>>
>>
> 

