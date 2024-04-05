Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A389A1F0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC91D10E803;
	Fri,  5 Apr 2024 15:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wy0rCCCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13EC10E803
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712332412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI80OQSSTp75Yz5rWxOaRLVcBrwx8DfV0TdIcg8SDyg=;
 b=Wy0rCCCvFvl3t/RmBr2ksjv9jAprigjRV+75jbm/u1/dciDxE4p1HXQuRr+/u8wVvgoR/L
 u5I1h8xukOZx1H5Gw11a+B6dCTape5tKTPRipGDFyHEuFSUy2s/1e+e7vlkzURqI5gsm2r
 V9aXnlGYHCHSV6RjN7xard8IJbEiCtY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-GhA30nFKOiytyu-AzpxGMg-1; Fri, 05 Apr 2024 11:53:30 -0400
X-MC-Unique: GhA30nFKOiytyu-AzpxGMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4162bc2da3fso7675065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 08:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712332409; x=1712937209;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aI80OQSSTp75Yz5rWxOaRLVcBrwx8DfV0TdIcg8SDyg=;
 b=S0duSVz8sTKMQImonF1Dj7X7NGYNkTNAMPrHQ9C1W5K6w1++J28VdJ4LHqIumDPRzk
 2dwTRhO2H6w5x5w44DFG6mdZMU4V54apflLLwwsF7E98oSwB4HF8nkTS5x4KXMaXptky
 IrQc1Pb00shpJ7JWDz/0g9s6PD+Ifi3BpaEPJFPklULKnjZph7SDnJcUVBBhlHSB+Cmt
 9x33GSjyKHLbsU9pN2SHmzmA02ewzm+M5fp1X7/M9psjinKZyeqSynlKEddw81p0poss
 9/XXdXjGhRlHZ04CzajqTL2Aqc7iTOEWAz+m1ctAY8phocrE0zEjxfNN1JVvcE4Wr9Nq
 HETg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqf2v4dkZLmtrzJVKNy/Ahe7sGIT/VQWx0CuJGPo+/0hQqkwy6NGPToc6WazjAKH125QgxLTaR1ymS5+Sib+2n1eis8Zpk1l/eWPZqjqmZ
X-Gm-Message-State: AOJu0Yy6cwfILBTamwmIzz5gYz2JxRi3ZJgPfnCsvwqwdNtgkkSeC4lK
 SOpL9jRmClnpjFmzIiHCEcbWuA7uVSJOgrUL60D2ugvSpy9BWZkmu78kMwYoTseWGpgBzhjGL6v
 r80oZGt/BzCCsLyEwzxNGmZkEfX9VnOHWvicft1l8RH1pumX/1JjLrKnDZaDGsvoSfw==
X-Received: by 2002:a05:600c:5494:b0:416:29e1:48ab with SMTP id
 iv20-20020a05600c549400b0041629e148abmr1383270wmb.29.1712332409505; 
 Fri, 05 Apr 2024 08:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWYKp3MvuNtM1C4UI8yZRQC9e7WA0mMptREYTTgtMTckNkCjjIeh8XWt2OzPDA7mSt68JtQQ==
X-Received: by 2002:a05:600c:5494:b0:416:29e1:48ab with SMTP id
 iv20-20020a05600c549400b0041629e148abmr1383245wmb.29.1712332409119; 
 Fri, 05 Apr 2024 08:53:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b00416326cc353sm1340950wmq.8.2024.04.05.08.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 08:53:28 -0700 (PDT)
Message-ID: <c3253f8a-e654-4016-b0c6-d92703107c48@redhat.com>
Date: Fri, 5 Apr 2024 17:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nv04: Add check to avoid out of bounds access
To: Mikhail Kobuk <m.kobuk@ispras.ru>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
References: <20240331064552.6112-1-m.kobuk@ispras.ru>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240331064552.6112-1-m.kobuk@ispras.ru>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/24 08:45, Mikhail Kobuk wrote:
> Output Resource (dcb->or) value is not guaranteed to be non-zero (i.e.
> in drivers/gpu/drm/nouveau/nouveau_bios.c, in 'fabricate_dcb_encoder_table()'
> 'dcb->or' is assigned value '0' in call to 'fabricate_dcb_output()').

I don't really know much about the semantics of this code.

Looking at fabricate_dcb_output() though I wonder if the intention was to assign
BIT(or) to entry->or.

@Lyude, can you help here?

Otherwise, for parsing the DCB entries, it seems that the bound checks are
happening in olddcb_outp_foreach() [1].

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_bios.c#L1331

> 
> Add check to validate 'dcb->or' before it's used.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for iMac G4")
> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
> ---
>   drivers/gpu/drm/nouveau/dispnv04/dac.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
> index d6b8e0cce2ac..0c8d4fc95ff3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
> @@ -428,7 +428,7 @@ void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable)
>   	struct drm_device *dev = encoder->dev;
>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>   
> -	if (nv_gf4_disp_arch(dev)) {
> +	if (nv_gf4_disp_arch(dev) && ffs(dcb->or)) {
>   		uint32_t *dac_users = &nv04_display(dev)->dac_users[ffs(dcb->or) - 1];
>   		int dacclk_off = NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder);
>   		uint32_t dacclk = NVReadRAMDAC(dev, 0, dacclk_off);
> @@ -453,7 +453,7 @@ bool nv04_dac_in_use(struct drm_encoder *encoder)
>   	struct drm_device *dev = encoder->dev;
>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>   
> -	return nv_gf4_disp_arch(encoder->dev) &&
> +	return nv_gf4_disp_arch(encoder->dev) && ffs(dcb->or) &&
>   		(nv04_display(dev)->dac_users[ffs(dcb->or) - 1] & ~(1 << dcb->index));
>   }
>   

