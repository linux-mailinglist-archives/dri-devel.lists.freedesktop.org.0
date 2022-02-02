Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A74A705A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090DD8914E;
	Wed,  2 Feb 2022 11:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDB6892CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643802876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bL5rgnJNtTCmd2esmcO6OG/N+9v3ttozfnd4SZakfGQ=;
 b=hcaa9dCAp+0ejVhy5Si3NvBgyZAOq3Yq7JwkNYlaEUnEcJ0B0cFGKL+0X+qKFT0jMmqYr/
 9CRRXeSTTiIWCQp2RDx8U65N6TLrQgm712aZ7hzzEQNhRIZAhI1nFbG8ZRq0mxmyWq9i2/
 NR1gv90BlL150MxQnr9KRJaf2kUnWoY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-pK1pUiDmNDWCxkpPmrfPbw-1; Wed, 02 Feb 2022 06:54:35 -0500
X-MC-Unique: pK1pUiDmNDWCxkpPmrfPbw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso2388668wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 03:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bL5rgnJNtTCmd2esmcO6OG/N+9v3ttozfnd4SZakfGQ=;
 b=s51Wx8cx5QTAT3YuDIsey9filTbP5pKOl9AtM8ZxqyIzJkVvLs4wY4W1K0AIwRaSJ9
 8JEgDHQTjKomvEGSMX0bEAOm3NokDZzGqxhmWjXUdir6DsqaVr3MeIILTT//SVVdXv9D
 eCCj0mVq3Jun5x/wPErk5ybcaTMCl/dYjwwjg8fFhxIrUKepXycUKGTbkpSt12t9hQOR
 nOPvvgDQ9cZDUIh/OfNX8JSlHauD8jXt8lZ3utidTSExlhaF+S9iIRXH+3A5jBoI/7Vr
 7YqX2c6ZxIlKn5zNcRs2TTEJVNfoRXxO/Uo/scDSRHtr8kX5rz+6qSh1U7nhkYIm/SOl
 7OTQ==
X-Gm-Message-State: AOAM532QqRjMQIv+3Q4qS5tCR2rdd2+7JUWouhw2FnM7cZWHbYSpa5NV
 mpptD533KDD+NqOB4AVkc3DKzekc6t/L5HJR1OhV4I9gfJyeABx32BrXOAVFKc6dFa9TMFHFJxI
 hsng1qvFGvwnlwTDVQdAXo3nOb+T8
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr1969713wry.191.1643802874126; 
 Wed, 02 Feb 2022 03:54:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9uaj1noGIyEUrpXHbn9QwweYL02b/7HPtTFauTRqXOp7zTH9jXowWwcKexaK5dPFtRxWRqw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr1969689wry.191.1643802873900; 
 Wed, 02 Feb 2022 03:54:33 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id j5sm1444854wrq.31.2022.02.02.03.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 03:54:33 -0800 (PST)
Message-ID: <a3a06362-ab9f-e29b-4f03-968e3f1865ba@redhat.com>
Date: Wed, 2 Feb 2022 12:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
 <YfmaqUBqCrgp0QdO@ravnborg.org>
 <e552caec-5136-f4b2-12dc-23b182ab8af6@redhat.com>
 <YfploeCM6C5y3Imj@smile.fi.intel.com>
 <2f149fef-b991-9e34-98cb-426e561192ff@redhat.com>
 <YfpwGtjj5hGkN7A4@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfpwGtjj5hGkN7A4@smile.fi.intel.com>
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

On 2/2/22 12:50, Andy Shevchenko wrote:

[snip]

>> What's your suggestion then to solve the issue mentioned above ? With my distro
>> maintainer hat I don't care that much, since the fbdev drivers will be disabled.
> 
> I think both of them can work together. If user doesn't care, the first one wins.
> 

I don't think this is a good idea but as mentioned I don't really care that much
since we will disable all fbdev drivers anyway. So I'm happy to allow them both.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

