Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F658A660D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF40112AF0;
	Tue, 16 Apr 2024 08:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CXDAdv2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E861112AF1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713255940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlRGwveZNaKTf/vaEO9gfk6UvaP7DHItsQdZ9LD5yHU=;
 b=CXDAdv2cicIzYL0XNcCz0PzMP+YSgTVo89h1TnYdQM/xlNPddTtMM44ob7gYq67U43mRAt
 TaRzmXAmfl7VBhAcTrS0LLKI8cGkCarb+UOcJdtRXAd2/lKUeQcgOOkEki59xPl1A814cq
 QzqE6F1F3UgdlkcF4vYXynIB0BWcVnE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-y7ne3KIsOfOWhGRR2_VqLg-1; Tue, 16 Apr 2024 04:25:38 -0400
X-MC-Unique: y7ne3KIsOfOWhGRR2_VqLg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-343e00c8979so2872176f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 01:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713255937; x=1713860737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qlRGwveZNaKTf/vaEO9gfk6UvaP7DHItsQdZ9LD5yHU=;
 b=XwYFWlciMP9SrXK8guvq77PoGWKZvXXjeTl1oGgFR40QLhAgjvNCpEkqSvoamdLxV4
 aV7vhvcxTYPPlO7qJIrWW6JRcvPZ6DSNyGDl86iXSgOqdCFbLbcSEnplnuNwBt/ryiEw
 4v4HRanETC+dEAMYMC4p+YysMrEdQxWdS2KydU10VykXxtJj+eE5tizinDmooGUP8Kb4
 gafKxftJ55ZniHgXPy6yBMk3mfnvKg+66yNeI5xl5wv6UfP6NFdg/6z8eWPUQ8CC31Ym
 a/eQ1kB+uzU91MrQmFpITmYpGe5Cw0PZap0NLalKzqqe2qvmxQ4pti7t65jQ57mJHzG5
 dXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKD8xGJO3I7PBbEN0InbfoThcbMK/FOUNAty+ST5Ad8+NkEvYrnCKtNIPcsDNLoTgQeWivNicREQF3zwWRx5g1aEhWfT5YaF95mSAcTCtb
X-Gm-Message-State: AOJu0Yx5OxtY2AXQY8wLLwU9iU//v+OfWsdHwTZRdf+ogX/IUUodef9C
 OT2HkD2G2XE41tDlJRf2y0knFkfPBAC5c0eJ1chzXUcbukEnxAGj94tnUOP7Ak0tEiuUFwctKCk
 75P0AI5od6Nd0Y8P5xMRQl/kPnUqGLfBrXylTfpz5Z/1kCG0w8RbPPy0nXho0mTATpQ==
X-Received: by 2002:adf:e350:0:b0:341:c9d1:eae5 with SMTP id
 n16-20020adfe350000000b00341c9d1eae5mr7129807wrj.27.1713255937580; 
 Tue, 16 Apr 2024 01:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKytJX+FjhQR2w1i1oJtNMSD1iHaqi6KTBm9EVmUYy4DH79bYUapQe5OqUrK74IzMetGwlpA==
X-Received: by 2002:adf:e350:0:b0:341:c9d1:eae5 with SMTP id
 n16-20020adfe350000000b00341c9d1eae5mr7129796wrj.27.1713255937264; 
 Tue, 16 Apr 2024 01:25:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d4d8d000000b003432d61d6b7sm14045151wru.51.2024.04.16.01.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 01:25:36 -0700 (PDT)
Message-ID: <70ec563b-b6a8-48d6-9f9b-287b13df8f36@redhat.com>
Date: Tue, 16 Apr 2024 10:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240416173112.04579e40@canb.auug.org.au>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240416173112.04579e40@canb.auug.org.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 16/04/2024 09:31, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter or struct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
> 

Hi,

Thanks for pointing that out. The parameter name is 'sb' and not 
'drm_scanout_buffer', I will send a fix.

Best regards,

-- 

Jocelyn

> Introduced by commit
> 
>    879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic")
> 

