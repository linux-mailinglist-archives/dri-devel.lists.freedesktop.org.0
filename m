Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05175FCE90
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 00:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034F10E149;
	Wed, 12 Oct 2022 22:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4257D10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665614900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cQbK112G3CBY1iPorRDqAdSJlO6cOwytKNZM4RSxzY=;
 b=IzjXHV7n5n46eyg5F11Ee3Ub06ws1cT5hLIlm1++csVZxOuVOephzBQuX4lbMTSwv+aKAv
 wrpXkS4ujNbVBruLjHyFJy0QBRRnUcoOy4R2HQe0q5DKtb89m8sUSps99Z9b8+7Q5pnaSA
 GdoQ+KUONNELyoGXcg6RBPBFZECyhtk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-t9Csv7AyMoK94g6ebprY3Q-1; Wed, 12 Oct 2022 18:48:18 -0400
X-MC-Unique: t9Csv7AyMoK94g6ebprY3Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 i7-20020a0cab47000000b004b4376895bfso194990qvb.20
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 15:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cQbK112G3CBY1iPorRDqAdSJlO6cOwytKNZM4RSxzY=;
 b=l790IcY3leAHFopr0P8GYwENnYVTQJrNZBxhb1LFNGEkaK6TlXcrLYdOgMGAwcHSyF
 80iopR0kBbgpL5kTgf8lFymdfOAukStjTt/adl1Ps00w4UVLBTLxbiNvmQec6Q7K94Gz
 ftAOYWrNHZwQJnAOd8xr9tiGGMnHoNdFq+O0M3K4PxZS6+A1pvD1jPLC26e7pp9JzRtJ
 Z/C4obio9eeoaVoCcnteG3ShYtGl5Cj+d5ExHW3QkjxBCIFChg3IYIXAUNGzlmVk7rY5
 woZyf9M8281qhZic8tFUWIgDgGBHfVzVVYHF4ke+ThUVr629cilMIeNShdf08dWmGIjM
 Dq5w==
X-Gm-Message-State: ACrzQf2RMaZnHYXYOsckLQ/rrXo55R0DyoTah9uEUBxgcNfOGfrmWJCu
 mcn6qYU/tUnsNf6+CeVseClB5scuJ9nQeXU6HckjMRYGh07+96/8ETHlHbP4bIAQvQ6RaUQcWft
 RJUK6nYogeeBaPxVbLbfyBrcOR80c
X-Received: by 2002:a05:622a:1183:b0:39c:606d:1f7f with SMTP id
 m3-20020a05622a118300b0039c606d1f7fmr8858884qtk.313.1665614897742; 
 Wed, 12 Oct 2022 15:48:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tzPmYPKNIbVp3GJbjJyU2orb8Zq7NMYarr1l6JZruGvyaqWohInpYh6qO0ffWOFde1Yrniw==
X-Received: by 2002:a05:622a:1183:b0:39c:606d:1f7f with SMTP id
 m3-20020a05622a118300b0039c606d1f7fmr8858864qtk.313.1665614897486; 
 Wed, 12 Oct 2022 15:48:17 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300:fdba:af4a:bbcd:7e28?
 ([2600:4040:5c68:4300:fdba:af4a:bbcd:7e28])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ac87014000000b0039cb9ef50b5sm3192209qtm.26.2022.10.12.15.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 15:48:16 -0700 (PDT)
Message-ID: <b52dbad5e3c2c5f19c605440de3e4e017e70a2ec.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/disp: fix cast removes address space
 of expression warnings
From: Lyude Paul <lyude@redhat.com>
To: ruanjinjie <ruanjinjie@huawei.com>, bskeggs@redhat.com,
 kherbst@redhat.com,  airlied@linux.ie, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch,  jani.nikula@intel.com, airlied@redhat.com,
 tzimmermann@suse.de,  hverkuil-cisco@xs4all.nl, greenfoo@u92.eu,
 seanpaul@chromium.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:48:15 -0400
In-Reply-To: <20220924092516.10007-1-ruanjinjie@huawei.com>
References: <20220924092516.10007-1-ruanjinjie@huawei.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Looks good to me (sorry for the slow response! I think this one just got lost
in the noise). Will push to drm-misc-next in a moment

On Sat, 2022-09-24 at 17:25 +0800, ruanjinjie wrote:
> When build Linux kernel with 'make C=2', encounter the following warnings:
> 
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:134:34: warning: cast removes address space '__iomem' of expression
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:197:34: warning: cast removes address space '__iomem' of expression
> 
> The data type of dmac->_push.mem.object.map.ptr is 'void __iomem *', but
> converted to 'u32 *' directly and cause above warnings, now
> recover their data types to fix these warnings.
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 33c97d510999..aa94f8e284dd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -131,7 +131,7 @@ nv50_dmac_kick(struct nvif_push *push)
>  {
>  	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->put != dmac->cur) {
>  		/* Push buffer fetches are not coherent with BAR1, we need to ensure
>  		 * writes have been flushed right through to VRAM before writing PUT.
> @@ -194,7 +194,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
>  	if (WARN_ON(size > dmac->max))
>  		return -EINVAL;
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->cur + size >= dmac->max) {
>  		int ret = nv50_dmac_wind(dmac);
>  		if (ret)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

