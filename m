Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6354B34D5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377210EEDD;
	Sat, 12 Feb 2022 12:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B3E10F0D3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644667202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jK813oefzdJ0/6NSnx2Rn+uJkfooQvk/5JjGhJEhjG4=;
 b=M5cSn+lbzAwUUNA3X6M13PUh/jnYhepGRkA+ttNY2lxgINVLH3yg8r2U1KUP5SwVTiqR8i
 zL+GZdyLUpvidUzgtq+Gi93FZOgOI6qrLiUs4LHAN8HkxxXrt0nwXmXgl5ZK5Bg4z3tke6
 V6L5+LqTQLj0LN0HN3LVnmehDhoQeCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-9oK3viAnN4OrMSDa-NBQ3A-1; Sat, 12 Feb 2022 07:00:00 -0500
X-MC-Unique: 9oK3viAnN4OrMSDa-NBQ3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 be14-20020a05600c1e8e00b0037c2a7b3ab6so2233397wmb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 04:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jK813oefzdJ0/6NSnx2Rn+uJkfooQvk/5JjGhJEhjG4=;
 b=LtPJSU8/BbO1TFudpKvPOmT9sqm5mL45wFZUWXOyeR+5LdwghROXz17X5llJtNOKU3
 eVEoODPAUTWZEnn54Tixjkr0NUDNA7MnRsMrxMB3uXtq/iKew6UO5rzwx1L7Qkn9qJuS
 LEvB1yyTaqwz9qUTtXk8v7Z+QjN+Vj3gaFBYfpsn64kirvprQ+2AapUf0HoqyUz/b7ft
 RMf780furYaGejFoSS9TB3G+yVMnO0HUFROZBJiUMVo7Hme78+Y7/ojIcCUB58TbEuPO
 vnJOv0+0WQ59qxQI0GpGnR67AadWZmzkwg3tLEbQzZx6YIBdcW/DdUA0x3mQRmMVuZoF
 RvRQ==
X-Gm-Message-State: AOAM530RFwMkKBcrFulSMGxJamd28Vx8t5kFFtfNNKeNAXQvCnLgnosb
 4GAP7Fe5uiji2w8PC4jlpkp0S2OMZr6KXfs+k/3ljH82b8KSu2gMZ2BnnsYgJ6ykeZDgKH+ocKt
 D7i/r720ZQNRAFH5uJS/ofntSpi76
X-Received: by 2002:a1c:f719:: with SMTP id v25mr4009105wmh.76.1644667199563; 
 Sat, 12 Feb 2022 03:59:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqcd4dGlKYOI049Do/ZHhERD6/7Hy1dVWu5MU99kNymZnm7xY+hxKOCJB2SsFLPO7HLwF65A==
X-Received: by 2002:a1c:f719:: with SMTP id v25mr4009079wmh.76.1644667199249; 
 Sat, 12 Feb 2022 03:59:59 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m6sm27501060wrw.54.2022.02.12.03.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 03:59:58 -0800 (PST)
Message-ID: <3e749d3b-a307-2c9e-be0a-2d2fc4647dd5@redhat.com>
Date: Sat, 12 Feb 2022 12:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/6] drm: Add driver for Solomon SSD130x OLED displays
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-4-javierm@redhat.com>
 <YgaLGDVscXlANxcZ@smile.fi.intel.com>
 <001ee392-d457-31e5-0087-272ef82afd12@redhat.com>
In-Reply-To: <001ee392-d457-31e5-0087-272ef82afd12@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/11/22 20:19, Javier Martinez Canillas wrote:

[snip]

>> I would put GENMASK() directly into FIELD(), but it's up to you
>> (and I haven't checked the use of *_MASK anyway).
>>
> 
> Same. I also considered just using GENMASK() directly, but since I was
> already reworking these, I thought that having the _MASK constant macros
> would make the code more explicit about these being masks and what for.
>

Just to make clear, I prefer to keep the GENMASK(n, n) and *_MASK here.

[snip]

>>
>>> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
>>> +					    &ssd130xfb_bl_ops, NULL);
>>> +	if (IS_ERR(bl))
>>> +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
>>> +					     "Unable to register backlight device\n"));
>>
>> Can be consistent with this then.
>>
> 
> Yes. I meant to change it everywhere but seems that one slipped it through.
> 
> It's not worth to send a v6 just for the changes you mentioned but I can do
> them before pushing the patches to drm-misc (once I get ack for this patch).
> 

Another option is to post a v6 only for patch 3/6 instead of all the patch-set.
Let me know what you prefer.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

