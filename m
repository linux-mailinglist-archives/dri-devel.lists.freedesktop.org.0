Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842FE562EF4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E58C10EF9D;
	Fri,  1 Jul 2022 08:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709110EF9D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656665521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udc+9nQYCXpKtUSeD4AdJU4l9g2/mTgQomYQfLKkOSA=;
 b=BfCCDU1ouiFrHM3yWaSTlHrXEh3GiibJ8U5MiHK+bcicjx/EckVoh3k611HqlDlT060bea
 VqmjW5n5MltVcUhgXNcfl8eP8YFHZIeuLSLTfHdNbrmwfEEKM490Qi6b2nJOyZqotN4QRs
 6EUydO8eYxFfrMZZmpV1/SGMpWnDghA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-Mg4lCR2jP7m9vnNv2spAPg-1; Fri, 01 Jul 2022 04:52:00 -0400
X-MC-Unique: Mg4lCR2jP7m9vnNv2spAPg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c20-20020a05640227d400b004369cf00c6bso1333662ede.22
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=udc+9nQYCXpKtUSeD4AdJU4l9g2/mTgQomYQfLKkOSA=;
 b=ahCdmDdIUMWfjq9nLwf3/H5D4VccksY+Vny0M6AMucBmu45luEFOtAv+LLCGOC1Ba2
 gc7EA8UcKz4hZAOf4CvtpzthnZxgdsCZW13dW3T2zAZpi2l+hUyxlA8kPdl6mCq9ixBI
 QS1Qf54faFJcag8ko3NeLJwp0LFJAKjrSDHANRz7a4GzllhspBwJNzQf74uhDIW+51F+
 qIJuC8G0t12iY9yyQojHIu3B3B1bPMYG39ABpgG53xNtHUwS33YDO3dcqAfkFlfyD3VH
 kQudLVsBr7dsPV5b0X7GgcXxVyW9IufFKhqJlpt4vdQ3ijxK+ZkalVDQ7Z0w+e91+vy2
 /q1g==
X-Gm-Message-State: AJIora9JA9OpOaNIdomScg5rs8/LTX/ZdI+V2Y5ToUqMGPVCAzv2sjkr
 a3ZYPA9aW2MrCH66eMomKJfbohnnLWLkEieKLfVKv3biPtq7LTE32Q9JyPcSGlx69SekgMyu2qN
 qhytRoMLVFVCLFQRItio8TycGV5/G
X-Received: by 2002:a17:907:8a14:b0:726:b4df:7863 with SMTP id
 sc20-20020a1709078a1400b00726b4df7863mr13277227ejc.552.1656665518826; 
 Fri, 01 Jul 2022 01:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snbGPU189g4fT1ob9fShEWwNqTET74oirxXMKlNvTi4qBZvroYFYsiKB7q38l3VqOizBfQXw==
X-Received: by 2002:a17:907:8a14:b0:726:b4df:7863 with SMTP id
 sc20-20020a1709078a1400b00726b4df7863mr13277208ejc.552.1656665518606; 
 Fri, 01 Jul 2022 01:51:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm14435496edb.60.2022.07.01.01.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 01:51:58 -0700 (PDT)
Message-ID: <73d45c58-dddc-cd1c-c8f7-c43e5cfedc96@redhat.com>
Date: Fri, 1 Jul 2022 10:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH resend] drm: panel-orientation-quirks: Add quirk for the
 Lenovo Yoga Tablet 2 830
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220623112710.15693-1-hdegoede@redhat.com>
 <0767f7c7-13fe-3209-50a7-61c1a46a1149@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0767f7c7-13fe-3209-50a7-61c1a46a1149@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/23/22 13:46, Javier Martinez Canillas wrote:
> Hello Hans,
> 
> On 6/23/22 13:27, Hans de Goede wrote:
>> The Lenovo Yoga Tablet 2 830F / 830L use a panel which has been mounted
>> 90 degrees rotated. Add a quirk for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks. I've pushed this to drm-misc-fixes now.

Regards,

Hans

