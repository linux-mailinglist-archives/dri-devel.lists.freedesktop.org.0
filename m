Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B194AF44A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E31410E464;
	Wed,  9 Feb 2022 14:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D404010E464
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644417741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95z5lgZr6N4bdneKS1w58+DkU3M+JrAsHlwainwdryQ=;
 b=hcSNCm9qU8vDHwFIWRNGv1CRcjXq8RTxfi9b4G1BJazDPKjxPvoMK+WQVeXoHk75lo0VPj
 XsaexoNyjkA7Kzm+jX26uSLqqnUzkA4pHIHD3D1S94UpDXzTCTJgYCTe46UVbQM8I+xWaM
 LFosn9ia4OhXePVKIwoR/29yUeft77A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-E9O4EOpnNFyAK57Oq-FWCw-1; Wed, 09 Feb 2022 09:42:19 -0500
X-MC-Unique: E9O4EOpnNFyAK57Oq-FWCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso1208421wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=95z5lgZr6N4bdneKS1w58+DkU3M+JrAsHlwainwdryQ=;
 b=4mjAYzyV5UmTfWlQxhZbPdsqdPpR5EbE/g/cAgPz2e+W1Sm3CBoWxOJdzCR2BI4zWM
 74Ul3ZD5Izxe1lBiBHhvtHx4FNfyqhxDdKTn7JClX8KwY9qlTrqOP9IpzfTVmuUPX/u+
 DajyNbM0mqrhNx2dJXsEd45jDJgDnmtNjJYIpLI+k0y6JquPjeAogUk2YbPP2sUs4Juh
 lzX/8hcXEObKZWkZByoMMcVPzAAfx2HIJPqygTUvGQLN9V5hx/E0x8hVRhAL4VFjoGHs
 ew9jPH85j+otVRp4MG3ZiA87HDL3OslpEn9uikT9rSbfHiP/1darSCTXb1ESYVNtNuJg
 hLdg==
X-Gm-Message-State: AOAM533HI0yaXcUXKZ4ph6AeIdkBtFj6ATj9Yfc3+tR4HUQsi897OMty
 Gn9RFdo8woznd/cYiRehqIz+iB2KWaglEb/5mOfGTbihC7mVobq+tBmFE6V0edRnSNcCRo9bqx8
 MJqvAuKYUli7z6dnll3SEIJd945qa
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr2429640wrt.492.1644417738150; 
 Wed, 09 Feb 2022 06:42:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwDcWgtBVsSADPkjwSIWKeWh2bWga0pSclgXkPHoPRyoxL4yRrB6nhG18lTOECvpK/yDGbwA==
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr2429623wrt.492.1644417737881; 
 Wed, 09 Feb 2022 06:42:17 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o14sm4978570wmr.3.2022.02.09.06.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:42:17 -0800 (PST)
Message-ID: <f58b2608-0d51-3209-ae11-18bdac19dd66@redhat.com>
Date: Wed, 9 Feb 2022 15:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <YgPF1cBMsd9973Dx@smile.fi.intel.com>
 <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/9/22 15:27, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Wed, Feb 9, 2022 at 2:48 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Tue, Feb 08, 2022 at 04:10:49PM +0100, Javier Martinez Canillas wrote:
>>> On 2/8/22 15:19, Geert Uytterhoeven wrote:
>>>> On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
>>>> <javierm@redhat.com> wrote:
>>>>   - Kernel size increased by 349 KiB,
>>>>   - The "Memory:" line reports 412 KiB less memory,
>>>>   - On top of that, "free" shows ca. 92 KiB more memory in use after
>>>>     bootup.
>>
>> The memory consumption should really be taken seriously, because these kind of
>> displays are for embedded platforms with limited amount of resources.
> 
> Thanks for your concern!
> 
> Looking at the options that are auto-enabled, a few stand out that
> look like they're not needed on systems witch such small displays,
> or on legacy systems predating DDC:

Thanks for your analysis.

Since drivers are replacing the {simple,efi}fb drivers and others with the
simpledrm driver, the DRM subsystem is now built into the kernel and no
longer a loadable module.

So there has been some effort to make it more modular and smaller, as an
example the following patch-set from Thomas:

https://www.spinics.net/lists/dri-devel/msg329120.html

But there are still a lot of room to reduce this and certainly enabling
CONFIG_DRM will be noticeable for such memory constrainted systems.

This is outside the scope of this patch series though, that is only about
adding a new DRM driver :)

Now, this is a reason why I mentioned that the old fbdev driver shouldn't
be removed yet.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

