Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3D171801
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103D36ECA1;
	Thu, 27 Feb 2020 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83536EC97
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:29:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so3055772wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IIQDA+tILyCgis3eGzX3uwCoD2bNMsa23VuAcEl8vLQ=;
 b=IWNRCmtZSP+sggBUUbz53Z2M+bpKk3376XLiYXyv0u72WIo8rBHn9cJONARUJl7uVs
 BVGFpIwGzLrFU3gyIP+zQQvrRNq2ntDoYTTeC0FzikpHL6JPxA8Bl9VktQfS7Gs0GL3J
 kSZ4FRLsRFYdwexVnHs7IwqZn6j4vhBY5xonCKvObHwmbXG1uP6DM08oBvd5AQueVPU2
 iAykxZ4iO3SoxDZspxY71Nh2/99TUiGF1o6mPFEhvqvkR2tpfRsUZ0+9LYuO/0UwTvRO
 KHbj5LvL250mnk3SswK/lfrAq53zoNSLmhnp971X1kVwLyTg/AwTXoTtHQuSkcnSYt0D
 AFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IIQDA+tILyCgis3eGzX3uwCoD2bNMsa23VuAcEl8vLQ=;
 b=k2kfU6QhgEVSfH32SA2WCHlsAU2VchRtnXyyxuuVmQW7aiSfRONZuAeN8qVc0VGr/3
 Fz8GMroyYBSYFvV61hbMnvOtyWHH9IZSTU2Ih0EHPDl5ltM7OJDKaLboO9s5weY3TygE
 ZkoBD6Ts91QVz0SdF1B0O62mRNDekI1uABf3Xmu5LDTt3FH2BH7QKn3DpCgHeG4xXWp+
 SXG0fkQCuAzwkbnSzOlVFH8XcZTz8hLxC6TCtgvladxPMxhpggnb2wpL206R1dlNUEco
 8C14rMz70adivPFX38EtY+u1jM/WzjX6Bbf8lBDaZ28swCiH3jrSfRZwyGDCxntY9L+0
 oJMw==
X-Gm-Message-State: APjAAAWVSitoigZpF7aAbGHiYyr68mHpW46eHa2kOqmr5QpzxEm1VPe7
 lCw8QXsMpWAOTLd5qaPHdlk=
X-Google-Smtp-Source: APXvYqwPHNF+JPCOcRmhlLQ2ZlGa0G7cxgWqv/b8nuMluNPecxiyGd4RGvqDNxh21bQ+cyf5VKkhgg==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr4561077wrw.193.1582806594536; 
 Thu, 27 Feb 2020 04:29:54 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id f11sm7611144wml.3.2020.02.27.04.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:29:54 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Thu, 27 Feb 2020 15:29:46 +0300 (EAT)
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 02/21] drm: convert the drm_driver.debugfs_init() hook
 to return void.
In-Reply-To: <20200227122313.GB896418@kroah.com>
Message-ID: <alpine.LNX.2.21.99999.375.2002271528310.19554@wambui>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-3-wambui.karugax@gmail.com>
 <20200227122313.GB896418@kroah.com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Thu, 27 Feb 2020, Greg KH wrote:

> On Thu, Feb 27, 2020 at 03:02:13PM +0300, Wambui Karuga wrote:
>> As a result of commit 987d65d01356 (drm: debugfs: make
>> drm_debugfs_create_files() never fail) and changes to various debugfs
>> functions in drm/core and across various drivers, there is no need for
>> the drm_driver.debugfs_init() hook to have a return value. Therefore,
>> declare it as void.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>> ---
>>  include/drm/drm_drv.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 97109df5beac..c6ae888c672b 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -323,7 +323,7 @@ struct drm_driver {
>>  	 *
>>  	 * Allows drivers to create driver-specific debugfs files.
>>  	 */
>> -	int (*debugfs_init)(struct drm_minor *minor);
>> +	void (*debugfs_init)(struct drm_minor *minor);
>
>
> Doesn't this patch break the build, or at least, cause lots of build
> warnings to happen?
>
> Fixing it all up later is good, but I don't think you want to break
> things at this point in the series.
>
So, should it come last in the series? All functions that use this hook 
have been converted to void in the patchset.

thanks,
wambui karuga

> thanks,
>
> greg k-h
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
