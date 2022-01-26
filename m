Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0249CB35
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0FF10E721;
	Wed, 26 Jan 2022 13:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2764410E711
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMApqNt1ZgI6jKrx8919Fwq96Y3BR80tJUMXs42hsh8=;
 b=B6HgCI8nroL78duOOFi7iAlArldQR3QdXZEKPcZTehvEeGzWp5J9McfxIYK/t6VxAnW+9T
 c3Sv6FEFR77RfWKN3KnKx1DI14sRgr5JxNCDcRmEYUz+kD+U+UyhW+W82G6TL4svTtTTtO
 fE/AwyaT2AU1qRdCOOJeeANipeRWcAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-gmyFKbhTMFucRdV173L-pQ-1; Wed, 26 Jan 2022 08:46:10 -0500
X-MC-Unique: gmyFKbhTMFucRdV173L-pQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso4301773wra.14
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nMApqNt1ZgI6jKrx8919Fwq96Y3BR80tJUMXs42hsh8=;
 b=ArsSoEyYgZkYoSI7U0t+c7pfZ9N435CvpXiUg4YTJXMgXnE9N8blZAF22DiUk7bZsx
 YG8K3+QwN++5S7HBygWSMjTH5RzO6SQ0jkirHdK5Sy07bLE35pN4KjjKRcYtcLHX2BDn
 TFMEGQII6EkZ2SuNsUgkuGzSINnl/lQTA4vl0M615XitdwMsrkVVBGwu1P5sMrP7F4yX
 WH67QAzTUkh0Opi1us6dDsfh1npazpbp/6smGK3qnAz6r8u93BTpdu/QFf5oSONBJG/E
 CVpYsCWFGjGmgAu8VJRzsgEu4EyDDSNR/4oIhwulOqQSxn5evXI+rEMTQQlIKACEgPjV
 Eu4g==
X-Gm-Message-State: AOAM533c0jUIpphi75TmGUwDOksJcc0yV7Fg3HHjm6pv1fhNBPHrwfrW
 YzOF3Fxz6r7TWZMFk+FvPM8dXtcvIo5WSQ+3gM2MB7HhaAALU4Hzp8XRmC8g8Hln89FN0+yDmnm
 MoeSUiU9dmB5/79WrzpP0b3RWLcD8
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr7603331wmj.135.1643204769699; 
 Wed, 26 Jan 2022 05:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD39jP25QuHyT/d3Ps5v4zM6D8JIYamRlR6NsTAlxrtt8yJfueUZCTKAbWmscHo0FL1EDqYg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr7603318wmj.135.1643204769510; 
 Wed, 26 Jan 2022 05:46:09 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f13sm1652132wry.77.2022.01.26.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:46:09 -0800 (PST)
Message-ID: <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
Date: Wed, 26 Jan 2022 14:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 14:12, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 12:26:36PM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
>>> On 1/26/22 11:31, Daniel Vetter wrote:
> 
> ...
> 
>>> You are describing a transitioning over to DRM - which is Ok.
>>> But on that way there is no need to ignore, deny or even kill usage scenarios
>>> which are different compared to your usage scenarios (e.g. embedded devices,
>>> old platforms, slow devices, slow busses, no 3D hardware features,
>>> low-color devices, ...).
>>
>> All of those should be handled by the drm layer, as Daniel keeps
>> pointing out.  If not, then the tinydrm layer needs to be enhanced to do
>> so.
>>
>> Anyone have a pointer to hardware I can buy that is one of these fbtft
>> drivers that I could do a port to drm to see just how much work is
>> really needed here?
> 
> I have bought myself (for other purposes, I mean not to convert the driver(s))
> SSD1306 based display (SPI), SSD1331 (SPI), HX88347d (parallel).
>

I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.

I didn't find one with a SPI interface but we can later add a transport for
that if I succeed.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

