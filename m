Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986814A5B5A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122AF10E717;
	Tue,  1 Feb 2022 11:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ED710E7A0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643715660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7n48rOVqWezIHqWx+2qepywQmYqWs41wlRyqhhm8ye8=;
 b=FOMXSp36NRAkjC4bAljQYIZl0j1AkpcxoXIeTDkWn5hQ8tMueoWZiX6HmnQzJHrVSvgyuU
 dkbn9WoDJ6OZpKCjRS3kwAx8gvFQ/JP/OYy0tqJ83CcqySmYPQ1IZbiAjKMu9A7+0NMdQb
 uqu/3sXzsHAtblDeBlakVHpRXfKh9Z0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-3fbziR1pPpu5o1T45Y-PTQ-1; Tue, 01 Feb 2022 06:40:59 -0500
X-MC-Unique: 3fbziR1pPpu5o1T45Y-PTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so5883399wrm.16
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7n48rOVqWezIHqWx+2qepywQmYqWs41wlRyqhhm8ye8=;
 b=S3vLAx0W4cWg3VnSK1P+zYccW1KqHDEQ5VaaRJ7YR8ZXxZZWs0hlkelms1Aahh1j5f
 /hryh+PSk/MNiD9eVSrLO5vfD2lluKh/14S8NFgAnBEb0eGCG1Fu2iPLFaE9TaURTWiN
 jdXdwIxM8UWvL2TEqnpytyB/urlDIwLsv733QYJVnm43w+skxhAhPkA/WXYcrVOu1L0m
 zz3l4+JpdMqa3f2EpyAsoRbv3TRGQ2VetzMoxXVuMzsDcmuZtd0iwiHjc/87P7siJAgf
 2TiN++K/L+t1nDXSpuwwRFxYU6r/eU4XFffinQgmuJ3lRw7WPdxjUcOUqFeoKK0EDTvJ
 iC4g==
X-Gm-Message-State: AOAM5310ehAhfRr0ZWOvdCPMRp6tNVHmacHQpoQ3K4haEuzhxVz+B0RI
 z9p7660iR/Q2JfV4GamqRGINMBGYsUMczCfle5qRYeWRXNVsrFa5VJuY+TR1bW1VwT8MR3WN6m/
 kKLkDqnsmIcGZU3/eZ++NMsCFcMHj
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr1423326wmd.61.1643715657863; 
 Tue, 01 Feb 2022 03:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytv6sGg27WWm9E+KaEvFVIzBmnh6PhhKvD74OMrypWaCif9Pxmpddbk3kfATQH4MU5jJX8rw==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr1423309wmd.61.1643715657640; 
 Tue, 01 Feb 2022 03:40:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c13sm14555734wrv.24.2022.02.01.03.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:40:57 -0800 (PST)
Message-ID: <7f4569d5-2b67-fd98-9a0e-03a2025ddcce@redhat.com>
Date: Tue, 1 Feb 2022 12:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org> <YfkAOiSlIMZrKXyl@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfkAOiSlIMZrKXyl@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 10:41, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 10:30:46PM +0100, Sam Ravnborg wrote:
>> On Mon, Jan 31, 2022 at 09:29:16PM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> +config TINYDRM_SSD1307
>>> +	tristate "DRM support for Solomon SSD1307 OLED displays"
>> Use SSD130X here - so SSD1306 users can find it.
> 
> It's better to list them all in the "help". How user would grep this?
> 
> `git grep -n -i ssd1306` ==> no match.
>

That's already the case :)

$ git grep -n -i ssd1306 drivers/gpu/drm/
drivers/gpu/drm/tiny/Kconfig:167:         DRM driver for the SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
drivers/gpu/drm/tiny/ssd1307.c:922:static struct ssd1307_deviceinfo ssd1307_ssd1306_deviceinfo = {
drivers/gpu/drm/tiny/ssd1307.c:948:             .compatible = "solomon,ssd1306fb-i2c",
drivers/gpu/drm/tiny/ssd1307.c:949:             .data = (void *)&ssd1307_ssd1306_deviceinfo,
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

