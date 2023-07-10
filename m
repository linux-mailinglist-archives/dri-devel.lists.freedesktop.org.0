Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC974CF73
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832B310E219;
	Mon, 10 Jul 2023 08:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8110E219
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688976466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwvFRWKF/bULxHiG8B4aBkBghwPwWvcvtpbD0/smRs4=;
 b=KmLxlWMEOkVB1XbPEtrIHILunT1wuFvW1WcfEKZmQzubrihbcEw6Ut46PjUYUGyqEYwzMw
 bw/4Kvo2mRGOVOPCFIRUv2zOs8WhWG22uOzgnkFXQRgG8SpuWEC+TbeP7fquGKHk/e939b
 yi4RYrDGrKNh7fAEq6INr1JD/5ldskE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-Tx3uIcfgOJ-TKBwERL_TzQ-1; Mon, 10 Jul 2023 04:07:44 -0400
X-MC-Unique: Tx3uIcfgOJ-TKBwERL_TzQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-314394a798dso1950193f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688976463; x=1691568463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NwvFRWKF/bULxHiG8B4aBkBghwPwWvcvtpbD0/smRs4=;
 b=k0DtlUT0yaiuviJosUovgbXEVeALqN9kxy4iQH/jYBIu368AOhXxrRhXLKV1pgIwbN
 Qg7NK/RV88+h+gMEmaaE+/AxyjMBGVUmEjTmKE7cgGBTHauRs7RYzupwFhMVWeOAjtoZ
 mNw50C7q4qCa+14S0rlRPi8f8Ik8ZkAgH2D0n/JcrmCjT2NLsiTgyl/yFZLzUws9lERn
 KT37g+z60IPjAx8p31BsIbQ6FQqJbqH5/9s1v4frgS7j7NQAkwsXfQCgY4A7WjjKoO9Y
 JXCW0Z5ADrACQQFxZqqRfixVBoe/7UP2wBuDzRvx2sMv+2LyW6Wmy0kgpHwhDo7Wpy+x
 LEIg==
X-Gm-Message-State: ABy/qLYewjDABusXcg9A0qgylV6jUf5Albvfwuryr7hbBd1980I10XBq
 7oHJ36qVMQMSOmg1KCcrhy29eooSeWuwxzD7V6kOJ07hxiV5XRwc3NI2ZcKqLX2GDWC0Kpv5xu9
 sEA3XaG2LBmEOZ9Yd+16PsTVJk2JPjC4SfGpm
X-Received: by 2002:adf:f08f:0:b0:314:1f0:5846 with SMTP id
 n15-20020adff08f000000b0031401f05846mr13044190wro.19.1688976463549; 
 Mon, 10 Jul 2023 01:07:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG8u3v282DS6vhXTlMQZmXsu+8hfr+Sm+Jl42MSbzCTdRbrAfcBC5dEyuu/S+N7IxxipTjQhQ==
X-Received: by 2002:adf:f08f:0:b0:314:1f0:5846 with SMTP id
 n15-20020adff08f000000b0031401f05846mr13044166wro.19.1688976463224; 
 Mon, 10 Jul 2023 01:07:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 23-20020a05600c025700b003fbc9371193sm9494077wmj.13.2023.07.10.01.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 01:07:42 -0700 (PDT)
Message-ID: <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
Date: Mon, 10 Jul 2023 10:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 07/07/2023 09:30, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.07.23 um 18:37 schrieb Jocelyn Falempe:
> [...]
>>>>
>>>> You could out-comment the VGA code in the ast driver for testing.
>>>
>>> Oh, Thanks for the idea, I will try that.
>>>
>>
>> The result is that I get a black screen on the remote BMC. So maybe 
>> adding a remote/bmc connector will solve that.
> 
> Could work. That would be a connector and encoder of type 'virtual'?
> 
> Not all ast devices have a BMC. Do you know how to detect its presence?

Hum, I though all ast devices have a BMC, and I don't see a way to 
detect that BMC is active or present. (It would be even better to know 
the browser's size, and automatically resize, like when using a VM. But 
I'm not sure the hardware/firmware is able to do this).

On the other hand, are there any drawback to present a BMC connector 
even when the hardware doesn't have it ?
> 
> Best regards
> Thomas
> 
>>
>>
> 

Best regards,

-- 

Jocelyn

