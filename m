Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6964A5356
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD610E471;
	Mon, 31 Jan 2022 23:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198ED10E487
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643672284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3CTm7Bs/ix/5LXGiIgLCJVvM0GoznV6Mmk0dN1zWSQ=;
 b=SW47u5qHU4hHVvCqDnwNl/HjsK2T7+dO/efjQ7pXGyt6ROVViNalbFD9N4vRbsm+qSHy1K
 NIDLunq3XYtzgfSNnLCAvk/JJ7kYz8JQSnrwW9HHtJIfOwC05rvcntgTDFI9a8UPdI6sAA
 ihHvWupobdx9ypQ/fUKSMfby4Fbp05A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-DVfKnN80OtiaGZ800eTK7A-1; Mon, 31 Jan 2022 18:38:02 -0500
X-MC-Unique: DVfKnN80OtiaGZ800eTK7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso294441wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C3CTm7Bs/ix/5LXGiIgLCJVvM0GoznV6Mmk0dN1zWSQ=;
 b=IvU8IoZpFHmH7p9l2AGb7mmIGcJxe6AJyINkW3bN75mnRj1VB8umdj3JlcNjT1rd7E
 J4EJ0jPp/ug83/F1KwpR3iKb9CDyaKQszJzUiTTV/D8XVGrHdlYXGTUnSlfJPsQkLfUO
 73EZUXBfFo0e0eIaoNgESZb3c6Z0IS4CadnlCj2iAoJsmtEl4otNs2fxFV2lVKUJARCG
 GAHUyGt9dVqo2FvQ0m+DhE9p/9UTtLMUGEILE5GwPtEBWVMQco6fU14y6Va5d7P4Oy98
 43BOO4ZnpWlNMTxieIN6Z122dhbDFIOzz4lOHCrV+03JOTrHKEn1x5ijE4Gg5Dq/H9xm
 CZsA==
X-Gm-Message-State: AOAM530VK9+ub/rhTEk/p+2ECm9dOdLzV/QuRJ2YKN8r8PDhAJgrXZQo
 CCrWaw6rC/sR5gQN9als1XnUJ8QeEKspTOpLTQXyQ47EGB2mfml9vu9crtXKERMjxWO7GnggmQp
 Qy/5ro0uR27EAKszZTGGBDl2kZBpu
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr19192573wry.94.1643672281300; 
 Mon, 31 Jan 2022 15:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVQSH23aLGjRqSo4FwmBefiCFx1sZwod/Bbj1r+ksyBNqib6t/bplSkWRXeqqfzdh6Ym8gbQ==
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr19192561wry.94.1643672281120; 
 Mon, 31 Jan 2022 15:38:01 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 8sm603298wmg.0.2022.01.31.15.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:38:00 -0800 (PST)
Message-ID: <0924dfdc-a8c3-5e0f-9362-6c27811b4bd6@redhat.com>
Date: Tue, 1 Feb 2022 00:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfhM97cVH3+lJKg0@ravnborg.org>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/22 21:56, Sam Ravnborg wrote:
> Hi Javier,
> On Mon, Jan 31, 2022 at 09:12:20PM +0100, Javier Martinez Canillas wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
>>
>> Using the DRM fb emulation, all the tests from Geert Uytterhoeven's fbtest
>> (https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) passes:
> 
> Impressed how fast you did this!
> Saw the picture you posted a link to on irc - nice.
>

Thanks :)

What's impressive is how many helper functions the DRM core has, so typing a
new DRM driver is something that could be achieved in a few hours. Which was
one of my goals with this experiment, to understand how much effort would be
for a developer with no prior experience with DRM to port a fbdev driver.
 
>> Patch #3 adds the driver. The name ssd1307 was used instead of ssd130x
>> (which would be more accurate) to avoid confusion for users who want to
>> migrate from the existing ssd1307fb fbdev driver.
> Looking forward the name ssd130x would make more sense. There is only so
> many existing users and a potential of much more new users.
> So in my color of the world the naming that benefits the most users
> wins.
>

Agreed. That's also what Andy suggested and makes a lot of sense to me.
 
> 	Sam
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

