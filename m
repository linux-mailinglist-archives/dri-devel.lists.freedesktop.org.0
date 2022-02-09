Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DC4AF467
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2B310E232;
	Wed,  9 Feb 2022 14:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5005A10E24F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644418218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCdwEoIBITb866ZII/MklMSrfR+LqGATKN4cy7oWV0k=;
 b=Tz80JRVgzCJt1iWSVO0+IbvqfpexTrcYTsejKkYlUKToOOunUbAn/WbdvtU0jv+x1AC7mQ
 JlJkLr/cA5aP1QdpsP+y/MpLUBrSy15Zj8sDVMplJbbY8OtuCOH9XpcCKmFQLxCwMQewpP
 ifNPczo5aZm/pwGkbw5NCnrMCofW688=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-6qTWAMFRNfSOcbKznKZDAw-1; Wed, 09 Feb 2022 09:50:17 -0500
X-MC-Unique: 6qTWAMFRNfSOcbKznKZDAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so1185683wrb.20
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GCdwEoIBITb866ZII/MklMSrfR+LqGATKN4cy7oWV0k=;
 b=3fgkadF48/9IW54N6ZAl+X9eTC011OlcCh7ePPG+rPkKuQWzXrth7pK4hm7QdgKA+q
 NBdKZ4MTQkPNEkPgqDzI4WLcIacsD0HcpueF6xW03WIQAwCvW2D0zRtR1dE/yKU3xIS5
 vtC6RXlXs19P/MoOsGd/H3e2QhlvbSFyhMjwMKsAK23NGj+pML0eio/H8GzLieCTeVGc
 wFXkuZiuO1S0JCd3tUrb8BqifkM1qiBLU+B4PzLWdi4B7jXRZyLriYwPNB//yx+HXEzF
 m6brQiEv3YL+aD034fSzj32MpvfrOA164nbqLg+w9B+81HTI/s1HhLE5Jek5u5QMDXdE
 l9ew==
X-Gm-Message-State: AOAM531N+gWRX3qmwmYWgJLrLX/JFFBLZMajXFjCD+Aq9/XtnjBIIVaW
 TJzAXr4MvMdvd1LxmoBx6U0SGll+Z7TkF1AcOhv3uXgCEtk/VnZqkJ35ebiCfixuqGMb2BZmp9/
 8W3zN/BbcqyQV8z7Zf+h4QKPZJBZ5
X-Received: by 2002:adf:c74f:: with SMTP id b15mr2468804wrh.307.1644418216020; 
 Wed, 09 Feb 2022 06:50:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZ+aCmdyVfsqG8nX2yK7Vow4vj4dB6fQbmE3flM8O2RH71KLJgArlRFmLkg6F73kXfRljWzw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr2468781wrh.307.1644418215812; 
 Wed, 09 Feb 2022 06:50:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t4sm15470023wro.71.2022.02.09.06.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:50:15 -0800 (PST)
Message-ID: <561e1f22-2741-b414-0267-14587d59d5de@redhat.com>
Date: Wed, 9 Feb 2022 15:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
To: Mark Brown <broonie@kernel.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
 <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
 <YgPOKf1QcOCtTisx@sirena.org.uk>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPOKf1QcOCtTisx@sirena.org.uk>
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
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 15:22, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 03:17:06PM +0100, Javier Martinez Canillas wrote:
>> On 2/9/22 14:43, Mark Brown wrote:
> 
>>> Unless the device supports power being physically omitted regulator
>>> usage should not be optional, it's just more code and a recipie for poor
>>> error handling.
> 
>> The device has a VCC pin but in most cases this is just connected to a
>> power provided by the board in its pinout header. For example, I've it
>> connected to a rpi4 3.3v pin.
> 
> That sounds like a very common configuration.
>

Yep.
 
>> I guess in that case what we should do then is to just have a regulator
>> fixed as the vbat-supply in the Device Tree, that's regulator-always-on.
> 
> Generally I'd suggest labelling things with whatever the supply is
> called in the board's schematics/documentation, that tends to make
> things clearer and easier to follow.
> 

The display controller datasheet and schematics mention VBAT as the power
supply but the documentation says that it's just connected to VCC and the
label in the display says VCC.

But I understand why the Device Tree binding and fbdev driver used VBAT
since that's what the documentation mentions.

>> The old ssd1307fb fbdev driver also had this as optional and I wanted to
>> keep the new driver as backward compatible. But I understand now that is
>> not describing the hardware properly by making this regulator optional.
> 
> It is depressingly common to see broken code here, unfortunately
> graphics drivers seem like one of the most common offendors.

I'll include a patch for the existing DT binding and mark the vbat-supply
property as required. Probably we won't be able to change the fbdev driver
without causing regressions, and I'm not interested in that driver anyways.

Best regards,
--
Javier Martinez Canillas
Linux Engineering
Red Hat

