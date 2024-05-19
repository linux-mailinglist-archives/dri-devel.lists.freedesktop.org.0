Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E48C94EA
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 16:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AC710E0D5;
	Sun, 19 May 2024 14:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KnsTuUly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7D510E0D5;
 Sun, 19 May 2024 14:09:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1eeb1a4c10aso51326165ad.3; 
 Sun, 19 May 2024 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716127788; x=1716732588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vtcnP5ITObrTkigttHDPw7YJgxN6MDR2Zkm+Z0h4/Ew=;
 b=KnsTuUlyDIm5RyxbcmqBGCazROqf+YT9KGRCcMtC1KTuUVxzEma/4umB0UuWf+roQC
 Uvsxs+7wPC5Ig+XGFN+S7LMGwJbTga3LCof4zHStXBuH/UEHHT/ziRb1pGMeRIhvQR8f
 6T8THlU7gI5xXldxNaNBOrTfTyoIP2P4dXrNKuTGBnq0D/2xDDgVFyeCVkYTELTwnOYM
 N97EkGZx+qWdFv7LM2fLqOjrYlNRdu+0FWWP1ePjBEM4Rhk7StxOBtz20tXbkpXe1ofv
 Tgasuth79PlrxbawPiHAkm40v2q82pfb7qzREqWgCfE0h8bwJRkJtXCgVAlOPdskSF8v
 lgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716127788; x=1716732588;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtcnP5ITObrTkigttHDPw7YJgxN6MDR2Zkm+Z0h4/Ew=;
 b=p5DIxTDsnv8VnY6HpwRcZ6o10PlLOxDnhzkHpK98ur+Wy81/Rj8yUvfWK5G8xktH9p
 jAInuUd8GvzdVRIXbGVhZxdlr/PKO8nc4c4CE5ZKHHPPYzd1LPJ3o19kayNc4hsUTS7p
 kZpcFWAHb9r8KdbndcxAazvgQ8WOfKR+lWiB+HypGkWpfDO0Lr94fMNESOWxyrDmjHlV
 ghj81A1FZqjchrZ12WOjUCvnE3su5AcKwyp7Vo/Q5+EF72O4h75aPVnApMrys1cioMg7
 MRbDhN4bbNagQMzD8SWvcbtcH8eTra7l5dGwNNmGdBtHSM57QX23DWhFC+YlO0agBV7M
 IHNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWWuE0BpEIKYGVlMCN3dfZtPTuPFmf7R8s/vIvhdJBiU2amyoibJIrPACX88H46qhyFQRFLA1PCC/8embIqW3rtGrCbHLfVm/br01UoHI/s6Ra0945g/M6TGf5aWGHoAcNebmjlssCsbEQGM35QA==
X-Gm-Message-State: AOJu0YzbEvNcp19lB6J3wCvsjC87Tse6Zrc/feA3ygDRU4JPVc2TUFUA
 8gLsiRmdJJSFAxO4TvkDeFfF6rzrz9ccDuqM5raLlk2iVqJbggaQ
X-Google-Smtp-Source: AGHT+IEMt4U2C/jaVTiB/rjsv/gT5LsTSDHWcs5phOqZJhB01vCSC+wJjQkTFduFWBB/9tTyRkSmew==
X-Received: by 2002:a17:902:9047:b0:1e9:320c:2ecf with SMTP id
 d9443c01a7336-1ef43d2eeefmr244624075ad.35.1716127787597; 
 Sun, 19 May 2024 07:09:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f0f192db3dsm64422115ad.233.2024.05.19.07.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 May 2024 07:09:46 -0700 (PDT)
Message-ID: <bf8af522-d4ee-47cd-82a8-635fc144b648@roeck-us.net>
Date: Sun, 19 May 2024 07:09:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
To: Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@gmail.com, dakr@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, javierm@redhat.com,
 kherbst@redhat.com, linux-kernel@vger.kernel.org, lyude@redhat.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, tzimmermann@suse.de,
 linux-hardening@vger.kernel.org
References: <20240518143743.313872-1-linux@roeck-us.net>
 <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
 <202405181020.2D0A364F@keescook>
 <a912c2d1-9008-410a-92cc-912e17c63695@roeck-us.net>
 <03cc262da2a3db817aa5663fbce6c914708b74f8.camel@perches.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <03cc262da2a3db817aa5663fbce6c914708b74f8.camel@perches.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/24 18:19, Joe Perches wrote:
> On Sat, 2024-05-18 at 11:23 -0700, Guenter Roeck wrote:
>> On 5/18/24 10:32, Kees Cook wrote:
>>
> []
>>> I think the INT_MAX test is actually better in this case because
>>> nvif_object_ioctl()'s size argument is u32:
>>>
>>> ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
>>>                                         ^^^^^^^^^^^^^^^^^^^^
>>>
>>> So that could wrap around, even though the allocation may not.
>>>
>>> Better yet, since "sizeof(*args) + size" is repeated 3 times in the
>>> function, I'd recommend:
>>>
>>> 	...
>>> 	u32 args_size;
>>>
>>> 	if (check_add_overflow(sizeof(*args), size, &args_size))
>>> 		return -ENOMEM;
>>> 	if (args_size > sizeof(stack)) {
>>> 		if (!(args = kmalloc(args_size, GFP_KERNEL)))
> 
> trivia:
> 
> More typical kernel style would use separate alloc and test
> 
> 		args = kmalloc(args_size, GFP_KERNEL);
> 		if (!args)
> 

Sure, I can do that as well. I'll wait a couple of days though before
sending v3 in case there are more change requests.

Guenter

