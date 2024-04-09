Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E933589DBD6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 16:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923B310E33E;
	Tue,  9 Apr 2024 14:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BiIekLj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07D810E33E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712671917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QETFzGRSm1bw4GUFf/o3EqA88kh03NHDAFm3qRemJs=;
 b=BiIekLj2rixbEsCmnEFf7DZs03vn5JU/nx3z+FrKlUkX/zSHGSUiSQSQVvs4p8q8YPOXiI
 FYeT6onFe9DCOO5PpS1Kxgjrodji7cVDl+7DEFXTM3SLwB808r3RJs++0ea+DLTr0MeuHG
 E37eh5++YPcJpLxEJC9Je13DJmZBo6U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-Ksyfvb1CNmS_Jqsfet2F_Q-1; Tue, 09 Apr 2024 10:11:56 -0400
X-MC-Unique: Ksyfvb1CNmS_Jqsfet2F_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-416664de900so16941025e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 07:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712671915; x=1713276715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6QETFzGRSm1bw4GUFf/o3EqA88kh03NHDAFm3qRemJs=;
 b=Ef6YLvhrd/RYNe1NBgU5rLAMgE8sa3nHi7E6MdqYxj2dxiI8854QMCkXujM6v/9ngj
 xyxSTqOAQq52c929WDqEQ9qlhtYJacdZECdtBqi6896k6g1yDY0EAQtyqIE4Cu1iesNb
 FohmX3/iFoRaqzxGFgjcLgHlbEdaKnoQAd/m8Yxhld76eFCNfKErPJZr+NEWP1AurZiy
 9to9bopEcM7k9z0QJo3hF1N0spM5UoSptTlVRcpFgOnWjth+Y0X9pTKqdcBNYUr19TNe
 5iDqGSlOEXSKi1VGfeJEVuU/hrMk287CsD6svXzRd6EKLKJ+euaYdPrnXEoESweKsmcj
 cvKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFMB1NqhUXxYzMIs7vQ/ADYZEFe6aAAIXNNmLDFADrSAXfER7KE2z8bPU5Dl9DowJbqZ4qX8qkP+u1pFchSPpsOVbmVIbe9oZdQRkfFt6b
X-Gm-Message-State: AOJu0YzkpCd82i70XRwqaSAPYr2G+avgeoa8JbiB18GAF1zb2/DY4cID
 ZWaQEwQAzBSFCaxumDAQNXzLIJ2hNyPYmlCoPJyxlOwvbhSZYLDzSt9I7EWe7N6iqqqxSJ2hJkY
 Lpy2YsqkvXZ4mqn+udaUkiVRIKVVyxpYFvN1aN3J254vqSy2O8SzzxNPTh71Ss9pIrw==
X-Received: by 2002:a05:600c:470d:b0:416:b8da:c998 with SMTP id
 v13-20020a05600c470d00b00416b8dac998mr738570wmo.24.1712671915083; 
 Tue, 09 Apr 2024 07:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfqOIuAOhfRutLBre/XvGZ7lIUsT9LWe0NHxndx/xi3sUgufBvpLuHuRmgnRZYMUDedxjLOw==
X-Received: by 2002:a05:600c:470d:b0:416:b8da:c998 with SMTP id
 v13-20020a05600c470d00b00416b8dac998mr738551wmo.24.1712671914721; 
 Tue, 09 Apr 2024 07:11:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 bi17-20020a05600c3d9100b00416bf7b68f6sm70196wmb.31.2024.04.09.07.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 07:11:53 -0700 (PDT)
Message-ID: <908b83c8-1c81-4fe6-8e96-be51b445eef8@redhat.com>
Date: Tue, 9 Apr 2024 16:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] drm/panic: Add a drm panic handler
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com
References: <20240328120638.468738-1-jfalempe@redhat.com>
 <20240328120638.468738-3-jfalempe@redhat.com>
 <6fe7d003-6dbd-4df2-bf33-a6925810358d@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <6fe7d003-6dbd-4df2-bf33-a6925810358d@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Hi,

On 09/04/2024 10:30, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.03.24 um 13:03 schrieb Jocelyn Falempe:
>> +/**
>> + * struct drm_scanout_buffer - DRM scanout buffer
>> + *
>> + * This structure holds the information necessary for drm_panic to 
>> draw the
>> + * panic screen, and display it.
>> + */
>> +struct drm_scanout_buffer {
>> +    /**
>> +     * @format:
>> +     *
>> +     * drm format of the scanout buffer.
>> +     */
>> +    const struct drm_format_info *format;
> 
> Newline here and among the other fields please.

Done in v12.
> 
>> +    /**
>> +     * @map:
>> +     *
>> +     * Virtual address of the scanout buffer, either in memory or iomem.
>> +     * The scanout buffer should be in linear format, and can be 
>> directly
>> +     * sent to the display hardware. Tearing is not an issue for the 
>> panic
>> +     * screen.
>> +     */
>> +    struct iosys_map map;
> 
> I would make this an array of DRM_FORMAT_MAX_PLANES. Its functionality 
> is then equivalent to the fields in struct drm_framebuffer. Supporting 
> multiple color planes is the general expectation in the DRM code, even 
> if not all parts actually implement it. In the panic code, you simply 
> test that the scan-out format has only a single plane.
> 
>    struct iosys_map map[DRM_FORMAT_MAX_PLANES]
> 
Sure, that was on my todo list, done in v12.
> 
>> +    /**
>> +     * @width: Width of the scanout buffer, in pixels.
>> +     */
>> +    unsigned int width;
>> +    /**
>> +     * @height: Height of the scanout buffer, in pixels.
>> +     */
>> +    unsigned int height;
>> +    /**
>> +     * @pitch: Length in bytes between the start of two consecutive 
>> lines.
>> +     */
>> +    unsigned int pitch;
> 
> Also use an array of DRM_FORMAT_MAX_PLANES.
> 
>> +};
> 
> This data structure looks like something I could use for the 
> shadow-plane helpers. Expect it to be moved elsewhere at some point.

Yes, this can even be part of the struct drm_framebuffer.
> 
> Best regards
> Thomas
> 
> 

Thanks for the reviews,

-- 

Jocelyn

