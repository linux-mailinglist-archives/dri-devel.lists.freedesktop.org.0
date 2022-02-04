Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6E4A9B18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51E10E4EE;
	Fri,  4 Feb 2022 14:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B3810E4EE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643985448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjU7W9LODb2lvWvbKWQ9iW4O2+zTIEYm3yk17PblSiY=;
 b=ehpr7zw2HdOr1dhp424V9c+8erpRjCIZr1kiIR1X69YM0liYg60eUJkLK9BEe8y/ptY3rf
 R0CM16rYjahREvPJBjWw4tjOgzNNWkUotpCgYSZ4FlFzvSF4gJ2dkYPWg/2ZKDWCTIs6a5
 2U+6UCIAQHIKTLUdQ8nuYqDn66y8IWg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-8RPtxVhAPnCPXBdlPk4_Wg-1; Fri, 04 Feb 2022 09:37:27 -0500
X-MC-Unique: 8RPtxVhAPnCPXBdlPk4_Wg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso2115809wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YjU7W9LODb2lvWvbKWQ9iW4O2+zTIEYm3yk17PblSiY=;
 b=mstqWoS80u8igT2MSFw5ikDPY9rCKQeR6ddOfQPos/D9b6x5g0f4vW+UV+nFuGnY5A
 zVrRrE+SvKUGlK3fCW9L5Y+VsjWtoir5KFjGqrCp2pO3bAPY9PwQWh/HAwBCWhBy7LEH
 J96RftEowUdffrTpniy8YDfGz0YWdEK7df8RQeYwq5Ek4sbeygplKPTVOLmJeUtOGczx
 BoycZBeXoT3vY8Wh/u9SGKOYQ8jIRIfJa8Q7sAfXkT9W7q8HGWtZV25TgOGJ8oi1QGLA
 sTdXmb0qu6c5qtAQ05nSrymZxLw0dVcDIEvUM+8P4Vt7fozb+OjCVMNh1n37C3G1DkHF
 Akew==
X-Gm-Message-State: AOAM533yK0RoRjkxWi/Cgvi8eHWzgivtAfLi/Xi0/Dpxfm5d6CleMfKh
 ld+aztSGKRHDR4e55ys/w4jjuvvZEjHRGPVYeAUHSiL+io4I21XEZGnkcJVDffxUYdfpdXzLOmM
 B3tjfWdXmAvvw8sf82Pk8lupqqayE
X-Received: by 2002:a05:600c:434c:: with SMTP id
 r12mr2489896wme.140.1643985446224; 
 Fri, 04 Feb 2022 06:37:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkGFdJ6hDsKtVrBob4zscnjoipPqd5Nz/eKLnnFx09MVW96jWfTBPMl2XcPzkr/EqQQfzppA==
X-Received: by 2002:a05:600c:434c:: with SMTP id
 r12mr2489866wme.140.1643985446002; 
 Fri, 04 Feb 2022 06:37:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c8sm2004710wmq.34.2022.02.04.06.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:37:25 -0800 (PST)
Message-ID: <f81d3d89-c892-9397-71d0-3d0ab99dd479@redhat.com>
Date: Fri, 4 Feb 2022 15:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
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
 Linux PWM List <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/4/22 15:31, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> [...]
> 
>> This is a v2 that addresses all the issues pointed in v1, thanks a lot
>> to everyone that gave me feedback and reviews. I tried to not miss any
>> comment, but there were a lot so forgive me if something is not there.
> 
> Thanks for the update!
>

You are welcome!
 
>> Changes in v2:
> 
> [...]
> 
> Note that the individual patches say "(no changes since v1)"?
> 

That's due patman (the tool I use to post patches) not being that smart.

I only added the v2 changelog in the cover letter and not the individual
patches to avoid adding noise, since there are a lot of changes since v1.

But patman then thought that means individual patches had no changes...

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

