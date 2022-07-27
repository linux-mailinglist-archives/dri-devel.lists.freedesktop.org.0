Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D3582354
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 11:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39745C3D63;
	Wed, 27 Jul 2022 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60816C3D33
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpYq8k+/zMFls5kVctZr6/54tObnNDYVXoF8Fq/DZnM=;
 b=D2nm8c8BNp6PbmFcApo4NSUDjf8H6GfGB8gTITZ596mIkJf+aySdJE4aNI5XfhvLG/bFGf
 BuhnJcVnhuPr5BJOSBf1BLB26BztMCdUo4tNrI/xWWB9nGnyqFHPtnUm0DRlNtSCwI961/
 YX8mamnFzvPvs6/U2BnZ8GYDtB3ibRE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-KEjju9AlMTS_OfvytjeGQQ-1; Wed, 27 Jul 2022 05:39:34 -0400
X-MC-Unique: KEjju9AlMTS_OfvytjeGQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 n7-20020adf8b07000000b0021e577a8784so2623177wra.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QpYq8k+/zMFls5kVctZr6/54tObnNDYVXoF8Fq/DZnM=;
 b=Xtkr9ni7mCE9PCYQWgDqlah2//48/X/NQ1eOoRTui82odOgF0/KLCgZANMjuSAAB/e
 gy9EFZr8Y2GLV5qjioqQzmqqWPfAkwfnCJLJchPKEVkPXKpWkJOIArLbjkZmH3X96mfi
 F67vtZlvM1iB4gKNHWaQK7gsHwyc3Oop75Wd0UGFfBPfnHMAEL6hVQ+4vFNOG3T5s2P3
 WbWRoOEmIJTrWIcqgmfVbQ18decixZYFyzkfspJlGOnlDTpnQUonAz3wR6c9iJnbuGu8
 oWRG0O1M18Ka7YV4E3ykOMhx/y0FxI4AW4mMRaNOZKSHI9QGddCCUAZTDwYKaWMH/Xiv
 sMlg==
X-Gm-Message-State: AJIora8IFswSUUju1r0PahdUuxilC3IS0rCaOimqY61728CCe90tl98m
 tUtWgY1w1xVDQg2cFvgxSck5EQm3+SOnBQW2o0kXQ0YI71/vzicdZQQv/CkCYO1Ugn+D6mV2f3+
 8eXxk8xWTWKE2KTziQ6xggljE3ITu
X-Received: by 2002:adf:b317:0:b0:21e:5096:cc9a with SMTP id
 j23-20020adfb317000000b0021e5096cc9amr13218336wrd.481.1658914773569; 
 Wed, 27 Jul 2022 02:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6OiTl+LoNwlWe8XcV0qSJ43j7F7WYkuLmnsjp6cy+jmMuLmruPU5Ty1ROsOCb5ONKsRirzA==
X-Received: by 2002:adf:b317:0:b0:21e:5096:cc9a with SMTP id
 j23-20020adfb317000000b0021e5096cc9amr13218313wrd.481.1658914773238; 
 Wed, 27 Jul 2022 02:39:33 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b003a17ab4e7c8sm1877647wmq.39.2022.07.27.02.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:39:32 -0700 (PDT)
Message-ID: <b3392ac8-0e21-d429-489f-b12a562dcb7c@redhat.com>
Date: Wed, 27 Jul 2022 11:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/10] drm/simpledrm: Move some functionality into fwfb
 helper library
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-7-tzimmermann@suse.de>
 <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>
 <623cde06-62ec-c8be-0f0e-2fd900c2359a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <623cde06-62ec-c8be-0f0e-2fd900c2359a@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/22 10:24, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.07.22 um 18:23 schrieb Javier Martinez Canillas:
>> On 7/20/22 16:27, Thomas Zimmermann wrote:
>>> Move some of simpledrm's functionality into a helper library. Other
>>> drivers for firmware-provided framebuffers will also need functions
>>> to handle fixed modes and color formats, or update the back buffer.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>
>> Nice patch!
> 
> TBH it took me 3 tries to get something done for this library and I'm 
> still not happy with the result. I want to share code between simpledrm 
> and ofdrm, but that turns out to be harder then expected. A good part of 
> this code appears to belong into other libraries (you also mentioned 
> this below).
> 
> I don't want to duplicated code between simpledrm and ofdrm without 
> reason, but I expect that this library will somewhen be refactored and 
> dissolved into existing libraries.
>

Yes, I think is a step in the right direction and guess it would be even
more useful once/if a 3rd firmware-provided framebuffer driver is added.

> 
>>
>> [...]
>>
>>> +
>>> +/**
>>> + * DOC: overview
>>> + *
>>> + * The Firmware Framebuffer library FWFB provides helpers for devices with
>>> + * fixed-mode backing storage. It helps drivers to export a display mode of
>>> + * te correct size and copy updates to the backing storage.
>>
>> the
>>
>> it is "backing storage" or "backing store" ? I always thought that storage was
>> used for non-volatile media while "store" could be volatile and non-volatile.
> 
> Why store? Isn't that a little shop for fashion or groceries? I'm no 
> native speaker; I can't tell if either implies that we're sending 
> pictures to a warehouse or bakery. :)
> 

LOL.

> Would 'back buffer' (in contrast to 'shadow buffer') be clear?
>

Back buffer is more clear indeed.

[...]

>> It seems a little bit arbitrary to me that format is the only field that's
>> a pointer and the other ones are embedded into the struct drm_fwfb. Any
>> reason for that or is just a consequence of how types were used by the
>> simpledrm_device_create() function before that code moved into helpers ?
> 
> Format is constant and comes from statically initialized memory in 
> drm_fourcc.c. I'd expect to be able to compare formats by comparing the 
> pointers. Copying the format here would break the assumption.
>

I see. Makes sense.

>>
>> [...]
>>
>>> +static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
>>> +{
>>> +	const uint32_t *fourccs_end = fourccs + nfourccs;
>>> +
>>> +	while (fourccs < fourccs_end) {
>>> +		if (*fourccs == fourcc)
>>> +			return true;
>>> +		++fourccs;
>>> +	}
>>> +	return false;
>>> +}
>>
>> This seems a helper that could be useful besides the drm_fwfb_helper.c file.
>>
>> I believe patches 1-6 shouldn't wait for the others in this series and could
>> just be merged when ready. Patches 7-10 can follow later.
> 
> Yeah, I'd like to move patches 1 to 5 into a new series for merging. 
> Patch 6 is only useful for ofdrm and as I said, maybe there's a better 
> solution then this library. I'd rather keep it here for now.
>

OK.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

