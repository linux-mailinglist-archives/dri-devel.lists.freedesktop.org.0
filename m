Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A44A5A21
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A38810ED48;
	Tue,  1 Feb 2022 10:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3659D10ED48
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643711814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaqBrIFOHvMLEnJtoyzrnK2gwLgrZ2ScPtfEFGlgxAY=;
 b=dmHFZ99jy0MPRB1P/PKqkcvdIARtRdCClc88b199vzMc26EyTYpJDHPEfof3LmbGnoorSm
 nDsvss5ftOFGIKSykP9yrGdc659K5IN0QVBIAaVd1BAIi57Lizp2kn0UO7/DMa4KUkLxMj
 ntHkus59BPQM9GVMj66N4X1SYCexcIs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-If6MaDfiMm68GTRNhy6HAg-1; Tue, 01 Feb 2022 05:36:51 -0500
X-MC-Unique: If6MaDfiMm68GTRNhy6HAg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso5878410wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 02:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kaqBrIFOHvMLEnJtoyzrnK2gwLgrZ2ScPtfEFGlgxAY=;
 b=vImEKPsjikhFKsHUob9N85+xUV7KwjuNmsgxi6ce/Q36vv/LXeFO8A91Ske5p5IWLk
 01ArjUd2/0dL5S4hm5Dgobi6KTffemQS23Tf1ldaE7ZGmgpve0vj9AsGeunlrMq9+Hhx
 7cqfI0Lm9nnwHab6ew5NUy3OnMM14fTxr9dFn44hs27Qsmwl7EFMaYRZbZ8gVad6yA/y
 RE9ijLH7Xm3KSI2jlXPn5ft2AMiHdFCFn30+lNYZXEd8qD+8OUX5RsWgq0FtFVs1t0PQ
 rBTLIYqZl99hXZhCkAvKyZLbdILkW6il9zRf4BQFN6z6gMqflsA+h4sgBdpMaNj5BwEh
 PK1w==
X-Gm-Message-State: AOAM533fitfO+O8clbPLVDNaH8tVuaF8AZJCreIxeU6vT+MUfIMfAU1P
 mtQ2cgc+hcYUx1Y7nDWzZCYBuhSwKKs7/rAVrbQZWDynlVlrADJojCTzOVIfklDJLik8XEC9zVs
 IFnz+jrYUmVs7kaSzNhuP/xmZJN0O
X-Received: by 2002:a7b:c44e:: with SMTP id l14mr1191957wmi.185.1643711810161; 
 Tue, 01 Feb 2022 02:36:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIelI3cz+7Zacd+5ZQQgX/8LYNpRzY3LsR8zgGmcKlb1QIdL+Q4hi84F8M/23d0R26+66jvw==
X-Received: by 2002:a7b:c44e:: with SMTP id l14mr1191934wmi.185.1643711809893; 
 Tue, 01 Feb 2022 02:36:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id k25sm1751285wms.23.2022.02.01.02.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:36:49 -0800 (PST)
Message-ID: <1a49a91a-1f6d-51c0-561b-5e5a519f3b49@redhat.com>
Date: Tue, 1 Feb 2022 11:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <CAMuHMdXMayLLRavAJJujmPqT+Vd11dPfycqXie3w_pOkS8i9eA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXMayLLRavAJJujmPqT+Vd11dPfycqXie3w_pOkS8i9eA@mail.gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/1/22 09:43, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Mon, Jan 31, 2022 at 9:12 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> Thanks for your series!
> 
> I'll give it a try on an Adafruit FeatherWing 128x32 OLED, connected
> to an OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V
> softcore.
>

Awesome! let me know if you have any issues. I keep an update-to-date version
at https://github.com/martinezjavier/linux/tree/ssd1307

>> Using the DRM fb emulation, all the tests from Geert Uytterhoeven's fbtest
>> (https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) passes:
>>
>>      ./fbtest -f /dev/fb1
>>     Using drawops cfb32 (32 bpp packed pixels)
>>     Available visuals:
>>       Monochrome
>>       Grayscale 256
>>       Truecolor 8:8:8:0
> 
> Oh, fake 32-bpp truecolor ;-)
>

Yes :) that's what the repaper drivers does to have maximum compatibility
with existing user-space and I followed the same.
 
> Does it run modetest, too?
>

It does, yes. And for example `modetest -M ssd1307` will print all the
info about encoders, connectors, CRTs, etc.
 
> I'm trying to get modetest working on my atari DRM driver.
> Comparing to the cirrus driver doesn't help much, as modetest doesn't
> seem to work with the cirrus driver (modified to not do hardware
> access, as I don't have cirrus hardware):
> 
>     # modetest -M cirrus -s 31:1024x768-60Hz
>     setting mode 1024x768-60.00Hz on connectors 31, crtc 34
>     failed to set gamma: Function not implemented
>

# modetest -M ssd1307 -c -s 31:128x64-0.12Hz
...
setting mode 128x64-0.12Hz on connectors 31, crtc 33
failed to set gamma: Function not implemented

this seems to be a bug in modetest. I found a patch posted some time ago
but never landed: https://www.spinics.net/lists/dri-devel/msg251356.html
 
> Does there exist another simple test program for showing something
> using the DRM API?
>

I tested with plymouth and gdm that make use of the DRM API, they do
start and I see something on the screen but don't really handle that
well the fact that's a 128x64 resolution.

I didn't test with more DRM programs because was mostly interested in
making sure that the fbdev emulation was working correctly.

Noticed that Simon shared some simple examples, I'll give them a try. 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

