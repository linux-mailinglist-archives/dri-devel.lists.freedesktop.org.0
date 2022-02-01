Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332914A5B3E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1002089EA9;
	Tue,  1 Feb 2022 11:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2C489B95
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643715229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGRcgirIP4zYqgSlhOvvY2QNMhMYpFLin8cREeYj74w=;
 b=RuKtPdsaEZLNfhEVk4TbvMxKllS/k8MQc9abHHgsqFdzsMuZiQcYRaMJwfq0vqhped+Fl2
 yFzYNPzoL44aS2m0x1DqqzTSDXrr6RjYpCL5E0BiFfvkPOfHSUQtrFxtRIU/3SnO/QT+uG
 LnSjZR/2OMiCXyz2JOSH8AzBlRBA374=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-EwsGlf53OyWhbW7ToGJCHg-1; Tue, 01 Feb 2022 06:31:47 -0500
X-MC-Unique: EwsGlf53OyWhbW7ToGJCHg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b0035399bb7e85so1190927wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGRcgirIP4zYqgSlhOvvY2QNMhMYpFLin8cREeYj74w=;
 b=8KHv80dFz8VD2kZ5qoRMTikwd/IvcRibTkkvWGKf7QOGFtl6JYhZ2EOw7g4LUTnE6S
 GkvhEp+1wDzwZyl1hOpCG+3ZJy2/kNdnD3rHBIf4ogIFD6YhnSOW/FYixMsc6v2YKrNV
 meUoTkVwBVNXX6KQPJhEMUSzm2oFjBRB/oJS8VPb6TYZcXsB614iP51RvvhQGDJINNd6
 bVqs9SrJzIuHLU9g0/iVSvhM1jqbLV/xjUvpzGauu+8NQMXt9ULOk6EL9jHJaAkvkM4o
 +mMc8+pcniw87HuUyMHM0oyeUy2mf1l8sDt9KnLv1WwZGb68s+ZLOI81cCLx83K1ROtF
 iPIQ==
X-Gm-Message-State: AOAM530xDQIctzGZiS9810xaAIpBm3+0dnojH0sddwHwcbNth1BhY5Z2
 GMec2gHI8hiOTLMkn/YP7J1X1bCeCsvyxlLtnodhUob/znhsqSbS1fvQ6kyeJk25JV1AXlKNdiH
 +g4oaP6G17a3iuG9kEdLV+y1+Co6m
X-Received: by 2002:a05:600c:4618:: with SMTP id
 m24mr1382121wmo.16.1643715106049; 
 Tue, 01 Feb 2022 03:31:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9dtgfmrio2wkiWGZX/AXacBC0IvydqtGX9/B6UswdRdmI3taa4PHdBSJzQZpcsZ/B5jNs5A==
X-Received: by 2002:a05:600c:4618:: with SMTP id
 m24mr1382099wmo.16.1643715105832; 
 Tue, 01 Feb 2022 03:31:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n13sm1866913wms.8.2022.02.01.03.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:31:45 -0800 (PST)
Message-ID: <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
Date: Tue, 1 Feb 2022 12:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org> <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
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
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 10:37, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 09:56:23PM +0100, Sam Ravnborg wrote:
>> On Mon, Jan 31, 2022 at 09:12:20PM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> Patch #3 adds the driver. The name ssd1307 was used instead of ssd130x
>>> (which would be more accurate) to avoid confusion for users who want to
>>> migrate from the existing ssd1307fb fbdev driver.
>> Looking forward the name ssd130x would make more sense. There is only so
>> many existing users and a potential of much more new users.
>> So in my color of the world the naming that benefits the most users
>> wins.
> 
> It depends if the binding is going to be preserved. Also this series doesn't
> answer to the question what to do with the old driver.
>

I don't plan to remove the old driver (yet). My goal here is to have an answer
for Fedora users that might complain that we disabled all the fbdev drivers.

So I wanted to understand the effort involved in porting a fbdev driver to DRM.

> If you leave it, I would expect the backward compatibility, otherwise the
> series misses removal of the old driver.
> 

I don't see how those two are correlated. You just need different compatible
strings to match the new and old drivers. That what was usually done for DRM
drivers that were ported. To give an example, the "omapfb" vs "omapdrm".

Since the current binding has a compatible "ssd1305fb-i2c", we could make the
new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

