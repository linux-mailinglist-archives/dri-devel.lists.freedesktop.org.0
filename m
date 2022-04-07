Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C14F802C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE06810EB0B;
	Thu,  7 Apr 2022 13:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426F10EB0B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649336921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYiG2jwpKviTbC79FBF6SS2JRtmy5ygo1J5oP0vh2gA=;
 b=HbR3t+YVYjSgn7o5loEbfr0XTV43e7/wu+kWI1RviXXiIChvrzUaNNSGwTLW2rRND4Hk4z
 vsVX4u0C9ZjfjpEJLBbWIpDpku+MbYYEfz3/lX+SObxn8w3ztAsqgcuN1u54GyirfPfhTY
 zf6t+42AkUTUgjAOSHUtPPWSl6FqSX4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-a1zuCdofMgKE4gQn94IT_A-1; Thu, 07 Apr 2022 09:08:40 -0400
X-MC-Unique: a1zuCdofMgKE4gQn94IT_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so3335004wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PYiG2jwpKviTbC79FBF6SS2JRtmy5ygo1J5oP0vh2gA=;
 b=mk4GyqgJeXRCxBjDzZuDC7umk+Mvjc0+/c5AJQZa1r+GSTrMLbm2GM75fvBYvBiFZt
 FeiNl3qvC0U6v8lCnC0IeS8zDsOJwlQ2y56V903UUEXg6TQEm0rXNrrHBquSApWI6t8Z
 hx6MPPN3+viNd6qHXBEF9vc1sV0E1/+n/TpaYHH+/EZ0wr6Y3hfrzJ9KbCodRHyuirEQ
 g9K8I66af4AqfbamjTs+VboTbRwg2efxUn4Z2+BTsyCCT1zMySL5cekBnOTF1x9Wq6if
 +OV23l1+DRnEcv3V1/mkC2G6akxtKtWlrHsN+4YqVerzGBkEdJt39b4ZRO6SLfG+rhul
 f4Wg==
X-Gm-Message-State: AOAM530/bqyudTc9CX3VGfGm7EtnJWrXGpYa59ua+ehTH34eyQus5uf1
 uN0bP3LNTulD4gxG++RR1wotLc//Yr6C+ATW7RH3ewp9GDOv7iHZdZ8oOD8PBlV9Cd2XlE8K2QV
 jYPNryHHktnJdfLVZQ0YSS2TLawIK
X-Received: by 2002:adf:b60a:0:b0:206:4ba:395c with SMTP id
 f10-20020adfb60a000000b0020604ba395cmr10724763wre.447.1649336919223; 
 Thu, 07 Apr 2022 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwusfCJViMsUP5Xtwk6CXg/MU53VnwwpUv0/qc7h8bleBl1fGekB+z/417y+QDwXAGl1LwU0w==
X-Received: by 2002:adf:b60a:0:b0:206:4ba:395c with SMTP id
 f10-20020adfb60a000000b0020604ba395cmr10724750wre.447.1649336919002; 
 Thu, 07 Apr 2022 06:08:39 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a056000120300b002061837b5b4sm8531890wrx.85.2022.04.07.06.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:08:38 -0700 (PDT)
Message-ID: <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
Date: Thu, 7 Apr 2022 15:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: specify usage while adding fences to
 dma_resv obj v7
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-3-christian.koenig@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220407085946.744568-3-christian.koenig@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christian,

On 4/7/22 10:59, Christian König wrote:
> Instead of distingting between shared and exclusive fences specify
> the fence usage while adding fences.
> 
> Rework all drivers to use this interface instead and deprecate the old one.
> 

This patch broke compilation for the vc4 DRM driver. I've this patch locally
which seems to work but I don't know enough about the fence API to know if
is correct.

If you think is the proper fix then I can post it as a patch.

From 3e96db4827ef69b38927476659cbb4469a0246e6 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 7 Apr 2022 14:54:07 +0200
Subject: [PATCH] drm/vc4: Use newer fence API to fix build error

The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
dma_resv obj v7") ported all the DRM drivers to use the newer fence API
that specifies the usage with the enum dma_resv_usage rather than doing
an explicit shared / exclusive distinction.

But the commit didn't do it properly in two callers of the vc4 driver,
leading to build errors.

Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 38550317e025..9eaf304fc20d 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -546,7 +546,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_READ);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
@@ -557,7 +558,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
 		bo->write_seqno = seqno;
 
-		dma_resv_add_excl_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_WRITE);
 	}
 }
 
-- 
2.35.1

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

