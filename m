Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F414A7016
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413D10E5C3;
	Wed,  2 Feb 2022 11:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D57110E5C3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643801974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udGfbFsD3WjS9bv8IIFrQcIv1RwbGFk7ab6Qa1eMKEE=;
 b=Bg6r97C51QpJwbqu7TlwIIR815gx4ev2ec39cX9RhT7lTnH2QbPUklB9gCpDszLU/c3tl8
 Q+AFwMrDmzM525W9buVa3TXUMB+7g6pt9ab2ZexshMwH1c7Q/C/PGkUEoIwHH3qflU51dx
 oLgLTrWwFaWkl/Yb93+EqdCGKbpLAnM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-hap8_Z6yOTiBgXjBkZj9vQ-1; Wed, 02 Feb 2022 06:39:33 -0500
X-MC-Unique: hap8_Z6yOTiBgXjBkZj9vQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so2366021wme.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 03:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=udGfbFsD3WjS9bv8IIFrQcIv1RwbGFk7ab6Qa1eMKEE=;
 b=RIn8jVhXB5yCM/9vplv6dc9Xaf5/WZmFpa3Hz0JCVo+XwZj531DcUyFrYCmQIHIPC5
 jhxyR29DpyH0bNLBbSRCM2jsJeMchhfxDaMbAJbjzXiLME1zSHtHJYocn9eFjMbBXhSA
 4TFaG2/4HonbwCE8+pz5cxN1UQ+pW8rqPy1KPd/1pppc6JLDIsGmeEkbf2OdFZHhASkh
 2TQzpcgHgIKjKH0kglfD7eOM4JweA4Qmi5Pq1syey6YTnxOB+Q+lRRdsHWRmzz36F+Bj
 ePOeX5VhBvj5zL7rh5t6fW2CTtA4WYKvNIFKHotau03PC/Ht4whsgz4ORYpT64zUYvZv
 nfoQ==
X-Gm-Message-State: AOAM5331U9GaZStTHDvMWz9SJAqX2STel4syixlBHvJobWDyDlpMGYQx
 VXGXg56z9d8/raerrd1ASK04Fyu+6Cn35lKrSUrwgKDpoJXE+/9jJzAUI0sS6+Y0m2PkrLOIDTn
 3vEHyhTf7+bPIZ5z/laaJQZuOJ68m
X-Received: by 2002:a05:6000:1707:: with SMTP id
 n7mr25289519wrc.234.1643801972292; 
 Wed, 02 Feb 2022 03:39:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIYnUCCInjr37c9/22HdQPcKzX7C106buTPKlsAaiTOOtU5+XcopMUfetRz5oizfbknnWbWw==
X-Received: by 2002:a05:6000:1707:: with SMTP id
 n7mr25289493wrc.234.1643801972038; 
 Wed, 02 Feb 2022 03:39:32 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m11sm4097810wmi.16.2022.02.02.03.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 03:39:31 -0800 (PST)
Message-ID: <2f149fef-b991-9e34-98cb-426e561192ff@redhat.com>
Date: Wed, 2 Feb 2022 12:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org> <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
 <YfmaqUBqCrgp0QdO@ravnborg.org>
 <e552caec-5136-f4b2-12dc-23b182ab8af6@redhat.com>
 <YfploeCM6C5y3Imj@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfploeCM6C5y3Imj@smile.fi.intel.com>
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
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

On 2/2/22 12:06, Andy Shevchenko wrote:
> On Wed, Feb 02, 2022 at 09:38:51AM +0100, Javier Martinez Canillas wrote:
>> On 2/1/22 21:40, Sam Ravnborg wrote:
> 
> ...
> 
>> Peter Robinson suggested to
>> make the driver mutually exclusive and add !FB_SSD1307 in the config symbol.
> 
> And how will distros choose "the right" option in this case?

It depends on the distro. In Fedora we are disabling *all* the fbdev drivers.

> What to do when I wan to see a regression and I want to change drivers w/o
> recompilation?
>

If you want to have the two drivers without recompilation (and same compatible
to match) then how would kmod / udev choose which one to load ? It becomes a
race condition between the two drivers which one probes first.
 
> NAK from me to that proposal.
> 

What's your suggestion then to solve the issue mentioned above ? With my distro
maintainer hat I don't care that much, since the fbdev drivers will be disabled.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

