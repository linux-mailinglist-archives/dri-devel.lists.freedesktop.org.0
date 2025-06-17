Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12801ADCE5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C310E704;
	Tue, 17 Jun 2025 13:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PdkeJRJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137E810E704
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 13:55:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so4382555f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750168510; x=1750773310; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SdHhdWey0/d/NpZD62B8im5YiGSFH+Yv8719uzu2IhE=;
 b=PdkeJRJro9tkDyRsrGVUTfVv2psnpwm5OU3a0VnrP2Q0w7r97ZukyxU5TwlqyzjYka
 oYw/iZfUgV/9hqmIpgtPA8VsINldpL7JiNNDjYY4ScKuv1+B5PvVo9+1k7a6C/36NRnH
 xe4Yy9ABtE9edVKOxE14PgrJ6AeKjMdeiAlJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750168510; x=1750773310;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SdHhdWey0/d/NpZD62B8im5YiGSFH+Yv8719uzu2IhE=;
 b=nM0QY2yTm15Xy/kwOVvO0UVlA/VT9VQKgq7W+p38jqEv21y2DyEn+zLKMkZ8YooP3r
 kbg+KoLqg0Rdv6+3yd9r/kt6yX3C1t/vswPUsSVvR9ce5PEHWy7sVGVmxr3Vwjbz/Gyr
 Oe8XjTMO60IcrpDBwrTQ7Ngw7rvBJtcMynFKiWjjKyULn5uNyebV/ZPnLURdBeYHqSmJ
 Y5w7Egm8qG2HpALIMQc3Lg6a2X83m0LNJBVr9rYrZVfWtK9dmcXG4BD/+icmBOmuVP94
 YrZV+fbS6kqDhHFktw1PG+xbicVUZKJC/9TuP6XZE/33zwdUwdQGzZlytHTqJOjXm0lo
 U+xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJKqHKxqTCDd11DSQcIKKKJ6xXohm3EsQwmiqEzEXA93Z4uVDf3AplYlapSUxLL7bwVvOq20cIHXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdlyTKvOk3PxveI6EbW6LysNtLt2GD1Rh/mG3qDKqYKeA/iQxi
 ZGKTjV7nHy78bKFfIXE+Me1S1tBEPjGQ625vbI6cmFJZOZt+v4dLhiNSlxMI+Zj3maE=
X-Gm-Gg: ASbGncuJsx6V6cNlR8AB/HsiKei1Rjmrqg9jmZvozMSNWr/blUIAL9lm+oqgWSpJArZ
 Ly9xKY5W14tPaDq48yRuezSLq/+FNWx1jBEPQyFxC9X4aJ4AUAFDy3v/z0v1Z2IpLPkbL+owMEr
 e8VkBWzJM2LPwgcaBWBiYGBnvYN/FXAp+pOwreehjUDlBiVFRVeKV8s0c0Fw42UAJo6JJMPyriW
 sCAJgK/nnBEBLU8ayKvpQ5I63KFOoQxWn9Wo6xb/KyWCM+1FY9k6XJdYAyke+34vgiM44jxVhMH
 bUfq1+huHNCbFKze94JYIq/SN6LO/hiMgkDKVz1yfPzZt4I+qARw+umBPN8pqUvljD6UBVz1jA=
 =
X-Google-Smtp-Source: AGHT+IGJ+m09gQWsDd4UfkeOF5T8mBRUSIg0URHGjc06ZG0oq829d88zDbJcG/ihK5SQerGPR4Q+3A==
X-Received: by 2002:a05:6000:178e:b0:3a4:c909:ce16 with SMTP id
 ffacd0b85a97d-3a572e92862mr10399134f8f.49.1750168509899; 
 Tue, 17 Jun 2025 06:55:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b09148sm14545683f8f.58.2025.06.17.06.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 06:55:09 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:55:07 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, jani.saarinen@intel.com,
 jani.nikula@linux.intel.com, tursulin@ursulin.net,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aFFzuzS8b7KgykZP@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
 <aEw3IRn565keDO6B@phenom.ffwll.local>
 <26705733-0c24-4f3b-a6ce-d5f2fd8c935d@amd.com>
 <aE_0PLfh3h2IeTun@phenom.ffwll.local>
 <28ef7ee3-0f02-4609-bb56-926cda563d60@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28ef7ee3-0f02-4609-bb56-926cda563d60@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Mon, Jun 16, 2025 at 01:38:17PM +0200, Christian König wrote:
> On 6/16/25 12:38, Simona Vetter wrote:
> >> 6. Now FD2HANDLE is called with 10 and here is what happens:
> >>
> >> 	drm_prime_lookup_buf_by_handle() is called for handle 10, so we
> >> 	don't find anything.
> >>
> >> 	obj->dma_buf is true so we branch into the if and call
> >> 	drm_prime_add_buf_handle() with handle 10.
> >>
> >> Now we have called drm_prime_add_buf_handle() both for handle 8 and
> >> handle 10 and so we have both 8 and 10 for the same DMA-buf in our tree.
> > 
> > So this is the case that broke, and which the various igt prime tests
> > actually had testcases for. Unless I'm completely confused here now.
> > 
> >> So FD2HANDLE could return either 8 or 10 depending on which is looked up
> >> first.
> >>
> >> I'm not 100% sure if that has any bad consequences, but I'm pretty sure
> >> that this is not intentional.
> >>
> >> Should we fix that? If yes than how?
> > 
> > I dont think there's an issue, all we guarantee is that if you call
> > FD2HANDLE or HANDLE2FD, then you get something consistent back. From a
> > userspace pov there's two cases:
> > 
> > 1. We've already seen this buffer, it got handle 8, that's the one we've
> > stored in the lookup caches. If you then do GETFB2 you get handle 10,
> > which could be confusing. So you do
> > 
> > 	temp_dmabuf_fd = ioctl(HANDLE2FD, 10);
> > 	new_id = ioctl(FD2HANDLE, temp_dmabuf_fd);
> > 	close(temp_dma_buf_fd);
> > 	ioctl(GEM_CLOSE, 10);
> > 
> > At this point new_id is 8,
> 
> No, exactly that is not guaranteed.
> 
> The previous call to HANDLE2FD stored 10 into the lookup cache
> additionally to 8 with the same dma_buf pointer.
> 
> And if you now get 8 or 10 as return from FD2HANDLE depends on how the
> red/black tree is balanced. It can be that 8 comes first or it can be
> that 10 comes first because the tree is only sorted by dma_buf pointer
> and that criteria is identical for both 8 and 10.
> 
> As far as I can see this case is not correctly handled.

Hm right, I did type some testcases with flink, but not one that does
funny stuff like this :-/
-Sima

> 
> Regards,
> Christian.
> 
>  and you already have that in your userspace
> > cache, so all is good.
> > 
> > 2. Userspace doesn't have the buffer already, but it doesn't know that. It
> > does the exact dance as above, except this time around it gets back the
> > same gem_handle as it got from GETFB2 and knows that it does not have to
> > close that handle (since it's the only one), and that it should add that
> > handle to the userspace-side dma-buf import/export side.
> > 
> > It's a bit a contrived dance, but I don't think we have an issue here.
> > 
> > Cheers, Sima
> > 
> >>
> >> Regards,
> >> Christian.

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
