Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E836AA86553
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4898910EC51;
	Fri, 11 Apr 2025 18:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CrnM7K2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1905A10EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 18:16:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso23435495e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744395410; x=1745000210; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NZxkE8WxAT0tt5y2UWBTlT2UlHaYcabNRmvlvPzxNGo=;
 b=CrnM7K2BhF2AfBNQnPSrZxmUddX9B7lzE2phSkTLM/ByB16UQNwRc4vLVZviWWLetY
 TM/RfFbpFkVRQW5XtZDZN0Tzcgj0E7lx+Bsemj6c4YyGjcWaC2sD2+lH7lCQgh1kF+kB
 VYHN/kXDbKZfSOL1qcF72kDDqBdLTcFkoV1dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744395410; x=1745000210;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZxkE8WxAT0tt5y2UWBTlT2UlHaYcabNRmvlvPzxNGo=;
 b=stldL9tPryKN2yTuH7jjJpSuwsOSNqzL9ZjK8xzgmPS9Uuy4Ia+J32IboTnv7imsmg
 RskuAqcHzvc6fU3rLiQSfQnwCO2n+HQhtPdF388NRkn5lvUI+FLFiB166/4bzsunqKpw
 u7QkPfDCCsnP7XQkdz6C2CxrfnlU0ybj9vzye1Nl/+AXnKCJyxdfojte+q9+8zQ6I55K
 Gcn7i7B8xTOzSQFyG+E0luBaMXhsStu7r0e7D8bzV5go7Kg1ILpwcOSoJg5GjZGBLI/y
 e4vabOElDrjBJReZbVJ4A9XrmVNBTfYHtfAAId77+rhgtLFT92DN9RJ6oBGZd6vGXh3m
 Bt7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEtyPDQwDp3uiDwW3HUPXA8onGKI0IocKxXMARz1nkoCUs2I6a//KjstTFj8y1jFz96jevB7UIVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/cfZJQTxUio6DdjaYBvER6+ar4knIxeSDcokgYxHg4InB3H3l
 C+zCKtRYrzZmfYZq3JV3O/aD4DZPImK5ZjFxe7yEkumTGQtiFpXWStY5sSv7/L8=
X-Gm-Gg: ASbGncuLAVJ5ZeDZQu7VN21uiPOtjUbWGMI70my03I8a1/ibaqNys7avksrt6ms8iI2
 +u6v2TivfwFZFQnRJ+TJAmapaKwXfqzNAbHaJpxOl/fSQ/UU5nFqAtJWZaVCBTXZIEUVtN1ncmo
 vS8Xnei33/j97CnOI1agCsDplqrPPfjuQP1AnAtzGX7ozj5HL3lyoV+XYd5cm4jkzrbIhG1+bD5
 DkKXxoo5nKOTxysKPJRImMgMWh4MaOQx+/GjXm2cKIeB82UiB7L+4K/pB0D3iD41Kyl4UW5JQfk
 L42TWG3zJFv2V99g2K9ZBE3BbSnRrlkSqBSkYHfxC53Ri+EPNi5r
X-Google-Smtp-Source: AGHT+IHMfTNrWP4hQFb0GQUyG0fpyElWUI07s483secQs29wCtyhNQLUcn9eSq5r1YGymCNO0T2AEg==
X-Received: by 2002:a05:600c:3c89:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-43f3a929372mr35568155e9.2.1744395410124; 
 Fri, 11 Apr 2025 11:16:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979663sm2843766f8f.51.2025.04.11.11.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 11:16:49 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:16:47 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 kernel@collabora.com, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <Z_lcj9pgunJFuj_4@phenom.ffwll.local>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local> <Z_kenr95QUq9rFpt@blossom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kenr95QUq9rFpt@blossom>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Fri, Apr 11, 2025 at 09:52:30AM -0400, Alyssa Rosenzweig wrote:
> > 2. Device Lost
> > --------------
> > 
> > At this point we're left with no other choice than to kill the context.
> > And userspace should be able to cope with VK_DEVICE_LOST (hopefully zink
> > does), but it will probably not cope well with an entire strom of these
> > just to get the first frame out.
> > 
> > Here comes the horrible trick:
> > 
> > We'll keep rendering the entire frame by just smashing one single reserve
> > page (per context) into the pte every time there's a fault. It will result
> > in total garbage, and we probably want to shot the context the moment the
> > VS stages have finished, but it allows us to collect an accurate estimate
> > of how much memory we'd have needed. We need to pass that to the vulkan
> > driver as part of the device lost processing, so that it can keep that as
> > the starting point for the userspace dynamic memory requirement
> > guesstimate as a lower bound. Together with the (scaled to that
> > requirement) gpu driver memory pool and the core mm watermarks, that
> > should allow us to not hit a device lost again hopefully.
> 
> This doesn't work if vertex stages are allowed to have side effects
> (which is required for adult-level APIs and can effectively get hit with
> streamout on panfrost). Once you have anything involving side effects,
> you can't replay work, there's no way to cope with that. No magic Zink
> can do either.

Yeah no attempts at reply, it's just standard gl error handling. So either
tossing the context and reporting that through arb_robustness. Or tossing
the context, "transparently" creating a new one and a mix of recreating
some internal driver objects and thoughts&prayers to give the new context
the best chances possible.

You really want all the tricks in step 1 and the quirks in 3 to make sure
this doesn't ever happen. Or at most once per app, hopefully.

I promised terrible after all :-P

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
