Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4849CA9A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0A410E6E1;
	Wed, 26 Jan 2022 13:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C05510E6E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643203182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYqBTg039yG6KmQki1vnfW07McLgJNXZp1LNPPbwRyU=;
 b=SUq0iGjLWrlL2Lek4X/myBf+pnR7TSfWKCDBrrW5aum17rISRYeSvdKm7JjjImEDQlz+Ck
 dceOtMYWWDNM1Zl59HP/ws6Yy9ezvtVBwiFgt4vQMpMDbD/3QEU4QgSymbuX2uK66DDjKs
 d14l4xU/NT4ILHUnHvls2X5yp6xUMNE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-6jcprRz5OeuMM8fA0r7jbA-1; Wed, 26 Jan 2022 08:19:40 -0500
X-MC-Unique: 6jcprRz5OeuMM8fA0r7jbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so4286757wrm.16
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kYqBTg039yG6KmQki1vnfW07McLgJNXZp1LNPPbwRyU=;
 b=A+TlmSLmnI1n23Tx4vv++/vXHJwL1qjAr4mZHggxoWLI77CA1pmqhVZTFSYT8rCBR3
 4dneXE0I/a7eOPNatvECya8BXii/hCiI2JZwMvk5bazbHHK2K2yuKUE95sA0vdl3YdaL
 fXJUceXM8c+Hn6dJ6YXMX1TJQ432T6gOOIv/gVSjPRrmrWaP+r5Nt03DgeNmouiPY538
 eE9guz5Z1V8CUzvuG0SPzFjmlNLAZHPp0W823wTG3oVSfTk9K39u2DARr8/bS0CoNBho
 vGXmXssCxrgTAoInvBa/Hy15LpnVrD+QApKbO78OWEx6Tf5FSgfluczvH3qeK88lTdUp
 1KEQ==
X-Gm-Message-State: AOAM5312C2BRF2vbw1y7JaZzlTTqzON32MCxs6LJhXbDNet6Hb8+I0cO
 g+jbcczUsZhRcLOt4f9uSAbM7mRXXKtVGrBHv3te+9JIZhmdbO8+8Fzcln6BoKakmnr8Di9iMG8
 8R5mA1WVzkXQX5RnFS0C19quN/n5z
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr7384000wmd.14.1643203179717; 
 Wed, 26 Jan 2022 05:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhzLOqHtQwaIpauLzMMgIbq+NXnLWl8IbD9oWCl1awOJ7DEu7sTaSS8Umh6aandrR9my5u6A==
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr7383980wmd.14.1643203179526; 
 Wed, 26 Jan 2022 05:19:39 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n8sm3264381wmk.18.2022.01.26.05.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:19:39 -0800 (PST)
Message-ID: <afb68b5c-8d1a-17c4-a62b-be985c5bc613@redhat.com>
Date: Wed, 26 Jan 2022 14:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
 <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
 <YfFE61IQus3SMQRZ@kroah.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFE61IQus3SMQRZ@kroah.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 13:56, Greg Kroah-Hartman wrote:

[snip]

>>    fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)

This was a copy and paste error. It should had been:

                   (DRM driver in drivers/gpu/drm/tiny/ili9341.c)

>>    fb_ili9481.c
>>    fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
>>    fb_pcd8544.c
>>    fb_ra8875.c
>>    fb_s6d02a1.c
>>    fb_s6d1121.c
>>    fb_seps525.c
>>    fb_sh1106.c
>>    fb_ssd1289.c
>>    fb_ssd1305.c
>>    fb_ssd1306.c
>>    fb_ssd1325.c
>>    fb_ssd1331.c
>>    fb_ssd1351.c
>>    fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
>>    fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
> 
> I'll gladly take a patch that deletes the fb_* files that are already
> handled by a DRM driver like you list here.
>

Sure, I'll post a patch later today. If there's something missing in
the DRM driver, anyone can get the needed bits from the git history.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

