Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07068A062D5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EB10EC1B;
	Wed,  8 Jan 2025 17:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EoR8z6bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324710EC1B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:01:20 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43618283dedso462515e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736355619; x=1736960419; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
 b=EoR8z6bmbSLuZgCKSGQEPKKQTkTqD7Y2NjfhmDhfX1IZUHvw9coX1UVkRQYiYCjZ+Z
 fxOUcv9gEjnxmk37Pc2ulT2sCXnoSfJVf4G6NMfkD9A1RQYx7xAAjvLzKpLGFvtSKoE9
 jXcr1xuz6qGcyViwfZtROD7M82PkHS29vEWko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736355619; x=1736960419;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
 b=bI4U6V21wU000iMSvMx2YEMnv3CCmND6sAEIl88pxGtywIKP+mBfe43kZ4PVOtxULG
 KtMnITwo6Jvyi1wP8okLEPsUrGGNViEd6b4Id/Ruux2h93szpKtSs0mPipwk+Qvshry3
 6Gh+F5p1iD8IzJMa8L90oJnasvnxOw1juNUOZAHasak+V+sZk+LXrt7s/5yTAcXFwtad
 PoKXxeKTIi/vcEypHO/OMLRxtzT8BllNa7kcCtHfzvaT0ddHIWGqxr3RWANVcbXzPe33
 ObNkS4tDjmQxRXVlIZ3nKXzLkro6jBsZ77EpvL5ABs+8yUZ4JbRQWK5FYnsas6YgsV0w
 8bag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUwhUCV0Q13KE67y39wDHt/Hjzm2eMxM7+0syxnY3w2jrqm42zHAoTiL2gouu5qyLtvg754vySphQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy12m+eQygcpNTMUSNWBB8EqNCd4j/DfenZ/9HbJEBaSG3V7OlM
 HmNtuL1hISs4PU0gIumpxB4N+SztIawcIsKoR87fketuHLMmehOSCEc1JKHodp+iWmXj7Nfqx91
 V
X-Gm-Gg: ASbGncsE7YJnjdP6O6+hYvWzaMsBTRw2O3xqqMFbJEejOIxmZTiVQiWah+yuXIFgeES
 Wod9ppSGTZ97kD/6Bzw2W+VK2WRttHLdaGV+LtgVK3hngk/DfIan1nUQ65X2Z2AaT+sCXdsPlRG
 J6opyH4E4Wum0zVru2mVRTOToHj1qmTgrkQBBnOJ4eFN50sOJ/YQtuixNshU8EL0ug1PM6L0r4V
 /h9m0zH6dVEP8Eqal38yt/RhBgqcNBjh2cyVWPNpkW8fKp3AMy4nKIr4kaOGGyVUiuc
X-Google-Smtp-Source: AGHT+IFmXBbhRF/ktEnx5uywuanupMYlXu4JXUiqRvhVOlqL+e96UOlNBaIepmawU04+oF/ngviO2Q==
X-Received: by 2002:a05:600c:524f:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-436e26d0cf9mr31801485e9.19.1736355619213; 
 Wed, 08 Jan 2025 09:00:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8287adsm52618501f8f.16.2025.01.08.09.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:00:18 -0800 (PST)
Date: Wed, 8 Jan 2025 18:00:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z36vIB-JrF5Ddhuf@phenom.ffwll.local>
Mail-Followup-To: Lukas Wunner <lukas@wunner.de>,
 Sumit Garg <sumit.garg@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
 <Z209ZegsmgN1xlNG@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z209ZegsmgN1xlNG@wunner.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Dec 26, 2024 at 12:26:29PM +0100, Lukas Wunner wrote:
> On Thu, Dec 26, 2024 at 11:29:23AM +0530, Sumit Garg wrote:
> > On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
> > > However in the case of restricted memory, the situation is exactly
> > > the opposite:  The kernel may *not* be able to access the data,
> > > but the crypto accelerator can access it just fine.
> > >
> > > I did raise a concern about this to the maintainer, but to no avail:
> > > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> > 
> > Herbert's point is valid that there isn't any point for mapping
> > restricted memory in the kernel virtual address space as any kernel
> > access to that space can lead to platform specific hardware error
> > scenarios. And for that reason we simply disallow dma_buf_mmap() and
> > don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
> > memory.
> 
> The API for signature generation/verification (e.g. crypto_sig_sign(),
> crypto_sig_verify()) no longer accepts scatterlists, only buffers in
> virtual address space:
> 
> https://lore.kernel.org/all/ZIrnPcPj9Zbq51jK@gondor.apana.org.au/
> 
> Hence in order to use buffers in restricted memory for signature
> generation/verification, you'd need to map them into virtual address
> space first.

Nope, you need to get that old api back. Kernel virtual address space
mappings for dma-buf are very intentionally optional.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
