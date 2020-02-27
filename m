Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A14171814
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771C26ECB5;
	Thu, 27 Feb 2020 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02366EC99
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:24:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c84so3174271wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=jp5suxB8PwckKllUEmHtSKALSA4mXRMI2T39pt6o9kw=;
 b=JvjpWo76pRAiBmY2lyeQmsaLrQZ4mkX9aCLLvAw/4cQmfro8qn2QJbyZIf4LlQxDSb
 OGHOPDhDLa3UhXV8oOX/fTg8Oxa7UXEqa+zLOSMI5UZgDI+tdhAZv5Y34MVIUXSpPW6Y
 ZAe754fYrRw17tvJUjByXRCnvQSyu0QxiLB+nC+UzDu/zLgeutxmNWB73QPlUFofVdxF
 yaSWMCcCyfgMrsk42vUVvuZ1dC+eDsJjrgw/loMlqHXOAmvUtpHW/WtVjn2sGQ2b121M
 FVmudIXCXLJ4KoSzSu62z3icEDZSxz39TLkoiyG0KuKQ13di6ysdPUVEaC//zUno9dNX
 EcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=jp5suxB8PwckKllUEmHtSKALSA4mXRMI2T39pt6o9kw=;
 b=IbQe1ekC7U9RXEXvZIWWW/U7yzA1jIrTuNzAJn/hk0KCua+hqdO2NmhA+NeRFOL7FO
 2FAtuQTwqp1Lj9rmPrOrrcDX5mlcA2nhxe0qcd1k1NSwKPPLhFHAx6FXs95gcLngn/Mg
 RJ+FmxJCZmPHmFgWernZw4YB7TLE9OOoWzONznYvXdj+LqNt/JfM2zc2BmSJwaN4Ehtf
 PkZPtOxngocnDes6lHIQZ9QSdX+xvEXbcBzsiyoj2oAkxFKXFAJczT0SUAN5BGVDZIL+
 aVmAF4CxHcT2lWUaiPfM9I6TIyOoZrb5MR8+r699en30ORj95o8ya+f6e6XhJG0eUkRc
 ++lA==
X-Gm-Message-State: APjAAAWtp/og2HUbXogFU0PjQxUPya9SBL5jOsPN/Fm0b0jvfhKZcF4X
 lhYsNsfrksrWCdI7sfu0Gfc=
X-Google-Smtp-Source: APXvYqy39CoQckRdV3i+42Rb9LPh5sCIUZPJ+vwEjuH0gGJK8KzCgsnF6pz5SR10++NHKt/Z7Aq3zg==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr4978787wme.148.1582806240616; 
 Thu, 27 Feb 2020 04:24:00 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id w19sm7017934wmc.22.2020.02.27.04.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:24:00 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Thu, 27 Feb 2020 15:23:31 +0300 (EAT)
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 17/21] drm/tilcdc: remove check for return value of
 debugfs functions.
In-Reply-To: <614d42f2-881e-6e4e-f3c4-c247a86d9262@ti.com>
Message-ID: <alpine.LNX.2.21.99999.375.2002271516120.19554@wambui>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-18-wambui.karugax@gmail.com>
 <614d42f2-881e-6e4e-f3c4-c247a86d9262@ti.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Thu, 27 Feb 2020, Jyri Sarha wrote:

> On 27/02/2020 14:02, Wambui Karuga wrote:
>> Since 987d65d01356 (drm: debugfs: make
>> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
>> fails. Therefore, remove the check and error handling of the return
>> value of drm_debugfs_create_files() as it is not needed in
>> tilcdc_debugfs_init().
>>
>> Also remove local variables that are not used after the changes, and
>> declare tilcdc_debugfs_init() as void.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>
>
> Ok, so this is a part of a bigger series.
>
Yes, this was converted to a series after initial feedback. Thanks for 
your review

wambui karuga.
> Acked-by: Jyri Sarha <jsarha@ti.com>
>
> I assume the series will be merged as one without my involvement. Please
> let me know if that is not the case.
>
> BR,
> Jyri
>
>> ---
>>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 17 ++++-------------
>>  1 file changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
>> index 0791a0200cc3..78c1877d13a8 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
>> @@ -478,26 +478,17 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
>>  		{ "mm",   tilcdc_mm_show,   0 },
>>  };
>>
>> -static int tilcdc_debugfs_init(struct drm_minor *minor)
>> +static void tilcdc_debugfs_init(struct drm_minor *minor)
>>  {
>> -	struct drm_device *dev = minor->dev;
>>  	struct tilcdc_module *mod;
>> -	int ret;
>>
>> -	ret = drm_debugfs_create_files(tilcdc_debugfs_list,
>> -			ARRAY_SIZE(tilcdc_debugfs_list),
>> -			minor->debugfs_root, minor);
>> +	drm_debugfs_create_files(tilcdc_debugfs_list,
>> +				 ARRAY_SIZE(tilcdc_debugfs_list),
>> +				 minor->debugfs_root, minor);
>>
>>  	list_for_each_entry(mod, &module_list, list)
>>  		if (mod->funcs->debugfs_init)
>>  			mod->funcs->debugfs_init(mod, minor);
>> -
>> -	if (ret) {
>> -		dev_err(dev->dev, "could not install tilcdc_debugfs_list\n");
>> -		return ret;
>> -	}
>> -
>> -	return ret;
>>  }
>>  #endif
>>
>>
>
>
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
