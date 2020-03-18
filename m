Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D918AE0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4D6E998;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC126E91A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:03:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 11so4062515wmo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NBpTb0vw99e5S/IoMj3BB65KCm2t/wKof5fD6aPsMYM=;
 b=u0abISc1Df5MhDyW8KEO42x/KCYMmTKfDc8BS/ayA+W6nEhRCNqtr8oV5oR4XRWRDS
 mgR4WUxae29gsY4cmH5mTdL7eNo3P6V6lJOGMmAz3ktoS/HKhhGFMQfcMynma7MOCsP7
 qHPhrBkIIeNADiVr2xnapnqQY95LCxDassg1c2jwjDvhNlgbNbG73TB1x9xvIY+LADb9
 9Donw4KTpVfKRSpBX5RpG8EbxMmGmfkmqFcIf9OT4BodqaceriCFriKCXg1+RgQtLXte
 y0AtZ1GMovRoZS5OVcZrAs5rlP6kNrbg8opOC57T3WGRvEMwzriJwHeCiWVjVNAcvn1N
 lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NBpTb0vw99e5S/IoMj3BB65KCm2t/wKof5fD6aPsMYM=;
 b=G0wzKzc1PsAU989K7AHD6QnT0e68LzLd2o0fIyqzamKAo3ytLF9Bknmz6xCXQdgMxF
 12L0mRnx+D4FXLWqYf6vHfy3/YZLu5vPjVgtuiLZ7PTU19A/WJwOSPlwaQBccnVJDPij
 lXZXCa/rdHpY8q2J52lrpVgWQzPhh1/EWnU4/OPDDBaCHLw8Taryzye0ldInO+QhYM/a
 aPKsei2jq24NjrgBqTpeohDsdmEr+mEFB268zmDGbXd5nV/gYmQZzzB5desHEuqcG0qs
 MUe799saMmHY6T21yDJOzhAm0bJCSbnvjZtEiEIxWResnucJHBY4d5UB5//QOwChdpfy
 yQnw==
X-Gm-Message-State: ANhLgQ2w1RdSrqKC5RtcvxihJWxXtLkqqx+Cu4lAg5IM8tgCF9gmJO0d
 nZk32uXC/cZeuJnS+XJiNfk=
X-Google-Smtp-Source: ADFU+vtUqqUm4YdPYcnPQhh4IIRuEnyKOGNipbJYU5eMGp48eguBm4WwXJVNvzdurXNHq0TP9bM3BQ==
X-Received: by 2002:a1c:9dc6:: with SMTP id g189mr6112861wme.91.1584547385078; 
 Wed, 18 Mar 2020 09:03:05 -0700 (PDT)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id r18sm10097934wro.13.2020.03.18.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 09:03:04 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Wed, 18 Mar 2020 19:02:47 +0300 (EAT)
To: Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
In-Reply-To: <20200318152627.GY2363188@phenom.ffwll.local>
Message-ID: <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Wed, 18 Mar 2020, Daniel Vetter wrote:

> On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
>> Since 987d65d01356 (drm: debugfs: make
>> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
>> fails and should return void. Therefore, remove its use as the
>> return value of drm_vram_mm_debugfs_init(), and have the function
>> return 0 directly.
>>
>> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
>> introducing build issues and build breakage.
>>
>> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 92a11bb42365..c8bcc8609650 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
>>   */
>>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
>>  {
>> -	int ret = 0;
>> -
>>  #if defined(CONFIG_DEBUG_FS)
>
> Just noticed that this #if here is not needed, we already have a dummy
> function for that case. Care to write a quick patch to remove it? On top
> of this patch series here ofc, I'm in the processing of merging the entire
> pile.
>
> Thanks, Daniel
Hi Daniel,
Without this check here, and compiling without CONFIG_DEBUG_FS, this 
function is run and the drm_debugfs_create_files() does not have access to 
the parameters also protected by an #if above this function. So the change 
throws an error for me. Is that correct?

Thanks,
wambui karuga

>> -	ret = drm_debugfs_create_files(drm_vram_mm_debugfs_list,
>> -				       ARRAY_SIZE(drm_vram_mm_debugfs_list),
>> -				       minor->debugfs_root, minor);
>> +	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
>> +				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
>> +				 minor->debugfs_root, minor);
>>  #endif
>> -	return ret;
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>>
>> --
>> 2.25.1
>>
>
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
