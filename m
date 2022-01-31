Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225954A531D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4B310E427;
	Mon, 31 Jan 2022 23:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E2010E427
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 23:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643671306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrT+G3tPg9tF+5XuIAQ32IRnOTQfqMCqOg72JDwqGHg=;
 b=az5rQSicjcNnkTP+5PCfY0d/hlIeIXcmwsiHxr7eKNMPJLB4Bd/QAE4NpiczzZvNwAYdSA
 CPp11YGb0aiMdAQOD/no0or3IZ14ouGX8cFTXB6rrSKrnA8WBks3dQM0yYMRMGnpI8tx2U
 gLzqD1QJv37GPvpOAmjbE37eWDze8O0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-n6muFDZBOie67lj4ukoxhQ-1; Mon, 31 Jan 2022 18:21:44 -0500
X-MC-Unique: n6muFDZBOie67lj4ukoxhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso411213wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PrT+G3tPg9tF+5XuIAQ32IRnOTQfqMCqOg72JDwqGHg=;
 b=eGNMapkGvJPeZOVcSKw63FAR7aBEzGfd714Umn5FuYrHpShRBHLIe0JX3Zd8MVuDJm
 NnA8DQ7MzNLFftWy9LLdHCTdMpBvE/phuqyCw4+TmhzwuX0lBsTSyFxSPwGFB/Wqyh0N
 aBkL4ghvrhkztwNokBvrzzXiuBDh2a0J7SJX2XAv4U4pM2TDjPXZtAk/AiDqaCxDXoLc
 4dl3Ox/TOwwZrbNIvIvr2bFWtcw7agiF8B+tCgKFo1aS3YeblitdBzp/YXHPDtxyhyBs
 TEgoXkWrsCnkC921Bk9TGYWexhmhIRBQ+ttHCieLGQqq80SrBlAsWAisO5wJHws3BSra
 nDOQ==
X-Gm-Message-State: AOAM532X/56CRaWoeMqdzKmH+mgoy5gDtm3FtFEvUkI5aldBSj95Wdld
 AxrJvw9KQdmsdyhFAx7BQ4XvhsRE2bgnMe9/g6eoKdOw5zSxwj1JTtJ5N4OUwE1ErU+tJLpv3Cd
 nVwocXNGcEuVXU3J/GGWt5Yfas8kF
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr28332788wmi.46.1643671303291; 
 Mon, 31 Jan 2022 15:21:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+5Kta65CM2LqtBZ8N7f7NRu724ZDFebRcaJ9B9wuQH3sMcUBfk67n6fa4xazee4fo9ruHBg==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr28332767wmi.46.1643671303032; 
 Mon, 31 Jan 2022 15:21:43 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p3sm515814wmq.40.2022.01.31.15.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:21:42 -0800 (PST)
Message-ID: <c7818782-ab41-b526-9e81-e769259baa52@redhat.com>
Date: Tue, 1 Feb 2022 00:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Simon Ser <contact@emersion.fr>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
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

Hello Simon,

Thanks for your feedback.

On 1/31/22 21:39, Simon Ser wrote:
> On Monday, January 31st, 2022 at 21:36, Simon Ser <contact@emersion.fr> wrote:
> 
>> This driver only advertises XRGB8888 in ssd1307_formats. It would be nice to
>> expose R8 as well so that user-space can directly produce suitable buffers.
>> It would also be nice to have some kind of preferred format, so that user-space
>> knows R8 is preferred over XRGB8888.
> 
> Hm, since the format used by the hw is actually R1, adding that to drm_fourcc.h
> would be even better.
> 

Yes, agreed that would be nice. We discussed this already with Thomas and my
suggestion was to land the driver as is, advertising XRGB8888. Which is also
what the other driver using monochrome does (drivers/gpu/drm/tiny/repaper.c):

https://www.spinics.net/lists/dri-devel/msg331328.html

As a follow-up we can wire up al the needed bits to have a DRM/KMS driver that
could expose a R1 format.

> Let me know if you want me to type up any of the user-space bits.
> 

Thanks! I also could help to add the needed support in the user-space stack.

Best reagards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

