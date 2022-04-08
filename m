Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A84F90AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6912E10F085;
	Fri,  8 Apr 2022 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994EF10F085
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649406197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUcwtvoATPKcbLJbMiymueRtIS1H2mxW0mqljwxnCkI=;
 b=LkzHLKiSjR9le31eBSloJQ89QdTv8FyvWhznQaC+EGXIIS/tCJPuyxCQ+MpoT3WybJzoS0
 WffVdHqXnpO19iwt/W312k9MZFDSj1hQ6L6JKIQ+HkMOs9xFddET3j4X+yGRxd90GG13n8
 qz/D1lM4y1/4qVV2ebwuwgskPqH/ZrQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-VxvitrFrOQqdyspY4EI_eg-1; Fri, 08 Apr 2022 04:23:16 -0400
X-MC-Unique: VxvitrFrOQqdyspY4EI_eg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so1997503wrj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 01:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FUcwtvoATPKcbLJbMiymueRtIS1H2mxW0mqljwxnCkI=;
 b=3A3hF8m4cUaV0U2yrvuwM/+l6L7iJkAqsWZFSf5qTuptF/JA97wKxtx6PMgJsA0gsf
 BOtgpwsYpWwatykzZHvIFsru9XL48CbMhpcZu0Ezpb+dpi21XMeZ+OiSTpYO85UeHekb
 LNp5PAKKZ4JKqnh8sWGDbgYzN61t4Mlp3pM61M5B/FqVYYq/PtXUo5TxgEfQlBH1NXmC
 b7wcfAMuo+sJf3QMUWYj2jSM9McRbQvssot1FpkpEkeZAnaHbWGhO4nWLBuzw4pDW2dT
 7LNJY06l6/dAmb54hQicyliGhoiQdcNeJzDk/110TiJ3w1hfAzjopEovK8o39KwG0+Z8
 b4/A==
X-Gm-Message-State: AOAM533nWbPgue8mCbuDnlB/0WEfRfW5qhc2XQ+RorNMfpYmDP8cEIDw
 9O+JRVZ2OS03GL7ZgA93Uf0ejUudAaHl1ck8YJkPy7KC+0wMlbzsfQFHTKXWXu7H6iUksgNYK62
 c4f2zPjhpd84DvSi0rKMvFUPpBQbg
X-Received: by 2002:a05:600c:218f:b0:38e:9e76:d3d4 with SMTP id
 e15-20020a05600c218f00b0038e9e76d3d4mr2736729wme.53.1649406195146; 
 Fri, 08 Apr 2022 01:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8JHzx8H7yOzKjvWesVxprpjTwS5/70usS+SbIiXVLP90ZSgvc+nVUJsdy9HtKMZxtFTJa3g==
X-Received: by 2002:a05:600c:218f:b0:38e:9e76:d3d4 with SMTP id
 e15-20020a05600c218f00b0038e9e76d3d4mr2736712wme.53.1649406194920; 
 Fri, 08 Apr 2022 01:23:14 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm22799702wrb.8.2022.04.08.01.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 01:23:14 -0700 (PDT)
Message-ID: <67634336-4711-d643-03d3-d2514af55917@redhat.com>
Date: Fri, 8 Apr 2022 10:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
To: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-5-javierm@redhat.com>
 <58e38622-a041-3e5c-3dca-fa95cd5f59be@baylibre.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <58e38622-a041-3e5c-3dca-fa95cd5f59be@baylibre.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Neil,

Thanks for your feedback.

On 4/8/22 09:49, Neil Armstrong wrote:

[snip]

>>   
>> +static struct ssd130x_deviceinfo ssd130x_variants[] =  {
>> +	{
>> +		.default_vcomh = 0x40,
>> +		.default_dclk_div = 1,
>> +		.default_dclk_frq = 5,
>> +		.page_mode_only = 1,
>> +	},
> 
> Why not [SH1106_ID] = {
> 
> and later:
> 
> if (variant < NR_SSD130X_VARIANTS)
> 	ssd130x->device_info = ssd130x_variants[variant];
> 
> instead of less efficient ssd13x_variant_to_info ?
>

Indeed. I'll change that in v2.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

