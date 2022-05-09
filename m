Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9948C52064C
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 23:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B13A10F1D2;
	Mon,  9 May 2022 21:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17C10F1D2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652130058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Bzt3W796ASHzaRhn4eWjT9qF0zjWal03UtUWUfW2ts=;
 b=Lz3aCIOJKyKXwOd7FkGALwwCM7JpTzrlOuYbTo3dVmCl8SpeSgqG7xh22yHPMvppQfl73H
 6Fww3k7hVZel++BJxpfD2hn4PqdHCHGI1muAoj7Gzl+Jw4ChH6B2lSLN1/YanpIzrBklds
 TWPMBY85x5pBz16+9zMBTsViiNVEOdE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-LldDrcZfPEuyMzEOy8D5Mg-1; Mon, 09 May 2022 17:00:57 -0400
X-MC-Unique: LldDrcZfPEuyMzEOy8D5Mg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so6224536wrd.14
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 14:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Bzt3W796ASHzaRhn4eWjT9qF0zjWal03UtUWUfW2ts=;
 b=5AECQR4kSVi0HXziVuNq5RwnPKmm0o2lEQPNGfnOBuvIXODh4KdKbMlYge5z53bMuq
 xegbdBtVDxsLoVhX+m6I4Q67OB+1UZcoy1hBdyhGT/XUlvxHIJcyEbqyFxnkR5jv6IWe
 3eoEwwLc7qUKATSmEOnCnNxbmdAmFZngJUw3ziuzMSipAW9o3KiNuXj3xZXoL2LJYyvv
 FAD9xZKnKXzFBUJDOvWwpsLAsorwMyqrY/gipbJjwk0f8U9wNF6U94iWNLXKEfIciqLM
 /gVN5lhjwb9fefzwiUqdmKJWtLMaIrJ4NGSG7s4DgZTLl4P/kD27+cjCiWDmxO3DyKYz
 4Ilw==
X-Gm-Message-State: AOAM531/QBQ58/3tUSdAt3grvpGsNGpnsgUzFTyUlpfCoanQX7wOgtP9
 HfYeVhjdR4QVQeqM7MOECzGbuwMwrcH3uqFSFHgMVmO7fGGKM+M1tZGEuKxkITJQjdMBT05BhL7
 OIE41krzf4vmm3Wc8sOCxY6W8xgoq
X-Received: by 2002:adf:f649:0:b0:20a:df27:d7e8 with SMTP id
 x9-20020adff649000000b0020adf27d7e8mr15107007wrp.288.1652130056171; 
 Mon, 09 May 2022 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFwBxm4UloEUWx7Wm9pIsKjR/43tPJ1g0hvjMDf3EHbP9pjdwU5R2j7Xzx+8fltPu3RcufgA==
X-Received: by 2002:adf:f649:0:b0:20a:df27:d7e8 with SMTP id
 x9-20020adff649000000b0020adf27d7e8mr15106994wrp.288.1652130055952; 
 Mon, 09 May 2022 14:00:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 c190-20020a1c35c7000000b003942a244f49sm303300wma.34.2022.05.09.14.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:00:55 -0700 (PDT)
Message-ID: <0be47bc4-ae27-0293-eeb0-83010d0ab948@redhat.com>
Date: Mon, 9 May 2022 23:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
To: michel.daenzer@mailbox.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
References: <20220509094930.44613-1-jfalempe@redhat.com>
 <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
 <6b7acc25-64b3-297d-7842-a8cd59c8d98d@daenzer.net>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <6b7acc25-64b3-297d-7842-a8cd59c8d98d@daenzer.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2022 18:04, Michel Dänzer wrote:
> On 2022-05-09 16:22, Thomas Zimmermann wrote:
>>
>> It might also make sense to adjust the starting value of the lut table such that its final entry is used for the final entry in the HW palette. For typical gamma ramps ~2, the curve is fairly flat for small values and goes up steeply at high values. (Please correct me if I'm misinterpreting the gamma ramps.)
> 
> I don't think that's accurate. The most common ramp should be a straight line from 0 to the maximum value, and others may be curved toward the top or bottom.
> 
> 
>> For 15-bit case I'd do thing like this.
>>
>>   lut += 7;
>>   for (i < 0; i < 32; ++i, lut += 8) {
>>      // write  lut
>>   }
>>
>> 16-bit is complicated and may better be done in 2 loops
>>
>>   lutr += 7;
>>   lutg += 3;
>>   lutb += 7;
>>   for (i < 0; i < 32; ++i, lutr += 8, lutg += 3, lutb += 8) {
>>     // write  r/g/b lut
>>   }
>>   for (; i < 64; ++i, lutg += 3) {
>>     // write  0/g/0 lut
>>   }
> 
> That'll just drop the first 3-7 entries of the LUT instead of the last ones, i.e. generally the full black entries instead of the full white ones.
> 
> Ideally, the loop should start at 0 and then count as evenly as possible up to 255/63/31. I realize that's tricky though, and I don't have any specific suggestions for how to achieve this offhand.
> 
> 

If you want 32 values from the 256 table, something like this should work:

for (i=0; i<32; i++) {
    lut_index = i * 8 + i / 4;
}

lut_index will have this value:

0, 8, 16, 24, 33, 41, 49, 57, 66, 74, 82, 90, 99, 107, 115, 123, 132, 
140, 148, 156, 165, 173, 181, 189, 198, 206, 214, 222, 231, 239, 247, 255


-- 

Jocelyn

