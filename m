Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB0CE48A8
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B339F11377A;
	Sun, 28 Dec 2025 03:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DoGzvlII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F6C11377A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:36:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so8066933b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766892964; x=1767497764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
 b=DoGzvlIIeVXzlL5SavxoA18t5sZwsd1MGqOv+hVtAbt+ZTpKcn22p8yH6z9/JxTYJ6
 ijZoooxn1LaRyVoTZR/pRqfFXbjFmxk2pvVeVMHs2vFrefW2hl6Whmbkkbv7VM2k+7Ae
 TeWeNgBVkC0ipqG1mciMWKlYtL65jU86egucT4u74gTGEaVId4DGbCMdybwOWjFSuDi6
 M3ur1b645pRkEtY0/5o3THTn2P9Px0pq1BDYArd6SSFKQjz9eR9D01PQ3L15RJRYcGvJ
 WQiA5+K3p+w88m/a8AVxi6U/0smr8aVwh6V13jX264D7BtreCgDtURdD7X4MiZXJ61Cm
 OuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766892964; x=1767497764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
 b=hY2Cvn371CbNba3og2Z5mrT0hJJtn26K9v/8fKiy8ku0VbUUvJBMxXTQi4t7JzSiRc
 WTABPTKowVaJPoTYTev7xMTWPiZQH/cRhmQBBN39EhCHpLxdZKHHLETPf5PW5qELCtQk
 rOLCaL2zMfdq3L8+Z/Iup0BCL5GmuF2RUQfR3bmASvcJ1px08x4DOsAVtYYf5kYahbGU
 AptWCw48gitpmwkmMKhhkMKz+TmiKECiRAomhixbI1aMDicG3/pjAuvN76rIi5yFSC/W
 /Y6b1tb0fFMP0jgTdXeuIGbTacqWtzvrXyt80XOgR02ocvzi8bX+fbT6Q2JFkkrPo6NB
 zEzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9C+sCewTrqiP/oO+KvHATQz4Wcxi2UpQVd0/HB7YMDq6Mw1b4m+u09JmrJ58my3FegbvsUNOmmik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs9g+/I/ZpijktFxcQBfWxT7NYwjuJ55XVIDRfBLPbyNC9kw0+
 FwiUUSlC5az1Su3oz36GGD6nKclPiK4tTqgQxRrZnNzgICzl8DUpVkY+
X-Gm-Gg: AY/fxX7pp9YgU/aPMTJr27zIykAOMnomeJDT45RheAca3++sbahK5ImPNuPeTQkvI3+
 AOO+5VJLw2bNFGLSnvyjUFCVkdQhEdkIrhnn7szObV/E74Cd9IK1R11ZlsokUlNnYvEtwLOEW+S
 vlhCCpB/VGQtqwKhl/v+NpiYfuOIO0r5vIMwtwLu7uihzR0jWE3hnJtUMsabzCTdszeHp2sPfFF
 WivujioruNK6YUkZsZshyOU3cmYMUX6XmcqfhdgH5aCuf36J9OuMBsCsaOMeGRwl5cSF2DlINZ2
 T/dckIu7YkJKf3fH+OptOqiClQMJVQT3sdjocu8AOnh3LS0NPynqazmTukWRNp44gfTmYcoYW9I
 WPB3GPh+G70tMIyRtJWG9+haHYytJCb7nN8SL+FbQ7rUUmj/Ro2Cj/B8yBIiXImXj38o7sztJax
 AcPpgFc+Hj7od/vjROvatHPPL5eoY9bVCabYhKRq2GkobHZyPowfUjS44J5aFL5JGm6RVd2Y4=
X-Google-Smtp-Source: AGHT+IHTWL3q8c+FeXaSOBHPaw/cADChxlI8DiI1o2Cg5IPCvZurA0tG1OaDi1zTnHTBCrTFoMuu6w==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:450c:61c2 with SMTP id
 d2e1a72fcca58-7ff66679603mr21673397b3a.50.1766892964131; 
 Sat, 27 Dec 2025 19:36:04 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a91e:86e3:6d78:53d4?
 ([2601:1c0:5780:9200:a91e:86e3:6d78:53d4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e797aadsm25834180b3a.61.2025.12.27.19.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Dec 2025 19:36:03 -0800 (PST)
Message-ID: <ec86f093-8fe8-4fc8-b330-dc7ee8a01de9@gmail.com>
Date: Sat, 27 Dec 2025 19:36:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-3-chintanlike@gmail.com>
 <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
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

Hi Andy,

On 12/27/25 06:19, Andy Shevchenko wrote:
> On Fri, Dec 19, 2025 at 7:43 AM Chintan Patel <chintanlike@gmail.com> wrote:
>>
>> fbtft provides sysfs interfaces for debugging and gamma configuration,
>> but these are not required for the core driver.
>>
>> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
>> sysfs operations are skipped while the code remains buildable and
>> type-checked.
> 
>> v2:
>> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
>> - Use dev_of_fbinfo() to guard sysfs creation and removal
> 
> The place for the change log is either a cover letter, or...
> 
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
> 
> ...a comment block here. It's not so important to be in the Git
> history since we have a lore.kernel.org archive.

Thank you for suggestion! Will move to coverletter.

>>   drivers/staging/fbtft/Kconfig       |  5 ++++-
>>   drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
> 
> ...
> 
>>   void fbtft_sysfs_init(struct fbtft_par *par)
>>   {
>> -       device_create_file(par->info->dev, &debug_device_attr);
>> +       struct device *dev = dev_of_fbinfo(par->info);
>> +
>> +       if (!dev)
>> +               return;
> 
> 
> The better way is to decouple the definition and the assignment in the
> cases when it's followed by a conditional (validation check). In this
> case any new code added in between doesn't affect readability and
> maintenance efforts.
> 
>         struct device *dev;
> 
>         dev = dev_of_fbinfo(par->info);
>         if (!dev)
>                 return;
> 
>> +       device_create_file(dev, &debug_device_attr);
>>          if (par->gamma.curves && par->fbtftops.set_gamma)
>> -               device_create_file(par->info->dev, &gamma_device_attrs[0]);
>> +               device_create_file(dev, &gamma_device_attrs[0]);
>>   }
> 
> Ditto for the rest.

Will do v3 and re-send. Thanks for reviews!


