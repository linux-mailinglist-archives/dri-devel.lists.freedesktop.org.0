Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C77492C43
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 18:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708410E1C9;
	Tue, 18 Jan 2022 17:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56710E1C9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642526752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z52nlSYdG4zSGEcNfty2xld/+KtOalwYbci677+f9Ow=;
 b=BBEvJZhzS6ETKoSgmA1qngyIBaNGZZhLRuRi77JSt8gXsSlwUpBHZUMOPJaueZ8087z6rS
 vyfGaKOoSMcxYCVk7k14h2UqABVvQwozyk4NWHZ1UW6/lRdTW4g/yVkVHGpoyNra/h5a31
 fxYTjKl1uxaZwClq4JAJdX7iihIHqkA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-79YqyFaGNeuO2ZDGZ8OHiw-1; Tue, 18 Jan 2022 12:25:51 -0500
X-MC-Unique: 79YqyFaGNeuO2ZDGZ8OHiw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso6430076wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z52nlSYdG4zSGEcNfty2xld/+KtOalwYbci677+f9Ow=;
 b=vYqxWFmLOxfnRxOpFsPoOSTUstQu6IbVyCAKxNyEnc/nJ75U3Tn+VW6MtFOg3lLQcx
 5yMK2N/HjBeNYkFwpCf7oyGA4bp9J1Ng5hvwGZ96pu0KBzCDIwaI0Exsx1F9GYDgfSl2
 b6i8icWxYDlF0/65OyqnPEN/VzVECCEcwcfE+WvoeU8aHrzFxr1XbzDn79KuBLCzpZxu
 n+vVqufN7EqFCt1Fl7sA/k0y3+KypqHSrODbn61ayX/HkyVFzf3eqk/zQHuilT1KCdfb
 m+i/iz2olJIoV2YO2jJWBsbfxLOTtusnG3fieuRGNLjfHYdkzV2QFuegjPx0Q4eP6CMH
 8vig==
X-Gm-Message-State: AOAM533woLQZ+FPj2KED2/43t1271FNb+HAUrP8k1xJIMfMbeZYQ+2q/
 lWCtcy29CxANj4IJ/077F4iCNfKUTSRO30MTru8FYwEWqeuCvY5goE9WpgKd0MBpTRV+XKDnZn8
 z2nwOp0krkRPhoLLlm421u6NcDRfB
X-Received: by 2002:a5d:67c9:: with SMTP id n9mr24932062wrw.46.1642526749576; 
 Tue, 18 Jan 2022 09:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyBKX0X6BFjE63QNTSwD+BbkFL1qmkimzsphehOwCdBtecOQSwycLMaQfyB9o+0J4gJzJSRQ==
X-Received: by 2002:a5d:67c9:: with SMTP id n9mr24932040wrw.46.1642526749368; 
 Tue, 18 Jan 2022 09:25:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:cb60:a1c5:8a09:190d?
 ([2a01:e0a:c:37e0:cb60:a1c5:8a09:190d])
 by smtp.gmail.com with ESMTPSA id r4sm3126392wmq.33.2022.01.18.09.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 09:25:48 -0800 (PST)
Message-ID: <dca8b176-cd2b-f27d-bdbf-8fd31b29d7af@redhat.com>
Date: Tue, 18 Jan 2022 18:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
 <b6526036-fcfb-734a-b45f-9ceec8aa656f@redhat.com>
 <fd5773a1-d780-4155-16fb-1c8f7fb73999@redhat.com>
 <8a8bbee0-1be8-5daa-fc86-dcaae4b78f8c@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8a8bbee0-1be8-5daa-fc86-dcaae4b78f8c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2022 18:17, Javier Martinez Canillas wrote:
> On 1/18/22 17:52, Jocelyn Falempe wrote:
>> On 18/01/2022 17:38, Javier Martinez Canillas wrote:
>>> Hello Jocelyn,
>>>
>>> On 1/14/22 10:47, Jocelyn Falempe wrote:
>>
>>>
>>> My worry is if this could cause other issues so I would only do this change
>>> if (is_kdump_kernel()), to make it as non intrusive as possible. And also
>>> add a verbose comment about why this is needed.
>>
>> This change must be done in the "first" kernel, so that when kdump
>> starts, it doesn't hang the machine by writing to the VGA interface, in
>> the early boot code.
>>
> 
> Ah, got it. The patch then makes sense to me as is in that case.
> 
> My comment about documenting why this is needed still applies though.

Yes, I will fix the commit message, and add a comment in the code.
I didn't know 0xA0000 was the graphic mode, so I though the 
configuration was a mistake.
But it turns out, the current configuration is good, but as the driver 
don't use this address, and kdump fails if this address is not VGA text 
mode on some hardware, it's better to set it to 0xb8000.

> 
> Best regards,

Thanks,

