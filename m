Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922C4ADC0C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F77110E181;
	Tue,  8 Feb 2022 15:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309DA10E181
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644333054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEdNY3YBugunq8yXpBBABtVIZDrmoxsBt8YDexXqqEo=;
 b=ASvoJxYo9vPV7gZdwqRDokLdmB6sQfHMa6ZZU+clWuu+1uMngawhe3FtvRyBqxs+BNPNED
 BGbZdx93DiOi64TQIC8W2+LFKActIutOUf5ubWgPIne00Qbs326Xe/M8LLdi/2wGyY8nsY
 1vY07UqxcYGutO+9l6TV97k9JzeVH/I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-BSH4vGkHOAShqpPBAP8IGg-1; Tue, 08 Feb 2022 10:10:53 -0500
X-MC-Unique: BSH4vGkHOAShqpPBAP8IGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c4f0400b0037bb2ce79d8so1146623wmq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 07:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zEdNY3YBugunq8yXpBBABtVIZDrmoxsBt8YDexXqqEo=;
 b=qU4dwfy5MnX+R+pn82iBZFzG6/v9SeXin+zFk01IBM+WD7F7VBsCSpDATKE+SZOxGO
 PFCD+uiTx3LhO8cEAqRGMW6HWRlNqHiqKDek7NknOE5T8frdzQmGXljCLP5tFJwhBVTh
 x/TdJWX98mLSA55d/l121psleB4r1NZXEBOAHaT58PaImJSEmWLnraL2Ok82x+RilEne
 liedOnYPEdWKkb3wo/zASCpjvRBbPMveNt6/loHx/vnmTJutRODRN4zx71qtBjv/9yx+
 RAMCrDrS5kInmJl8ea0qUx7FcptVuI1FAmCDXtSBP2tt8sO3f/SdjSz2GcorVjvDlIOU
 wNPw==
X-Gm-Message-State: AOAM532aaMnAojbLC8C63hy9EZ9wWVMQT20aFm5yaET7/AZ4aJ3PtCU4
 BzdrHjaLZMuyjyrdoUG24NmeYt6sNQCmNiVKTpmLdtKZfhqljWlvQ3OFQc1GUR45G2lqK0ynF2M
 zfBquoiFLH3xOnA/sFMwWdSabz1vw
X-Received: by 2002:adf:ef10:: with SMTP id e16mr3652222wro.428.1644333051931; 
 Tue, 08 Feb 2022 07:10:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFW9XXEiShgJBRMmm2UkmN1bA7P1SHblO06AiaMNERAOilbmNeV2HVlkYhh60Zpx3AWddEMQ==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr3652206wro.428.1644333051654; 
 Tue, 08 Feb 2022 07:10:51 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n13sm2601507wms.8.2022.02.08.07.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:10:51 -0800 (PST)
Message-ID: <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
Date: Tue, 8 Feb 2022 16:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

Thanks a lot for testing!

On 2/8/22 15:19, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> I gave it a try on an Adafruit FeatherWing 128x32 OLED, connected to an
> OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V softcore.
> 
> Findings:
>   - Kernel size increased by 349 KiB,
>   - The "Memory:" line reports 412 KiB less memory,
>   - On top of that, "free" shows ca. 92 KiB more memory in use after
>     bootup.
>   - The logo (I have a custom monochrome logo enabled) is no longer shown.

I was able to display your tux monochrome with ./fbtest -f /dev/fb1 test004

>   - The screen is empty, with a (very very slow) flashing cursor in the
>     middle of the screen, with a bogus long line next to it, which I can
>     see being redrawn.
>   - Writing text (e.g. hello) to /dev/tty0, I first see the text,
>     followed by an enlargement of some of the characters.


So far I was mostly testing using your fbtest repo tests and all of them
(modulo test009 that says "Screen size too small for this test").

But I've tried now using as a VT and I see the same visual artifacts. I
wonder what's the difference between fbcon and the way your tests use
the fbdev API.

>   - "time ls" on the serial console (no files in the current directory,
>     so nothing to print) increases from 0.86s to 1.92s, so the system is
>     more loaded.  As ssd1307fb relied on deferred I/O too, the slowdown
>     might be (partly) due to redrawing of the visual artefacts
>     mentioned above.
>

I was trying to first have the driver and then figure out how to optimize
it. For v3 I'm using regmap to access instead of the I2C layer directly.

I noticed that this is even slower but it makes the driver more clean and
allows to support both I2C and SPI (untested but will include it as a WIP).

> So while the displays seems to be initialized correctly, it looks like
> there are some serious bugs in the conversion from xrgb8888 to
> monochrome.
>

Yes, that's possible. I haven't tried to use it as a console before because
the display resolution is just too small. But will include now in my tests.

> Gr{oetje,eeting}s,
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

