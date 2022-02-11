Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AD4B2075
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2310EA23;
	Fri, 11 Feb 2022 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86A910EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhiejNdZNc9V7Q57Z4FGfEE9W4EtgIkRByXMCdx4jhQ=;
 b=jMniQzghdCSnuvlxHcu49FP/Obyx5NWFaPwcyzzfZdjxyooE8BajYvjCf1xUbnQO8F8ju5
 pcksNg21DA5dsfClrrEk6z6jgEmqdInXVwNh66SXER1+m99CNDJ/6SfYrSzCW5EaaIe6L4
 OpEEFD18jFoE4lIPWJk3cvN/ondEI+Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-GnxJKc4GMru_0V3XF9XHlg-1; Fri, 11 Feb 2022 03:45:55 -0500
X-MC-Unique: GnxJKc4GMru_0V3XF9XHlg-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020adfc748000000b001e333edbe40so3594302wrh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 00:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=yhiejNdZNc9V7Q57Z4FGfEE9W4EtgIkRByXMCdx4jhQ=;
 b=nizypF74x1un1EG7282sj0tmre3t3e974sUolYoTFVR6gj8astAMO9cGcSNQrFcCd9
 pheDyC+yo5u51fC328cTeHepNDYZZyG15NlRaqjxDMobKzNikln/RB1dzoZN2SgV+ZfJ
 020DByBvIAvfOBF3XJatk01ctg/3/0rZI2m/TGA9S3jfjBEu8KlX8eEHIuiIHhXpLrOg
 8SPj2tuUsmPAgWiQlRuMgQWqHu+c6q8GeCX48yGkG0UvzSO5TcgU6sUMxHR4d0SpB/Tv
 WuAUR3pRFeUeOaKwmWAb+JgnKLcQDCaqdmKBv5njKQexzwEZ58v72Scq7OPzYtnDV+PK
 GnKg==
X-Gm-Message-State: AOAM532tF8UazLi79/wmN2zmKjlK3GH2NjEU8JH0u3CPHVx+8EWXvINn
 3T3NvJnssWAVE97I7LJ0V3Sk88J2PD7xclsOnnAw6GPDckqkdp59w8OSdn4jXm53q3O9ivSoJKe
 0qFax8fHV3/4rrPgXpuEnKuNstQrk
X-Received: by 2002:adf:edc9:: with SMTP id v9mr470915wro.135.1644569154549;
 Fri, 11 Feb 2022 00:45:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydD7roXdtXZjQWp72Wo5fcJQ6eNKNYHlSPNx2dupK8zLBlB9eyylPxhSvKDBOJgfjPqx/X3w==
X-Received: by 2002:adf:edc9:: with SMTP id v9mr470898wro.135.1644569154333;
 Fri, 11 Feb 2022 00:45:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id az21sm3460772wmb.11.2022.02.11.00.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 00:45:53 -0800 (PST)
Message-ID: <9ee28446-2dda-7015-1a0a-44dc8385002e@redhat.com>
Date: Fri, 11 Feb 2022 09:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/7] drm: Add driver for Solomon SSD130X OLED displays
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
 <58ebacd2-d44d-c7e9-e752-de7815dd4cc1@redhat.com>
In-Reply-To: <58ebacd2-d44d-c7e9-e752-de7815dd4cc1@redhat.com>
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

On 2/9/22 13:37, Javier Martinez Canillas wrote:

[snip]

> 
>> There is still an issue with the cursor, though.
>> After doing "echo hello > /dev/tty0", the text appears, but the cursor
>> is gone. "clear > /dev/tty0" brings it back.
>>
> 
> Hmm, I was able to reproduce this too. Thanks for pointing it out,
> I'll investigate what the problem is.
>

I still didn't have time to dig on this for v4. But I think that the
driver works well enough to be merged and we can then fix the issues
that are still present in the fbdev emulation and fbcon interaction
as a follow-up.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

