Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C393A4ADF57
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6390410E914;
	Tue,  8 Feb 2022 17:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436CC10E90F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644340802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvtYV1w2OGJoib9qyPYwsPmSmom8EsfjJ6qIk3HrlMg=;
 b=HCsZd6hELLefWH7gUv0HS23CDy4hiLPNsq5oyY8lcNJN1BdW8cJ8sxotzxZqMxMIXflFO/
 F9aejW4lpGSkiKKTBlFbj3rci7Z1RRpIJ2wuaTE4o9oxn5Tx9irzi28PgUusPCJe3u1q97
 K7Yn3SxheeevztS/p9+oA2g+BDCOLJU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-LJMSugGVMROJYObGPAJbUQ-1; Tue, 08 Feb 2022 12:19:58 -0500
X-MC-Unique: LJMSugGVMROJYObGPAJbUQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so827730wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=gvtYV1w2OGJoib9qyPYwsPmSmom8EsfjJ6qIk3HrlMg=;
 b=XJ3KucWVpr9PghDzM3qovfOm1O9++asbxUj+wIG+DQZFwPX73AdMacJRrVYaOZ9JbV
 NrJjB6QEcgurRGmCh5qInXToYlpHdy7oicHjB8+STHe/FRF33yllWsDff5eqjNeJRtSt
 XIIi/BL6E1LRHWxEyTwjYlffBDNbW31YsPlhIg/cZckCvPq8mHNQX0ekDNwV/zCsKtA+
 OzTrRU95+ze81rnlx7wnGbi7CdrHqH9i75qVjuOLBxESrAahobBa64d11Ks3galyy1I7
 vqVMMRnC1PM3FfrTO3qi4005zoJZ96aBlHBde6+56rGQ9iYuUaMIZt6QT+tcpklXCDFr
 MqpQ==
X-Gm-Message-State: AOAM5334/ncy3thWD3NDpo9/rxYxD909BQJLoF9FPEYSiCeH1MTFpOAa
 T5aMZ+PsivLOypmR6PQx570G40Ps3Xofre1spP7xkY2BvWmWjv3+wmAJfKAiwx5I6JAv9CV+R1E
 1eo7z3A7TkU+q686HIz5S4H1Ug14f
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr1970598wmq.53.1644340796908; 
 Tue, 08 Feb 2022 09:19:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCtP21kxl63t75zqIHQ/e55SNAp8JmtgJLzIfz68aaypGLhZPiKZoSOCdl+lNIIxOdEqmTpg==
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr1970578wmq.53.1644340796715; 
 Tue, 08 Feb 2022 09:19:56 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h17sm2393719wmm.15.2022.02.08.09.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 09:19:56 -0800 (PST)
Message-ID: <bb474101-eaa4-e815-0fa0-7adba3d56925@redhat.com>
Date: Tue, 8 Feb 2022 18:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <CAMuHMdWvrJip+W6ZZoO2ZURLc5CYmFno3=Sa2mL4xJE8gMzFqg@mail.gmail.com>
 <02d5b225-e1a8-77f6-7e4e-18d6a1df5e48@redhat.com>
In-Reply-To: <02d5b225-e1a8-77f6-7e4e-18d6a1df5e48@redhat.com>
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

On 2/8/22 16:40, Javier Martinez Canillas wrote:
> On 2/8/22 16:23, Geert Uytterhoeven wrote:

[snip]

>>
>> Fbcon does small writes to the shadow frame buffer, while fbtest
>> writes to the mmap()ed /dev/fbX, causing a full page to be updated.
>>
> 
> I see. Thanks for the information.
> 

I found the bug. Partial updates where indeed broken and only a full
screen update was working. I didn't notice because where using your
fbtests that mmap and do a full update.

Thanks a lot for reporting this, the issue should be fixed in v3.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

