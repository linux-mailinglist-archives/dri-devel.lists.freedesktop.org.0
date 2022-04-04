Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B264A4F1970
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68110E220;
	Mon,  4 Apr 2022 16:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B02510E315
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649091517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfXVG2LWmlhxvH9mQkRRvHM6oog3iVL1XZEsuBNjm/c=;
 b=FkabnPyzuQY1gBbj5C9GUgZTRhhOwwSb/xionwfjJ1CPRxT+Adn+PmKdir4KF6GlMfXYhd
 BAbKbNkihJ2RjPL5vHzaiMmH+AdAlgAzCMYaup0NgULA0Jht6ccKAA1P/wX3eYCWVAOhwC
 s2zqOBmW4L2c0XAkb6LRmiZ31BPfICs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-OPNvxqvdPe6NYJQ6MCSk_Q-1; Mon, 04 Apr 2022 12:58:35 -0400
X-MC-Unique: OPNvxqvdPe6NYJQ6MCSk_Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 d29-20020adfa35d000000b002060fd92b14so808102wrb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 09:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xfXVG2LWmlhxvH9mQkRRvHM6oog3iVL1XZEsuBNjm/c=;
 b=Va63gE7u12qSosuk8+ZSxwOTv1fpR/NikM9IjsOu5kmes0wmXqfyQBq+FNxq+Vtk/k
 GWWvUSN4JGVNe3mxU+rdEIgJd6IC0w3o5lfSBlrasLe4aplGWmBGkWmvEDrlBMGi7eP5
 WWjJF8Kro2KoF0/zKV+jyC3w+hxCR7QxX3Iw3lcN0PGnZlzo3r2C0LwP+D2J0nVcE3PM
 yHjz3f4kQS69dcBm0Fjfls7I9WwXUI5wuswokFCsyKb8TvsQizbmPRFa1XLGMNpc9DhI
 jVp3qEXKhEubEXuCSKdudoS9SLf0Mt2BOuU5M5l+qqnFlv6bvepaVNiugOAwb1uAdu7K
 NW8w==
X-Gm-Message-State: AOAM530IugBKa1J7uAGVHBvuH/94RNbvQQ6yXguWPzA1bltLvLnVZWUT
 TTSlBpo5+46s2Iq+jb345AmKuH+16/Lqjdf+Lj5NtEAoDB7qZLK6C9t37OTDjpz/QNbcEs4BQXd
 +KRmMPEzOrHJ7lsGs2bt49V4FTQYh
X-Received: by 2002:a5d:410c:0:b0:206:b5c:65c7 with SMTP id
 l12-20020a5d410c000000b002060b5c65c7mr534239wrp.94.1649091514694; 
 Mon, 04 Apr 2022 09:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKDTMoBjJ4f1T5UNl+SpGUCBQjk0UlUhzCd3D6qnO9zx/TbihX+oajM7/ljMLrCcySTKcPAQ==
X-Received: by 2002:a5d:410c:0:b0:206:b5c:65c7 with SMTP id
 l12-20020a5d410c000000b002060b5c65c7mr534220wrp.94.1649091514448; 
 Mon, 04 Apr 2022 09:58:34 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm38126wmq.40.2022.04.04.09.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 09:58:33 -0700 (PDT)
Message-ID: <0d296685-0769-d669-b3fd-d5ca26717c64@redhat.com>
Date: Mon, 4 Apr 2022 18:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
To: wens@kernel.org
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-3-wens@kernel.org>
 <CABxcv==csvqsxM46ce2LecDh4E-UxxD2DG+3E-hCFoyrdtRv7A@mail.gmail.com>
 <CAGb2v64VQPjan=EUkd8UhRZfV0g1GqBwPqhxQakS=7YhgvVDQA@mail.gmail.com>
 <92a46ea2-e23e-b7c8-ea5f-35d458ee1b76@redhat.com>
 <CAGb2v66zj4x7zx4ht+6ojjKRxEe+M4bTc_mKRgf8wd_TK+Wf4g@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGb2v66zj4x7zx4ht+6ojjKRxEe+M4bTc_mKRgf8wd_TK+Wf4g@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/22 18:11, Chen-Yu Tsai wrote:

[snip]

>>>
>>
>> tl; dr: unfortunately we can't do it due how SPI and I2C report module
>> aliases. Otherwise module auto loading will not work. I wrote a much
>> longer explanation with some details not so long ago:
>>
>> https://patchwork.kernel.org/project/dri-devel/patch/20220209091204.2513437-1-javierm@redhat.com/#24730793
> 
> Right. I think that crossed my mind at some point, but didn't stick.
> Thanks for raising it again. :)
> 
>> BTW, I bought a SSD1306 SPI controller and go it working this weekend.
>>
>> I plan to post the patches once yours land, to avoid in-flight series
>> that may conflict. And what I did is mark the -fb as deprecated, then
>> added "ssd130x-i2c" and "ssd130x-spi" compatibles strings.
>>
>> The WIP patches can be found here in case you are interested:
>>
>> https://github.com/martinezjavier/linux/tree/drm-ssd130x-spi
> 
> I took a quick look and a couple things stood out:
> 
> 1. Would 3-wire SPI ever be considered? If so, might want to
>    rename some of variables/functions as *_spi_4wire_* to
>    begin with.
>

That's a good question and something that I considered too. I have to
admit that never had a SPI device that uses the 3-wire scheme though
so I don't know how common that is.

The ssd1306 datasheet mentions that the chip supports it but I could
not find one to buy. Read that should be able to do it by soldering
some pads in the board but that wold be more hustle that would like.

For that reason I just went with only supporting 4-wire and someone
if really like could provide patches for 3-wire SPI.

> 2. Maybe we should move the ssd130x_deviceinfo stuff into the
>    core module, and define an enum to use for matching compatible
>    strings across the modules to their respective device info
>    entries? FYI we are doing this in drivers/mfd/axp20x* .
> 

Yes, that's a good idea. I'll add that refactoring as a part of the
SPI series. Thanks a lot for the suggestion, it was very useful.

> I think a friend of mine has a SPI based SH1106 module that I
> could borrow and test/work on, but that's a big if.
> 
>

Cool. If it uses 4-wire too then I believe that would mostly work
out-of-the-box if you add a compatible string for it. I didn't
have to do any change in the core ssd103x driver for the ssd1306
SPI to work.

> Regards
> ChenYu
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

