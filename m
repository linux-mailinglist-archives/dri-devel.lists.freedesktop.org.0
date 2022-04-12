Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1184FD2C8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAC910FE87;
	Tue, 12 Apr 2022 08:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6026910FE83
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649750468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yun2BU4GEvJ6pZF2R1wwCOG8a5Yady7UA0t+GMUdSTY=;
 b=fUpPgD/8rto0XCXD75TcNOumHT/cDF7x7SqA5qVpcA6V6A3l/h8WnZiykpHcYcZnlGZqlj
 gw8UG7t87lMO8FxgZNPrrdVEXzAWvAbIwVUNxO9eUUyiXV22GOGwW8aJ7Hc/vKeqcpdbra
 ByldzWmc6DUJAndMHhp/Po2YfOo+jzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-PkHx0CAJMaqTOUPqc0YvAg-1; Tue, 12 Apr 2022 04:01:07 -0400
X-MC-Unique: PkHx0CAJMaqTOUPqc0YvAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l41-20020a05600c1d2900b0038ec007ac7fso937501wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yun2BU4GEvJ6pZF2R1wwCOG8a5Yady7UA0t+GMUdSTY=;
 b=uvuHT/mohr5zLzHrefustx5dJ9ihofsFyUNzAdZfBUGB8dsg9XoeMv4WTU4vZExHlX
 KX90P27SPT0LKl5P/6yNjoKYDThae/lPIl3DDaNB1xvS1wCzNY3rnrvHPVxK1qaq9jeT
 veQUfYwhtQGe4QJVJsCkTxpjn/K88eV9n86YXE8SugohD8sjwlyhYk/Ap6vplM+uxVO4
 sTcJ4ujXjlaMNR87ibCQlAGoRtcJtCXCIiTWtS+eAGHSVRWUN0ExrNMcYkDjfPzB/Qpb
 V073Ev5ZnkaPJ+dPm2bIO7bvFYsizvVCsZBh2iQG70qXj+USI7928t5G1tWBVA5Y4z8G
 Z/ZQ==
X-Gm-Message-State: AOAM531a+rpEvo+PcoFMy4aBN+zohfIMk2PVrEIxsSbuUlsegnApIKJ5
 uF5fUqWRUz1AcoIxyU/+OZUBhDj1o9/qexpiStyFkNH+GLT6b5walsyyt/DbIcH6nMOSClxqdcM
 MGPM0/mCO5q9wbPr8putvZMcSj5WN
X-Received: by 2002:a7b:c013:0:b0:38e:9edd:a44c with SMTP id
 c19-20020a7bc013000000b0038e9edda44cmr2843805wmb.122.1649750465614; 
 Tue, 12 Apr 2022 01:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4xyJVcMPwaSHo28mAGHjTf3te+mbmf7aS3NcBbvG5DwIb2JGi3dRKgJeBadFNt9Ppg1fEeg==
X-Received: by 2002:a7b:c013:0:b0:38e:9edd:a44c with SMTP id
 c19-20020a7bc013000000b0038e9edda44cmr2843777wmb.122.1649750465293; 
 Tue, 12 Apr 2022 01:01:05 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0038e8fb63293sm1694298wmq.22.2022.04.12.01.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:01:04 -0700 (PDT)
Message-ID: <d37de4b1-55f7-ff4d-6230-6f0b6e65799c@redhat.com>
Date: Tue, 12 Apr 2022 10:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Extend schema for
 SPI controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-3-javierm@redhat.com>
 <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
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

On 4/12/22 09:16, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
>> add to the schema the properties and examples for OLED devices under SPI.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> ---
>>
>> Changes in v2:
>> - Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven).
> 
> Thanks for the update!
>

You are welcome and thanks for your prompt review and feedback!
 
>> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> @@ -39,9 +39,14 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>
>> +  dc-gpios:
>> +    maxItems: 1
>> +
> 
> Perhaps add a description, and clarify this is for SPI only?
> 

I wondered how to make it required for SPI but couldn't find another binding
that did the same and I'm not that familiar with DT schemas to figure it out.

Before, when I had compatible strings just for SPI I could do the following:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - sinowealth,sh1106-spi
              - solomon,ssd1305-spi
              - solomon,ssd1306-spi
              - solomon,ssd1307-spi
              - solomon,ssd1309-spi
    then:
      required:
        - spi-max-frequency
        - dc-gpios

but now that we are using the same compatible strings for I2C and SPI, the
compatible string can't be used anymore as an indication to make required.

Do you have any hints here on how I should enforce this in the schema ?

Or if you think that a comment is enough, then I will add it in v3.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

