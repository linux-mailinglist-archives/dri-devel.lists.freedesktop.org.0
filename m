Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC654AF1FF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC210E4BA;
	Wed,  9 Feb 2022 12:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E5810E4AB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644410482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2T/ZX315dLjrEaKbTpQjrwkLEmj/39CedeR+myw2pnM=;
 b=TKFMDoOM9aKBd4xApx2XssVsggMt/8CQAFxj9otRZOITcutpgqeRTCnTCDZFjm5cPNj+SU
 c+9rU3BYuUgw5YZUPDgytnuWWIx+C5jY3eU/g/Ue6uKo6OyWOZONC8cIGvHvSZH7IjYfNs
 hogfAFo2zkx9FXvzjfAErU/xqbgxFdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-TA7c8kXTNLule2wOa5pyOg-1; Wed, 09 Feb 2022 07:41:20 -0500
X-MC-Unique: TA7c8kXTNLule2wOa5pyOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso439114wmb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2T/ZX315dLjrEaKbTpQjrwkLEmj/39CedeR+myw2pnM=;
 b=UotBKMwabG59m2keqoAckwMhhycTwD57AmWfSSyA0lNHU4toSr2JfsdP91YILxcne7
 B5XeTfQf0oScJxWXmKyKose3Ikg2x0m4KQEHedVT+N5FPP2cCEPXzatwC2LwydqoUxCC
 ldPqSZP/p5umhbPa5mlRy+rFY44WgVQtqlKx63feo9yrMzsQWWwx5I70v5EZD54tXfu2
 /TNQiQw9msKyW9Foca+tsYOqg8v0Xo0drLNFnWPeKvnN2kuSNyZftkQ+r7XwgRJtzhpW
 9GZO80WhYPOpi70gbufrUdZYFDGBRzxxzRBlbUkjnZbBv27J+jgMItJLXLxxnsiddo1t
 GPVA==
X-Gm-Message-State: AOAM533oc0iYWO63qe4Iia6IDsWsfaPpPydTYd0RZHduebepBfToR6Zi
 N9TLhBu0CCNfgp9dk7/eKJ2qI5NMD0wap/JKPc90Gu9+lJhNW2YR2GuN1T9+xmfbllOey2nKke0
 z7XIz3DTjOW66opkQUHX/mE3wMDrw
X-Received: by 2002:a5d:64af:: with SMTP id m15mr1973600wrp.478.1644410479719; 
 Wed, 09 Feb 2022 04:41:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPYKui1CF0MIpN4jnFuKlY7TO7NxCK4qlra0MJS9GiBFjcirpTBRptBCzbYbNupz5K+sxp5g==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr1973587wrp.478.1644410479500; 
 Wed, 09 Feb 2022 04:41:19 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p3sm5299211wmq.40.2022.02.09.04.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:41:19 -0800 (PST)
Message-ID: <29312c12-5684-b134-3e0f-e02240c574c6@redhat.com>
Date: Wed, 9 Feb 2022 13:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/7] drm/solomon: Add SSD130X OLED displays I2C support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-5-javierm@redhat.com>
 <CAMuHMdXOfz94gD+SpGRS7HazxA_PN3n2D=Q04CPm-eEMb_CkEw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXOfz94gD+SpGRS7HazxA_PN3n2D=Q04CPm-eEMb_CkEw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

Thanks for your feedback.

On 2/9/22 13:21, Geert Uytterhoeven wrote:

[snip]

> 
>> +static const struct of_device_id ssd130x_of_match[] = {
>> +       {
>> +               .compatible = "solomon,ssd1305fb-i2c",
>> +               .data = (void *)&ssd130x_ssd1305_deviceinfo,
> 
> The casts are not needed.
> 

Right. I copied the table from the ssd1307fb driver verbatim. I'll clean it up.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

