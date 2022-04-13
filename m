Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF444FF3FF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0104610EFF0;
	Wed, 13 Apr 2022 09:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049510EFF0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649843078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foBzhikXuCLjtC6Ari8RZkx+1wS4aS+fCUlhb35KDqw=;
 b=Hf4WPju10aDAb66s2Oc1qy0BqI77Gr5qouUqoorPrI5aXXhkrtXDGRI708J50tG4A4+QK+
 IGxbD5H8SrN7pxonv3gCek/y+o4WfshjM837diJx61k5M8ZBrJRX0bHRCpMsoFIQS2l539
 okFWW4129fW/TmYILB3ba7K9Izzcids=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-D-Tdha59PEKUY0-2p3WKHg-1; Wed, 13 Apr 2022 05:44:37 -0400
X-MC-Unique: D-Tdha59PEKUY0-2p3WKHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r132-20020a1c448a000000b0038eaca2b8c9so232217wma.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=foBzhikXuCLjtC6Ari8RZkx+1wS4aS+fCUlhb35KDqw=;
 b=0xzbLwmSub+AJkEBSLVAwsTryl6WE7ABays8Rdth8RDsACKNBUjRXhoOrkkuZ3cVNA
 VifMhWX96nOjLASzKpZ1j6EpbxbM4+4qPgQHZ8RgmU8J5Mb6YtKXT/+5CigK/1GMJmWO
 BvxP+VwmUVZ58nzBzQGgFmMossiPJ/XWJXCTFBKZqrXWLS3B5GVqs3Yn6qfn8Wks8bbe
 3Qb/tKMnOLsZ/P5EN+LPp4vcGk3oS9WCC1S0ulK1HLizjU1SfkOM59NakpuYcPEYk5WG
 bjHIfXqs54V+5ARA7dTJrPAeQPujXswejGmjPcVskIrjsYfT4ldZFx/7nuSWLH6mExHi
 RTUQ==
X-Gm-Message-State: AOAM531HseVLHufjhFWu8IVjZga7IE6KsvhTo7bIntAzTfOsYABEuKLS
 kdhxmDDSEXfTB4mF2djQJHYSqVLbehMXkOX3D0Ij0V/FqugHeu/e+S+Lys9gulccUd4f/AnO+GT
 NPmZi3/Jj/ykQkQeoimREhZk7cP/D
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr7706530wmb.199.1649843076508; 
 Wed, 13 Apr 2022 02:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0HXRzJbUNXpEFfAtNGvrG9B9JzK/eHK2ZSXSccHuCPbF3oaO1WosnYsBkWkBzF47eXcT4NQ==
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr7706513wmb.199.1649843076247; 
 Wed, 13 Apr 2022 02:44:36 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm37150569wrc.6.2022.04.13.02.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 02:44:35 -0700 (PDT)
Message-ID: <ddf107c7-5108-f366-45a8-e7244cdcd209@redhat.com>
Date: Wed, 13 Apr 2022 11:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] dt-bindings: display: ssd1307fb: Extend schema for
 SPI controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220412162729.184783-1-javierm@redhat.com>
 <20220412162729.184783-3-javierm@redhat.com>
 <CAMuHMdUDxexqsGjb3B37jW_xZU1TBLq8gK5hctA+PKjL+LhQGQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUDxexqsGjb3B37jW_xZU1TBLq8gK5hctA+PKjL+LhQGQ@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 4/13/22 10:04, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Tue, Apr 12, 2022 at 6:27 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
>> add to the schema the properties and examples for OLED devices under SPI.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>
>> Changes in v3:
>> - Add a comment to the properties required for SPI (Geert Uytterhoeven)
> 
> Thanks for the update!
> 
>> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> @@ -38,9 +38,16 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>
>> +  # Only required for SPI
>> +  dc-gpios:
>> +    maxItems: 1
> 
> Actually I meant to also add a description, like for vbat-supply below,
> to explain the meaning of "dc".
>

Ahh, sorry for misunderstanding you! Something like the following looks good ?

  # Only required for SPI
  dc-gpios:
    description:
      GPIO connected to the controller's D/C# (Data/Command) pin,
      that is needed for 4-wire SPI to tell the controller if the
      data sent is for a command register or the display data RAM
    maxItems: 1

If you agree with that, then can squash before pushing or add it to a v4
if another revision is needed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

