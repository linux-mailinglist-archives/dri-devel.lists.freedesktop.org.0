Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32318D1C755
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 05:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941A10E00F;
	Wed, 14 Jan 2026 04:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Awcl4hNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927810E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 04:47:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a2ea96930cso53082175ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 20:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768366076; x=1768970876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
 b=Awcl4hNZstBigkbZNzJiiSNEWzxBpuM/DkfQYt4PEyqAOSQTzCNLg0SoJnk+86V3QX
 hXYKCdMrQAda6cqMDE3LwET2Apl20g8jPP47XRamGKIUMLghBNAUCsWxpxQOoENWFWtA
 Qxe1gY4WHdQiFXqULLKKf9h2F8RA50MZFav8NHmWkJw/7mejfHpI+1kKQF3nS/Xzqkdr
 ZwnDvPh6lLXva8rOmWAuBiho7qT4zVu0Hv5jWJqxhkVRJAvnR4J/vb2gAcbK+hbydurs
 6cEobkinz9SZOqBtenHm7fmz7jyFxJRNj10O9LIAFXlUSBXECbeRor+P8yOt4XNCh0Ch
 d8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768366076; x=1768970876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
 b=KVM5yL5VjizfLwmmLzw+fC3hP6i+Ed+OBUtc58by3xSw8DKmuFD/1QHO2j0bVT8Lv+
 DNDmcQD1uLKwloBhL5gLVKTHESYM4Gh298cYq+D+pTIKnAEmAfi9e0kd3Cr2agIz2a24
 XjW9+F4oaqeO2Zw66LdSTbGHAhpcGHf2tBDgfOjNKv8TSWWAD4ImgkTF6on461Zq0drj
 ay2RqvIkoCv5o0ndNwTms7ISuAsV+kHEF13uZkswHi9sAkvW+ARDNztR1K1sroixXRCe
 gpxfMhMJ2IClLgV/5PtZPcgTBY6KbVN8MpAfRqu2O4fi43wCycM3MY8KDQD+Lfw/25XB
 4w0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqsqW30JkHbbFztT3nVvNFQ6XlJPzXp1M5aCNj3vZZ/HZ5z/Dn2Td9ST+7cIRABCGAfRmxBfckhWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4s3VwTqIyvccUGiEdEDSGNtuGJeUM/Wn8tVP0hXwx1/D1frtf
 02G6K1jSHvvYrCn6eBukuoUGlmwt3nbvU4ue3dvdyH8CLH/BNK/E8fXn
X-Gm-Gg: AY/fxX4727+/Dwn2P5K4KTqMJ1QXcajUHGLjNUbGaORgz3dVnJxbMTp+dweVeHkaUYm
 01n1SApiJj7EtNbByQg1yWvUd3Qow10Xo2MQg0AQZCqD/pANJ7a++fwVtlP6VIcNRDk1fvS1epS
 OW8SSatlgRm2A0mPqAXquL997sV7LWX7HcGatgme8awgQ1sbT4KqSTLJ1DI9/HT3EYPFincxzN9
 jm1msmLrtHqsToqYAD+awk/dk6ND+3RiSgenj/GGZOn1IW99MsBDxLdLZkqhr3/AFHgCYXxQhCI
 v8PJULS+gtE7CSD44fOwL3kXdRxXmAbXd1COHJSswIZNo5ss2vn313RfcK+jgi5vMPz3PoEJMLs
 8jYlm1X7kxQCc1U6jSKFBTVgVczgTVtq0EodHbX/j8nkJkjNSn3ERS/i/eE5CGWQzVNrZJkGsCl
 h1h0nGTF5Bc1jN7K11b8RbeIgutsJPtVT1DHH2QHdJIpeeo+oikX6+REy0v66P
X-Received: by 2002:a17:903:11c3:b0:2a0:c884:7f03 with SMTP id
 d9443c01a7336-2a59bc12d90mr8348595ad.44.1768366075547; 
 Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:2c53:988c:79cd:8451?
 ([2601:1c0:5780:9200:2c53:988c:79cd:8451])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c48931sm211402105ad.29.2026.01.13.20.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Message-ID: <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Date: Tue, 13 Jan 2026 20:47:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <2026011341-chomp-protegee-6be5@gregkh>
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



On 1/12/26 22:16, Greg KH wrote:
> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> 
> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> should be used instead.


You’re correct that dev_dbg()/dev_info() are the standard logging APIs.

The reason I switched to fb_dbg()/fb_info() is not stylistic: direct
dereferences of info->dev / fb_info->dev are invalid when
CONFIG_FB_DEVICE=n, which causes compile-time errors.

fb_dbg() and fb_info() are framebuffer-specific helpers that handle
this case correctly, allowing logging without touching info->dev.

> 
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> 
> Is this really a bug?

The build failure occurs when CONFIG_FB_DEVICE=n, where direct
dereferences of info->dev / fb_info->dev are not valid. This was 
reported by the kernel test robot.

That said, I’m fine dropping the Fixes tag if you don’t consider this a
regression.

>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Changes in v6:
>> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
>> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>>    handle the debug/info context.
>> - Drop __func__ usage per review feedback(suggested by greg k-h)
>> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>>    (suggested by Andy Shevchenko)
>>
>> Changes in v5:
>> - Initial attempt to replace info->dev accesses using
>>    dev_of_fbinfo() helper
>> ---
> 
> The changelog stuff goes below the --- line.

Ack.

> 
>>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
>> index 8a5ccc8ae0a1..1b3b62950205 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>>   	unsigned int val;
>>   	int ret = 1;
>>   
>> -	dev_dbg(info->dev,
>> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>> -		__func__, regno, red, green, blue, transp);
>> +	fb_dbg(info,
>> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
>> +	       regno, red, green, blue, transp);
> 
> I dont understand what is wrong with the existing dev_dbg() line (with
> the exception that __func__ should not be in it.
> 
>>   
>>   	switch (info->fix.visual) {
>>   	case FB_VISUAL_TRUECOLOR:
>> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>>   	struct fbtft_par *par = info->par;
>>   	int ret = -EINVAL;
>>   
>> -	dev_dbg(info->dev, "%s(blank=%d)\n",
>> -		__func__, blank);
>> +	fb_dbg(info, "blank=%d\n", blank);
> 
> Same here, what's wrong with dev_dbg()?
> 

Same reason: dereferencing info->dev is invalid when CONFIG_FB_DEVICE=n. 
fb_dbg() handles this correctly without needing info->dev.

>>   
>>   	if (!par->fbtftops.blank)
>>   		return ret;
>> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>>   	if (spi)
>>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>>   			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>> -	dev_info(fb_info->dev,
>> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> -		 fb_info->fix.smem_len >> 10, text1,
>> -		 HZ / fb_info->fbdefio->delay, text2);
>> +	fb_info(fb_info,
>> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> +		fb_info->fix.smem_len >> 10, text1,
>> +		HZ / fb_info->fbdefio->delay, text2);
> 
> When drivers work properly, they are quiet.  Why is this needed at all
> except as a debug message?

Agreed. The informational message during framebuffer registration is not
necessary. I will either remove it entirely or convert it to a 
debug-only message.

I’ll rework the patch accordingly and resend.

Thanks again for the guidance.


